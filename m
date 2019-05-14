Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id B068D7DF2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 12:26:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w12so19013885wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=JG0gYvwUtKRUnET2JpCi2KT642qqWpvU8B7A0RsPrvyBSQD2IPPrZ9pTcYrOlVzmgm
	m01kXF2ADWgMP38GZrZ6qhaIu8zEaxPy4CjZiSwC6Ta+R9Go6VBvkxVCmsh5qWUOKB4H
	hjm4gKNTp1Adn4ntSAvQYkyk1vNA/JMrXRj94Pp9z3KjLwJ6vNrtb7A1h6GZnWQq6Hz3
	xBho2hNUet3lk7By+aggWPpzCvx5HgXISGTG40/V4FcZ+mW7hdnFrVF8funui/FW1EPf
	a07mcNGhtjBQRbmsuHa95aKnEJciemPyZ/R4vtgcOhL2RksgXvUrYenOATpIh+IbQav5
	Mb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=A+77IfT19yXbPNDOww3C4Kg029+UhGqmdkyebpTb47bjCSFWAJgvEFQ3ueDUIwXSWC
	yTXeMDBqJtr6M/r0oS9sNWYRungfrvBwQIY3nrfdK7SHBuQLCn/Qt7KiqAGhFPd7Mnl/
	R9SBTpZ6pCujmXcDHw5dq+u2CHL8SyTVYdVDWxxfMeueOEValxApkjHxF6aRZMdV9Sau
	EalX7XxU5iFjmC8mNZDWd0MCeFpXvPmjw+0QBcdR8Wd0baCCBy8D2ly4HbTSOehCmg/V
	R0cMoh6kd/HSiCOPrLKGn/ICyIn/6RNmviDVlgietvudtzR3prbboikBYlQLbVPJSTeO
	q5XA==
X-Gm-Message-State: APjAAAVm564evS3a92sPSdIWtO3AGFOTCsTfuiCAzlKWLOEE//vz8OIt
	ofxYB+XPT0j5CX/cfHxcnQN5lH2PnNM=
X-Google-Smtp-Source: APXvYqxox0T63A5ne+WbwfZgpBRFqJttNXvXP7LtBpQv1A1JetGv6rPMZuHlZjGZuwrHOXAtNex75w==
X-Received: by 2002:adf:db4e:: with SMTP id f14mr21228250wrj.35.1557836808178; 
	Tue, 14 May 2019 05:26:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g2sm8124457wru.37.2019.05.14.05.26.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 05:26:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 14:26:39 +0200
Message-Id: <20190514122639.102946-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514122639.102946-1-alex.kanavin@gmail.com>
References: <20190514122639.102946-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Tue, 14 May 2019 12:26:48 -0000

This matches what the qemux86_64 is currently using, and
will allow testing the instructions added in the meantime;
particularly various SSE extensions are now enabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86.conf             | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 5fdbe4df50e..82ce46d8604 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,8 +1,8 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME_x86 = "qemu-system-i386"
-QB_CPU_x86 = "-cpu pentium2"
-QB_CPU_KVM_x86 = "-cpu pentium2"
+QB_CPU_x86 = "-cpu core2duo"
+QB_CPU_KVM_x86 = "-cpu core2duo"
 
 QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
 QB_CPU_x86-64 = "-cpu core2duo"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index f2434a4b5f5..272ad1e1870 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -8,8 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "i586"
-X86ARCH32 ?= "i586"
+DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/tune-corei7.inc
 require conf/machine/include/qemuboot-x86.inc
 
-- 
2.17.1


