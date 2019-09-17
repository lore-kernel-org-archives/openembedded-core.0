Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9FFE57F6A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b9so3715670wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z9HfBOkMKn6GA3NbB7CemWo3bBgJCPnGmaBFjgrpToA=;
	b=VjEPUmbqlYXpNQWsjsW+YAPhf3z1EP0Li+3ULw0lW/MfHehJEGGfhZmBbY7jaZyqpz
	gHfSaljXF+KqLOup/0N5deEMeyeqTUKeECwBHu25j+VQMGS1pYk9jUeKYcyjAyhsRtCJ
	2VYFNvfjlhbyxVPm4X+Rpec1OyfRbY+Y4nsduRjA5vSeOoWMkraGKJ0ZqjnAfCOOsXlj
	EonCpvBEdqQ04KJpjCUTJPb+peaKPKKy/BaVVQwIsGVvsDptkzhkPW5/3n98J3IJXOn7
	2sPmIjE5NErWT/+7YtRkVZyg29Wi3zxDxwf0Zh32zn67pCpj4guzKQ8CH6OLkPSDrq5Q
	CVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z9HfBOkMKn6GA3NbB7CemWo3bBgJCPnGmaBFjgrpToA=;
	b=bmkT39VBroqPbe9g9mqlHaN2xocj3OhX0e4IpdPYUB5x7niZhEVP9ivjP8EiuxEH/c
	Ywb3QWjdtzHzYOSxbgAyLpn/TGomLOJSEdltbPjlSXYy/MGxk6CIp0HFVmedt+n95gLB
	apqL6DCBEh8a2oU2FqPCbwl2umkfXGAzVFcZRJ1fThbykB0mvbQcDEqk3xW5CpyUkVSs
	AHW63znM9RSbIcs4nSu7Ft/AapM+QxQPiy8KolNJv7svCEEaMWUnVLnr+Eeys7xpn+jA
	5EZGyoe04PaoU/rxbpJksqr7ARo3FvuwzCIYa8DO8kvtRjIzBCpkOi1BO0ISdRLGzPBd
	O56Q==
X-Gm-Message-State: APjAAAVJLRJ/EArAapKAZIsyrVG4CxF4MOR+JNvAkfT1uXYEeYbsrCVq
	r1IGCpLQvh/YqBDO40dy+IGI2SbA
X-Google-Smtp-Source: APXvYqxKE5EYsYdq6IL80vj29qea42iYE1/0jox+QPN6vRN5HD4YrFeLTR7Z7+aXDaDcTF8dBoNN5Q==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr3673089wrq.305.1568734576575; 
	Tue, 17 Sep 2019 08:36:16 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:15 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:05 +0300
Message-Id: <20190917153613.4954-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 1/9] uefi.conf: add config file holding configuration for UEFI applications
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:16 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Create new config file defining common variables for all UEFI-related
packages (bootloaders, test applications, etc).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/uefi.conf | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/conf/uefi.conf

diff --git a/meta/conf/uefi.conf b/meta/conf/uefi.conf
new file mode 100644
index 000000000000..aaeff12ccb80
--- /dev/null
+++ b/meta/conf/uefi.conf
@@ -0,0 +1,16 @@
+# Location of EFI files inside EFI System Partition
+EFIDIR ?= "/EFI/BOOT"
+
+# Prefix where ESP is mounted inside rootfs. Set to empty if package is going
+# to be installed to ESP directly
+EFI_PREFIX ?= "/boot"
+
+# Location inside rootfs.
+EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
+
+# Determine name of bootloader image
+EFI_BOOT_IMAGE ?= "bootINVALID.efi"
+EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
+EFI_BOOT_IMAGE_x86 = "bootia32.efi"
+EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
+EFI_BOOT_IMAGE_arm = "bootarm.efi"
-- 
2.23.0


