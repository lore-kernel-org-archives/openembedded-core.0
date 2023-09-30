Return-Path: <Bernhard.Guillon@begu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927DCE77373
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 12:54:41 +0000 (UTC)
Received: from dd45002.kasserver.com (dd45002.kasserver.com [85.13.162.249])
 by mx.groups.io with SMTP id smtpd.web10.40171.1696078475416505973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 05:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@begu.org header.s=kas202309091104 header.b=n6ULl608;
 spf=pass (domain: begu.org, ip: 85.13.162.249, mailfrom: bernhard.guillon@begu.org)
Received: from dd45002.kasserver.com (dd0806.kasserver.com [85.13.161.252])
	by dd45002.kasserver.com (Postfix) with ESMTPSA id DFC461D8053C
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 14:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=begu.org;
	s=kas202309091104; t=1696078472;
	bh=TBLhuKQ3qceEl0el98NGmVJJd9iQMF2SkK89+9OigLU=;
	h=Subject:To:From:Date:From;
	b=n6ULl608K0EJtgVDSVbNP/DsSPZINvOlABMoZEGa9Y5Pdb6osCHweijt/85IN6lcf
	 vVdgKvyPZqp/uJQ5QrTUE5jb1LLOaCscboY9akIUoVDa949vcdjZrOReHjOV0+4Vfl
	 gZUaXfYF3s/j9ZlcWUmq4yqbsOovagWCNioT4FjAp4BY5JaTDwHBsIihCn7+AO/PkI
	 Hkc+BUvH84rTm9xdnt/1XMOAfJCc7arH1YdpC/lrvxi8is1nU7vk12tWeYgKXQftbz
	 hsvEF1loXv169s8EfQKeK+S9db40CwqPez7KPZSVHNtHt/WZXIxNs5NccVKMnCeWXG
	 wa0pP9V3jvYyQ==
Subject: [RFC] Escape unprintable characters
To: openembedded-core@lists.openembedded.org
From: bernhard.guillon@begu.org
User-Agent: ALL-INKL Webmail 2.11
X-SenderIP: 91.141.62.155
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20230930125432.DFC461D8053C@dd45002.kasserver.com>
Date: Sat, 30 Sep 2023 14:54:32 +0200 (CEST)
X-Spamd-Bar: /
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188458

Hi all,

after watching "DEF CON 31 - Terminally Owned - 60 Years of Escaping - Da=
vid Leadbeater" [1] I wrote this recipe to test our message behavior.

SUMMARY =3D "Test escape sequences"
DESCRIPTION =3D "Test escape sequences"
LICENSE =3D "MIT"

python do_compile() {
    bb.plain("\033[31;1;4mHello\033[0m\n");
}

do_install() {
    bbwarn "\033[31;1;4mHello\033[0m\n"
}


At least on my terminal it will print a red Hello with a newline.

Dmesg and sytemd both escape unprintable characters by default.=20
I propose that we should do the same.
We could still offer an option to just print those, for all people who wa=
nt to have shiny color outputs.

As a second step we could even try to escape them before writing them to =
the logfile? This would help people who don't know about cat -v and so on=
?

What is your opinion about that?

Greets,
Bernhard

