Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 97323731FC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:21 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 65so142172663pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tp5nYEaogwS0JHrCHgpnNSBbNkyq6ugmJkViGLBJ9xs=;
	b=u42dTsHNcoswVj25YQcTFfVOLHQoI16XpMwxn68jSD6JTsGPaB76hn7c+V1Oy7Xr1e
	bEGkixCUqijVYE294wr3bojTlN0QhiExcQGpa/edDXyQAaTacuK8O7/yjb3+NClDH8bX
	6V8zcf9OPTMMo/2Dh4e4RMRooqUHeAq2pquesKdW9yeUImJ4a/otRZ7BceaYOrYe4jF3
	ay/AelNqzu/jVcGHpe/Gr2AOyCGz9VswhGKVuauL3oKke7L09Z/AN5PnodTgptCRSpnm
	HBRJPhs+1He9tAG+0jj+bC2nDHKgLvkVStflPQq3dkwC3ke9Zgm51BGQ40SXXY+eLLHq
	vL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=tp5nYEaogwS0JHrCHgpnNSBbNkyq6ugmJkViGLBJ9xs=;
	b=DwrU7dB1y6F3jfLIH9giQn5LYgMxGinwDkJJIrGfto6LV8GdlTpDhh6JW7Zkx2WsdJ
	RZ9TqvRD9LLNcc9X0CDqIPgfLNa9K4ru9o0PuXyX0RvN957T71aNb4NhX+77906fZhLp
	V44ydPOvdySWbvj2NfY8pW/ZJ1hukesjHy4KEHHNOjNzBt2AH0Bt/92k8UjRtQd7pm2G
	by/Aq/dl+dr6ShployVG9Zu4Mn1mJVmguRYlL1PS7uMtZFYeCQ9t4LMS9CPtlA8qTlaw
	m902FO12VjRc1vMkvCfG0yq/S+9RmuwdXFtYGRSLYx5jniWDrZSdu0mQdCpnsrWu1CfO
	QC2A==
X-Gm-Message-State: ALoCoQlNyRRvjvE1EsCU1wN8hljMCyjj+HFmCjJ9OWd3hGuf71vgOesfdNQ9BxWPCMM5tLjKuqdZdk6lWo+lYQSWV7MFd1/57w==
X-Received: by 10.98.64.215 with SMTP id f84mr28705449pfd.113.1453030642687;
	Sun, 17 Jan 2016 03:37:22 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:57 -0800
Message-Id: <057981a7fc7647fd71afba970c5574c826da9c52.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 24/73] gzip: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:21 -0000

gzip 1.6 uses an older version of gnulib when cross compiling it treats
fseeko as broken since it cant do runtime checks for it during configure
this only shows up on musl since for glibc since it has special check
for gnu c library, so we aid the system by telling it that fflush on
stdin works well with musl

Use NO_ASM to avoid textrels

Delete charset.alias for musl which is again another issue in gnulib not
knowing musl platform

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gzip/gzip.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 58e5e0c..6e81883 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -6,8 +6,10 @@ SECTION = "console/utils"
 # change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
 
 inherit autotools texinfo
+export DEFS="NO_ASM"
 
 EXTRA_OEMAKE_class-target = "GREP=${base_bindir}/grep"
+EXTRA_OECONF_append_libc-musl = " gl_cv_func_fflush_stdin=yes "
 
 do_install_append () {
 	if [ "${base_bindir}" != "${bindir}" ]; then
@@ -20,6 +22,11 @@ do_install_append () {
 	fi
 }
 
+do_install_append_libc-musl () {
+	rm ${D}${libdir}/charset.alias
+	rmdir ${D}${libdir}
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.7.0


