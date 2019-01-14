Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id EF4857BD20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 10:53:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so18602059ljd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9IEN3E8GBzlD43HrMw01vux1Q4hyh6wt8A1NvAgqpiM=;
	b=M+pzZH8/GFe/etVFJvL3qDdM8U8vzJ4x06sOr73IxFn3PB/Bdwp9n/A9pQbmYKENTs
	NbbLGQHGuIRDxWp4wZ8Alpkr9Twl/VxZ2IDMlK39IJS2+94s2EzDBw1daL1DNLMLVaKH
	qF4DgKvkvRORFt6MThgGtrSD+ZXviGwcINRJaxciXqiJN+3NHmz34/FsRkidCdUF5bJe
	+a2czMAbMauf6DQj4t0psgDHpU6b1f/YPvWl2ybpQxSk2ulFuEfEEYesQfEqJqhP9akh
	0FffZ3Ud4lRwI3QsH9YcO2goBCUlqcpq5TCx0UPV4V6rp+qwJByGylCHedDeul2dCrAo
	KJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9IEN3E8GBzlD43HrMw01vux1Q4hyh6wt8A1NvAgqpiM=;
	b=ttEI3/qvNnwy0Zn5AXqM8jcOsgkppcjA8i3qGRym4LQeeKLtsz/fM5BM4RrNOQu+8N
	hDqBo9qofkfbGxHr53Vqplh+PqQC5z7nvvDYFQ4wLmsj0parrDm0n5VV+NOn3/SMopFg
	/ltockZ70Ixjqwi1MGAdJFuzDFCUOT23/xFvUT7hRfgWpNhTyIzYny5wGm6sOl7/g0Ki
	oZcHxAq0eyJRDWGx/URoQuFhhD2UpYafB5Nd/aiDAa9Ak7V0vuGMOlQl556G3sZWcmAO
	mUCQJF1fExNFsEwo3y70iw9wIjYmVINmjlTfshGG7C0ghTn33+fQVjSwWR6hVRCh/S4j
	+yuA==
X-Gm-Message-State: AJcUukcn1COjzU186kFoQUEffNI9Z+Um9WdyC9RLZm6rLEgsrdYRq/Lp
	CN/AcyubqgpuaR6B/MsI1dCXvuki
X-Google-Smtp-Source: ALg8bN7MSFyXhUmBvPJ+qQq0cBX5F7/Gv4uDAt7ru6y/rPBRBbsCZOvLhdoMOICmIzxdaL9OsPRg7w==
X-Received: by 2002:a2e:90ca:: with SMTP id
	o10-v6mr13761490ljg.134.1547463193302; 
	Mon, 14 Jan 2019 02:53:13 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 10sm15699lff.62.2019.01.14.02.53.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:53:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 11:53:05 +0100
Message-Id: <20190114105305.117535-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] perl: fix yet another race failure
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
X-List-Received-Date: Mon, 14 Jan 2019 10:53:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...oader-separately-as-race-failures-ha.patch | 31 +++++++++++++++++++
 .../perl-sanity/perl_5.28.1.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch b/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch
new file mode 100644
index 00000000000..15678b83ba7
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-Also-build-dynaloader-separately-as-race-failures-ha.patch
@@ -0,0 +1,31 @@
+From 9c68cdd1a89f9b944edc804d7c5d000c45de7b85 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 14 Jan 2019 11:45:20 +0100
+Subject: [PATCH] Also build dynaloader separately as race failures have been
+ observed in Yocto.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7846406..cd8d75f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -74,10 +74,13 @@ $(CROSSPATCHED): %.applied: %.patch
+ # Force full patching before any building starts. Als, force early building
+ # of miniperl -- not really necessary, but makes the build process more logical.
+ # No reason to try CC if HOSTCC fails.
++#
++# Dynaloader is also built separately as race failures have been observed.
+ all:
+ 	$(MAKE) crosspatch
+ 	$(MAKE) miniperl$X
+-	$(MAKE) dynaloader perl$x nonxs_ext utilities extensions pods
++	$(MAKE) dynaloader
++	$(MAKE) perl$x nonxs_ext utilities extensions pods
+ 
+ config.h: config.sh config_h.SH
+ 	CONFIG_H=$@ CONFIG_SH=$< ./config_h.SH
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 4ce158f4f81..0df821d446a 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://fix-race-failures.patch \
            file://fix-race-failures-2.patch \
+           file://0001-Also-build-dynaloader-separately-as-race-failures-ha.patch \
            "
 
 SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
-- 
2.17.1


