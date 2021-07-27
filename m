Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.9181.1627428050506422013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 16:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16RNKnYP026812
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16RNKmr5012648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 16:20:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 27 Jul 2021 16:20:48 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 27 Jul 2021 16:20:48 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id C7EE6901563; Tue, 27 Jul 2021 16:20:47 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <tony.tascioglu@windriver.com>
Subject: [PATCH 6/6] ffmpeg: fix CVE-2021-33815
Date: Tue, 27 Jul 2021 16:20:47 -0700
Message-ID: <20210727232047.58238-6-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727232047.58238-1-tony.tascioglu@windriver.com>
References: <20210727232047.58238-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id 16RNKnYP026812
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

avcodec/exr: More strictly check dc_count

Fixes: out of array access
Fixes: exr/deneme

Found-by: Burak =C3=87ar=C4=B1k=C3=A7=C4=B1 <burakcarikci@crypttech.com>
Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>

CVE: CVE-2021-33815
Upstream-Status: Backport [26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-33815.patch    | 44 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33=
815.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.pat=
ch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch
new file mode 100644
index 0000000000..51edb76389
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-33815.patch
@@ -0,0 +1,44 @@
+From 26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 25 May 2021 19:29:18 +0200
+Subject: [PATCH] avcodec/exr: More strictly check dc_count
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: out of array access
+Fixes: exr/deneme
+
+Found-by: Burak =C3=87ar=C4=B1k=C3=A7=C4=B1 <burakcarikci@crypttech.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+
+CVE: CVE-2021-33815
+Upstream-Status: Backport [26d3c81bc5ef2f8c3f09d45eaeacfb4b1139a777]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ libavcodec/exr.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/exr.c b/libavcodec/exr.c
+index 9377a89169..4648ed7d62 100644
+--- a/libavcodec/exr.c
++++ b/libavcodec/exr.c
+@@ -1059,11 +1059,11 @@ static int dwa_uncompress(EXRContext *s, const u=
int8_t *src, int compressed_size
+         bytestream2_skip(&gb, ac_size);
+     }
+=20
+-    if (dc_size > 0) {
++    {
+         unsigned long dest_len =3D dc_count * 2LL;
+         GetByteContext agb =3D gb;
+=20
+-        if (dc_count > (6LL * td->xsize * td->ysize + 63) / 64)
++        if (dc_count !=3D dc_w * dc_h * 3)
+             return AVERROR_INVALIDDATA;
+=20
+         av_fast_padded_malloc(&td->dc_data, &td->dc_size, FFALIGN(dest_=
len, 64) * 2);
+--=20
+2.32.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.4.bb
index 70b1513048..02af257d0f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.=
xz \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
+           file://fix-CVE-2021-33815.patch \
            "
 SRC_URI[sha256sum] =3D "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96=
affc29e17645d909"
=20
--=20
2.31.1

