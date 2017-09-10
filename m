Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA3B77E91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 13:15:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j16so344178pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 06:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=1YVVbDk+UNzguzvm0/6jp9sXD8LSLE+ZAaJPK0DPaHM=;
	b=QW8GgwNXth56flgY1tjXDcM1KHSh4ylYvZfoK+5Eu+Lbp5xdzQXrjmlK29l1sAzPdI
	eyeilWPDNfoUsJCfPaP5YsDX6RDIYYCg2a/XPx3WtGChwgL1RkpPyJtTiKa07ySIfnxZ
	WQBvQFDED2LcY1QDw/456TN77gEw+L3SnnrACrQBpupNE5E/o6rJG3yZT7P7lSmvdZMr
	4M7J6aFbNEBQNJ62SlHG+tifAvhcB4zMEDyPkpeIqgT0vMwtmO43fjBq/kHQrBmYoJ6l
	+H9shuYjEk0HXmFhj8x9puYE5ygnYmM5/JUEvDPG4Wlwjq7WhAy4lLphBXiW1B6nB2A6
	enqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=1YVVbDk+UNzguzvm0/6jp9sXD8LSLE+ZAaJPK0DPaHM=;
	b=ZNRggUgrT4qd710oN4RBfIZQadd+rPq+/TfwwEncGEDUuINWle66vN8Jt4d+GyJpXk
	It1eqisYNAgpSQnRuyf9icCBgsABzAizHnA8y5VJYT9JGQWZS/cKm0Qc09Bl4YvOgvge
	4M1n9fCcRUcO6e1hEz3E5ue6QMIUKlnMtxKTlKCseNRqpsfe42MHdFA8LH6d5IIFThkf
	P9q6y99H4oU1RU+cDIDf8iZulVadf+0cVY5P8ITMgIMwbcdodRfxBwRn3/Hb9btDzW5c
	GBo9zMzvm4kp2fE7cQNr+/bSCdDzXxQyiakKUxY6p5GdGr3Ct2l2VkEVgFFF1vyGjdIK
	SkTw==
X-Gm-Message-State: AHPjjUiByrXHh9RKF1RieDCLZAOB1RtTacXh5wtvhbg0Y6qR3G2WqIem
	3FjXjPYrCRR+sSekaRHZnA==
X-Google-Smtp-Source: ADKCNb6oaBH9cvnkGVbdp/kMOQJg9xJWzIECWFv3pCU7p+rAlX4IVkC5QxzXyvd96+NsnkK19Hw7fQ==
X-Received: by 10.84.131.97 with SMTP id 88mr10215641pld.280.1505049307396;
	Sun, 10 Sep 2017 06:15:07 -0700 (PDT)
Received: from [127.0.1.1] (CPE-121-223-2-142.lnse2.cha.bigpond.net.au.
	[121.223.2.142]) by smtp.gmail.com with ESMTPSA id
	5sm11770686pfr.151.2017.09.10.06.15.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 06:15:06 -0700 (PDT)
Date: Sun, 10 Sep 2017 23:14:46 +1000
Message-Id: <20170910131446.4555-3-nathan@nathanrossi.com>
In-Reply-To: <20170910131446.4555-0-nathan@nathanrossi.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/4] arachne-pnr: Add Arachne Place and route for iCE40 FPGAs
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
X-List-Received-Date: Sun, 10 Sep 2017 13:15:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Arachne Place and Route provides tools to complete the place and route
step for iCE40 FPGAs. This allows for processing synthesised designs
from Yosys, and generating netlist output which can be processed by
IceStorm.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../arachne-pnr/arachne-pnr_git.bb                 | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/arachne-pnr/arachne-pnr_git.bb

diff --git a/meta/recipes-devtools/arachne-pnr/arachne-pnr_git.bb b/meta/recipes-devtools/arachne-pnr/arachne-pnr_git.bb
new file mode 100644
index 0000000000..2928a9d78b
--- /dev/null
+++ b/meta/recipes-devtools/arachne-pnr/arachne-pnr_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "Arachne Place and Route tool for iCE40 FPGAs"
+HOMEPAGE = "https://github.com/cseed/arachne-pnr"
+LICENSE = "MIT"
+SECTION = "devel/fpga"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bb65c4bee625d497d43f50e6dacb4e2"
+
+SRC_URI = "git://github.com/cseed/arachne-pnr;protocol=https"
+SRCREV = "7e135edb31feacde85ec5b7e5c03fc9157080977"
+
+PV = "0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# needs coreutils for 'sum'
+# icestorm is needed for chipdb
+# depends on itself for processing chipdb content
+DEPENDS = "coreutils-native icestorm-native arachne-pnr-native"
+
+# export the path for icestorm chipdb
+export ICEBOX = "${STAGING_DIR_NATIVE}${datadir_native}/icebox"
+
+# set executable for use when processing chipdb
+ARACHNEPNR_class-native = "${B}/bin/arachne-pnr"
+ARACHNEPNR = "arachne-pnr"
+
+do_compile () {
+	oe_runmake bin/arachne-pnr
+
+	# manually build the chipdb.bin files
+	mkdir -p ${B}/share/arachne-pnr
+	for i in 384 1k 8k; do
+		${ARACHNEPNR} -d 384 -c ${ICEBOX}/chipdb-$i.txt --write-binary-chipdb ${B}/share/arachne-pnr/chipdb-$i.bin
+	done
+}
+
+do_install () {
+	oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
+}
+
+# populate the chipdb into the sysroot (not enabled by default on -native)
+SYSROOT_DIRS_NATIVE_append = " ${datadir}/arachne-pnr"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


