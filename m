Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0ECC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 15:55:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.30058.1684511705061390634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 08:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id DE206182CF
	for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 17:55:01 +0200 (CEST)
Received: from [192.168.178.156] ([84.163.41.143]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q02RZ-14Nw2q0; Fri, 19 May 2023 17:55:01 +0200
Date: Fri, 19 May 2023 17:54:54 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: widevine + arm64
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-Id: <IJXWUR.OUXJ6LSOIO482@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CaCsFsASMdH8I1Ot2Usc"
X-TOI-EXPURGATEID: 150726::1684511701-0A7CB714-AA0FFCC4/0/0 CLEAN NORMAL
X-TOI-MSGID: f5df701f-0709-4296-a7d9-41cc2038f665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 15:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181560

--=-CaCsFsASMdH8I1Ot2Usc
Content-Type: text/plain; charset=us-ascii; format=flowed

Finally there's a libwidevinecdm.so achievable for arm64. To make it 
usable by chromium/kodi it is required to patch glibc:

 From 85892fbc0d6f64f564f0d4c9514a7183ad8eb985 Mon Sep 17 00:00:00 2001
 From: alex <knaerzche@gmail.com>
Date: Sun, 17 Jul 2022 12:16:20 +0200
Subject: [PATCH] HACK: Don't check GLIBC_ABI_DT_RELR support for 
ChromeOS
 libwidevinecdm.so

Required starting with glibc 2.36
---
 elf/dl-version.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/elf/dl-version.c b/elf/dl-version.c
index cda0889209..058394f148 100644
--- a/elf/dl-version.c
+++ b/elf/dl-version.c
@@ -373,7 +373,8 @@ _dl_check_map_versions (struct link_map *map, int 
verbose, int trace_mode)
 	if (d->d_tag == DT_NEEDED)
 	  {
 	    const char *name = strtab + d->d_un.d_val;
-	    if (strncmp (name, "libc.so.", 8) == 0)
+	    if (strncmp (name, "libc.so.", 8) == 0 &&
+	        strstr (map->l_name, "libwidevinecdm.so") == NULL)
 	      {
 		_dl_exception_create
 		  (&exception, DSO_FILENAME (map->l_name),
-- 
2.37.1

I have tested this to work on raspberrypi4-64. Is this something that 
should be supported in oe-core or should it be added via bbappend?



--=-CaCsFsASMdH8I1Ot2Usc
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Finally there's a libwidevinecdm.s=
o achievable for arm64. To make it usable by chromium/kodi it is required t=
o patch glibc:</div><div><br></div><div><div>From 85892fbc0d6f64f564f0d4c95=
14a7183ad8eb985 Mon Sep 17 00:00:00 2001</div><div>From: alex &lt;knaerzche=
@gmail.com&gt;</div><div>Date: Sun, 17 Jul 2022 12:16:20 +0200</div><div>Su=
bject: [PATCH] HACK: Don't check GLIBC_ABI_DT_RELR support for ChromeOS</di=
v><div>&nbsp;libwidevinecdm.so</div><div><br></div><div>Required starting w=
ith glibc 2.36</div><div>---</div><div>&nbsp;elf/dl-version.c | 3 ++-</div>=
<div>&nbsp;1 file changed, 2 insertions(+), 1 deletion(-)</div><div><br></d=
iv><div>diff --git a/elf/dl-version.c b/elf/dl-version.c</div><div>index cd=
a0889209..058394f148 100644</div><div>--- a/elf/dl-version.c</div><div>+++ =
b/elf/dl-version.c</div><div>@@ -373,7 +373,8 @@ _dl_check_map_versions (st=
ruct link_map *map, int verbose, int trace_mode)</div><div>&nbsp;<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (d-&gt;d_tag =3D=
=3D DT_NEEDED)</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre">	</span> &nbsp;{</div><div>&nbsp;<span class=3D"Apple-tab-span=
" style=3D"white-space:pre">	</span> &nbsp; &nbsp;const char *name =3D strt=
ab + d-&gt;d_un.d_val;</div><div>-<span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre">	</span> &nbsp; &nbsp;if (strncmp (name, "libc.so.", 8) =3D=
=3D 0)</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span> &nbsp; &nbsp;if (strncmp (name, "libc.so.", 8) =3D=3D 0 &amp;&amp;=
</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</spa=
n> &nbsp; &nbsp; &nbsp; &nbsp;strstr (map-&gt;l_name, "libwidevinecdm.so") =
=3D=3D NULL)</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span> &nbsp; &nbsp; &nbsp;{</div><div>&nbsp;<span class=3D"Ap=
ple-tab-span" style=3D"white-space:pre">		</span>_dl_exception_create</div>=
<div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">		</spa=
n> &nbsp;(&amp;exception, DSO_FILENAME (map-&gt;l_name),</div><div>--&nbsp;=
</div><div>2.37.1</div></div><div><br></div><div>I have tested this to work=
 on raspberrypi4-64. Is this something that should be supported in oe-core =
or should it be added via bbappend?</div><div>&nbsp;</div></div>
--=-CaCsFsASMdH8I1Ot2Usc--


