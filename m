Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id AE12C7D0D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:21:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y13so12188397wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2qSHE/aYFHJrz634e55LJG6G/SV51x7I0H7EB9OYyYg=;
	b=sz2XBfm7mbIEKwM/ZJLuldOh9BC0Rbt8FJxQ90F0PtX5tGE8/lE4rc9ew9e/6pXFK7
	q0C2M64RIq4M12Vq08d34D3JlUuHmuQ5qIwVljoBC0nqstsx+rBA/ViNMgV175Ng7ehf
	7HR3TG87vIXa9+OFVmg3PvXeKLg2P0OsMpcYOgT4BjEPwWHI4XiL9k5vUO+Mj+9CNXD6
	2c9RYbQe+Z+Q0iV5Yt9qRJCRVXySi1l+mSdCURxiZun8+OdGbgfO598g+/6InGB+TQ9L
	51n9c6g/UDmJf3GXCeINQmDEAPRoLga7NGtwCuAs3crxI1wPC0FWIeA0DSyKLyW2aOUA
	o8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2qSHE/aYFHJrz634e55LJG6G/SV51x7I0H7EB9OYyYg=;
	b=m7AFhzN1x5qdkZITejXyOsjX24vMfLV1pprNAaAxBQPJJbylZLRuYqXYnTyzN1+Epn
	stWRLmB4v3kuARZq6+6vmouhlZmh8UXfimBizmM5JzM7GCKxpPRYY/QL+Sd+sUSqwvaV
	tp1X+WugqSIbGLfnckwL0pnZcslnAnQuQR3FhpkTh6p2akqcCBPkn91eCk7Gd2tU+BFG
	QPu0eXbLVzJmD5ht+jP57QHhxektfusdHqCS/MviioX5tC6TES2QdXA40n07usB9M5ew
	Vlj24kUi1MKOzyH/Z7I7GrurxLDgH1o50XWk23fPzVH7eo30Ioy6PBSgSMANF2c6ztz/
	B06g==
X-Gm-Message-State: APjAAAVwxN30ngB8vnn5S3WQauV3tOtmLveKipc9uQ2A9euZKbCvmdGI
	y60Lh4fLxFsWqEgfn3//xRRRLi5Ia2s=
X-Google-Smtp-Source: APXvYqz1JYxZ3FMbgUoQ6Ct6HGrPz7rIhIUvz72oPJBKnYK582NZczRBoODjaAATjVCR3IJ04Vs8uQ==
X-Received: by 2002:a05:6000:1292:: with SMTP id
	f18mr17828738wrx.115.1553556073269; 
	Mon, 25 Mar 2019 16:21:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o2sm10795461wrs.89.2019.03.25.16.21.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 16:21:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 23:21:08 +0000
Message-Id: <20190325232108.10002-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190325232108.10002-1-ross.burton@intel.com>
References: <20190325232108.10002-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libsndfile1: fix CVE-2019-3832
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
X-List-Received-Date: Mon, 25 Mar 2019 23:21:13 -0000

The previous fix for CVE-2018-19758 wasn't complete, so backport another patch
to solve it properly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libsndfile/libsndfile1/CVE-2019-3832.patch     | 37 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
new file mode 100644
index 00000000000..ab37211399f
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
@@ -0,0 +1,37 @@
+From 43886efc408c21e1e329086ef70c88860310f25b Mon Sep 17 00:00:00 2001
+From: Emilio Pozuelo Monfort <pochu27@gmail.com>
+Date: Tue, 5 Mar 2019 11:27:17 +0100
+Subject: [PATCH] wav_write_header: don't read past the array end
+
+CVE-2018-19758 wasn't entirely fixed in the fix, so fix it harder.
+
+CVE: CVE-2019-3832
+Upstream-Status: Backport [7408c4c788ce047d4e652b60a04e7796bcd7267e]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+If loop_count is bigger than the array, truncate it to the array
+length (and not to 32k).
+
+CVE-2019-3832
+
+---
+ src/wav.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/wav.c b/src/wav.c
+index daae3cc..8851549 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1094,8 +1094,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+ 		psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format */
+ 		psf_binheader_writef (psf, "44", psf->instrument->loop_count, 0) ;
+ 
+-		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
+-		psf->instrument->loop_count &= 0x7fff ;
++		/* Make sure we don't read past the loops array end. */
++		if (psf->instrument->loop_count > ARRAY_LEN (psf->instrument->loops))
++			psf->instrument->loop_count = ARRAY_LEN (psf->instrument->loops) ;
++
+ 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
+ 		{	int type ;
+ 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index eb2c719d8da..77393db8470 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2018-19432.patch \
            file://CVE-2017-12562.patch \
            file://CVE-2018-19758.patch \
+           file://CVE-2019-3832.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.11.0


