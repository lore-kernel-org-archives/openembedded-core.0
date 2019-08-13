Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Aug 2019 22:36:39 UTC
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7C06375E80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=sendgrid.me; 
	h=from:to:cc:subject:mime-version:content-type; s=smtpapi; 
	bh=SvZgrJNqBoZHICcvcDQQTeSkPtg=; b=JYgKvRvKPOvFq9MdbzW8B/xzG9l6a
	yrW0TL6HdXzHZ7dIrRkbeHBvyo1njifraG6FFEIrOQI3JC/iaBQtIGg9Pn7ss32r
	043it6i8D+Yu2xNP1UI6O0htaNC7R5g7VJA4BDZI0h+hrAY9n73yE/qGZDxYMlnr
	7XBTclwSaqRMbQ=
Received: by filter0129p3las1.sendgrid.net with SMTP id
	filter0129p3las1-32396-5D533A0A-39
	2019-08-13 22:30:34.798526509 +0000 UTC m=+1567332.621435828
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0005p1las1.sendgrid.net (SG) with ESMTP id
	Spemn3zkQoWM9HNgPIvHeA Tue, 13 Aug 2019 22:30:34.728 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:31:35 +0000 (UTC)
Message-Id: <20190813223031.40138-1-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-SG-EID: NueaD3OYy6TFANBcuSZZzWeqNF8z73veS5dGPAsjLWggnA2yQn0uEn6uw+MVASYbXwb4xHL1lfvezZ
	uPmA0fqL1799XGhBkXJdN1gFHwv7IcTk+2AoiDYqqtuUjvr4q9EK2VqP0+W0/Vo4TCviRCZT76fgii
	NI1M3dNBuHlNpTZu4LHyFmSumi4La++fFlvq6aYjZzkzLQRRVWEUQcTGv9W8O/5L1cf2x1HwpzRCoU
	lOcnLys2pHT/e9udaqaFJN
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH 1/4] curl: fix CVE-2018-16890 CVE-2019-3822 CVE-2019-3823
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 22:36:40 -0000
Content-type: multipart/alternative;
	boundary="----------=_1565735435-32668-382"

