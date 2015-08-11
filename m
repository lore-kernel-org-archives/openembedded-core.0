Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 47807762D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:09 +0000 (UTC)
Received: by iodt126 with SMTP id t126so3984482iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TjxiqD9VYocm8Nk22zzbffrATEWdjyrC1HFQRGomY28=;
	b=P7l3i7GmHdr+4b3gXbPs8kufExeAvrl4gGZFEOLVQmCN5W3P/umoBNGAt6FNyrK1JM
	cLdsXSpyx5f4GEGyTRIxUZHx6OjrSSzfo44HGA82AJVmLzhzEuGgyLGaGTmWCgg/3RFP
	72dS7vzGVk/W/v28OMqLyICoALNP6Bn/Z5AV/xC6JTX9oUzl4rRGqBBNnoD1DLFeYL7B
	ELiZMJTyCAlHcpcRG7NTW+Y/qSZ0WhrVDWsXZQNQ9wHWT9QwYJPdYHgoXL6rI6Q83Yls
	iqZtOrn6pCwP09tRbiysju9WZxGX49glDvAzatZHxrVspqpLmoKEedbSJOSq1xpLLhpg
	bGqw==
X-Gm-Message-State: ALoCoQl+IGEPy9KdrgjtFweoK2wwzpwEJTnX8xK+4s7sSVyskO6iAX8ZGnVLcOMEwJsy7JRYNTvL
X-Received: by 10.107.164.92 with SMTP id n89mr16468555ioe.91.1439282710255;
	Tue, 11 Aug 2015 01:45:10 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C212.dip0.t-ipconnect.de.
	[93.232.194.18]) by smtp.gmail.com with ESMTPSA id
	bd7sm7684942igb.19.2015.08.11.01.45.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Aug 2015 01:45:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 10:44:58 +0200
Message-Id: <616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
Subject: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:10 -0000

Installing "tar" into the sysroot leads to race conditions
(tasks which do not depend on tar-replacement-native may already
call tar while it's installation is incomplete). Avoid those
by installing only the tar binary under the name tar-native.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/tar/tar-replacement-native_1.28.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.28.bb b/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
index 071ede7..d69122f 100644
--- a/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
+++ b/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
@@ -3,4 +3,16 @@ require tar_${PV}.bb
 inherit native
 
 BPN = "tar"
-EXTRAINSTALL = ""
+
+# Installing "tar" into the sysroot leads to race conditions
+# (tasks which do not depend on tar-replacement-native may already
+# call tar while it's installation is incomplete). Avoid those
+# by installing only the tar binary under the name tar-native.
+EXTRAINSTALL = "do_install_extra_native"
+do_install_extra_native () {
+    remove=$(ls -d ${D}/*)
+    mv ${D}${bindir}/tar ${D}/tar-native
+    rm -r $remove
+    install -d ${D}${bindir}
+    mv ${D}/tar-native ${D}${bindir}
+}
-- 
2.1.4


