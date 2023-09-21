Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74110E71091
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 15:51:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.21830.1695311482211092667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 08:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 09F0610608;
	Thu, 21 Sep 2023 17:51:20 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.174.95]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjLxU-3GuRVo0; Thu, 21 Sep 2023 17:51:16 +0200
Date: Thu, 21 Sep 2023 17:51:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Kai Kang <kai.kang@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <EPEC1S.ET9N9UD2HEU43@t-online.de>
In-Reply-To: <CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
	<VGUB1S.EQNLFG4U297D@t-online.de>
	<CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
	<3SXB1S.VJD0PU0SDSPS1@t-online.de>
	<CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
	<V3DC1S.GMOO9XQMVAE72@t-online.de>
	<CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lONTa0M1f8vnbBc0VpfL"
X-TOI-EXPURGATEID: 150726::1695311476-9907DF2D-702607F8/0/0 CLEAN NORMAL
X-TOI-MSGID: e8350c67-6a17-4b48-be98-8823b3a2d756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188018

--=-lONTa0M1f8vnbBc0VpfL
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 21 2023 at 05:36:13 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> How did you trace it? That doesn't make sense given what the test
> does, and the task where diverge begins.

First I ran
oe-selftest -r 
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
2023-09-21 17:43:06,946 - oe-selftest - INFO - 
----------------------------------------------------------------------
2023-09-21 17:43:06,946 - oe-selftest - INFO - Ran 1 test in 68.893s
2023-09-21 17:43:06,946 - oe-selftest - INFO - FAILED
2023-09-21 17:43:06,946 - oe-selftest - INFO -  (failures=1)
2023-09-21 17:43:11,370 - oe-selftest - INFO - RESULTS:
2023-09-21 17:43:11,370 - oe-selftest - INFO - RESULTS - 
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs: FAILED 
(66.80s)
2023-09-21 17:43:11,380 - oe-selftest - INFO - SUMMARY:
2023-09-21 17:43:11,380 - oe-selftest - INFO - oe-selftest () - Ran 1 
test in 68.896s
2023-09-21 17:43:11,380 - oe-selftest - INFO - oe-selftest - FAIL - 
Required tests failed (successes=0, skipped=0, failures=1, errors=0)

to verify that I can reproduce the issue.

Then I looked at the code and couldn't find any suspicious activity in 
meson so I thought it may be an internal problem.
 I removed all non-essential stuff from the recipe

SUMMARY = "GTK+ icon theme"
DESCRIPTION = "The Adwaita icon theme is the default icon theme of the 
GNOME desktop \
This package package contains an icon theme for Gtk+ 3 applications."
HOMEPAGE = "<https://gitlab.gnome.org/GNOME/adwaita-icon-theme>"
BUGTRACKER = 
"<https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues>"
SECTION = "x11/gnome"

LICENSE = "LGPL-3.0-only | CC-BY-SA-3.0"
LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c 
<file://copying;md5=c84cac88e46fc07647ea07e6c24eeb7c/> \
                    
file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 
<file://copying_ccbysa3;md5=96143d33de3a79321b1006c4e8ed07e7/> \
                    
file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02 
<file://copying_lgpl;md5=e6a600fd5e1d9cbde2d983680233ad02/>"

GNOMEBASEBUILDCLASS = "meson"
GTKIC_VERSION = "4"
inherit  gnomebase pkgconfig gtk-icon-cache allarch

SRC_URI[archive.sha256sum] = 
"2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
FILES:${PN}-doc = "${datadir}/licenses"
BBCLASSEXTEND = "native nativesdk"

but still the test failed. In the next step I excluded inherit allarch 
and the test succeeded

Looking at allarch.bbclass, this was the most suspicious part to me and 
first thing I tried was commenting out
#addhandler allarch_package_arch_handler

2023-09-21 17:08:57,046 - oe-selftest - INFO - Adding: "include 
selftest.inc" in /home/flk/poky/build-core-st/conf/local.conf
2023-09-21 17:08:57,046 - oe-selftest - INFO - Adding: "include 
bblayers.inc" in bblayers.conf
2023-09-21 17:08:57,046 - oe-selftest - INFO - 
test_sstate_allarch_samesigs 
(sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)
2023-09-21 17:10:02,922 - oe-selftest - INFO -  ... ok
2023-09-21 17:10:02,955 - oe-selftest - INFO - 
----------------------------------------------------------------------
2023-09-21 17:10:02,955 - oe-selftest - INFO - Ran 1 test in 68.008s
2023-09-21 17:10:02,955 - oe-selftest - INFO - OK
2023-09-21 17:10:07,700 - oe-selftest - INFO - RESULTS:
2023-09-21 17:10:07,700 - oe-selftest - INFO - RESULTS - 
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs: PASSED 
(65.88s)
2023-09-21 17:10:07,713 - oe-selftest - INFO - SUMMARY:
2023-09-21 17:10:07,713 - oe-selftest - INFO - oe-selftest () - Ran 1 
test in 68.008s
2023-09-21 17:10:07,713 - oe-selftest - INFO - oe-selftest - OK - All 
required tests passed (successes=1, skipped=0, failures=0, errors=0)


