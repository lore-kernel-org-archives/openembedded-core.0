Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id E62BA785F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 19:38:51 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c195so5913380itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=t8Aif+WaB7YmIHYGaAnl5SmrVboAsXZ7g90Soapen30=;
	b=kSX4xeQFnSue81o6fC+nUrsTYTiqN8vFvqwKiHjerpf1JB4VthWUbMJJNKrn83vzFh
	zQfRRPlLwKtr1FXoDbMuF+jYYMgaXoBKF5GyVJJVyZ4gBCy2B5RUuzks3IoF8/5coMP1
	nvsSdcAiKkBo4AW0BMhSQbWFYZimo/mX6WR4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t8Aif+WaB7YmIHYGaAnl5SmrVboAsXZ7g90Soapen30=;
	b=ilCnLb1kK21/SPR8ChIQzu5XvP3dOhUgsLqIrQvXt4ZkN+4e4Mq8fIJxse70hxeWNt
	q+HD3QBYwBcsKJYC+AM3fIReTABmfSjmDMrzId4vcINuN924F1V3MQjd4sK+Pi+tqLdI
	4DWk0hBH0Ris6hBlXnm5Cb7P0EWzcBWzbAoEMvuhdfrk2QiKbLs71LjUDBxjInIkMnVz
	6Kq2ljCNZ0OBqaH0EdOhzw2bKi5dljMPC2oLt7mW5EcDN7Y68ZpXxYNV/gOH8+JGYjJ7
	FSFRIdGPE3a5f3Q+4JG2H6Q1LUUGhtDd+rMaEjU3WajnxyIm9N53hCijDDgpW7PMHief
	boWQ==
X-Gm-Message-State: AHPjjUj3OTCJckNY+JVxQ5xTMj/xpkl5JOJbkibyJ0QZhLhzRLj0F3JC
	3Uj1leHnHqvjQ0PjBO2jbcEjFw==
X-Google-Smtp-Source: AOwi7QDyZ0EwU2TEh1kYsezDpBPwm6WKsOnqVSpu6w/qefvb50qnGr/cyLKsvU5r9OHA/St7fVKg1g==
X-Received: by 10.36.112.147 with SMTP id f141mr6005738itc.80.1505331532965;
	Wed, 13 Sep 2017 12:38:52 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	d189sm1212841itg.32.2017.09.13.12.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Sep 2017 12:38:52 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 21:38:20 +0200
Message-Id: <20170913193820.11923-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [morty][PATCH] kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
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
X-List-Received-Date: Wed, 13 Sep 2017 19:38:52 -0000

KERNEL_IMAGETYPES lists all the kernel images that we want to build. in
cb17b6c2a7 (kernel.bbclass: support kernel image type of vmlinux.gz), some logic
was added to support vmlinux.gz which is not a target built by kernel
makefiles (only vmlinux). It is clear that the goal of this logic is only to
support vmlinux.gz and not others compressed format (such as Image.gz) which are
valid target for kernel makefiles.

For Image.gz we should rely on the kernel makefiles and not do the compression
in kernel class.

This patch updates the logic used to filter out non supported kernel target from
KERNEL_IMAGETYPES, and make vmlinux.gz a 'special case', instead of *.gz. If
more special cases are needed in the future, we could add them in a similar way.

This patch should be a no-op for anyone using vmlinux or vmlinux.gz, and on top
of that it is fixing the build for Image.gz which was not working until now.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cfc0c897656fe67e81a6a5dcd936dff785529f41)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/kernel.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index eefe574a60..f8318b83a1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -28,7 +28,6 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION',
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
-    import re
 
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE', True) or ""
@@ -40,7 +39,10 @@ python __anonymous () {
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)
 
-    typeformake = re.sub(r'\.gz', '', types)
+    # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
+    # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
+    # is built (such as using gzip to compress vmlinux)
+    typeformake = types.replace('vmlinux.gz', 'vmlinux')
     d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 
     for type in types.split():
@@ -262,14 +264,12 @@ kernel_do_compile() {
 	fi
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
-		for type in ${KERNEL_IMAGETYPES} ; do
-			if test "${typeformake}.gz" = "${type}"; then
-				mkdir -p "${KERNEL_OUTPUT_DIR}"
-				gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
-				break;
-			fi
-		done
 	done
+	# vmlinux.gz is not built by kernel
+	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
+		mkdir -p "${KERNEL_OUTPUT_DIR}"
+		gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
+	fi
 }
 
 do_compile_kernelmodules() {
-- 
2.11.0


