Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.4202.1627404770497110957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=Y9Abwi78;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id EE1952E8920;
	Tue, 27 Jul 2021 11:52:48 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627404769; bh=Qsf+0OMdH48cw45oe3FRGQTRJaghStvAty0vL5oZq9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y9Abwi78BNic8Hihl8U/AP1QXMwiQTzZ9WcMjFIKGT2vJczRtoE5a6BkYZQJ2E776
	 LWzomXWN+m8/yhNnKxgUDoWj1iMuX/GIdlwL6SqMTqe2DXt6+bzinWMYJfFG6dsgnP
	 cyh4+SFJkVRe8cTWcaTKGRfxeljpoRNGAeOSaqkXltfD/dE+ep02Eu91RFISLO88y1
	 +/5ujS7SoWMISclJ//NMt6qKxupGXJnIyg/wkJDCGjjHMcMBU/PkTkhctvqgkNLRoC
	 u1JGz6lT3jqfupwe26ahRdUcksLXpNqnk3slUm364/3cAJ9GO95Gx0JCV8DUOactyK
	 S0Rr0J5mdvpxg==
Date: Tue, 27 Jul 2021 11:52:46 -0500
From: "Seebs" <seebs@seebs.net>
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
Message-ID: <20210727115246.04b8ffa4@seebsdell>
In-Reply-To: <17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jul 2021 18:30:33 +0200
Damian Wrobel <dwrobel@ertelnet.rybnik.pl> wrote:

> The returned pointer has to be freed by the caller not by the callee
> function itself.

So, this predates the public release, but long ago, that was indeed
how it worked, and then LONG ago it was changed so that the pseudo_ipc
stuff always used the same object for its returns, so we weren't doing
alloc/free cycles all the time.

Which means that, in every *other* code path, if we return a non-nil
msg, it *must not* be freed.

I think probably the solution is to change that object to be static.
We can't make callers free the results unless we want them ALL to be
freed, which we absolutely don't, that's devastatingly expensive.

There is exactly one call with OP_CHROOT, and all it checks is whether
the return is null or not-null. I'd be mildly surprised by the
theoretically-invalid address of stack garbage actually causing a
problem on most modern systems, except that I think some systems have
started doing stack guards. But all we care about here is that the
address returned be a valid non-null pointer. Heck, we could use
&xattrdb_data, that already exists, is already static, and we don't
care about it.

(The reason the `msg` in that function isn't static is so it gets its
initializer every time. This is not a great reason.)

-s
