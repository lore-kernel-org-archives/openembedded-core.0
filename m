Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2A46D6AB5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:53:10 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k13so7212371wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=4vmmTdcCF2r8WuL4/xR0jfxxPwLWV1poOsxq0ABUT7s=;
	b=EiyIdmF/9ZVd03t/WJp7CIbqfNCo+2mal/MHZlxFb+qQRaVF83fkXSiHhtFXgflVOD
	b5YPeDHkrTaqJiXfZP9/bgA+wAfKW5apllR1Cp0zcsnKmG3xaBNUjNAkX23IHlPbepJB
	548ovb2qSJ5dEwNVoei/JtOxK8cLYNW1MHA9fi7P6FwXh+8nX8DUWI6ah/+n53jkAY6G
	bke+jmFbRrRJ0wAVSkUs4uYl93qQHuOwP0/f7kOKkIEv5HK1XgrPOVA8oadi7GSjsJmU
	cnzXBKxM4iuwuMuA6aL5ktKOKBE7WuKn6XOfO/z6Qs3MrLt1mDEC/hGVlaivy4hK8raW
	K8Cw==
X-Received: by 10.180.210.132 with SMTP id mu4mr1216911wic.5.1371055990742;
	Wed, 12 Jun 2013 09:53:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm4624419wij.5.2013.06.12.09.53.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:53:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 17:49:40 +0100
Message-Id: <4675c2ea4d21c1e7b9291698ba4b30750187efde.1371055550.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlrHwFtepzxw46Igdk5oxJDc1rVdM4Tz6hZlXejthrSnnbtY+0848O1Y12iJlFyuwmP+8hQ
Subject: [PATCH 2/4] python-native: add nativepython symlink
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
X-List-Received-Date: Wed, 12 Jun 2013 16:53:10 -0000

Add a symlink to the native Python so that scripts can just invoke
"nativepython" and get the right one without needing absolute paths (these often
end up too long for the #! parser in the kernel as the buffer is 128 bytes
long).

The name "nativepython" was chosen to match the existing "nativeperl" which
serves the same purpose.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.3.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 722d92c..39d53bb 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -48,4 +48,10 @@ do_install() {
 	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
 	done
+
+	# Add a symlink to the native Python so that scripts can just invoke
+	# "nativepython" and get the right one without needing absolute paths
+	# (these often end up too long for the #! parser in the kernel as the
+	# buffer is 128 bytes long).
+	ln -s python-native/python ${D}${bindir}/nativepython
 }
-- 
1.7.10.4


