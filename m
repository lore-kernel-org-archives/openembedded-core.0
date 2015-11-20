Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB0F6212E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:40 +0000 (UTC)
Received: by iouu10 with SMTP id u10so140597404iou.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=THSpxYe9v/Iuq55t0UzQndOg6E7nBaWzdxMYVXsBiqQ=;
	b=FjPUy8R29rP6NPmj1MLpSllbpunFDLvLtw7bXDKk25rc5trPFJLnPNRGkVpbOlPv1E
	OV12PQbsGEh4VL4e1NAa8SdjJSpiWmOMxGt9BoHP7uQJ96+aJHhDMLdn5t+EoFLlzoBN
	l5/z/HrIxKaNzfDhtD2z2jLNYmUkPT43AG9Aq93BCbdeSHpsS2F48eI1q/V9faGShxE1
	H5y0/mt04dftzbtGgIin95A5AaEGtWb7/+g/AYvFvx9Rfhy7TpAZppQnEWde4PdiHQPh
	CeDZ1H+mUQNgwsRGAyIUOlKVkJ+6IUq3uo/vd5qdaiQA85mSIRiZCm6MgH4k300JrjVT
	bNwA==
X-Received: by 10.107.13.143 with SMTP id 137mr6757831ion.72.1448059481473;
	Fri, 20 Nov 2015 14:44:41 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:58 -0800
Message-Id: <1448059438-24431-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 11/11] busybox: enable resize applet
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:41 -0000

The /etc/profile script contains a call to resize, which improves
the usability of shells run on the serial console.

  http://git.openembedded.org/openembedded-core/commit/?id=cc6360f4c4d97e0000f9d3545f381224ee99ce7d

Unfortunately the resize applet is not currently enabled in busybox
defconfig, so resize is never called. Fix that.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/resize.cfg | 2 ++
 meta/recipes-core/busybox/busybox_1.24.1.bb  | 1 +
 meta/recipes-core/busybox/busybox_git.bb     | 1 +
 3 files changed, 4 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg

diff --git a/meta/recipes-core/busybox/busybox/resize.cfg b/meta/recipes-core/busybox/busybox/resize.cfg
new file mode 100644
index 0000000..a1d9c95
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/resize.cfg
@@ -0,0 +1,2 @@
+CONFIG_RESIZE=y
+CONFIG_FEATURE_RESIZE_PRINT=y
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 92bbee1..7d2a7b2 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://resize.cfg \
 "
 
 SRC_URI[tarball.md5sum] = "be98a40cadf84ce2d6b05fa41a275c6a"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index d968fad..220977a 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://resize.cfg \
 "
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.9.1


