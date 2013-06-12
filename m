Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D052B6AB54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:53:11 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so6071962wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=OPBZU5FhxB+5tgjgZ5Ic/hoYyDo9hCOSH2O3TXy+sGo=;
	b=lxd7xyMM4f8GbIld2CdXSAlXirFCO2oDFdOQAMQDCr3MD36oWwfEoSbwWOfZCfjL5e
	sqOxbAQz0XHIoO/lvYE5JPWYCE+1joxsW0GAd1h4pG0cZ2uyU7OznuwtCo1P/LlisBXD
	ziFRJQw4v/pFSlb5ISHg35onz7RmIwXQGdwwBa5yxrWI+cMmt5D/fkDkAMhulNwZ4U8j
	j1J5FFOVE8X5bB62TVAVRxAmg7LD5MYFhn/y7U5JA4BkAz6DVNo45ZdiAABnXyiBbMIl
	NWzAeuMQt3Q0j4jiOPhYMUXBgjRhOySZa53itE+yjIyBoSKIoufkCKC68Vu7+g27Ja98
	rzcg==
X-Received: by 10.180.75.41 with SMTP id z9mr5073696wiv.22.1371055992442;
	Wed, 12 Jun 2013 09:53:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm4624419wij.5.2013.06.12.09.53.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:53:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 17:49:41 +0100
Message-Id: <b08abe484b4481c035d838bcd5954b8348de7413.1371055550.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkxwYRrM2QlxQo+XP9sd7aOtGt1Nmjxid7QBc6MpzkBefHnb0lDx5Qd5/2ZmTYycU0lVnRM
Subject: [PATCH 3/4] createrepo: drop the usage of create_wrapper
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
X-List-Received-Date: Wed, 12 Jun 2013 16:53:12 -0000

create_wrapper was previously abused to invoke the Python interpretter directly
instead of relying on #! parsing, which is read into a 128 byte buffer so breaks
with deep build directories.

However now that we already install a "nativepython" binary into the native
sysroot, use sed to change the #! line to /usr/bin/env nativepython.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/createrepo/createrepo_0.4.11.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index c977c2e..523d31b 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -35,7 +35,7 @@ do_install_append_class-native () {
 	for i in ${D}${datadir}/createrepo/genpkgmetadata.py \
 		 ${D}${datadir}/createrepo/modifyrepo.py \
 		 ${D}${bindir}/rpm-createsolvedb.py ; do
-		create_wrapper $i ${STAGING_BINDIR_NATIVE}/python-native/python
+		sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' $i
 	done
 
 	create_wrapper ${D}/${bindir}/createrepo \
-- 
1.7.10.4


