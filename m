Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id B12A96F6DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 12:57:12 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so10057009wes.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sz5FTU82EOf48f6xuZB3uDQjzVLEsvN6YTdItVRVdoc=;
	b=HVPLa8Ab+z0Idl59kNZKoYjq9yDcmQWhqqLzAHe53DW1rp+U5n9GJkkcGIgoT3ZbPS
	t1Lt3bHTLRANtovGimrdQybbkktaqLJGzvX8ONraBc9XgdjolmZ0IbCmz1knYdf2Ns9o
	Y6lrBtAqL8bjZn/ePFW/KY2iivt/OX5aNkhAnR+b7ieCTtB5OUImkIDcLw/cYzkpdGgB
	PXraLQT8dS2TKZw33TcYuR7u3rG7EIgEDrtjRkPmk2qL1O4b5dQI+l1LIrJNKyrL3FhT
	6+wLgDhLU3MEbrF5rJHdQwEtv93lqLRkoOQ7gPaMR/17N+LWC5TWBRL7vqSxbXB8gTz2
	HtzA==
X-Gm-Message-State: ALoCoQkPmHu5xOEOU/L7oQO0ZqMsLvQWnasqeqgOUGsiViX2CdPDIEjJvscsmCFJ6bYUYNtIiHZG
X-Received: by 10.180.72.239 with SMTP id g15mr3080456wiv.45.1394542633275;
	Tue, 11 Mar 2014 05:57:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hy8sm61289284wjb.2.2014.03.11.05.57.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 05:57:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 12:57:04 +0000
Message-Id: <1394542624-22894-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [dora][PATCH] avahi: handle SO_REUSEPORT not being available
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
X-List-Received-Date: Tue, 11 Mar 2014 12:57:14 -0000

Linux < 3.9 doesn't have the SO_REUSEPORT option so instead of failing to start
when built with >=3.9 kernel headers but booted on <3.9 kernels, continue as if
SO_REUSEPORT wasn't available.

(From OE-Core rev: 85e89da55f778ad3713460cb0df1435d82e94510)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    1 +
 .../avahi/files/reuseport-check.patch              |   30 ++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/reuseport-check.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index cf063db..02dd5ed 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -25,6 +25,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://avahi_fix_install_issue.patch \
           file://fix_for_automake_1.12.x.patch \
           file://out-of-tree.patch \
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


