Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E41C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 23:13:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.11402.1679699604114392894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 16:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 462D0D61D;
	Sat, 25 Mar 2023 00:13:21 +0100 (CET)
Received: from [192.168.178.83] ([84.163.41.244]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfqau-4BGdyi0; Sat, 25 Mar 2023 00:13:12 +0100
Date: Sat, 25 Mar 2023 00:13:06 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <UHS1SR.41XVDUNLPY6P2@t-online.de>
In-Reply-To: 
	<CANNYZj8eyCvwacnVoQui+ghL=cN=D8yDaBWAV1eBtvcz9qPOGA@mail.gmail.com>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	<B0EORR.JWJ884MGYK8G2@t-online.de>
	<CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
	<CHRXRR.A1NILQGNBS7P1@t-online.de>
	<CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
	<1TC1SR.M6OX77V0K20W3@t-online.de>
	<CANNYZj8eyCvwacnVoQui+ghL=cN=D8yDaBWAV1eBtvcz9qPOGA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/lOaEJggDoDAYTUPy3fG"
X-TOI-EXPURGATEID: 150726::1679699592-0B7FDC01-C1B85F72/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a3368a0-4270-44a5-920c-c38a605a4ccf
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 23:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179080

--=-/lOaEJggDoDAYTUPy3fG
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Fr, 24. M=E4r 2023 um 20:53:22 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> Do you have something in your local setup
> that pulls it in? core-image-sato-sdk does not by default add it.

True, thanks for the hint. I still had this lines in local.conf because=20
of the glib ptest issue.

DISTRO_FEATURES:append =3D " ptest"
EXTRA_IMAGE_FEATURES +=3D "ptest-pkgs"

That shortens the test duration by far

sysvinit:
 SUMMARY:
core-image-sato-sdk () - Ran 71 tests in 129.937s
core-image-sato-sdk - OK - All required tests passed (successes=3D49,=20
skipped=3D22, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1159 tasks of which 1158 didn't need to=20
be rerun and all succeeded.

systemd:
SUMMARY:
core-image-sato-sdk () - Ran 71 tests in 129.812s
core-image-sato-sdk - OK - All required tests passed (successes=3D56,=20
skipped=3D15, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1159 tasks of which 1158 didn't need to=20
be rerun and all succeeded.

busybox:
File "/home/flk/poky/meta/lib/oeqa/runtime/cases/ssh.py", line 17, in=20
test_ssh
    self.assertEqual(status, 0, msg=3D'SSH Test failed: %s' % output)
AssertionError: 255 !=3D 0 : SSH Test failed: ssh: connect to host=20
xxx.xxx.xxx.xxx port 22: Connection refused
RESULTS - ssh.SSHTest.test_ssh: FAILED (8.09s)
SUMMARY:
core-image-sato-sdk () - Ran 71 tests in 43.593s
core-image-sato-sdk - FAIL - Required tests failed (successes=3D2,=20
skipped=3D68, failures=3D1, errors=3D0)

There is an issue with mdev-busybox but i guess it is not related?


--=-/lOaEJggDoDAYTUPy3fG
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Fr, 24. M=E4r 2023 um 20:53:22 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
Do you have something in your local setup
that pulls it in? core-image-sato-sdk does not by default add it.</div></bl=
ockquote><div><br></div><div>True, thanks for the hint. I still had this li=
nes in local.conf because of the glib ptest issue.</div><div><br></div><div=
><div>DISTRO_FEATURES:append =3D " ptest"</div><div>EXTRA_IMAGE_FEATURES +=
=3D "ptest-pkgs"</div></div><div><br></div><div>That shortens the test dura=
tion by far</div><div><br></div><div>sysvinit:</div><div>&nbsp;SUMMARY:</di=
v><div>core-image-sato-sdk () - Ran 71 tests in 129.937s</div><div>core-ima=
ge-sato-sdk - OK - All required tests passed (successes=3D49, skipped=3D22,=
 failures=3D0, errors=3D0)</div><div>NOTE: Tasks Summary: Attempted 1159 ta=
sks of which 1158 didn't need to be rerun and all succeeded.</div><div><br>=
</div><div><div>systemd:</div><div>SUMMARY:</div><div><div>core-image-sato-=
sdk () - Ran 71 tests in 129.812s</div><div>core-image-sato-sdk - OK - All =
required tests passed (successes=3D56, skipped=3D15, failures=3D0, errors=
=3D0)</div><div>NOTE: Tasks Summary: Attempted 1159 tasks of which 1158 did=
n't need to be rerun and all succeeded.</div></div></div><div><br></div><di=
v>busybox:</div><div>File "/home/flk/poky/meta/lib/oeqa/runtime/cases/ssh.p=
y", line 17, in test_ssh</div><div><div>&nbsp; &nbsp; self.assertEqual(stat=
us, 0, msg=3D'SSH Test failed: %s' % output)</div><div>AssertionError: 255 =
!=3D 0 : SSH Test failed: ssh: connect to host xxx.xxx.xxx.xxx port 22: Con=
nection refused</div></div><div><div>RESULTS - ssh.SSHTest.test_ssh: FAILED=
 (8.09s)</div><div>SUMMARY:</div><div>core-image-sato-sdk () - Ran 71 tests=
 in 43.593s</div><div>core-image-sato-sdk - FAIL - Required tests failed (s=
uccesses=3D2, skipped=3D68, failures=3D1, errors=3D0)</div></div><div><br><=
/div><div>There is an issue with mdev-busybox but i guess it is not related=
?</div></div>
--=-/lOaEJggDoDAYTUPy3fG--


