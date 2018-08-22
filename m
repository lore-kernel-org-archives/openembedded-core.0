Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id D24D179437
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:04 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id s198-v6so3676221oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MpDQTne1X8zrMJgt5bfN3keWj9aRfih1b/gt7e8Nok0=;
	b=Jisea8y8p4QAt9995YtBP+uLIejetpk6wva4ZtXKzMw7AhT5ayLiKiLqty61eYgsPZ
	13dskxyW3r4qsNqYBgKqZOi3PGehceWSm/+9ip603CzXrVceeR+3ybOuTcU70JOsRDF4
	H5GqvuuynaYOMBWfYm0ojUS5wNTrwN75qKGmSKfWJDfhm4ve9aAXA1WzbQBEaDuO4Psq
	fYhwK800M7Quu56uVfZ0tCOaON9WIwq3qMhfkAS9pgWzy0JWthO2arDBSkgNOETPhYtq
	1ofDFKN2C9llN2fDkaqrtpOxgQKmiUqQCJ4x0dG2572JMRq7P0vds61kjYiPS5gREyUT
	oj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MpDQTne1X8zrMJgt5bfN3keWj9aRfih1b/gt7e8Nok0=;
	b=qrPpxXLgyxvTgfYZ6TXt0PshOoGXbxA1eOtfmuu/BznIO4TmNJluObL39uytOBHhhS
	JsNCjE9qOQUqwmXT9DvuVwEkBOD0cSG/MpBi2dMXwsRXlhpeIb4HoV7BpuUiC4aOESPO
	0d879TabMVAkv5sETxHyBIgDQQUh14lXd+/XlvtDlpB836i41kn/+YRBwsxoEl4Kfk9w
	if6prr7jk97Fscl5y5+SFyMXOnTCor4K7QTqrx9sTGfK3fV1C7FmSpZrXiMgeuicAJ47
	8PpviQPBa3KcFvgwmCh/b23xqPnEvu14xS/BUUv0+zEQqOIznJRN/2BbNk/5bAxNJpZK
	pM0Q==
X-Gm-Message-State: APzg51AYUY4DwIVtLR5CsrUbSghZN41dBoiGYnUfhNX7bvdpb/jDa2QL
	XRLOuUScpbkhGE+gecPE0J6PKvbkmGw=
X-Google-Smtp-Source: ANB0VdYgKghX7bEbxj0sSlDrbgrxq67KpNNASw99L6MpDpK8SnTFM0YBOZPZ4Z3aDiEc8ZvjVUdxHA==
X-Received: by 2002:aca:5b88:: with SMTP id
	p130-v6mr4579902oib.247.1534950545725; 
	Wed, 22 Aug 2018 08:09:05 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:05 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:21 +0530
Message-Id: <1534950532-23850-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 03/34] libsndfile1: CVE-2017-14245 CVE-2017-14246
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:05 -0000

sfe_copy_data_fp: check value of "max" variable for being normal
and check elements of the data[] array for being finite.

Both checks use functions provided by the <math.h> header as declared
by the C99 standard.

Fixes #317
CVE-2017-14245
CVE-2017-14246

Affects libsndfile1 = 1.0.28

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libsndfile1/CVE-2017-14245-14246.patch         | 121 +++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
new file mode 100644
index 0000000..07c7d13
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
@@ -0,0 +1,121 @@
+From 2d54514a4f6437b67829717c05472d2e3300a258 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Wed, 27 Sep 2017 14:46:17 +0200
+Subject: [PATCH] sfe_copy_data_fp: check value of "max" variable for being
+ normal
+
+and check elements of the data[] array for being finite.
+
+Both checks use functions provided by the <math.h> header as declared
+by the C99 standard.
+
+Fixes #317
+CVE: CVE-2017-14245
+CVE: CVE-2017-14246
+
+Upstream-Status: Backport [https://github.com/fabiangreffrath/libsndfile/commit/2d54514a4f6437b67829717c05472d2e3300a258]
+
+Signed-off-by: Fabian Greffrath <fabian@greffrath.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ programs/common.c          | 20 ++++++++++++++++----
+ programs/common.h          |  2 +-
+ programs/sndfile-convert.c |  6 +++++-
+ 3 files changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/programs/common.c b/programs/common.c
+index a21e62c..a249a58 100644
+--- a/programs/common.c
++++ b/programs/common.c
+@@ -36,6 +36,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <stdint.h>
++#include <math.h>
+ 
+ #include <sndfile.h>
+ 
+@@ -45,7 +46,7 @@
+ 
+ #define	MIN(x, y)	((x) < (y) ? (x) : (y))
+ 
+-void
++int
+ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize)
+ {	static double	data [BUFFER_LEN], max ;
+ 	sf_count_t		frames, readcount, k ;
+@@ -54,6 +55,8 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
+ 	readcount = frames ;
+ 
+ 	sf_command (infile, SFC_CALC_SIGNAL_MAX, &max, sizeof (max)) ;
++	if (!isnormal (max)) /* neither zero, subnormal, infinite, nor NaN */
++		return 1 ;
+ 
+ 	if (!normalize && max < 1.0)
+ 	{	while (readcount > 0)
+@@ -67,12 +70,16 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
+ 		while (readcount > 0)
+ 		{	readcount = sf_readf_double (infile, data, frames) ;
+ 			for (k = 0 ; k < readcount * channels ; k++)
+-				data [k] /= max ;
++			{	data [k] /= max ;
++
++				if (!isfinite (data [k])) /* infinite or NaN */
++					return 1;
++				}
+ 			sf_writef_double (outfile, data, readcount) ;
+ 			} ;
+ 		} ;
+ 
+-	return ;
++	return 0 ;
+ } /* sfe_copy_data_fp */
+ 
+ void
+@@ -252,7 +259,12 @@ sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * in
+ 
+ 		/* If the input file is not the same as the output file, copy the data. */
+ 		if ((infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT))
+-			sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) ;
++		{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) != 0)
++			{	printf ("Error : Not able to decode input file '%s'\n", filenames [0]) ;
++				error_code = 1 ;
++				goto cleanup_exit ;
++				} ;
++			}
+ 		else
+ 			sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
+ 		} ;
+diff --git a/programs/common.h b/programs/common.h
+index eda2d7d..986277e 100644
+--- a/programs/common.h
++++ b/programs/common.h
+@@ -62,7 +62,7 @@ typedef SF_BROADCAST_INFO_VAR (2048) SF_BROADCAST_INFO_2K ;
+ 
+ void sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * info) ;
+ 
+-void sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
++int sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
+ 
+ void sfe_copy_data_int (SNDFILE *outfile, SNDFILE *infile, int channels) ;
+ 
+diff --git a/programs/sndfile-convert.c b/programs/sndfile-convert.c
+index dff7f79..e6de593 100644
+--- a/programs/sndfile-convert.c
++++ b/programs/sndfile-convert.c
+@@ -335,7 +335,11 @@ main (int argc, char * argv [])
+ 			|| (outfileminor == SF_FORMAT_DOUBLE) || (outfileminor == SF_FORMAT_FLOAT)
+ 			|| (infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT)
+ 			|| (infileminor == SF_FORMAT_VORBIS) || (outfileminor == SF_FORMAT_VORBIS))
+-		sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) ;
++	{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) != 0)
++		{	printf ("Error : Not able to decode input file %s.\n", infilename) ;
++			return 1 ;
++			} ;
++		}
+ 	else
+ 		sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 281ac82..c6f2a46 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8361-8365.patch \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
+           file://CVE-2017-14245-14246.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


