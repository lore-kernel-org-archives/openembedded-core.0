Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A623078347
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:56:55 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 207so18861360pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VK3v0dDSVDnSaFOMJAZdlvtIDNHRmTpPikiNbt366Qw=;
	b=ybGuEbVR0/eSQ74oAY7V4duwjwAIJUEi3sMW6CgvXRrF2cFPWC+SmgZGJtQKDIYTHP
	7EIgvSWfd4phM+efp4qDdh8Js0t4jxFO3lSVyhb8gfKIdbYMWTjrFiQH5lkzzjxyurxn
	PXGesbMis5Q6cCSCSgH+3BZeyknPNsw3jhxYR+2QkqITnrZ/noW9VAnwKsMNiEhHQy6i
	UR5XXcLz7F5Xj6+cZqZ2zz31TMG6lTj4AciyNTnKQRozCD0vKCTM0SGr9k0VBMY3WT1I
	irCsiD2NfpBSj/7a1CGUyk1bdTrnQGuUTUaBKQvHbfvfIO4cLCEGfgATd4VvuiGqxKeu
	9Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VK3v0dDSVDnSaFOMJAZdlvtIDNHRmTpPikiNbt366Qw=;
	b=AHcyMtpi2ukijFzb9udqh9ExwWhB2Z++N7QQuqVmNR+/kMmWy5YGrghdsw1CxuA1N8
	r8OGGCnIX1FcqVev3O19u4znM5kvikQQRCyFKZBBj7DDOKQ8tKR+oMBkrrw9WjeKLczK
	jXUjepwhfS1HTzos4qvUyIcRBOJPCzJkRjzAnnIQL3epjM02K5+VGnOCpLUM8Ai13Ia3
	rqefqiiK59jMQNyGRz/3ditWVKVLVPStbtcMKTNUbduaZl3lwtJ35ZhpbTK1m6KPMxEn
	+XUj3C36aZHHcbkQJDl7LOiIQJh+Iw6Z1YWhjUCZcB9nCddyFHClIil0kDuIIWsl26ws
	Kh8g==
X-Gm-Message-State: AJaThX6lZ8Nmn8Ijeqm4hQKpl9hZrPgCz9zbVz+NkmMxUQnJyPgUWSMr
	0uIjJfZuPap0Co6BUNi4y9VOPQA=
X-Google-Smtp-Source: AGs4zMauV2o6OWGchaESOo04JfkErgYL+YTZl7e1gWnTcDR2uE4/4TVQhpBY4dxiySwIOCmVffGlRw==
X-Received: by 10.99.165.25 with SMTP id n25mr36737616pgf.3.1511798216745;
	Mon, 27 Nov 2017 07:56:56 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD51E2.dip0.t-ipconnect.de.
	[84.189.81.226]) by smtp.gmail.com with ESMTPSA id
	m87sm40889460pfi.88.2017.11.27.07.56.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 07:56:55 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 16:56:42 +0100
Message-Id: <604f11f2621d2df6704616383582fe68a5627529.1511796276.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.34dd9130ccff96d177d10e8e7e414aa4ebbb71c2.1511796276.git-series.patrick.ohly@intel.com>
References: <cover.34dd9130ccff96d177d10e8e7e414aa4ebbb71c2.1511796276.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] rootfs-postcommands.bbclass: ensure that rootfs gets mounted ro
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
X-List-Received-Date: Mon, 27 Nov 2017 15:56:55 -0000

When read-only-rootfs is active, we need to ensure that the rootfs
does not get mounted read/write by the kernel or initramfs. Adding
"ro" to the boot parameters achieves that.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 5391e7a..a4e627f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -14,6 +14,14 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
+# We also need to do the same for the kernel boot parameters,
+# otherwise kernel or initramfs end up mounting the rootfs read/write
+# (the default) if supported by the underlying storage.
+#
+# We do this with _append because the default value might get set later with ?=
+# and we don't want to disable such a default that by setting a value here.
+APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
+
 # Generates test data file with data store variables expanded in json format
 ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
 
-- 
git-series 0.9.1

