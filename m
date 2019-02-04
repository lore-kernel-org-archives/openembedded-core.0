Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9736B463
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 03:13:08 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id l142so1252506lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2019 19:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+m+041pu0szSeeWSp1XGM3aL4lJFHVsuArXaWpUAlU=;
	b=GFJJpTJSzbdgJU3mAN2DkYL7pXO5DuPe+mqKue0h70mqEpO5SFYnm8dsL3pQfExT86
	yq/vZiNh8YnJEd4ngEh9RYRq9hPgvNgXinUdOpbH2bv9Cli1KnZSMpBgNK/RP8C4V87q
	To+Hymj3jWjMzVVwJj/pdKBtAj0bDk+blIYyY2A5u51oIrSrxrSlo30rcPw+9PvVfEKJ
	zd/qduFi8ARw7dzxTzBJYrTrQ0Byb9i0q1Vo/cstWq+1sXIivvzNfTOaHzQJCaJ6JOk3
	0tZsAYreoIEoVnrlgQ4ywp6twDwPTsc9oLPXvvKV13IPKbB9NC/AldtGMsFUnm/MWHGM
	Dwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+m+041pu0szSeeWSp1XGM3aL4lJFHVsuArXaWpUAlU=;
	b=PXfDCDMX8CLCpnDq16+usvB3GgUi86PXOM43htLEOEkxWqVClcCMZON7frPTedpehg
	PsEIYsc58IrgOsghod+NNlRMYl8hzhCZHHokJGHzRfUZQM8pLWPDlB1KWBITGtuDegAG
	icRFhmefQrp86xhr2SPvcUhh7oAcDNrMSgiwBkCe+JaCOTZ1cSI0QYKFxPBayQAKrHs5
	K+Iuw06pFuXrKF+FW1CuLQjUpPiVcTT6MIt6TbSFBaIXsQ8SRxSUE7YF2WMtvfLVdQ4Q
	uiMgWGCn3nX+xMKbTklW4l9VtRUa6UuGleVmXjTa6xdqIW0lTZEKM2mCggxbbD5kv4LY
	R9Fw==
X-Gm-Message-State: AHQUAub8lgz628oiAX9LcReXs9t2y+5TDvh1Nxvwcv+KmVcWRTbOFMCI
	zfKiDz1zNSJjnDtHAfFLjnDCTKZz
X-Google-Smtp-Source: AHgI3IZBbKU2kOBN/iamZNzZOqxrtK6OuJ/YOSl/pyddKHmVsR2LeOIZyGwYl16eeOTReR3gpgHFPg==
X-Received: by 2002:ac2:4191:: with SMTP id z17mr4722772lfh.117.1549249988376; 
	Sun, 03 Feb 2019 19:13:08 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id d3sm1105154lfj.39.2019.02.03.19.13.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Feb 2019 19:13:07 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 04:11:53 +0100
Message-Id: <20190204031153.1348-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Mon, 04 Feb 2019 03:13:08 -0000
Content-Transfer-Encoding: 8bit

Although base-passwd in OE is somewhat outdated, upgrading
to a newer version is not going to solve eudev warnings about
missing groups during boot; input/shutdown/kvm are still not
listed in groups.master. The reason for this is that
Debian uses systemd, which will automatically create
missing groups(systemd-sysusers). In a sysvinit+eudev
configuration you instead get a warning printed to
the console:

  udevd[<pid>]: specified group 'kvm' unknown

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---

v2: Add reasoning in commit message trying to justify the added patch

 .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
new file mode 100644
index 0000000000..113d5151e7
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
@@ -0,0 +1,23 @@
+From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
+From: Jacob Kroon <jacob.kroon@gmail.com>
+Date: Wed, 30 Jan 2019 04:53:48 +0000
+Subject: [PATCH] Add kvm group
+
+Upstream-Status: Pending
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index cea9d60..5b62284 100644
+--- a/group.master
++++ b/group.master
+@@ -34,6 +34,7 @@ utmp:*:43:
+ video:*:44:
+ sasl:*:45:
+ plugdev:*:46:
++kvm:*:47:
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index c6be1c1d08..d1aab09181 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://noshadow.patch \
            file://input.patch \
            file://disable-docs.patch \
-          "
+           file://kvm.patch \
+           "
 
 SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
 SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
-- 
2.20.1


