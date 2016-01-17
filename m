Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C7FAA76FF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:42 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id e65so142597098pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fLPG35ySkJbqUkDW1j1xe6ok4kvF6/VLEFMMZ2Huzs4=;
	b=GXGIPO1Q3b2JoDOjzSrmKN95F+MH7fY0e8wlHeSZsCA43MtyY7z+LqCQY6YOO7CPAY
	HZNPu+7hYrPdhDbfufJEGGLcU6ePXtV62OU8y1vJi2GQ7oWAd293lShMPRnJzXOFbMeu
	Z9UCo8b9z4Nia3xlwct1tnSgeA3JJH8mXZMKPu8BYyXvd0CiXw3HgpbyTrUXv3xV5bL5
	WRZ4Nc42vbuY5voIgcYTX0r2aDELOWfZbIRgxc6jT3Ng0hChcUFx1cUOYPfzrZMh+zQO
	cSVO3atBJGKMbDtSxqlVdAs9cDFEpo3bwQaUJ2+J7pZM+My1k/5WNe+fVB5vRWBPZRcH
	7OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fLPG35ySkJbqUkDW1j1xe6ok4kvF6/VLEFMMZ2Huzs4=;
	b=Xb2eXK3nLwrWF0jb5tUtSEz5jqQqIRLd8b3SBCED8jNKP08UgwZQr+elwvvP9ePr/a
	PUuyvS/aKDIPuMeTBQADWJkkCwYRCaS30of3uQiVduwflsG4ffAUziOxMy5p0eXy6D5k
	/T65rFQptvmwk3LLJxZ4Gj1H8nIUazhpz8iVTbzYujXvQ8ywWrJFBt2a+PZ4ygSsfR/G
	r5JCVdCAphVpSL5mVUfyYzbAKPf2FcWathiDApcWza626BO4Y9vG7XWx3kGRi9f3D5m3
	V/AbTfSdFGtxdDDLMmHnTH8dP7m16ZVzfBqEl0NdHCo/Wg6wBh7y/WGiDzdEIk08wHqM
	cZaw==
X-Gm-Message-State: ALoCoQk209k0tnXInSO1X85Yq7zoORmDIXZsm4T43qzUFzMgektx9VwGkq7Em1k2KAJTG7nEQ5olZCHyAY28wR7CS9JaX/0rAA==
X-Received: by 10.98.32.25 with SMTP id g25mr28573416pfg.20.1453030663883;
	Sun, 17 Jan 2016 03:37:43 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:21 -0800
Message-Id: <0baac086a4f9026abb0cba6eca2067134bbae0bc.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 48/73] oprofile: fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:43 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc        |  2 ++
 meta/recipes-kernel/oprofile/oprofile/musl.patch | 46 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/musl.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 6ec56e7..faf0e53 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -25,6 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://root-home-dir.patch"
 
+SRC_URI_append_libc-musl = " file://musl.patch"
+
 inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix} --without-x ac_cv_prog_XSLTPROC="
diff --git a/meta/recipes-kernel/oprofile/oprofile/musl.patch b/meta/recipes-kernel/oprofile/oprofile/musl.patch
new file mode 100644
index 0000000..51db408
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/musl.patch
@@ -0,0 +1,46 @@
+Fix glibc-isms so that oprofile builds with musl.
+
+Patch taken from openwrt (https://github.com/openwrt-mirror/openwrt/blob/master/package/devel/oprofile/patches/100-musl.patch)
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -857,11 +857,14 @@ static int __delete_old_previous_sample_
+                                 int tflag  __attribute__((unused)),
+                                 struct FTW *ftwbuf __attribute__((unused)))
+ {
++	int err;
++
+ 	if (remove(fpath)) {
++		err = errno;
+ 		perror("sample data removal error");
+-		return FTW_STOP;
++		return err;
+ 	} else {
+-		return FTW_CONTINUE;
++		return 0;
+ 	}
+ }
+ 
+@@ -896,7 +899,7 @@ static void convert_sample_data(void)
+ 		return;
+ 
+ 	if (!operf_options::append) {
+-                int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
++                int flags = FTW_DEPTH;
+ 		errno = 0;
+ 		if (nftw(previous_sampledir.c_str(), __delete_old_previous_sample_data, 32, flags) !=0 &&
+ 				errno != ENOENT) {
+--- a/libop/op_events.c
++++ b/libop/op_events.c
+@@ -83,7 +83,7 @@ static int parse_hex(char const * str)
+ static u64 parse_long_hex(char const * str)
+ {
+ 	u64 value;
+-	if (sscanf(str, "%Lx", &value) != 1)
++	if (sscanf(str, "0x%llx", &value) != 1)
+ 		parse_error("expected long hexadecimal value");
+ 
+ 	fflush(stderr);
-- 
2.7.0


