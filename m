Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3CF7CBD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:47:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so599611iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xeLwFYA8Gh7EVEk3hl70AJaUvn/soL5LQIWrbn3XtCo=;
	b=MTJXfGGIGeXsdwQwYWTNzBS8N5V3vgn/+LE8SWnOW+0Tlm6EfbOloz/XC6PQ+gOgHe
	O/oSl48BqF/WjZFbW47IVtEtAGQv1T8XtZIAnKYkaBI266sn6kQdr0QUZAWvqjOv9/Lk
	ccnIggQFf0uba96z0kQTUMl87WSIbTnDN/pTMEmWSPwolfpUeVGXjeEsP1WSVzobe6QB
	VCYS5SM8vW2J4lW1Qsac/ZteGiBrKBcray339aPpkjZYnBi9ZYN/c/XKz25kWoSqSNBc
	vkMRn3ph1lleuKp0unLCW33EeMe/8UjLCLVkxGqfVbmO+Sm6MIIi9BBi0iAk9pDfI3i1
	4szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xeLwFYA8Gh7EVEk3hl70AJaUvn/soL5LQIWrbn3XtCo=;
	b=Cq7l7JjCQjSqov3ME0cMYkkXKxlLUIRYIaWQsykFuu2aYKikOFSWXEcaijmshj1ehS
	ToKrHYh7kS3mCLgHR8tK/4Rg6Z4fb/74b7n/VZ+64NH2uHJHfwWOcG0x+nCLguj7FHAZ
	6S25tyQpgsT1eo0ge9L1dMXyMN1HOQAY74edk//F2ruHGhp0DvGQx8VnF50FQbTJjetB
	ROfEQm2/1KNOEoEhcxOblVglQKoLKgfVQ0enKycxcbHD8m6wyl+DNvNeVgHC3eHBf31G
	Gdl8UgzUSXY1oG62zmSc1ptAanaZjDu06bC9copRU9gudfUjNp6md7pN2AqWn0da6VV1
	Fe3w==
X-Gm-Message-State: APjAAAVq3zszHD1VZX+0/WzTl8FA63G7KjmiT865JGHji1xZACcKD0qc
	L92LtcTdjp/BKd7eYGjQFN3vkNSg
X-Google-Smtp-Source: APXvYqw6MT4WvgDlHeLsWgz3BG/3uW69uaOp5WQanqJ44WM/dzKi+k/0zfFGhlYfBnVp02tHeZwNzA==
X-Received: by 2002:a5e:9e42:: with SMTP id j2mr14573746ioq.133.1561045634113; 
	Thu, 20 Jun 2019 08:47:14 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id c14sm208063ioa.22.2019.06.20.08.47.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:47:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 10:47:04 -0500
Message-Id: <20190620154704.13940-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] bash: Remove .build files for reproducible builds
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
X-List-Received-Date: Thu, 20 Jun 2019 15:47:13 -0000
Content-Transfer-Encoding: 8bit

Bash has an internal "build number" that it tracks and automatically
increments ever time a given builds is made from the same sandbox.
However, this can make builds non-reproducible in the event that a build
directory is reused multiple times.

Remove the .build files after every build if reproducible builds have
been requested which will reset the build build number for the next
build.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index c91cc8ada8d..e2844dffbad 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -39,6 +39,14 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " \
 
 CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
 
+do_compile_prepend() {
+    # If reproducible builds are requested, remove any leftover .build files.
+    # This ensures that bash always has the same version number
+    if [ "${BUILD_REPRODUCIBLE_BINARIES}" == "1" ]; then
+        rm -f ${B}/.build
+    fi
+}
+
 do_compile_ptest () {
 	oe_runmake buildtest
 }
-- 
2.21.0


