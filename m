Return-Path: <tom.rini@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7917D7CDEF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:33:54 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id v10so14477548qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 12:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=89joqRFNsH1iEn4PPAI0dm2cGSnar6Zp4DmpDRbDIVs=;
	b=dfYqM4fCv4QPtFLkZGGDxKlTDiH+eqScaniZ+klqfS38ajmTnhQzAKofYSALS0PDRf
	A/0cX/kn570BPoC8uInrxXo7sLDtHQlTE63p4X4yPLtJxiE4ws/hmOJCXluUI7XHrxcK
	dGcoL/eAuR88a/wZaquAjbPd8NJvlljFIO2zHwRrl8wqtiLXD270e1ZeO38lVmCtURcj
	KvoiIe4lCt7e7G+rEgrRqokIX/SwCQc5eNQRre31xMFHqKOYprhgajP/JEpscX7A13gj
	83r7IAul0bisi5dE87fkki5XBjhZejijqpOndkks2EuRok9f1vJ1M8hOPfYty2jNO2Rc
	+Wrg==
X-Gm-Message-State: APjAAAXzplfpuDvGQGaZGNOjG0B0YCRGWzNSkjsvU8FqLeBcqikqDGvt
	x9TUpx6ZTrvFPJhKkHOKfkAnpOI=
X-Google-Smtp-Source: APXvYqyOFaXm6S9LLgxaLpkdBDsgYhI0CxWPjlC2HMZeMfQBXfphcFY38Lsak5Y4BnWjxfdE8tHBzQ==
X-Received: by 2002:aed:3f05:: with SMTP id p5mr7265291qtf.114.1551904435200; 
	Wed, 06 Mar 2019 12:33:55 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-C8CE-3B73-783F-B0BC.dyn6.twc.com.
	[2606:a000:1401:880d:c8ce:3b73:783f:b0bc])
	by smtp.gmail.com with ESMTPSA id
	x43sm1895034qtc.10.2019.03.06.12.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Mar 2019 12:33:54 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 15:33:47 -0500
Message-Id: <1551904427-14661-4-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551904427-14661-1-git-send-email-trini@konsulko.com>
References: <1551904427-14661-1-git-send-email-trini@konsulko.com>
Subject: [PATCH v3 4/4] imagefeatures: Add test to blacklist building busybox
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
X-List-Received-Date: Wed, 06 Mar 2019 20:33:54 -0000

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


