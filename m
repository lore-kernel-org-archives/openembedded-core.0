Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id AA510605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:19 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id j35so47296745qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5Y8OyDaj+vedRBZotPIx0JOmN+pkhlBhfEls0m+drKI=;
	b=U9vXHXkNH7KHP4q+l3RWwqe+z+e8MqLl2qjwVs+RBim6SM3rk62fMyLcaJLOLNKI+j
	Z5+3f+sThNdr/wWK5S5K4PrM7Ns+iM30K5khA/m9PfJiY5JGZRa6IQrn11jwjTBVn0B3
	kFO9vfxiKZw8nn3GT5kPAoUcUe6GhmisYTqBbzGowUAfzMusOiFzNP9Cpzp3Rnnamgxh
	CbD2VyYjNqOp49JHfNb7JC2LGotKF1In11w0gz1zijGqNGGidloTTUR5GkOyYaFzUxVQ
	5deAk6RlNt/5eqU5+Zh8oqIKkzFkObbOptN5mlCqyTHYtn2KcIx/QhaLXrLGLe9k2pTI
	NDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=5Y8OyDaj+vedRBZotPIx0JOmN+pkhlBhfEls0m+drKI=;
	b=EfyCZM1JijgFGJUWqk9ijuIp6gFtKvwFPXi3IDCvQ1QrMP6fW36r2LLvK5YVYFscE8
	oPoOMMNBwTkHRXguRUw9GP1ern6FGnh9w5bCOyiTk2CVEYrITxeXbjwQodRE42J2qv+M
	26N4r4+ZYXFAjPguPKtZOdY+xkwjq9SeIS5/GNQfSKMl1yvQsuVJInYKc1ia1Kt3xe/4
	iONkFi7Odfo6ZSJmNU47v4+VSyEpQo6K45VaiZ864ffRXfSGAinClHADQYhkT/echUW0
	ARwtKzh1m0Yp9vbjfrERhoWMLTFD3SCn/k4kx5Q9qT+2+2nDO83XuYL2bDxuz72unH+T
	fUug==
X-Gm-Message-State: AOPr4FXlznY4nszN0Fs+OB0ne7wtNfbwdD8TAE8y8vRtJNXiXwvjz3s72W9iPz7kK1Eg9A==
X-Received: by 10.140.101.238 with SMTP id u101mr12489957qge.33.1460563940186; 
	Wed, 13 Apr 2016 09:12:20 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:19 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:13 -0400
Message-Id: <83cc5f17761498dbf3dcd5bade28f5583f9bcfad.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto: make aufs4 optional
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:19 -0000

An always on configuration of aufs4 crept into the default kernel
configuration blocks.

With this change, aufs-enable.scc can be used to turn on aufs via
a KERNEL_FEATURES entry. We can now have co-existing unionfs solutions
and can update them without breaking builds that haven't opted-in.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index cb245eeb913a..d81ca13872c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "328830680bc35257c83fc400d9d8e2ae94d86f77"
-SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
+SRCREV_machine ?= "2bc112a6ccd16800a4c45e47ccb3018a1042abdf"
+SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 2821f448e7f1..684e8809859a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
+SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5509dd697bfb..3c5ee1bd43b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d0dae8a98254e7ddd8d9be107e33c3a492bccdae"
-SRCREV_machine_qemuarm64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_machine_qemumips ?= "9024e9c842557e258a88470f8b1a772df18d9813"
-SRCREV_machine_qemuppc ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_machine_qemux86 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_machine_qemux86-64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_machine_qemumips64 ?= "88fb42ec863d20ccde57dd35da06d6221cfb4c03"
-SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
-SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
+SRCREV_machine_qemuarm ?= "ec9167bcb0ccd4897177c5e235af68b5890aa326"
+SRCREV_machine_qemuarm64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_machine_qemumips ?= "900f98d3ab6498bc7f4ff6b7a489db3bca4e6417"
+SRCREV_machine_qemuppc ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_machine_qemux86 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_machine_qemux86-64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_machine_qemumips64 ?= "4b08dfb1fb3bc7659e8f3e13665597d9a9f0816d"
+SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
+SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


