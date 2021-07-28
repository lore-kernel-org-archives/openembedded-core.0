Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web08.2641.1627464989285548007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 02:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=S+28Fjvu;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627464984; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nrq5B6torMmYc0eYRJR9Wt5OJwzgs22ki2bELBF+qq+rI+Uu8vQLeh19FHzr/HjyIpccyga+/KMiRI+5uFL1EmxrCD7MjmTOeX7u4D2sTu4Tv0nHX3e5LbJ8v/xmtLHJXYLXv37D4rZnESbGh5gvjPl4VxnRCleG5h5KdVpoALk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627464984; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=BBwSvAWTO2HcOPAwW17HoEQeEHg4jpCV2P4+WSAr7J0=; 
	b=dgtgl24zrA5IS5uqYWP8zKKRrXxCUcqTPFxVSHknDoGzRK3TaKC1QrhZoeXE6UDEHHHqiJM2JijGyuA2SSfH1cJv1Myhrf+WYblRp8zmadx6KMUQ7IFPXFdvJXjnFGZehFe6MVmsuwmh31Y4Qa76oW5ZJb1TAPO8WqUSHaJso7w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627464984;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BBwSvAWTO2HcOPAwW17HoEQeEHg4jpCV2P4+WSAr7J0=;
	b=S+28FjvuHyduP03a2pRvLagvv71SwDb1brx3wo3VIPadqzxYnLiqRfyf8S4J1WZB
	FEye4Yh+OkIVK6zf8P+opgxPXecszd99P8SFbtpdIY1oQAhewH2uYkFlBQs/Hs86jru
	ELAFR2fARosIs3SOLanbdg8NncIJEl93RZmIA43U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1627464982160988.3741042610886; Wed, 28 Jul 2021 02:36:22 -0700 (PDT)
Date: Wed, 28 Jul 2021 11:36:22 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Seebs" <seebs@seebs.net>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
In-Reply-To: <20210727115246.04b8ffa4@seebsdell>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl> <20210727115246.04b8ffa4@seebsdell>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Tue, 27 Jul 2021 18:52:46 +0200 Seebs <seebs@seebs.net> wrote ----
 > On Tue, 27 Jul 2021 18:30:33 +0200
 > Damian Wrobel <dwrobel@ertelnet.rybnik.pl> wrote:
 > 
 > > The returned pointer has to be freed by the caller not by the callee
 > > function itself.
 > 
 > So, this predates the public release, but long ago, that was indeed
 > how it worked, and then LONG ago it was changed so that the pseudo_ipc
 > stuff always used the same object for its returns, so we weren't doing
 > alloc/free cycles all the time.
 > 
 > Which means that, in every *other* code path, if we return a non-nil
 > msg, it *must not* be freed.
 > 
 > I think probably the solution is to change that object to be static.

That was already static before this revert[1] and as you could read from the git message
it was causing problems as well.

If above static version didn't work then very likely the following similar pattern of returning static pointer:

pseudo_client_op()
  pseudo_client_request()
    pseudo_msg_receive() {
      newmsg = pseudo_msg_new()
      free(incomming) // static pseudo_msg_t *incoming
      incomming = newmsg
      read(incomming)
      return incomming
    }

is causing the same sort of problems.

I'm seeing this code for the first time so the question is.

Do I correctly assume that pseudo_client_op() has to be fully reentrant?

If so, then under any circumstances any path shouldn't return a pointer to a static variable which
in fact is not const static.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?h=oe-core&id=b988b0a6b8afd8d459bc9a2528e834f63a3d59b2

--
Regards,
Damian

 > We can't make callers free the results unless we want them ALL to be
 > freed, which we absolutely don't, that's devastatingly expensive.
 > 
 > There is exactly one call with OP_CHROOT, and all it checks is whether
 > the return is null or not-null. I'd be mildly surprised by the
 > theoretically-invalid address of stack garbage actually causing a
 > problem on most modern systems, except that I think some systems have
 > started doing stack guards. But all we care about here is that the
 > address returned be a valid non-null pointer. Heck, we could use
 > &xattrdb_data, that already exists, is already static, and we don't
 > care about it.
 > 
 > (The reason the `msg` in that function isn't static is so it gets its
 > initializer every time. This is not a great reason.)
 > 
 > -s
 > 
 > 
 > 
 > 
