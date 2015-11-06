Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA92A7713B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:49 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116512315pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=THSpxYe9v/Iuq55t0UzQndOg6E7nBaWzdxMYVXsBiqQ=;
	b=D2LkO/fVyXlFB/UZccEicmGr0SRqKZzgPBzOMw0uZ2gHgqIntx5tLy/OHJ8o1/FZgy
	+ssrGtLa+/S4Amel80yuARKetvvo6n+w1w//8HRXS6uY4OKFHIptYbN37p6AzWt17X8p
	WOusiW2/4g2/4wAg+sQS7dhzEPM1KqBc8zhuM260J7QYA/5iq7T3oYbUV2gp8y8gxeDt
	mFV+8ALchGkOD4S3px4M+hUq3lgULYbz/pLf+8gslNoW8gRDNDhPrFrFHEqt0DG5FWBm
	kzzt4OG5M9gvLdoJmn6pCqIGOVggO/noFcXRZOxVj5fMM+s3AxKL6HQG7iule3KCdn0K
	Bnsg==
X-Received: by 10.66.102.34 with SMTP id fl2mr15932416pab.59.1446799670389;
	Fri, 06 Nov 2015 00:47:50 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:11 -0800
Message-Id: <1446799631-7037-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:50 -0000

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


