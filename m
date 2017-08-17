Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 149D278447
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:45:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7H6j84x007849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:45:08 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 23:45:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 14:44:27 +0800
Message-ID: <c58b0c5bf1604819cfe032db3fcbf86c75ab181b.1502952233.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502952233.git.jackie.huang@windriver.com>
References: <cover.1502952233.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libsndfile1: Fix CVE-2017-8361 and CVE-2017-8365
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
X-List-Received-Date: Thu, 17 Aug 2017 06:45:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport the patch to fix two CVEs:

CVE-2017-8361:
The flac_buffer_copy function in flac.c in libsndfile 1.0.28 allows
remote attackers to cause a denial of service (buffer overflow and
application crash) or possibly have unspecified other impact via a
crafted audio file.

CVE-2017-8365:
The i2les_array function in pcm.c in libsndfile 1.0.28 allows remote
attackers to cause a denial of service (buffer over-read and application
crash) via a crafted audio file.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-8361
https://nvd.nist.gov/vuln/detail/CVE-2017-8365

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libsndfile1/CVE-2017-8361-8365.patch           | 73 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.patch
new file mode 100644
index 0000000000..ac99516bb3
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.patch
@@ -0,0 +1,73 @@
+From fd0484aba8e51d16af1e3a880f9b8b857b385eb3 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Wed, 12 Apr 2017 19:45:30 +1000
+Subject: [PATCH] FLAC: Fix a buffer read overrun
+
+Buffer read overrun occurs when reading a FLAC file that switches
+from 2 channels to one channel mid-stream. Only option is to
+abort the read.
+
+Closes: https://github.com/erikd/libsndfile/issues/230
+
+CVE: CVE-2017-8361 CVE-2017-8365
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/fd0484aba8e51d16af1e3a880f9b8b857b385eb3]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/common.h  |  1 +
+ src/flac.c    | 13 +++++++++++++
+ src/sndfile.c |  1 +
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/common.h b/src/common.h
+index 0bd810c..e2669b6 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -725,6 +725,7 @@ enum
+ 	SFE_FLAC_INIT_DECODER,
+ 	SFE_FLAC_LOST_SYNC,
+ 	SFE_FLAC_BAD_SAMPLE_RATE,
++	SFE_FLAC_CHANNEL_COUNT_CHANGED,
+ 	SFE_FLAC_UNKOWN_ERROR,
+ 
+ 	SFE_WVE_NOT_WVE,
+diff --git a/src/flac.c b/src/flac.c
+index 84de0e2..986a7b8 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -434,6 +434,19 @@ sf_flac_meta_callback (const FLAC__StreamDecoder * UNUSED (decoder), const FLAC_
+ 
+ 	switch (metadata->type)
+ 	{	case FLAC__METADATA_TYPE_STREAMINFO :
++			if (psf->sf.channels > 0 && psf->sf.channels != (int) metadata->data.stream_info.channels)
++			{	psf_log_printf (psf, "Error: FLAC stream changed from %d to %d channels\n"
++									"Nothing to be but to error out.\n" ,
++									psf->sf.channels, metadata->data.stream_info.channels) ;
++				psf->error = SFE_FLAC_CHANNEL_COUNT_CHANGED ;
++				return ;
++				} ;
++
++			if (psf->sf.channels > 0 && psf->sf.samplerate != (int) metadata->data.stream_info.sample_rate)
++			{	psf_log_printf (psf, "Warning: FLAC stream changed sample rates from %d to %d.\n"
++									"Carrying on as if nothing happened.",
++									psf->sf.samplerate, metadata->data.stream_info.sample_rate) ;
++				} ;
+ 			psf->sf.channels = metadata->data.stream_info.channels ;
+ 			psf->sf.samplerate = metadata->data.stream_info.sample_rate ;
+ 			psf->sf.frames = metadata->data.stream_info.total_samples ;
+diff --git a/src/sndfile.c b/src/sndfile.c
+index 4187561..e2a87be 100644
+--- a/src/sndfile.c
++++ b/src/sndfile.c
+@@ -245,6 +245,7 @@ ErrorStruct SndfileErrors [] =
+ 	{	SFE_FLAC_INIT_DECODER	, "Error : problem with initialization of the flac decoder." },
+ 	{	SFE_FLAC_LOST_SYNC		, "Error : flac decoder lost sync." },
+ 	{	SFE_FLAC_BAD_SAMPLE_RATE, "Error : flac does not support this sample rate." },
++	{	SFE_FLAC_CHANNEL_COUNT_CHANGED, "Error : flac channel changed mid stream." },
+ 	{	SFE_FLAC_UNKOWN_ERROR	, "Error : unknown error in flac decoder." },
+ 
+ 	{	SFE_WVE_NOT_WVE			, "Error : not a WVE file." },
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index e6a92a2a41..f80ce2fc99 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -7,6 +7,7 @@ LICENSE = "LGPLv2.1"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-6892.patch \
+           file://CVE-2017-8361-8365.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.11.0


