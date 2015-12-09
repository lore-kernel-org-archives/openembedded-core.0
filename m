Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 62C7560767
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 08:46:35 +0000 (UTC)
Received: by wmec201 with SMTP id c201so62879680wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 00:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TkYBslMUmQ8SvKcMmACy/pwoI5hmMAk7VW19RENvZxU=;
	b=Lcxyawh4mGJoX6VwfE/JXrxgdBkxOmkWohJN3d3TlJDxkWS9k4QW6sl4N4JngsKYbq
	p7mzme0vv9D4+GMKcq2esY0ysLXnaF/oQvaK4KEiH+QeK0sV6xJbq2O1EMEGF6GDWi8/
	ZwfqUzTUUu90lDuY/Oq1bu+4Dh0KbSYj5MWO3J0ky/Bhc56JPvxOZ/vZlMFUUvHmEhBm
	qV3AUXe93BcTsH1mwDKQUStZVoW8zTUn+LIGe+ZyBammtKkCcTHMdQWNY2e/DkBgFHZV
	9a3aWdjh94z+ZBylaaY96mMpNBWY7Mfb+3C8zUwEg9LAsTcqYvgq1xfrCF8Rp4MqS06T
	w3/A==
X-Received: by 10.28.19.84 with SMTP id 81mr10187960wmt.26.1449650795749;
	Wed, 09 Dec 2015 00:46:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w203sm24860609wmg.15.2015.12.09.00.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Dec 2015 00:46:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 09:48:13 +0100
Message-Id: <1449650893-32183-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449273356.14864.232.camel@linuxfoundation.org>
References: <1449273356.14864.232.camel@linuxfoundation.org>
Subject: [PATCHv2][master] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Wed, 09 Dec 2015 08:46:35 -0000

* we don't want the do_package signature depending on INHERIT variable
* e.g. just adding the own-mirrors causes texinfo to rebuild:
  # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
  basehash changed from 015df2fd8e396cc1e15622dbac843301 to 9f1d06c4f238c70a99ccb6d8da348b6a
  Variable INHERIT value changed from
  ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
  to
  ' rm_work own-mirrors blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/texinfo/texinfo_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
index 8fb715a..a8702cf 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
 def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
+    if bb.data.inherits_class('compress_doc', d):
          compress = d.getVar("DOC_COMPRESS", True)
          if compress == "gz":
              return "gzip"
-- 
2.6.3


