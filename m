Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A28AC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:07:11 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.10589.1678892825845525360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id E1D1115231;
	Wed, 15 Mar 2023 16:07:03 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.85]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pcSiU-2TqJRw0; Wed, 15 Mar 2023 16:07:03 +0100
Date: Wed, 15 Mar 2023 16:06:57 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <LZHKRR.FOHLRDXQDV053@t-online.de>
In-Reply-To: 
	<CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
References: <20230315070909.422721-1-f_l_k@t-online.de>
	<CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KKj8XxDh17uhz3IrO0hc"
X-TOI-EXPURGATEID: 150726::1678892823-C9433DB0-E9C07F66/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e7b235f-e930-4925-9410-51c7bc8bb232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178579

--=-KKj8XxDh17uhz3IrO0hc
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Mi, 15. M=E4r 2023 um 08:27:33 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> Guesswork is a fast track to frustration.

True :D But thats what always happens to me if I dont know enough and=20
can't find a way to reproduce.
Thanks to your hint on  core-image-ptest-glib-2.0 I was able to=20
reproduce the issue. Running the test from /var/volatile/tmp didn't=20
solve the issue. But compared to core-image-ptest-glib-2.0 where /tmp=20
links to /var/tmp the tmpdir is handled by systemd tmp.mount in my=20
image and thus is not a symbolic link.

According to systemd ducumentation /var/tmp and /tmp are not the same=20
and are handled differently
<https://systemd.io/TEMPORARY_DIRECTORIES/>

Still I have no idea how this should be fixed or if the failed test=20
could maybe ignored but I was able to pass the tests in =20
core-image-ptest-glib-2.0 by removing the /tmp symlink and adding this=20
line to fstab:
tmpfs /tmp tmpfs defaults 0 0

After a reboot the tests completed successful


--=-KKj8XxDh17uhz3IrO0hc
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mi, 15. M=E4r 2023 um 08:27:33 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite">Guesswork is a fast track to frustration.</blockquote><div><br=
></div><div><div>True :D But thats what always happens to me if I dont know=
 enough and can't find a way to reproduce.</div><div>Thanks to your hint on=
 &nbsp;core-image-ptest-glib-2.0 I was able to reproduce the issue. Running=
 the test from /var/volatile/tmp didn't solve the issue. But compared to co=
re-image-ptest-glib-2.0 where /tmp links to /var/tmp the tmpdir is handled =
by systemd tmp.mount in my image and thus is not a symbolic link.</div><div=
><br></div><div>According to systemd ducumentation /var/tmp and /tmp are no=
t the same and are handled differently</div><div><a href=3D"https://systemd=
.io/TEMPORARY_DIRECTORIES/">https://systemd.io/TEMPORARY_DIRECTORIES/</a></=
div><div><br></div><div>Still I have no idea how this should be fixed or if=
 the failed test could maybe ignored but I was able to pass the tests in &n=
bsp;core-image-ptest-glib-2.0 by removing the /tmp symlink and adding this =
line to fstab:</div><div>tmpfs /tmp tmpfs defaults 0 0</div><div><br></div>=
<div>After a reboot the tests completed successful</div></div></div>
--=-KKj8XxDh17uhz3IrO0hc--