--=-lONTa0M1f8vnbBc0VpfL
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Sep 21 2023 at 05:36:13 PM +02:=
00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquo=
te type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-space=
s;">How did you trace it? That doesn't make sense given what the test
does, and the task where diverge begins.</div></blockquote><div><br></div><=
div>First I ran&nbsp;</div><div>oe-selftest -r sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs</div><div><div>2023-09-21 17:43:06,946 - o=
e-selftest - INFO - -------------------------------------------------------=
---------------</div><div>2023-09-21 17:43:06,946 - oe-selftest - INFO - Ra=
n 1 test in 68.893s</div><div>2023-09-21 17:43:06,946 - oe-selftest - INFO =
- FAILED</div><div>2023-09-21 17:43:06,946 - oe-selftest - INFO - &nbsp;(fa=
ilures=3D1)</div><div>2023-09-21 17:43:11,370 - oe-selftest - INFO - RESULT=
S:</div><div>2023-09-21 17:43:11,370 - oe-selftest - INFO - RESULTS - sstat=
etests.SStateHashSameSigs2.test_sstate_allarch_samesigs: FAILED (66.80s)</d=
iv><div>2023-09-21 17:43:11,380 - oe-selftest - INFO - SUMMARY:</div><div>2=
023-09-21 17:43:11,380 - oe-selftest - INFO - oe-selftest () - Ran 1 test i=
n 68.896s</div><div>2023-09-21 17:43:11,380 - oe-selftest - INFO - oe-selft=
est - FAIL - Required tests failed (successes=3D0, skipped=3D0, failures=3D=
1, errors=3D0)</div></div><div><br></div><div>to verify that I can reproduc=
e the issue.</div><div><br></div><div>Then I looked at the code and couldn'=
t find any suspicious activity in meson so I thought it may be an internal =
problem.</div><div>&nbsp;I removed all non-essential stuff from the recipe<=
/div><div><br></div><div><div><div>SUMMARY =3D "GTK+ icon theme"</div><div>=
DESCRIPTION =3D "The Adwaita icon theme is the default icon theme of the GN=
OME desktop \</div><div>This package package contains an icon theme for Gtk=
+ 3 applications."</div><div>HOMEPAGE =3D "<a href=3D"https://gitlab.gnome.=
org/GNOME/adwaita-icon-theme">https://gitlab.gnome.org/GNOME/adwaita-icon-t=
heme</a>"</div><div>BUGTRACKER =3D "<a href=3D"https://gitlab.gnome.org/GNO=
ME/adwaita-icon-theme/issues">https://gitlab.gnome.org/GNOME/adwaita-icon-t=
heme/issues</a>"</div><div>SECTION =3D "x11/gnome"</div><div><br></div><div=
>LICENSE =3D "LGPL-3.0-only | CC-BY-SA-3.0"</div><div>LIC_FILES_CHKSUM =3D =
"<a href=3D"file://COPYING;md5=3Dc84cac88e46fc07647ea07e6c24eeb7c">file://C=
OPYING;md5=3Dc84cac88e46fc07647ea07e6c24eeb7c</a> \</div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"file://=
COPYING_CCBYSA3;md5=3D96143d33de3a79321b1006c4e8ed07e7">file://COPYING_CCBY=
SA3;md5=3D96143d33de3a79321b1006c4e8ed07e7</a> \</div><div>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"file://COP=
YING_LGPL;md5=3De6a600fd5e1d9cbde2d983680233ad02">file://COPYING_LGPL;md5=
=3De6a600fd5e1d9cbde2d983680233ad02</a>"</div><div><br></div><div>GNOMEBASE=
BUILDCLASS =3D "meson"</div><div>GTKIC_VERSION =3D "4"</div><div>inherit &n=
bsp;gnomebase pkgconfig gtk-icon-cache allarch</div><div><br></div><div>SRC=
_URI[archive.sha256sum] =3D "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9=
d6215c623cb4e42ff1"</div><div>FILES:${PN}-doc =3D "${datadir}/licenses"</di=
v><div>BBCLASSEXTEND =3D "native nativesdk"</div></div></div><div><br></div=
><div>but still the test failed. In the next step I excluded inherit allarc=
h and the test succeeded</div><div><br></div><div>Looking at allarch.bbclas=
s, this was the most suspicious part to me and first thing I tried was comm=
enting out</div><div>#addhandler allarch_package_arch_handler</div><div><br=
></div><div><div>2023-09-21 17:08:57,046 - oe-selftest - INFO - Adding: "in=
clude selftest.inc" in /home/flk/poky/build-core-st/conf/local.conf</div><d=
iv>2023-09-21 17:08:57,046 - oe-selftest - INFO - Adding: "include bblayers=
.inc" in bblayers.conf</div><div>2023-09-21 17:08:57,046 - oe-selftest - IN=
FO - test_sstate_allarch_samesigs (sstatetests.SStateHashSameSigs2.test_sst=
ate_allarch_samesigs)</div><div>2023-09-21 17:10:02,922 - oe-selftest - INF=
O - &nbsp;... ok</div><div>2023-09-21 17:10:02,955 - oe-selftest - INFO - -=
---------------------------------------------------------------------</div>=
<div>2023-09-21 17:10:02,955 - oe-selftest - INFO - Ran 1 test in 68.008s</=
div><div>2023-09-21 17:10:02,955 - oe-selftest - INFO - OK</div><div>2023-0=
9-21 17:10:07,700 - oe-selftest - INFO - RESULTS:</div><div>2023-09-21 17:1=
0:07,700 - oe-selftest - INFO - RESULTS - sstatetests.SStateHashSameSigs2.t=
est_sstate_allarch_samesigs: PASSED (65.88s)</div><div>2023-09-21 17:10:07,=
713 - oe-selftest - INFO - SUMMARY:</div><div>2023-09-21 17:10:07,713 - oe-=
selftest - INFO - oe-selftest () - Ran 1 test in 68.008s</div><div>2023-09-=
21 17:10:07,713 - oe-selftest - INFO - oe-selftest - OK - All required test=
s passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)</div></div>=
</div>
--=-lONTa0M1f8vnbBc0VpfL--


