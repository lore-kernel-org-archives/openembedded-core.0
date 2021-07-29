Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web12.8772.1627562264753979605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 05:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=bDeU0F6A;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627562261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GQ8HMr2Lt+dIDWuegg7+UP85+UnFLPxxQIrTmCNIS7Id0P1GxKVXoDssRiAErNpPOB7HGaRmIqjJwfS9766ErTSuwXndjB30MWSqIPnfkawxoMALRtXRevhFi9y4uKzVysGpi4aRtifKSR4/jSAROBiQ3JJpmLNRTjzDVVjG10Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627562261; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JMSHffmyNaszSJpikpol713Qy8M1/RBtnVbCPCycnRs=; 
	b=HYv+IkZb4cj3Gioz/W+HFeBV6k4KanuW7MpTTIw9+NYhB/btkrAIq0hnRIFEE/qShDh8ZncD/W5NwEbpc52u4HIdEShtgcPw9yzNvaFGCwYqH6h50dFxGDEQ1cTC+y8ZTgMtmFAVM10qYUbvalHriJQhyu1vlDOWf3RRUBrkqtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627562261;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JMSHffmyNaszSJpikpol713Qy8M1/RBtnVbCPCycnRs=;
	b=bDeU0F6Ab6qiC1EwaQAlwmHeQceMNX2tNB89H0Kyo8JYrXnxE9t2cbcha257/IiV
	nhGoW6i2C0wid627Tr+svox9v6XnlTNwB5YoOPlX47J0Flw9OO8Q9oRZyqDY1RSWVb/
	hz6HKhNNk54w4Gl3LiFiICT+pH83zZsRVbgcwjOE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1627562248845394.30819596222284; Thu, 29 Jul 2021 05:37:28 -0700 (PDT)
Date: Thu, 29 Jul 2021 14:37:28 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Seebs" <seebs@seebs.net>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17af2450a5a.11cd2feba245412.5780322336925190641@ertelnet.rybnik.pl>
In-Reply-To: <20210728151641.667338a5@seebsdell>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl>
	<20210727104712.385ad146@seebsdell>
	<17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
	<20210727115246.04b8ffa4@seebsdell>
	<17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl> <20210728151641.667338a5@seebsdell>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable - unverified
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Wed, 28 Jul 2021 22:16:41 +0200 Seebs <seebs@seebs.net> wrote ----
 > On Wed, 28 Jul 2021 11:36:22 +0200
 > "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:
 > 
 > > Do I correctly assume that pseudo_client_op() has to be fully
 > > reentrant?
 > 
 > No. It's never been even a tiny bit reentrant. We used to do the
 > allocate and free thing, and it was incredibly expensive, and the
 > nature of the thing requires confidence that we never, ever, have
 > more than one thing writing and reading over the socket at a time,
 > so it's just Not Reentrant. During one call to pseudo_client_op,

 > there will never be another, and all the IPC stuff uses a single
 > consistent local buffer that it returns the address of.
 > 
 > Declaring that as static without changing the initializer would indeed
 > break everything -- we rely on the initializer working. Changing it to
 > static means it only gets initialized once...
 > 
 > Changing it to:
 > 
 >     static pseudo_msg_t msg;
 >     msg = pseudo_msg_t { .type = PSEUDO_MSG_OP };
 > 
 > would probably be fine, because then it'd be initialized. Otherwise,
 > we'd get failures when msg got overwritten and reused.

Looking at the code I see that:

$ grep -n msg pseudo_client.c | grep -A 1 ".type = PSEUDO_MSG_OP"
1592:	pseudo_msg_t msg = { .type = PSEUDO_MSG_OP };
1848:		pseudo_msg_stat(&msg, buf);
1875:	msg.type = PSEUDO_MSG_OP;
1876:	msg.op = op;

the PSEUDO_MSG_OP is being unconditionally assigned to the msg.type
before any real usage of the 'msg' structure. So, if I'm not mistaken that code was
already tested and didn't work well and was reverted here[1].

[1] http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?h=oe-core&id=b988b0a6b8afd8d459bc9a2528e834f63a3d59b2

--
Regards,
Damian

 > 
 > Or just changing `result = &msg` to something like `result =
 > &xattrdb_data`, which would be nonsensical but it turns out not to
 > matter, as the only caller that reaches this case is the caller
 > that's just checking yes/no "is the return value not a null pointer".
 > 
 > -s
 > 
 > 
 > 
 > 
