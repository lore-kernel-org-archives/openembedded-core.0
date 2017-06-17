Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF1078096
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:45:25 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y25so7167943wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1XTfE9WwimAqyybfKCnn7PY3khJZVGavHn9xYAQxM5E=;
	b=IK0rmksjypAylpZvqoURkNTyO+Y3p+peY1Yr2b4kU/PEqmjN6HsAt4s7+ZfcsQJHpq
	igXUMI7mEkDQTnHAf4hAaMGV6V1djGO6BfgSQ5R8s4R1oQAHbUEkNSPXajRbIo6urehp
	LEibqlgszHDrW4jYncS5zOncLo3jeH3gOs38bK579oZS/CucHSqR70u3X/gczatjuyQ+
	vvE19xBATzLaXQVrYMwh33vG7o7k1uUEhjc4EZjnD7wAGQmNALNxLehBaLJr8V0BXoVM
	qBLSctQ4loyDy2YkeeOlxXxfCqU1U6yl/AaZgVAFoUNf629UF0+yYWtBCC6wxqFeWIrv
	2rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1XTfE9WwimAqyybfKCnn7PY3khJZVGavHn9xYAQxM5E=;
	b=fBlCHChwLLzLUpcpjih8Daifn6w+2s06Tef197IGoEYEP/cB4OAiqifzlgHbqr+Inr
	ycmM0a+3taIHnqJc6IVRk7LgaqeetBX6/jytgmSmWuUHGHWgqkT3x94YHt0F9FgK00JZ
	FMBf3sxYA3XgIwry5UtH7yp4LPn0Dg40iSUp/bUOYtWc8+95PhVz5J3cNUA3uCRa9o0a
	/FOTPbxxi8xJd1iSOdcB7/BzC0BzI4B/eyVgjcvGiHUoYOWFTj6vr926PQdc/jWoUtBL
	8wlCIY+ZbsV57/6Z5mug1+S/uec3Hb/vnzFB0bFKtWanbo//xWBnp5xVnWrpqZVq1RVk
	c9SQ==
X-Gm-Message-State: AKS2vOxWwqxgwaoroR6stlpNUby9hqIViTpe04vNF+6ftSh4ZRz5ZiDC
	xAS5zdZnt04GilA0
X-Received: by 10.223.128.65 with SMTP id 59mr12159981wrk.0.1497721526700;
	Sat, 17 Jun 2017 10:45:26 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	139sm2180586wmu.34.2017.06.17.10.45.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:45:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Jun 2017 19:45:30 +0200
Message-Id: <20170617174530.24693-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH] expect: use u-a for mkpasswd
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
X-List-Received-Date: Sat, 17 Jun 2017 17:45:28 -0000

* when busybox is built with CONFIG_CRYPTPW=y, then it will provide
  alternative for mkpasswd, which will fail in postinst, because
  mkpasswd from expect wasn't using u-a:
  update-alternatives: Error: not linking rootfs/usr/bin/mkpasswd to
  /bin/busybox.nosuid since rootfs/usr/bin/mkpasswd exists and is not
  a link

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 630f2e4649..e2d24e8d85 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
 DEPENDS += "tcl"
 RDEPENDS_${PN} = "tcl"
 
-inherit autotools
+inherit autotools update-alternatives
 
 PR = "r1"
 
@@ -57,6 +57,11 @@ EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                 "
 EXTRA_OEMAKE_install = " 'SCRIPTS=' "
 
+ALTERNATIVE_${PN}  = "mkpasswd"
+ALTERNATIVE_LINK_NAME[mkpasswd] = "${bindir}/mkpasswd"
+# Use lower priority than busybox's mkpasswd (created when built with CONFIG_CRYPTPW)
+ALTERNATIVE_PRIORITY[mkpasswd] = "40"
+
 FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
                    ${includedir}/expect.h \
                    ${includedir}/expect_tcl.h \
-- 
2.13.1


