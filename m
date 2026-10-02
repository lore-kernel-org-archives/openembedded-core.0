Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CA5CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 12:44:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11201.1790945086622129995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 05:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Pxx9Mu/h;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A06101A10DE;
	Fri,  2 Oct 2026 12:44:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66FE6603DC;
	Fri,  2 Oct 2026 12:44:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4E97103281E3;
	Fri,  2 Oct 2026 14:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790945084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nA7FS/hxk9WXJlIUO+m5poNPChGuYnM5B61lXXaxkiw=;
	b=Pxx9Mu/hMa2QGdX7ainHWzaogTCz1s1edejJD98qrjqK5Kslj4PN9lXadKQLAghaqTJ0gZ
	KgQZ6NreFlohRPcW7iVlP68T/B2ijJrWEBcOgocIGga4M0YZNnqqW6+D3lLZer0UkEtWRO
	HsJV0pi+ZvrH+dk20eZhK1NVcRR8ZIxv7JzE9xU9vdLPdE3F1dKTl6u9Wh/FDpU+Gl2Qis
	PPCPthAdyHVV1VpQffbGB0AmXHsu7MRCXqhAjO9E3TUMHCGua22UKsBKERyGEkxcmfb9dd
	M/VAy/A1RLYqPD95WJBI2wR/tMbGLVIbq+9ve/EtYhDDOxXaGggcwmBszR2NLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 14:44:42 +0200
Message-Id: <DLUD1OK99YO3.1QPQV67EMZI06@bootlin.com>
Subject: Re: [OE-core] [AUH] python3: upgrading to 3.14.8 SUCCEEDED
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>, <auh@yoctoproject.org>,
 "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com> <DLTOIG3SFIS9.38K7K9E7WCA4H@bootlin.com> <8d16f142-505a-4806-a419-b237773e5374@est.tech>
In-Reply-To: <8d16f142-505a-4806-a419-b237773e5374@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 12:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247118

On Fri Oct 2, 2026 at 10:22 AM CEST, Jaipaul Cheernam wrote:
>
> On 2026-10-01 19:31, Mathieu Dubois-Briand via lists.openembedded.org wro=
te:
> I think we need to skip newly added test case in above commit like we=20
> did for=C2=A0test_write_read_limited_history in recipe.
>
> # Also fails with editline instead of readline. See:
> # https://github.com/python/cpython/issues/123018
> SKIPPED_TESTS +=3D " \
>  =C2=A0 =C2=A0 --ignore test_write_read_limited_history \
> "
>

I'm not sure. I tried to compare a build with and without musl, and
history looks broken on musl builds.

So I use the same steps as in the test:

>>> import readline
>>> readline.clear_history()
>>> readline.add_history("first line")
>>> readline.add_history("second line")
>>> readline.write_history_file("/hist")
>>> readline.add_history("third line")
>>> readline.set_history_length(2)
>>> readline.append_history_file(1, "/hist")
>>> readline.clear_history()
>>> readline.read_history_file("/hist")
>>> self.assertEqual(readline.get_history_item(1), "second line")

On the glibc build, I have:
root@qemux86-64:~# cat /hist=20
_HiStOrY_V2_
second\040line
third\040line

While on the musl build, I have:
root@qemux86-64:~# cat /hist
_HiStOrY_V2_
_HiStOrY_V2_
third\040line

Now it's funny, as both build are using editline, but the behaviour is
different. It might be that the issue is not just in python.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


