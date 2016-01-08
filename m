Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B5E0360667
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:23:00 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l65so136609307wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iQNdHoPFoMOlssl2ViDoRKnAQsQt/RK9A28xirXrx9k=;
	b=zd2s1JmQZt0d9TtqOe2xIJBeWu34iaGHVdG3OiW6ExaKyaECKwk0Unhb/wQjI+1QGW
	RghILBegxa1lHaVCzXSWeRpKnmcboC9oLLBQUxT9JhodT/Mib/cvafot/V4FvX7gx/Gi
	FpS1zuagpVZ499P47JjM1Nv7ehO1sqQk8lrveGDqw/Gzy+VJh29U4nh7GAsyXEO6qLVb
	8ZO3TnDUrpj+eJ2NOIuq4Q/UzmQ8s+uJKUHkSTgaepU1CozR83fsu977nJVg9SpSOMN2
	7+s8bomr1b5S2xHsz2yvKPBnmOdrP6jKOov/jOBWGDCMnlvLmo+fHmGx0G94LaE1bSP4
	0HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iQNdHoPFoMOlssl2ViDoRKnAQsQt/RK9A28xirXrx9k=;
	b=CizuuNTEuAE5xcid/yPRwHtHyYhqUNhpFRROD5oCYEQY6EAalFy2b9un+XQRCVYIOa
	72KLAemoZrDakYbGd+nYFexuUiRmLa4C760qqE5FWyAZNVSK40oWzN/YBAQggtLJD0x5
	KG3L145fXQnbK6/dU2Vq0XN0MwmaaDHtQ8HNUGftnjD4sbRSZhf6sXL5JBGBbpeS52VW
	EHMF9H3oYP+MoogM1aCxehpGUPF1/a1xCCTIFmarooU75lCLvlNVIlqGg2BlK6MNz481
	+NuS8n4bnL1CxXI8OKmlJfT1mzPdW1QZ57YiQL2glHnjp7g8D3D+5A//9fBP8q5oiDp4
	F0iQ==
X-Gm-Message-State: ALoCoQmdrPQcg6iZCYhS6EgkNy4RQ/nr3Iv1+H9s2Q3aZwTocU1sS/Mhrg6hr6zCJ036DmHMLvn3ne/amUGZOtEjnzLVFwWQ3g==
X-Received: by 10.194.246.37 with SMTP id xt5mr41496224wjc.7.1452262980754;
	Fri, 08 Jan 2016 06:23:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n5sm18795807wmf.3.2016.01.08.06.22.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 06:23:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 14:22:58 +0000
Message-Id: <1452262978-12324-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] oprofile: fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 14:23:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
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
index 0000000..39e5fdf
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
\ No newline at end of file
-- 
2.6.4


