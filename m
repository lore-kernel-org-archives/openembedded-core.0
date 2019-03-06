Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 44BF77997F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 14:36:33 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h58so10535354edb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 06:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=89joqRFNsH1iEn4PPAI0dm2cGSnar6Zp4DmpDRbDIVs=;
	b=BvWXZHQH6R3GLRAQVNf2acSaAerG7kZEdynW30T7f08qw3V8C+cQbu84T7WQ27vqNN
	vxW4qzEXlj7CgDK8e9/syOgNdxcU4RAMapE0dOvTVzQocz7XXsU7dcXSsxg8++pibLBX
	Zgw1fa4trDpbOFIRSbAPiwnO7GgnnInxN1s87eMlqu7JbYPtwjmQ/1FgemufvzIq1Ru9
	x0psMHrQnkanDgKxFs+fXaXGKoMDsSp2sKKGp0a5OCt5k4QX34rO9vk+5grPtp6Mq5r5
	EZ39qKNtCK1LbF1qF83Huw+pursJrS/zqA7KJd8JtZFi399a0AjnODz7XWAikj4K497W
	Q9gA==
X-Gm-Message-State: APjAAAWscczWu3miAI2CFgtP3D1cM84LObiSszCh7aJazFfWECgJTpq9
	V/K4D65H2Y6ucciOX7j9ox8UGYQ=
X-Google-Smtp-Source: APXvYqw29ml4xcYhiwDRjdBRqc44bOfMqdm9YU6aD7WfTKSVovRW0eDRb8clMTCiS3AYHPdmoBXU0g==
X-Received: by 2002:a50:b36b:: with SMTP id r40mr24619144edd.12.1551882990644; 
	Wed, 06 Mar 2019 06:36:30 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-159-4081-9338-CA43.dyn6.twc.com.
	[2606:a000:1401:880d:159:4081:9338:ca43])
	by smtp.gmail.com with ESMTPSA id i14sm363467ejy.41.2019.03.06.06.36.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Mar 2019 06:36:28 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:36:13 -0500
Message-Id: <1551882973-8710-5-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551882973-8710-1-git-send-email-trini@konsulko.com>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
Subject: [PATCH v2 4/4] imagefeatures: Add test to blacklist building busybox
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
X-List-Received-Date: Wed, 06 Mar 2019 14:36:33 -0000

Now that we have a packagegroup that can be used to replace the overall
functionality of busybox as base-utils, add a test that we can continue
to build a fairly complex image without busybox being available.  This
also doubles as documentation-by-test of how to do this.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 8c95432e00b3..aed63e5476a7 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -236,3 +236,29 @@ USERADD_GID_TABLES += "files/static-group"
 """
         self.write_config(config)
         bitbake("core-image-base")
+
+    def test_no_busybox_base_utils(self):
+        config = """
+# Enable x11
+DISTRO_FEATURES_append += "x11"
+
+# Switch to systemd
+DISTRO_FEATURES += "systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = ""
+VIRTUAL-RUNTIME_syslog = ""
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
+
+# Replace busybox
+PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
+VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
+VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
+VIRTUAL-RUNTIME_base-utils-syslog = ""
+
+# Blacklist busybox
+PNBLACKLIST[busybox] = "Don't build this"
+"""
+        self.write_config(config)
+
+        bitbake("--graphviz core-image-sato")
-- 
2.7.4


