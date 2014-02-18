Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id EC4C86EE33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:13:05 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so11380017wes.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DxARXYDIhjGO01iowDPDmaBXIhporDzTRg1EDgfTcps=;
	b=ZcxZQWFQvzfQ7dEELAUaxmwPrNDR6ltjx6BlE7m5WIraRk4GuHSXb1h7jI/klHiJSd
	CcYZ2Kz63pgxOY1l16kTgXMDpxr649B+db3VNmNnrmgXb71REFMIjjyhF23UEvCyAx3Y
	6LCpHdM+NdNX0F8PEIZ61DW0nXhQJSw9BcvYeTgFzjWy3gB/tvpNnZEryqlAHiwbLYpM
	CC3GmAgKlnkaIh4Na0uapgdanfWq97PFBqni2nJgVDvhx2v4wDCKAkQcuf5sy3wDmzwb
	pkDzy8feM5U8P5UtQTieTIwk8a+/whFV9wwbWc/XrirlZkNPoQXF48o3fsuvwiriFPNd
	Zghg==
X-Gm-Message-State: ALoCoQmEIckgpIPyWMJnE6CsLVdZlVcEMB2BF5bhn+YoBPWctrvO2R8mya1DJlonf7WGoAOFQUTz
X-Received: by 10.180.101.40 with SMTP id fd8mr17646365wib.1.1392725585646;
	Tue, 18 Feb 2014 04:13:05 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id n15sm41569128wij.3.2014.02.18.04.13.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 04:13:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 12:13:01 +0000
Message-Id: <1392725581-6817-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] avahi: handle SO_REUSEPORT not being available
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
X-List-Received-Date: Tue, 18 Feb 2014 12:13:07 -0000

Linux < 3.9 doesn't have the SO_REUSEPORT option so instead of failing to start
when built with >=3.9 kernel headers but booted on <3.9 kernels, continue as if
SO_REUSEPORT wasn't available.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    1 +
 .../avahi/files/reuseport-check.patch              |   30 ++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/reuseport-check.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3a95b7f..e4ff26a 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -26,6 +26,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://fix_for_automake_1.12.x.patch \
           file://out-of-tree.patch \
           file://0001-avahi-fix-avahi-status-command-error-prompt.patch \
+          file://reuseport-check.patch \
           "
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
diff --git a/meta/recipes-connectivity/avahi/files/reuseport-check.patch b/meta/recipes-connectivity/avahi/files/reuseport-check.patch
new file mode 100644
index 0000000..bb81c2c
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/reuseport-check.patch
@@ -0,0 +1,30 @@
+Fix avahi-daemon when running on kernel < 3.9 (patch taken from Ubuntu).
+
+Upstream-Status: Pending (unmaintained upstream)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Description: SO_REUSEPORT may not exist in running kernel
+ When userspace defines SO_REUSEPORT we will attempt to enable socket
+ port number reuse.  However if the running kernel does not support
+ this call it will fail preventing daemon startup.  If this call is
+ present but fails ENOPROTOOPT then we know that actually the kernel
+ does not support it and we should continue as if we did not have the
+ call at all.  (LP: #1228204)
+ .
+ This patch could be removed from the debian package after jessie release.
+Author: Andy Whitcroft <apw@canonical.com>
+
+Index: avahi-0.6.31/avahi-core/socket.c
+===================================================================
+--- avahi-0.6.31.orig/avahi-core/socket.c	2013-09-20 16:36:50.000000000 +0100
++++ avahi-0.6.31/avahi-core/socket.c	2013-09-20 16:38:23.781863644 +0100
+@@ -177,7 +177,8 @@
+     yes = 1;
+     if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &yes, sizeof(yes)) < 0) {
+         avahi_log_warn("SO_REUSEPORT failed: %s", strerror(errno));
+-        return -1;
++        if (errno != ENOPROTOOPT)
++            return -1;
+     }
+ #endif
+ 
-- 
1.7.10.4


