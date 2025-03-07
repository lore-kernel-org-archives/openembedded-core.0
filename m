Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5ACC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 15:09:10 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.13337.1741360144886123090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 07:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id AAEC7F91;
	Fri,  7 Mar 2025 16:09:02 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqZJu-1lkRDE0; Fri, 7 Mar 2025 16:09:02 +0100
Date: Fri, 07 Mar 2025 16:09:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <64ERSS.ZRYR49F4X5XV3@t-online.de>
In-Reply-To: <CANNYZj_uNe90wTLJkJhnL17JSbWi6xA1x+_YXHZ_ccWCHOhKrg@mail.gmail.com>
References: <20250307132900.456962-1-f_l_k@t-online.de>
	<CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
	<182A8AC2C61D2C82.9571@lists.openembedded.org>
	<OFCRSS.DMAMQS5P3JTF@t-online.de>
	<CANNYZj_uNe90wTLJkJhnL17JSbWi6xA1x+_YXHZ_ccWCHOhKrg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ylac9i2MfhvZtP9ylQFL"
X-TOI-EXPURGATEID: 150726::1741360142-24FF699A-CE72CE62/0/0 CLEAN NORMAL
X-TOI-MSGID: 1e96fc72-e0e3-44de-be7a-b8208d862659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 15:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212449

--=-ylac9i2MfhvZtP9ylQFL
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Mar 7 2025 at 15:47:54 +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> No, they should stay where they are. The question was why they need 
> to be in the main package, rather than ptest package?

Eventually we are just missing a guard?

 From 717bb3308fb1be398858bb07260a26fb9cb151ef Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
Date: Fri, 7 Mar 2025 15:47:51 +0100
Subject: [PATCH] tests/lib/meson.build: guard installation by 'if 
installed_tests_enabled'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 tests/lib/meson.build | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/lib/meson.build b/tests/lib/meson.build
index 25990a481..9e7ca4052 100644
--- a/tests/lib/meson.build
+++ b/tests/lib/meson.build
@@ -2,14 +2,16 @@
 # Copyright 2025 Simon McVittie
 # SPDX-License-Identifier: LGPL-2.1-or-later

-install_data(
- files(
- 'taptestrunner.py',
- 'testprogramrunner.py',
- ),
- install_dir: installed_tests_execdir,
- install_tag: 'tests',
-)
+if installed_tests_enabled
+ install_data(
+ files(
+ 'taptestrunner.py',
+ 'testprogramrunner.py',
+ ),
+ install_dir: installed_tests_execdir,
+ install_tag: 'tests',
+ )
+endif

 tests_conf = configuration_data()
 tests_conf.set('gir_suffix', gir_suffix)
-- 
2.48.1

This at least removes the do_install issue with tests disabled for me


--=-ylac9i2MfhvZtP9ylQFL
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Fri, Mar 7 2025 at 15:47:54 +01:00:0=
0, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote t=
ype=3D"cite">No, they should stay where they are. The question was why they=
 need to be in the main package, rather than ptest package?</blockquote><di=
v><br></div><div>Eventually we are just missing a guard?</div><div><br></di=
v><div>From 717bb3308fb1be398858bb07260a26fb9cb151ef Mon Sep 17 00:00:00 20=
01</div><div>From: Markus Volk &lt;f_l_k@t-online.de&gt;</div><div>Date: Fr=
i, 7 Mar 2025 15:47:51 +0100</div><div>Subject: [PATCH] tests/lib/meson.bui=
ld: guard installation by 'if installed_tests_enabled'</div><div><br></div>=
<div>Signed-off-by: Markus Volk &lt;f_l_k@t-online.de&gt;</div><div>---</di=
v><div>&nbsp;tests/lib/meson.build | 18 ++++++++++--------</div><div>&nbsp;=
1 file changed, 10 insertions(+), 8 deletions(-)</div><div><br></div><div>d=
iff --git a/tests/lib/meson.build b/tests/lib/meson.build</div><div>index 2=
5990a481..9e7ca4052 100644</div><div>--- a/tests/lib/meson.build</div><div>=
+++ b/tests/lib/meson.build</div><div>@@ -2,14 +2,16 @@</div><div>&nbsp;# C=
opyright 2025 Simon McVittie</div><div>&nbsp;# SPDX-License-Identifier: LGP=
L-2.1-or-later</div><div>&nbsp;</div><div>-install_data(</div><div>-  files=
(</div><div>-    'taptestrunner.py',</div><div>-    'testprogramrunner.py',=
</div><div>-  ),</div><div>-  install_dir: installed_tests_execdir,</div><d=
iv>-  install_tag: 'tests',</div><div>-)</div><div>+if installed_tests_enab=
led</div><div>+  install_data(</div><div>+    files(</div><div>+      'tapt=
estrunner.py',</div><div>+      'testprogramrunner.py',</div><div>+    ),</=
div><div>+    install_dir: installed_tests_execdir,</div><div>+    install_=
tag: 'tests',</div><div>+  )</div><div>+endif</div><div>&nbsp;</div><div>&n=
bsp;tests_conf =3D configuration_data()</div><div>&nbsp;tests_conf.set('gir=
_suffix', gir_suffix)</div><div>--&nbsp;</div><div>2.48.1</div><div><br></d=
iv><div>This at least removes the do_install issue with tests disabled for =
me</div></div>
--=-ylac9i2MfhvZtP9ylQFL--


