Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id D15C578FBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:00:44 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id 13-v6so2703723ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=m7sWGMXWrwUM43JT9JhC23ovHoOTYCjIAcZL/2uj2YM=;
	b=1utjtN46hoeFkhQc3LG+7NcROpIeWtu1eDAOBtIKUpBPe4NRGEVv6hw8tgXyAdea+W
	o1dE3k6c2S4bT1VrhwYR/6qBSyLC8B52Bzw4ZNRpSDM+4m+GE+58Me1RlJ2AHx94PTHD
	06BXmFYJC2H9ciCgtkos6SHGqfWgpc6dyR8VCNOFJ7PrqUtmcRiQDnLnQ5WFY5wzsSAA
	EG3yJ1x0WSid4B44h/AuRNgCzvrI74keLSsZ5qbQAVXPWlVBz/ja1K06o7qotsEgRnWC
	zv5nHdY5AZbjQQLMPo4YMJgCFT/dpjJ9Joo0+TaunYlVh5+o73pSf6L6VjsXECifzjEk
	Zarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7sWGMXWrwUM43JT9JhC23ovHoOTYCjIAcZL/2uj2YM=;
	b=GtM2bxuEvRyTZhcjPE9WnvI0G3vpLPjFhqE8zMP6uwMFHh6HH9ezSy6SYCJ1XtDsUF
	V1UlebPD2mi4leKIYzlMKT/hBwmQs+yyoeN+aFI30crUwNCc2Mm4tIpp68xfCj4fe8uc
	vu1fiyRlLjQ2kJ4Eb0yoB78E2Un1DuKB3LJwarK24BHfeyXxuGcnQEr+vxKyhzot6iNQ
	7tQ5YLQiWq+FElOyM8Iph0pIg0E8yRIY+lHeU5SbLeg5VJMOQMV+e5I/F8LaxmT6QlIU
	3lQBwq2AZm8pDeRHli0JeaSFydTrhL34h6DJEjxN7+53egI4LodxL65vlBD3ZZnNi8ib
	u8Bg==
X-Gm-Message-State: APzg51D4LNq71/TgDsRDUb9hE/GFv9/cLZ4dQCEuMqZTv95o7RX4fvYU
	uEV6rgd779MW+nIo7hkjPZIXBhi2Br8=
X-Google-Smtp-Source: ANB0VdZV8o3Sd7GJh8z0tmOwjQlHg3AzKEemkFapfdxKuPHLJRFD62IpDeO+Btbhg1LFTdAzHFWlTA==
X-Received: by 2002:aca:3c02:: with SMTP id j2-v6mr3833775oia.50.1534939245590;
	Wed, 22 Aug 2018 05:00:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3129596oib.55.2018.08.22.05.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 05:00:44 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:29 +0530
Message-Id: <1534939232-13249-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH V2 1/4] libsndfile1: CVE-2017-14245 CVE-2017-14246
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
X-List-Received-Date: Wed, 22 Aug 2018 12:00:45 -0000

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
index 0000000..a17ec21
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
+ 	int		frames, readcount, k ;
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


