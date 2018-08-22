Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D03C79275
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:10 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q204-v6so2467790oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=acMa5/iwcmjoWAl5VAkScS46RBIRILp9xfPkEXW4qUqHwXONRcaesPmw4qUzODrqTI
	L/sEyWCpfAR1AgsWoWDVH/9WNtCBi9J17jcq+jeJiM0OuhC9V9w357OwfBK7pEYUSzZc
	6tWFN4NfxSkLdwSIeuTieVrl8U4W8iTYRmFD9HZ6Q2BLqXpQUVoG+CYOvIuiGjuuQXLR
	xc6MhCPsXVf9rg7iQz+ykAhDX1xd1SG+ewE/p6odChH2gfPI9F9wdvgfuIvSygRRpWEO
	hJdkH2Rbhs5+giaznnO9wsy7R9CFiKPlHMftfXZvh8MAsp61SFbgnr8u4EcB6JtIEbLR
	HeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=dBobzRJ8P7tLGm9QrJC4tDIkzPlAHA+OOdA/vXgSb5kJVQKk9mQm/0/LWYMl6j9GJ3
	QEWeWOlft4EAJPF6538X24wbXhxG+3NE9iXMWC/hztFjMvNwXsd20yIKjFKTfWHlDz6u
	l7zmWyhWaFeAnXdOeVK835Y3f3e+cfOklqKbVO4/VXcHY/as2zv1AijK7pndr1i03zQD
	9UHP7AZtsZTS5FEZdmlnPRNXoz5FhVLh1m+MPBZv77/H2g01cKzSyNAzR9StKdK/3zYv
	0atI+EZ5RZtq7e1GR4JMtwwmN4UdDksbgMSZ9jRbzNgePmCbwFBlGH29roAXjImR6lTp
	jl9w==
X-Gm-Message-State: APzg51Bgs9ranaYfABEEOMvIOX8FA4jVmU4mOVWGHo9mFyLUAceqR0tX
	jJxuwnFqy8uRQK3TvMhLBbefi0Ambfk=
X-Google-Smtp-Source: ANB0VdZX3Kz68ojRgCg1RRbzb4N/nE2/6jn6o1ofG3G6FEV5XcypVR5hNihx63xrTB0vORKq5Cyz3g==
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr1418856oia.211.1534936751076; 
	Wed, 22 Aug 2018 04:19:11 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:10 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:59 +0530
Message-Id: <1534936692-11736-21-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 21/34] libsndfile1: CVE-2017-14634
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:10 -0000

double64_init: Check psf->sf.channels against upper bound

This prevents division by zero later in the code.

While the trivial case to catch this (i.e. sf.channels < 1) has already
been covered, a crafted file may report a number of channels that is
so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
miscalculated to zero (if this makes sense) in the determination of the
blockwidth. Since we only support a limited number of channels anyway,
make sure to check here as well.

CVE-2017-14634

Closes: #318

Affects libsndfile1 = 1.0.28

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libsndfile/libsndfile1/CVE-2017-14634.patch    | 42 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
new file mode 100644
index 0000000..39b4ec1
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
@@ -0,0 +1,42 @@
+From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Thu, 28 Sep 2017 12:15:04 +0200
+Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
+
+This prevents division by zero later in the code.
+
+While the trivial case to catch this (i.e. sf.channels < 1) has already
+been covered, a crafted file may report a number of channels that is
+so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
+miscalculated to zero (if this makes sense) in the determination of the
+blockwidth. Since we only support a limited number of channels anyway,
+make sure to check here as well.
+
+CVE: CVE-2017-14634
+
+Closes: https://github.com/erikd/libsndfile/issues/318
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/85c877d5072866aadbe8ed0c3e0590fbb5e16788]
+
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/double64.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/double64.c b/src/double64.c
+index b318ea8..78dfef7 100644
+--- a/src/double64.c
++++ b/src/double64.c
+@@ -91,7 +91,7 @@ int
+ double64_init	(SF_PRIVATE *psf)
+ {	static int double64_caps ;
+ 
+-	if (psf->sf.channels < 1)
++	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
+ 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+-- 
+2.13.3
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index c6f2a46..ed43b74 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
            file://CVE-2017-14245-14246.patch \
+           file://CVE-2017-14634.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


