Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id F0F087CEA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:31:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v14so2497194wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UvL9k5uBFE9TEkae0VKkJTNMen9tlKVRcBAPyXlN+/I=;
	b=Ap8LYESoxRa/Q3nbSAeH9QEyJR3qvS/xuBSe8U7OUADuy5NEWGfDbXCUcI3YFE/HbP
	c27uFM3/Dr6dZtAP6IeuMzeKgXcNgAYNFznRPHxxVQ0//ZzQUdiXPZ9NGbbGpB1hK9+0
	LZZN9T1EzJh92YxLkZGmeVACCORN0guufc/lZBwUAEIeLvBTCr860GFwC8ehc5HqiKax
	XKCp/qRtGVDSOjjGWGAsiPLmQTlEf3KD2NtJG3n7YUj+Dv0UK92zjSt58GEkEcmu9Q/I
	U67uaBb1OrG636NygZpqDATMaY68oRpKWOM9vZgyUSQwyUUUnzgAOu2eVj8PAB8A8lZR
	FGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UvL9k5uBFE9TEkae0VKkJTNMen9tlKVRcBAPyXlN+/I=;
	b=hqSKPwppyDDhdUWLnHnPCWLlskYPzL6mPkQ5sXQIemWnREXyvxcNiuDzYNiSDRFd+3
	Eo2p1xJyiXtf0+33SMRaN6ugPrEx7IyS8SvBqp0jKog2/irq0OSyPzOhYWfVzr2fF/oJ
	AzA72AkTvUeLV5m0YQ7A+8HXm8Q+EFoMht8vU/SrFQyqILg75tw31GogqJU2RZ5Ihtjf
	ZiEsDbHWoAcz9aEQ8WaY22cv/TPNFMFdZZq5xFW1T4yn2M89nWsv2Otr2PELGz3XH3YC
	xPcRmV7hHOR0Hu6QQwRJrw0cHFHlsHJLAsmFW4MABsppQtp2l9NzDNo1WuTBuUP+1PNv
	XIMA==
X-Gm-Message-State: APjAAAXkeLeEVz49h9of1E/TPnb5829dKMqg+kqqaLaYpBZz9xoRpSpY
	ice0TcGIMc+fiUi7yqa/0S4+7IWuXo0=
X-Google-Smtp-Source: APXvYqxghXB9dRbYSQOiSF7mr7U1rELOSRG5frI/ORHNlq3HQx0JNe3ZrD4tNZ+G0eITvL1BcvaLyg==
X-Received: by 2002:a1c:2407:: with SMTP id k7mr2313156wmk.137.1553171491515; 
	Thu, 21 Mar 2019 05:31:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c8sm4139530wrx.6.2019.03.21.05.31.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:31:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:31:29 +0000
Message-Id: <20190321123129.3127-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] qemu: fix CVE-2019-3812
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
X-List-Received-Date: Thu, 21 Mar 2019 12:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../recipes-devtools/qemu/qemu/CVE-2019-3812.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2babfe4c6f5..e503aa866d3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0017-fix-CVE-2018-20126.patch \
            file://0018-fix-CVE-2018-20191.patch \
            file://0019-fix-CVE-2018-20216.patch \
+           file://CVE-2019-3812.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
new file mode 100644
index 00000000000..7de5882b3e2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-3812.patch
@@ -0,0 +1,39 @@
+QEMU, through version 2.10 and through version 3.1.0, is vulnerable to an
+out-of-bounds read of up to 128 bytes in the hw/i2c/i2c-ddc.c:i2c_ddc()
+function. A local attacker with permission to execute i2c commands could exploit
+this to read stack memory of the qemu process on the host.
+
+CVE: CVE-2019-3812
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b05b267840515730dbf6753495d5b7bd8b04ad1c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Tue, 8 Jan 2019 11:23:01 +0100
+Subject: [PATCH] i2c-ddc: fix oob read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Suggested-by: Michael Hanselmann <public@hansmi.ch>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Michael Hanselmann <public@hansmi.ch>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 20190108102301.1957-1-kraxel@redhat.com
+---
+ hw/i2c/i2c-ddc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
+index be34fe072cf..0a0367ff38f 100644
+--- a/hw/i2c/i2c-ddc.c
++++ b/hw/i2c/i2c-ddc.c
+@@ -56,7 +56,7 @@ static int i2c_ddc_rx(I2CSlave *i2c)
+     I2CDDCState *s = I2CDDC(i2c);
+ 
+     int value;
+-    value = s->edid_blob[s->reg];
++    value = s->edid_blob[s->reg % sizeof(s->edid_blob)];
+     s->reg++;
+     return value;
+ }
-- 
2.11.0


