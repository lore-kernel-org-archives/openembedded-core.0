Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 908AD7F986
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 07:22:21 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so4537108pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 23:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=10R3fxdxCWaAQH6wlO8t5LGCt+Ik4JS3sb+BZ2LPGA0=;
	b=Our9qX24Oobt6wXVQopjDW/uB3p9E/N8K8YXRRLRaRZLrlLqp21DIynSqu+kuB0dSV
	Bebt9bbio/3aqzp/cCEB/JEEWn7YBoiJVG4xJ9qhbmywg/md+N3UlwZGQ3wWk7awej/A
	U3VCtoIals68SjTRfKBat7vFIVk7eh6qXmmMC7tzx7XyH67b5POoj1cUJMx6bOXmJ0Ar
	MKgghdIZ6TSF9qLJS4E/muRwwGfa5yS8xeIY5MpB5Q8wJO2lH8V5wopOafBJzEaOFBFY
	fstnq3dCTlandN6DPNwdJ7u/sBhxK43EiDzltfZRGvVX5e4QSW+9hM4J6B84siXsa09b
	E7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=10R3fxdxCWaAQH6wlO8t5LGCt+Ik4JS3sb+BZ2LPGA0=;
	b=KHrAhmGj1MyKHTVXW9ZM7Kyp2dcfCIrpCfVDGqsGO3L7nUrZRwcvFKgHTiAXj+9T8P
	2neu/FDNl6XZUYCIVG716cKv4DWZo3vT9BmGfF+0/4J49yRo21gaRxAinYnpvtl4MGIC
	nBd0XEbq7EUy35B12ptnSU2AxYnZ0hk77IdVy0Quzh/aDD810LLeK8OiLKAKNXv3dvIE
	fa/wqJ5wZ/Gr0wzeW1DsY2gDIntzGVkRke0MBNPfWQ+/FUm/WjFNSORVofP7oIRBvf+t
	j+XCeD54z1dfE/W30RZdeBURcMO8PFs+zA60ukRobxrt7egOH8DJ4f5LdhI/52uFxEY1
	9pBg==
X-Gm-Message-State: APjAAAVUziO1DHHz5QfvMwBPm+N90hqJSbrxDSYJEqFdGtPWSNZeOaJq
	crWx5s30n3UTgwZPQyoap16Bb3BbAjg=
X-Google-Smtp-Source: APXvYqx0uLx6IyX5fTRNU1kBuDO0h9yYy3ajxYM41aUe+uPZyuzcFivNBZFLbkkcTzQyx2Tm1bQWDw==
X-Received: by 2002:a63:5211:: with SMTP id g17mr7530662pgb.299.1575703341939; 
	Fri, 06 Dec 2019 23:22:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	w10sm17314152pgi.47.2019.12.06.23.22.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 23:22:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 23:22:08 -0800
Message-Id: <20191207072208.2773273-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] kbd: avoid vlock conflict with busybox
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
X-List-Received-Date: Sat, 07 Dec 2019 07:22:21 -0000
Content-Transfer-Encoding: 8bit

busybox as well as vlock utility from meta-oe provides vlock utility
which can conflict when with kbd if pam is a enabled distro_feature

Fixes image build errors

update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link

ERROR: yoe-qt5-wayland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/kbd/kbd_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index 9556302ab5..4853db8a78 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -61,7 +61,7 @@ RDEPENDS_${PN}-ptest = "make"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey"
+ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey vlock"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
2.24.0


