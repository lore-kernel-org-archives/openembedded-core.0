Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.106.1627503409496152746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=RnmCaqvd;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1302C2E8939
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 15:16:46 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627503407; bh=Yi6d0YDMzVe2uFIyyPSEpCQxJ166JcX9OvpTlPB9SNA=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=RnmCaqvdFFPh7oFFoIi4WwB4S5Sn1VHiopLyhsWm8at4HmCnCNCaUiTolQmiDVJIj
	 Ygluxl+KzAzZbDVARHMlknQpwM6RHvCnnD9aQrFJMOTScLOFbmnJJo1U5aOqFXjqz/
	 upgGK/3BHkWHpOwgGB6lmg8ewcBy3/wzK982FGOmOCpz9EoS3PlYghNdwgyieB/87r
	 UGS4f9VhhWXLgLrfbLb+Mio592GT2TJIs9p2JS90mIx7c7V63fetkofZuTWvE2SHLv
	 pPqmSQiRKbdJyNv9IvS2mVuD6XKqqvszeu313kdB8L6BHPL3LTkePbXRXlydvPKwVT
	 ublREOVy0yEMA==
Date: Wed, 28 Jul 2021 15:16:41 -0500
From: "Seebs" <seebs@seebs.net>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
Message-ID: <20210728151641.667338a5@seebsdell>
In-Reply-To: <17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
	<20210727115246.04b8ffa4@seebsdell>
	<17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Jul 2021 11:36:22 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

> Do I correctly assume that pseudo_client_op() has to be fully
> reentrant?

No. It's never been even a tiny bit reentrant. We used to do the
allocate and free thing, and it was incredibly expensive, and the
nature of the thing requires confidence that we never, ever, have
more than one thing writing and reading over the socket at a time,
so it's just Not Reentrant. During one call to pseudo_client_op,
there will never be another, and all the IPC stuff uses a single
consistent local buffer that it returns the address of.

Declaring that as static without changing the initializer would indeed
break everything -- we rely on the initializer working. Changing it to
static means it only gets initialized once...

Changing it to:

	static pseudo_msg_t msg;
	msg = pseudo_msg_t { .type = PSEUDO_MSG_OP };

would probably be fine, because then it'd be initialized. Otherwise,
we'd get failures when msg got overwritten and reused.

Or just changing `result = &msg` to something like `result =
&xattrdb_data`, which would be nonsensical but it turns out not to
matter, as the only caller that reaches this case is the caller
that's just checking yes/no "is the return value not a null pointer".

-s
