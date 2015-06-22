Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id AC6CC75A67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:56:48 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so74180187wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x7ciiTgpuU9GVD6tJyByhwDSXhW1QSO/ZEJSn1LlfpY=;
	b=oaIOcQIUReCaytzG1H/XtBv3Rj6ehbk+xgF+AZwhNeTGMbKc4jjo9EQJWld3nXGJ2c
	MLujBYaMW4MviO36oWJbuoQXrlrrFOokkSeW7oJoK/wifJ+74uvVGN2NNj5R5AMn3s45
	DHqarNHRj4fyTV7TC6jIOWFZxNpv7KRnCzxZbLG7zlSSoK4qtIK0tB3QuYHmgJVGxvU1
	6FgUANjEd6qNfRi6DaaDGNn2nB8yAdk0fPwGqA+X2yqtQNgI/H/UQ/+g3rlmY0mND7aK
	NUunOxmpzVbVj0PauvbPDwkg8JOm2QzGvu485kP4JlVs+ikVehqZ2f1Wm/oCSOEefziF
	hTqA==
X-Received: by 10.194.248.227 with SMTP id yp3mr41048844wjc.32.1434974208168; 
	Mon, 22 Jun 2015 04:56:48 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id q4sm30184358wju.14.2015.06.22.04.56.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 04:56:47 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 13:56:07 +0200
Message-Id: <1434974169-19875-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
References: <1434974169-19875-1-git-send-email-adrian.freihofer@gmail.com>
Cc: paul.eggleton@linux.intel.com,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 1/3] connman: fix qemu config
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
X-List-Received-Date: Mon, 22 Jun 2015 11:56:51 -0000

If a network interface is configured by kernel boot parameters
and the image is booted in qemu, connman takes the IP settings
from /proc/cmdline for this NIC.
The regex for parsing /proc/cmdline is invalid.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb                  | 2 +-
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 2358d9d..4271a37 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 SRC_URI_append_qemuall = "file://wired.config \
                           file://wired-setup \
                          "
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index c46899e..4a61513 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -2,8 +2,10 @@
 
 CONFIGF=/var/lib/connman/wired.config
 
-# Extract wired network config from /proc/cmdline
-NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^ ]*\).*$/\1\/\4\/\3/p'`
+# Extract wired network config (IPv4 = <client-ip>/<netmask>/<gw-ip>) from /proc/cmdline
+# "ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns0-ip>:<dns1-ip> "
+NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([0-9.]*\):\([0-9.]*\):\([0-9.]*\):\([0-9.]*\).*$/\1\/\4\/\3/p'`
+NET_CONF=${NET_CONF=%/}
 
 # Check if eth0 is already set via kernel cmdline
 if [ "x$NET_CONF" = "x" ]; then
-- 
2.4.3


