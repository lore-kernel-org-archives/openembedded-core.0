Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E881678222
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 14:12:45 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g35so23524139ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=gihYFV8Q9+Xfnz/D+FQRj7wTzrcOzYYt0CMvymW4dEY=;
	b=ho2eRhZjo5vjid+HUU5lts3+u2BwH+lZvM3kUinCu0EwmW/TI8y8okoKgbZ5pWY1tv
	35Q7ksgSdeY+T26P0LFLvYQVUgZ32bdSy6Nuj/ypBuMls3li5YxGRTTg+ucI7txaLTVq
	gNnQjvIHXVcam0upx4LGMHwbvzWFr1R1tCKP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gihYFV8Q9+Xfnz/D+FQRj7wTzrcOzYYt0CMvymW4dEY=;
	b=pO5e+h+sdt/UYI7hvQxkIIQqrTxTbYNBRMR8V3o1Q/QLiNdeLOF30S2sYuvz208wbk
	xTf0J+zVcKk6d5tkfOYDWsaEpKFcpRulNFElRGidtCUeIcHTc6alxdSdVrYpdXR+h1WT
	hvX4+BCn9BxZ0Dt0uFSZhlYUfkHahER3Bp6hoBmJ9V0PTeEPWYrK25GWYw2ul9IuZ2wH
	Em4qXEH9OBkUbu/l9Y4gwTJBQSL0b4ctKl4sYvOl7A5yxttTEwtit6PSAahfWJKIiFgG
	MDwF4Qp1yR3CbuS/JCkVjp3EmUeNHACsRMYczwhkV1jfs1RJoos3qo2KqzmktlZ+NEWv
	1/zg==
X-Gm-Message-State: AIVw111tTplpQ2jIB9BYxAtHtwUzvEOG/8WcCqNTz4tH7UNRSoM9L/6c
	lnAtSrkC888Y9PtClVR3TA==
X-Received: by 10.107.135.226 with SMTP id r95mr19195884ioi.3.1500991966998;
	Tue, 25 Jul 2017 07:12:46 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	e84sm6779715iof.86.2017.07.25.07.12.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Jul 2017 07:12:46 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 16:12:14 +0200
Message-Id: <20170725141214.4830-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH][pyro] kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
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
X-List-Received-Date: Tue, 25 Jul 2017 14:12:46 -0000

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
index 7a134d5c29..7670c7107a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -32,7 +32,6 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 
 python __anonymous () {
-    import re
 
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE') or ""
@@ -44,7 +43,10 @@ python __anonymous () {
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)
 
-    typeformake = re.sub(r'\.gz', '', types)
+    # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
+    # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
+    # is built (such as using gzip to compress vmlinux)
+    typeformake = types.replace('vmlinux.gz', 'vmlinux')
     d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 
     for type in types.split():
@@ -268,14 +270,12 @@ kernel_do_compile() {
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


