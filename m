Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 86A9974FD5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 11:44:54 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id w24-v6so6091264wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fk8evmXA2LQNXzC51Qh/K/5LHb+0b5L4o9JFgSaY+uM=;
	b=ncup8BfurPNlK6VqVbsimRnDbkDGYHEAYgUCzlbOoVsJLNOvnmr9K9QwfsSlp/PZY1
	9FoVrD5Ulu3AjNXgQKJhNqwEgzR9/46Ji7lqH4QloLuElwamzF44zbKeo4UvRNJhE2US
	ltr9mbzBV5cy3dRQvZzQmiKiKN46ilPDg5egFVI39KVhIEnPV8F7v11w/oe9JTVW5Lf3
	VAYJLQE1DhEwADkzG1qg9uiJJ9BFFM03vbAJV81i9V1lBuWhTXcfKwqQoMO9kdEVRiZs
	shcsm6ShQeyJUWrQHkVaAWq0h8gja2gStp8AoBXNO17MsgCThp5hPublDeqHVNLsdg+w
	N2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fk8evmXA2LQNXzC51Qh/K/5LHb+0b5L4o9JFgSaY+uM=;
	b=BWzCWpyjb9vmun/TWn35bmmLPujhybpYPCajV5HPFNezWkPdlBWsR22y0laWgKw3wH
	VJgjdLWdnPu07b8pCChLx6IDiOTvHpJTuPdWF8rngjar7wUgInGq5563cRRcec2oJ8IL
	/tmvzsPPZhvw48gvMHDfVoucnT1mh/I9/LYARR1CUs5CGiEnI8h+ZgisQBywSTzHSyuO
	oslV08HLhhIAmkQHG5/rbFi2kMoh0Aw1YjgxAswaT30kMJ+cqviXieefwhHWki/oCX5j
	TBeDIE8HWuT5vGFHepllVdgJ0gn+yXVhzj7NJ7t3Pre91hW3LbgOiZTXg5yPpuJ14nXm
	woTg==
X-Gm-Message-State: AOUpUlHh08SSuArRywxz1IpSERwYbGdeJo8mJuqlk11c+zpQ1eCdM8kP
	jU4hatBTHFWMFvAnQbvlYmQwFCOy
X-Google-Smtp-Source: AA+uWPxR0e7muHxynQMIBkPhBIa/RU9gYbKgvNUVTLJacugfuwBp4GhfIqPn4Z4AIJ1AYYh0yD+73Q==
X-Received: by 2002:a1c:93d2:: with SMTP id
	v201-v6mr1352359wmd.77.1533815095122; 
	Thu, 09 Aug 2018 04:44:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u7-v6sm11489294wmd.46.2018.08.09.04.44.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 04:44:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 11:44:46 +0000
Message-Id: <20180809114448.26411-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] go(-dep): add INSANE_SKIP for textrel
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
X-List-Received-Date: Thu, 09 Aug 2018 11:44:54 -0000

* I'm not using go or go-dep, so I'm not going to fix it proplerly,
  it was just bothering me in world builds
* this is reproducible only with ptest in DISTRO_FEATUREs (for aarch64
  issue) and included security_flags.inc, more specifically with the PIE
  flags, so alternative work around is:
  SECURITY_CFLAGS_pn-go = "${SECURITY_NOPIE_CFLAGS}"
  SECURITY_CFLAGS_pn-go-dep = "${SECURITY_NOPIE_CFLAGS}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/go/go-dep_0.4.1.bb | 10 ++++++++++
 meta/recipes-devtools/go/go_1.9.bb       |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.4.1.bb b/meta/recipes-devtools/go/go-dep_0.4.1.bb
index d82e637205..10af1d660c 100644
--- a/meta/recipes-devtools/go/go-dep_0.4.1.bb
+++ b/meta/recipes-devtools/go/go-dep_0.4.1.bb
@@ -18,3 +18,13 @@ GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 RDEPENDS_${PN}-dev += "bash"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# for x86 ends with textrel in ${PN}
+# http://errors.yoctoproject.org/Errors/Details/185630/
+# ERROR: QA Issue: ELF binary '/work/i586-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep/usr/bin/dep' has relocations in .text [textrel]
+INSANE_SKIP_${PN} += "textrel"
+
+# for aarch64 ends with textrel in ${PN}-ptest
+# http://errors.yoctoproject.org/Errors/Details/185632/
+# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/go-dep/0.4.1-r0/packages-split/go-dep-ptest/usr/lib/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test' has relocations in .text [textrel]  
+INSANE_SKIP_${PN}-ptest += "textrel"
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index ec5a314e7d..7da7897cf5 100644
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ b/meta/recipes-devtools/go/go_1.9.bb
@@ -15,3 +15,10 @@ do_compile() {
 	./make.bash
 	cd ${B}
 }
+
+# for aarch64 ends with textrel in ${PN}
+# http://errors.yoctoproject.org/Errors/Details/185634/
+# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/bin/go' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/trace' has relocations in .text
+# ELF binary '/work/aarch64-oe-linux/go/1.9.7-r0/packages-split/go/usr/lib/go/pkg/tool/linux_arm64/pprof' has relocations in .text [textrel]
+INSANE_SKIP_${PN} += "textrel"
-- 
2.17.1


