Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 879DE7F6D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so3668548wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TWjXiqPitD17HvnEPZJHTT69LA8EYm1VXWgpkWJMwcA=;
	b=ciaj7oBCg5ivVrNz/b0NErelbyP5HjjeHAP6HKTyPCriK8Bhm/7VDRxOCeEqDpe+A7
	m7hY/OYPzIKZZ1tpLdW9LdQxtqGRE+vkNkjr32KBsM2clxAvo8wjpZD6XenenRUnAnEG
	+5INpjtywQQTyUAhpAuW3ziHIsqT6wPal+lRBNabSQWFnF3e5cX6tM16AFNWDuQBm6Ec
	6TQybrwGSLzPjRTh+AD2fZuEbylfyFIqpEZgBFepuZ/3N/4xpZZMuNyYwKATebwYy0XJ
	u8rlM5mbw28eAGqBLmozFlEWGWnxf2ULqEv6W0MRBhaHFrbUGahSFTyatLGeMM5F/Z4U
	HyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TWjXiqPitD17HvnEPZJHTT69LA8EYm1VXWgpkWJMwcA=;
	b=lMctO2ZH7IsBrAY1fINLHQXxZZJ1zXQiXvJeuzfJlpn6pDvloTdLs6ksewyTMNxP1G
	9PJIqvYels6xM9YLtdPFG/FNAMTVY6uOV66uoDs5sLzzNtheNj9X5rCVfraRAAIXcwtA
	hYU0yDSBlGSxqLS0Ox7xM+ODc029FpCGk9nsGbmZwMzxiLZYS0jEvYO2tf/vB882+5pT
	pC4ZFAwc7g4jWTzZE0uhxYvqvZOFsd5SPidq2hDrcqvUHiHXLXnXjevx/7j+6RftmcRX
	zDsXIneNxbznFufFh6OitFA9Ce9o9NXV46i/sWILFRdJhWqTmGaJoEhofFxfaoA/wrtU
	dttQ==
X-Gm-Message-State: APjAAAXdTb7r6Xx9+XNlmg/Xp8omZFRigovnvqE9AEYFtTfu92/W32fK
	WdEhkXQPDGc6KaEMlsuRWyGWzO8K
X-Google-Smtp-Source: APXvYqynGXCWfXPcBF4saupZkGMoMowbPuzYF9bgVB8oPVhC1aFFmZF6QyOWPTHQruF4LcdFmK9tJg==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr3596102wrm.157.1568734584875; 
	Tue, 17 Sep 2019 08:36:24 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:23 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:11 +0300
Message-Id: <20190917153613.4954-7-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 7/9] uefi.bbclass: provide efi population functions for live images
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:24 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define common functions for populating EFI directories in live image.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/classes/uefi.bbclass

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass
new file mode 100644
index 000000000000..4baba81369c8
--- /dev/null
+++ b/meta/classes/uefi.bbclass
@@ -0,0 +1,29 @@
+require conf/uefi.conf
+
+efi_populate_common() {
+        # DEST must be the root of the image so that EFIDIR is not
+        # nested under a top level directory.
+        DEST=$1
+
+        install -d ${DEST}${EFIDIR}
+
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/$2-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+}
+
+efi_iso_populate_common() {
+        iso_dir=$1
+        efi_populate $iso_dir
+        # Build a EFI directory to create efi.img
+        mkdir -p ${EFIIMGDIR}/${EFIDIR}
+        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
+
+        if [ -f "$iso_dir/initrd" ] ; then
+                cp $iso_dir/initrd ${EFIIMGDIR}
+        fi
+}
-- 
2.23.0