------------=_1565735435-32668-382
content-transfer-encoding: quoted-printable

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
---=0D
 .../curl/curl/CVE-2018-16890.patch            | 50 +++++++++++++++++=0D
 .../curl/curl/CVE-2019-3822.patch             | 47 ++++++++++++++++=0D
 .../curl/curl/CVE-2019-3823.patch             | 55 +++++++++++++++++++=0D
 meta/recipes-support/curl/curl_7.61.0.bb      |  3 +=0D
 4 files changed, 155 insertions(+)=0D
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch=0D
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch=0D
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch=0D
=0D
diff --git a/meta/recipes-support/curl/curl/CVE-2018-16890.patch b/meta/rec=
ipes-support/curl/curl/CVE-2018-16890.patch=0D
new file mode 100644=0D
index 0000000000..3776f362bc=0D
--- /dev/null=0D
+++ b/meta/recipes-support/curl/curl/CVE-2018-16890.patch=0D
@@ -0,0 +1,50 @@=0D
+From 53d3c2f92b4a7561b1006494badf8cf2ef9110c0 Mon Sep 17 00:00:00 2001=0D
+From: Daniel Stenberg <daniel@haxx.se>=0D
+Date: Wed, 2 Jan 2019 20:33:08 +0100=0D
+Subject: [PATCH 1/3] NTLM: fix size check condition for type2 received dat=
a=0D
+=0D
+Bug: https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIX=
suYawlW3mAc8KSIVCn7Sr15C6jasXKgfgJg3JjJc2B5tUGp03H07-2B9S6u-2FfoRsGaNA-3D-3=
D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2=
FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkb2piM5nuT9Okl3ZrJA9sAE-2B5rm=
YECHdFNdUX0JlH7LDIVejeTQadVG6ba-2FpEkCdCA9gq7zRkLAgdI3PN-2BCxa3dccdSBFpI1pL=
4M0QWKi8etP4TfG1trESO3T7x1KWt9hdClBaPVmjcfOg0NnZqj3dM=0D
+Reported-by: Wenxiang Qian=0D
+CVE-2018-16890=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2=
BOxbx-2BokIEd78jiad-2F22EvF-2F5AbNKhGzn8FPX-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0pi=
OBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-=
2FH99gGD0yxa2eDYEjnkkYh8rqSb35IOFzYXlwANJZDcoaGAvdMBQIW66yHB0q840xeh1nsvNy9=
9-2BeC8OnXMhl6mIja7Rhuos5DP-2FrmBNWuySm6VU5JTOy1kFNvV-2BydqaqtGXpyIgtzWMDkU=
6Z-2BR0cXTCVLDdCzHe-2Fmc15i6Akd=0D
+/b780b30d1377adb10bbe774835f49e9b237fb9bb]=0D
+=0D
+CVE: CVE-2018-16890=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ lib/vauth/ntlm.c | 7 ++++---=0D
+ 1 file changed, 4 insertions(+), 3 deletions(-)=0D
+=0D
+diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c=0D
+index cdb8d8f0d..0212756ab 100644=0D
+--- a/lib/vauth/ntlm.c=0D
++++ b/lib/vauth/ntlm.c=0D
+@@ -5,7 +5,7 @@=0D
+  *                            | (__| |_| |  _ <| |___=0D
+  *                             \___|\___/|_| \_\_____|=0D
+  *=0D
+- * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.=
=0D
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.=
=0D
+  *=0D
+  * This software is licensed as described in the file COPYING, which=0D
+  * you should have received as part of this distribution. The terms=0D
+@@ -182,10 +182,11 @@ static CURLcode ntlm_decode_type2_target(struct Curl=
_easy *data,=0D
+     target_info_len =3D Curl_read16_le(&buffer[40]);=0D
+     target_info_offset =3D Curl_read32_le(&buffer[44]);=0D
+     if(target_info_len > 0) {=0D
+-      if(((target_info_offset + target_info_len) > size) ||=0D
++      if((target_info_offset >=3D size) ||=0D
++         ((target_info_offset + target_info_len) > size) ||=0D
+          (target_info_offset < 48)) {=0D
+         infof(data, "NTLM handshake failure (bad type-2 message). "=0D
+-                    "Target Info Offset Len is set incorrect by the peer\=
n");=0D
++              "Target Info Offset Len is set incorrect by the peer\n");=
=0D
+         return CURLE_BAD_CONTENT_ENCODING;=0D
+       }=0D
+ =0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-support/curl/curl/CVE-2019-3822.patch b/meta/reci=
pes-support/curl/curl/CVE-2019-3822.patch=0D
new file mode 100644=0D
index 0000000000..4f612ddd5e=0D
--- /dev/null=0D
+++ b/meta/recipes-support/curl/curl/CVE-2019-3822.patch=0D
@@ -0,0 +1,47 @@=0D
+From 761b51f66c7b1cd2cd6c71b807bfdb6a27c49b30 Mon Sep 17 00:00:00 2001=0D
+From: Daniel Stenberg <daniel@haxx.se>=0D
+Date: Thu, 3 Jan 2019 12:59:28 +0100=0D
+Subject: [PATCH 2/3] ntlm: fix *_type3_message size check to avoid buffer=
=0D
+ overflow=0D
+=0D
+Bug: https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIX=
suYawlW3mAc8KSIVCn7Sr16swIdigko5fNDjNRt0Dh6FfGTpPs9ibM6aBry51kJrnw-3D-3D_TE=
0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1v=
YL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkbJbCzXOiW1odOTtQFdFcpJzsRBVUETMO=
tLC0B-2BdylXcUavysDy2hajcvoqOZD-2ByPOIoUO2RTyiKiVNqvL52XWE0BudzTX7FaPC6VtNn=
fkW1p1Uwi1FAOsHmAIdfS0Hk46aZhgWeAHazbigfQ1Wrvpc=0D
+Reported-by: Wenxiang Qian=0D
+CVE-2019-3822=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2=
BOxbx-2BokIEd78jiad-2F22EvF-2F5AbNKhGzn8FPX-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0pi=
OBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-=
2FH99gGD0yxa2eDYEjnkkZyVjLXyu6AfrfslPgZqQqfmT-2FCjlb31qQx-2BPRmMVneLfPjeil2=
-2BTKjDA9s3w3kZFEyRIX6Yy-2B0lQECXSq5tv3xNIDIn46JHgTnKWqkfIQHuY7yT5WYG3E5lOF=
cZYcsoosqoxeJTKgg9-2BPkTA1v944K=0D
+/50c9484278c63b958655a717844f0721263939cc]=0D
+=0D
+CVE: CVE-2019-3822=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ lib/vauth/ntlm.c | 11 +++++++----=0D
+ 1 file changed, 7 insertions(+), 4 deletions(-)=0D
+=0D
+diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c=0D
+index 0212756ab..3be0403d9 100644=0D
+--- a/lib/vauth/ntlm.c=0D
++++ b/lib/vauth/ntlm.c=0D
+@@ -777,11 +777,14 @@ CURLcode Curl_auth_create_ntlm_type3_message(struct =
Curl_easy *data,=0D
+   });=0D
+ =0D
+ #ifdef USE_NTRESPONSES=0D
+-  if(size < (NTLM_BUFSIZE - ntresplen)) {=0D
+-    DEBUGASSERT(size =3D=3D (size_t)ntrespoff);=0D
+-    memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);=0D
+-    size +=3D ntresplen;=0D
++  /* ntresplen + size should not be risking an integer overflow here */=
=0D
++  if(ntresplen + size > sizeof(ntlmbuf)) {=0D
++    failf(data, "incoming NTLM message too big");=0D
++    return CURLE_OUT_OF_MEMORY;=0D
+   }=0D
++  DEBUGASSERT(size =3D=3D (size_t)ntrespoff);=0D
++  memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);=0D
++  size +=3D ntresplen;=0D
+ =0D
+   DEBUG_OUT({=0D
+     fprintf(stderr, "\n   ntresp=3D");=0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-support/curl/curl/CVE-2019-3823.patch b/meta/reci=
pes-support/curl/curl/CVE-2019-3823.patch=0D
new file mode 100644=0D
index 0000000000..194e6e6430=0D
--- /dev/null=0D
+++ b/meta/recipes-support/curl/curl/CVE-2019-3823.patch=0D
@@ -0,0 +1,55 @@=0D
+From 40f6c913f63cdbfa81daa7ac7f1c7415bb99edeb Mon Sep 17 00:00:00 2001=0D
+From: Daniel Gustafsson <daniel@yesql.se>=0D
+Date: Sat, 19 Jan 2019 00:42:47 +0100=0D
+Subject: [PATCH 3/3] smtp: avoid risk of buffer overflow in strtol=0D
+=0D
+If the incoming len 5, but the buffer does not have a termination=0D
+after 5 bytes, the strtol() call may keep reading through the line=0D
+buffer until is exceeds its boundary. Fix by ensuring that we are=0D
+using a bounded read with a temporary buffer on the stack.=0D
+=0D
+Bug: https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIX=
suYawlW3mAc8KSIVCn7Sr17bxD3qQbRJHwN3rEunY9YFM-2FGFwQQ-2BqqtWua0S2Yp0TA-3D-3=
D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2=
FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkYEinH-2FgcBH7Tq8AaX2KZhuPq-2=
Fy3RuudDWkzQA9mDGAL1rZ7iXE22kbqnGazRo1W7NbgEx2qaEtnh0kwmXyEvCysVMqQonIlhT9S=
i5hxh5wcZGaHj8u-2FLtNcXnlYQKQvGtTsNsNRPcgcRixjIil-2BcP2=0D
+Reported-by: Brian Carpenter (Geeknik Labs)=0D
+CVE-2019-3823=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2=
BOxbx-2BokIEd78jiad-2F22EvF-2F5AbNKhGzn8FPX-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0pi=
OBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-=
2FH99gGD0yxa2eDYEjnkkY6vuyp3O3-2B5qsqS-2FksCyApU0viIVT2cbmTaVxEVRuj6OTq95gN=
M-2ByiZ6IEdpBGf82PXxJQvgJNB-2FX47uHixp2OyDt5VHOQIIh1MIdb5fxbPC-2BcHk0uIz388=
bT8U1ukdNPZyDlN0V0T0xsOjvHFc-2B2Y=0D
+/39df4073e5413fcdbb5a38da0c1ce6f1c0ceb484]=0D
+=0D
+CVE: CVE-2019-3823=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ lib/smtp.c | 8 ++++++--=0D
+ 1 file changed, 6 insertions(+), 2 deletions(-)=0D
+=0D
+diff --git a/lib/smtp.c b/lib/smtp.c=0D
+index ecf10a41a..1b9f92d30 100644=0D
+--- a/lib/smtp.c=0D
++++ b/lib/smtp.c=0D
+@@ -5,7 +5,7 @@=0D
+  *                            | (__| |_| |  _ <| |___=0D
+  *                             \___|\___/|_| \_\_____|=0D
+  *=0D
+- * Copyright (C) 1998 - 2018, Daniel Stenberg, <daniel@haxx.se>, et al.=
=0D
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.=
=0D
+  *=0D
+  * This software is licensed as described in the file COPYING, which=0D
+  * you should have received as part of this distribution. The terms=0D
+@@ -207,8 +207,12 @@ static bool smtp_endofresp(struct connectdata *conn, =
char *line, size_t len,=0D
+      Section 4. Examples of RFC-4954 but some e-mail servers ignore this =
and=0D
+      only send the response code instead as per Section 4.2. */=0D
+   if(line[3] =3D=3D ' ' || len =3D=3D 5) {=0D
++    char tmpline[6];=0D
++=0D
+     result =3D TRUE;=0D
+-    *resp =3D curlx_sltosi(strtol(line, NULL, 10));=0D
++    memset(tmpline, '\0', sizeof(tmpline));=0D
++    memcpy(tmpline, line, (len =3D=3D 5 ? 5 : 3));=0D
++    *resp =3D curlx_sltosi(strtol(tmpline, NULL, 10));=0D
+ =0D
+     /* Make sure real server never sends internal value */=0D
+     if(*resp =3D=3D 1)=0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-suppor=
t/curl/curl_7.61.0.bb=0D
index 1027f75e9e..c1e4342df5 100644=0D
--- a/meta/recipes-support/curl/curl_7.61.0.bb=0D
+++ b/meta/recipes-support/curl/curl_7.61.0.bb=0D
@@ -13,6 +13,9 @@ SRC_URI =3D "https://u12060237.ct.sendgrid.net/wf/click?u=
pn=3Da3Po4i5toNpKG6uRFNTh8Mij1UJJ0s7eaefE5fjBvMoK7n3E1d4Vr77hdrxhdo3kHD4zsr=
mpJIYsuxtLMzY2nQ-3D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlO=
tbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkbjw7yBa=
9AyY8PBCNAv3tBbOXVoV1Ozdj1SBXbDS03uJjc-2F-2B6upP3vSwyusGzF-2BrZEWWVGm8IkzC0=
A-2BdPnThUkoLPfnkuky8lFD7hq02LAd7fnFQj69S98jxXxCc0RncdWDaW-2F68KnI1wTGPebZr=
pml \=0D
            file://CVE-2018-16842.patch \=0D
            file://CVE-2019-5435.patch \=0D
            file://CVE-2019-5436.patch \=0D
+           file://CVE-2018-16890.patch \=0D
+           file://CVE-2019-3822.patch \=0D
+           file://CVE-2019-3823.patch \=0D
 "=0D
 =0D
 SRC_URI[md5sum] =3D "31d0a9f48dc796a7db351898a1e5058a"=0D
-- =0D
2.22.0=0D


------------=_1565735435-32668-382
Content-Type: text/html
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body>
<h3>Signed-off-by: Kevin Weng &lt;t-keweng@microsoft.com&gt;</h3>
<pre>.../curl/curl/CVE-2018-16890.patch            | 50 +++++++++++++++++
.../curl/curl/CVE-2019-3822.patch             | 47 ++++++++++++++++
.../curl/curl/CVE-2019-3823.patch             | 55 +++++++++++++++++++
meta/recipes-support/curl/curl_7.61.0.bb      |  3 +
4 files changed, 155 insertions(+)
create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch
create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch
create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch</pre>
<p>diff --git a/meta/recipes-support/curl/curl/CVE-2018-16890.patch b/meta/=
recipes-support/curl/curl/CVE-2018-16890.patch new file mode 100644 index 0=
000000000..3776f362bc --- /dev/null +++ b/meta/recipes-support/curl/curl/CV=
E-2018-16890.patch @@ -0,0 +1,50 @@ +From 53d3c2f92b4a7561b1006494badf8cf2e=
f9110c0 Mon Sep 17 00:00:00 2001 +From: Daniel Stenberg &lt;daniel@haxx.se&=
gt; +Date: Wed, 2 Jan 2019 20:33:08 +0100 +Subject: [PATCH 1/3] NTLM: fix s=
ize check condition for type2 received data + +Bug: <a href=3D"https://u120=
60237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsuYawlW3mAc8KSIVCn=
7Sr15C6jasXKgfgJg3JjJc2B5tUGp03H07-2B9S6u-2FfoRsGaNA-3D-3D_TE0Kxc-2FihH-2BE=
aJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSy=
f-2BcHR-2FH99gGD0yxa2eDYEjnkkZ3q-2B67vtyhjRXye3X5wFj1YopTSAk5Ghi5zGLTSp0R-2=
BesqjMnZSBIQte-2FKY-2FwgQTg-2FQqDB3i-2BIdjRqTFYWHhWmQLTLv9u3mf-2FFNv-2BigQq=
kM7KcsUfyc29SOElH5SnNKCZpVtPS-2F8fNlROczCSn5Z8u">https://curl.haxx.se/docs/=
CVE-2018-16890.html</a> +Reported-by: Wenxiang Qian +CVE-2018-16890 + +Upst=
ream-Status: Backport +[<a href=3D"https://u12060237.ct.sendgrid.net/wf/cli=
ck?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2BOxbx-2BokIEd78jiad-2F22EvF-2F5AbNKhGzn8FP=
X-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIp=
o7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkbfyP9Hb4AT9te9JryfAuI=
A1BGpUIhQBgDhTQ-2FhwIlJUb9jEhlFXvRJuPqnZcFuWlOi2aUEuGkSAxP6h16UqA68h4LTavtE=
4TwLnozPPXJxP6v6Ih6A5zS8WEPqSjBL3gPYKE4qdTP41X9n-2BjlWFFxi">https://github.=
com/curl/curl/commit</a> +/b780b30d1377adb10bbe774835f49e9b237fb9bb] + +CVE=
: CVE-2018-16890 + +Signed-off-by: Kevin Weng &lt;t-keweng@microsoft.com&gt=
; +--- + lib/vauth/ntlm.c | 7 ++++--- + 1 file changed, 4 insertions(+), 3 =
deletions(-) + +diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c +index cdb=
8d8f0d..0212756ab 100644 +--- a/lib/vauth/ntlm.c ++++ b/lib/vauth/ntlm.c +@=
@ -5,7 +5,7 @@ +  *                            | (__| |_| |  _ &lt;| |___ +=
  *                             \___|\___/|_| \_\_____| +  * +- * Copyright=
 &copy; 1998 &ndash; 2017, Daniel Stenberg, &lt;daniel@haxx.se&gt;, et al. =
++ * Copyright &copy; 1998 &ndash; 2019, Daniel Stenberg, &lt;daniel@haxx.s=
e&gt;, et al. +  * +  * This software is licensed as described in the file =
COPYING, which +  * you should have received as part of this distribution. =
The terms +@@ -182,10 +182,11 @@ static CURLcode ntlm_decode_type2_target(s=
truct Curl_easy *data, +     target_info_len =3D Curl_read16_le(&amp;buffer=
[40]); +     target_info_offset =3D Curl_read32_le(&amp;buffer[44]); +     =
if(target_info_len &gt; 0) { +-      if(((target_info_offset + target_info_=
len) &gt; size) || ++      if((target_info_offset &gt;=3D size) || ++      =
   ((target_info_offset + target_info_len) &gt; size) || +          (target=
_info_offset &lt; 48)) { +         infof(data, &quot;NTLM handshake failure=
 (bad type-2 message). &quot; +-                    &quot;Target Info Offse=
t Len is set incorrect by the peer\n&quot;); ++              &quot;Target I=
nfo Offset Len is set incorrect by the peer\n&quot;); +         return CURL=
E_BAD_CONTENT_ENCODING; +       } + +-- +2.22.0 + diff --git a/meta/recipes=
-support/curl/curl/CVE-2019-3822.patch b/meta/recipes-support/curl/curl/CVE=
-2019-3822.patch new file mode 100644 index 0000000000..4f612ddd5e --- /dev=
/null +++ b/meta/recipes-support/curl/curl/CVE-2019-3822.patch @@ -0,0 +1,4=
7 @@ +From 761b51f66c7b1cd2cd6c71b807bfdb6a27c49b30 Mon Sep 17 00:00:00 200=
1 +From: Daniel Stenberg &lt;daniel@haxx.se&gt; +Date: Thu, 3 Jan 2019 12:5=
9:28 +0100 +Subject: [PATCH 2/3] ntlm: fix *_type3_message size check to av=
oid buffer + overflow + +Bug: <a href=3D"https://u12060237.ct.sendgrid.net/=
wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsuYawlW3mAc8KSIVCn7Sr16swIdigko5fNDjNRt0=
Dh6FfGTpPs9ibM6aBry51kJrnw-3D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHz=
eWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEj=
nkkYGziql-2B9pL3R79OqEV4EwDBPfhNzGW2Kj2khXqXBvySHejML2tqsm3n-2Byqs7M98agA15=
zl3wmWYD2k4Xy3nqLO8yKg-2FG8vr33vz9iwN634IWrpHNe-2BTHJcgMf1-2Bwsxnec5yhfz3Tt=
wAL2JUtNzAc89">https://curl.haxx.se/docs/CVE-2019-3822.html</a> +Reported-b=
y: Wenxiang Qian +CVE-2019-3822 + +Upstream-Status: Backport +[<a href=3D"h=
ttps://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2BOx=
bx-2BokIEd78jiad-2F22EvF-2F5AbNKhGzn8FPX-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0piOBm=
40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH=
99gGD0yxa2eDYEjnkkYtqXAfPxKeCYVZpz9z3vmGmbOcH-2Fphxgb6yEvSk5klvAyOQIx-2FrYQ=
2nAN1okiWOfghFTAhIrq44lBSFHfarVXkexltyyKjQ-2FbKtwlpHNG7smSGXE4o2MZR9Jfjh7iB=
ekOVbGLyx7EgEDxYP5aOlBfp">https://github.com/curl/curl/commit</a> +/50c9484=
278c63b958655a717844f0721263939cc] + +CVE: CVE-2019-3822 + +Signed-off-by: =
Kevin Weng &lt;t-keweng@microsoft.com&gt; +--- + lib/vauth/ntlm.c | 11 ++++=
+++---- + 1 file changed, 7 insertions(+), 4 deletions(-) + +diff --git a/l=
ib/vauth/ntlm.c b/lib/vauth/ntlm.c +index 0212756ab..3be0403d9 100644 +--- =
a/lib/vauth/ntlm.c ++++ b/lib/vauth/ntlm.c +@@ -777,11 +777,14 @@ CURLcode =
Curl_auth_create_ntlm_type3_message(struct Curl_easy <strong>data, +   }); =
+ + #ifdef USE_NTRESPONSES +-  if(size &lt; (NTLM_BUFSIZE &ndash; ntresplen=
)) { +-    DEBUGASSERT(size =3D=3D (size_t)ntrespoff); +-    memcpy(&amp;nt=
lmbuf[size], ptr_ntresp, ntresplen); +-    size +=3D ntresplen; ++  /</stro=
ng> ntresplen + size should not be risking an integer overflow here */ ++  =
if(ntresplen + size &gt; sizeof(ntlmbuf)) { ++    failf(data, &quot;incomin=
g NTLM message too big&quot;); ++    return CURLE_OUT_OF_MEMORY; +   } ++  =
DEBUGASSERT(size =3D=3D (size_t)ntrespoff); ++  memcpy(&amp;ntlmbuf[size], =
ptr_ntresp, ntresplen); ++  size +=3D ntresplen; + +   DEBUG_OUT({ +     fp=
rintf(stderr, &quot;\n   ntresp=3D&quot;); +-- +2.22.0 + diff --git a/meta/=
recipes-support/curl/curl/CVE-2019-3823.patch b/meta/recipes-support/curl/c=
url/CVE-2019-3823.patch new file mode 100644 index 0000000000..194e6e6430 -=
-- /dev/null +++ b/meta/recipes-support/curl/curl/CVE-2019-3823.patch @@ -0=
,0 +1,55 @@ +From 40f6c913f63cdbfa81daa7ac7f1c7415bb99edeb Mon Sep 17 00:00=
:00 2001 +From: Daniel Gustafsson &lt;daniel@yesql.se&gt; +Date: Sat, 19 Ja=
n 2019 00:42:47 +0100 +Subject: [PATCH 3/3] smtp: avoid risk of buffer over=
flow in strtol + +If the incoming len 5, but the buffer does not have a ter=
mination +after 5 bytes, the strtol() call may keep reading through the lin=
e +buffer until is exceeds its boundary. Fix by ensuring that we are +using=
 a bounded read with a temporary buffer on the stack. + +Bug: <a href=3D"ht=
tps://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsuYawlW3=
mAc8KSIVCn7Sr17bxD3qQbRJHwN3rEunY9YFM-2FGFwQQ-2BqqtWua0S2Yp0TA-3D-3D_TE0Kxc=
-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7R=
dHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkbuXWq8yA76NLdDMCKi4Nu5OZakSVClfIp1Zp=
hWmBXTiRG51fUpCm2XxKf8LIT9LkhLsSgy1s3SkXQD7uENB-2FkAaTfDBWqSmtfNY40WPIebHLI=
ji4b4QWMFszHTJsXO-2BG2X-2FdG0o0UF6UaxtpDS-2BYXG">https://curl.haxx.se/docs/=
CVE-2019-3823.html</a> +Reported-by: Brian Carpenter (Geeknik Labs) +CVE-20=
19-3823 + +Upstream-Status: Backport +[<a href=3D"https://u12060237.ct.send=
grid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsm-2BOxbx-2BokIEd78jiad-2F22EvF=
-2F5AbNKhGzn8FPX-2FD9Za_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZl=
OtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkka3lrOW=
KES2RhRNheyFy5a9Uj-2Bgs0-2B68XtHbmfc-2F4wp-2FJKOyd-2BtWEubGB5iubDUOoYdXNbBm=
n0gKTuQbdtDr1q9S-2FqL-2F5s-2Bt-2Bod29utAe53W5mZ2m-2BiAyhjI2fDKtM6DQ4wbp6oxC=
c5C5jxRr0uGr-2Bm">https://github.com/curl/curl/commit</a> +/39df4073e5413fc=
dbb5a38da0c1ce6f1c0ceb484] + +CVE: CVE-2019-3823 + +Signed-off-by: Kevin We=
ng &lt;t-keweng@microsoft.com&gt; +--- + lib/smtp.c | 8 ++++++-- + 1 file c=
hanged, 6 insertions(+), 2 deletions(-) + +diff --git a/lib/smtp.c b/lib/sm=
tp.c +index ecf10a41a..1b9f92d30 100644 +--- a/lib/smtp.c ++++ b/lib/smtp.c=
 +@@ -5,7 +5,7 @@ +  *                            | (__| |_| |  _ &lt;| |__=
_ +  *                             \___|\___/|_| \_\_____| +  * +- * Copyri=
ght &copy; 1998 &ndash; 2018, Daniel Stenberg, &lt;daniel@haxx.se&gt;, et a=
l. ++ * Copyright &copy; 1998 &ndash; 2019, Daniel Stenberg, &lt;daniel@hax=
x.se&gt;, et al. +  * +  * This software is licensed as described in the fi=
le COPYING, which +  * you should have received as part of this distributio=
n. The terms +@@ -207,8 +207,12 @@ static bool smtp_endofresp(struct connec=
tdata <strong>conn, char *line, size_t len, +      Section 4. Examples of R=
FC-4954 but some e-mail servers ignore this and +      only send the respon=
se code instead as per Section 4.2. */ +   if(line[3] =3D=3D ' ' || len =3D=
=3D 5) { ++    char tmpline[6]; ++ +     result =3D TRUE; +-    *resp =3D c=
urlx_sltosi(strtol(line, NULL, 10)); ++    memset(tmpline, &lsquo;\0&rsquo;=
, sizeof(tmpline)); ++    memcpy(tmpline, line, (len =3D=3D 5 ? 5 : 3)); ++=
    *resp =3D curlx_sltosi(strtol(tmpline, NULL, 10)); + +     /</strong> M=
ake sure real server never sends internal value */ +     if(*resp =3D=3D 1)=
 +-- +2.22.0 + diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta=
/recipes-support/curl/curl_7.61.0.bb index 1027f75e9e..c1e4342df5 100644 --=
- a/meta/recipes-support/curl/curl_7.61.0.bb +++ b/meta/recipes-support/cur=
l/curl_7.61.0.bb @@ -13,6 +13,9 @@ SRC_URI =3D &quot;<a href=3D"https://u12=
060237.ct.sendgrid.net/wf/click?upn=3Da3Po4i5toNpKG6uRFNTh8Mij1UJJ0s7eaefE5=
fjBvMpSFvFRqQNhCuPSRxSZtLzB_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsy=
ZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTSyf-2BcHR-2FH99gGD0yxa2eDYEjnkkZo=
D1Q-2BmgT4opZq5-2FiFTHajI9w7ddyyjuTK-2ByDmxxVRpu3toZ3MoQ2RZ7-2BlbDPmO25TsPZ=
ucV9ocAX-2FzRsy2Xji2s4X2mC04o1s7ZLGSSQDOZ18OklrWnj6T79ueMuEjSJhqfEjbHr6bGD-=
2FqUmdEa86">http://curl.haxx.se/download/curl-$</a>{PV}.tar.bz2 \</p>
<pre>file://CVE-2018-16842.patch \
file://CVE-2019-5435.patch \
file://CVE-2019-5436.patch \</pre>
<p>+           <a href=3D"file://CVE-2018-16890.patch">file://CVE-2018-1689=
0.patch</a> \ +           <a href=3D"file://CVE-2019-3822.patch">file://CVE=
-2019-3822.patch</a> \ +           <a href=3D"file://CVE-2019-3823.patch">f=
ile://CVE-2019-3823.patch</a> \</p>
<pre>"

SRC_URI[md5sum] =3D "31d0a9f48dc796a7db351898a1e5058a"</pre>
<p>&mdash; 2.22.0</p>

<img src=3D"https://u12060237.ct.sendgrid.net/wf/open?upn=3DTE0Kxc-2FihH-2B=
EaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FT1vYL7RdHUXx5bTS=
yf-2BcHR-2FH99gGD0yxa2eDYEjnkkbF3N0T58QoqYjHR-2B4RBBGWvN9Jn2C5umu65lQgGOQDo=
CQzScGeU89FgWMa6QrgUvPavfyrP9NQ5aAz0JukbRr9UhBQzRkoR8NE8f0erz-2FgQOPY-2BcdK=
8mNbxmeT7QETM2mK-2F3Yf7-2BfhZ8ghFH1ENUb9" alt=3D"" width=3D"1" height=3D"1"=
 border=3D"0" style=3D"height:1px !important;width:1px !important;border-wi=
dth:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-=
right:0 !important;margin-left:0 !important;padding-top:0 !important;paddin=
g-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;=
"/>
</body></html>

------------=_1565735435-32668-382--
