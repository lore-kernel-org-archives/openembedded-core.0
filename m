Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1B660132
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 20:45:49 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so91546031wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 12:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nqMe92zrktA3gGSZWdQKOn2E2AXrqWDiVXihVgy9rsM=;
	b=owzafydpJPFfnNoo8PkWRkmoD8l6FzjoHTZw/3EqZvnsNmmg3kmMLqlKY7IRMNwjCL
	HZ3uz459D6PDMqMWxvsc2Ake1whhbT1SWBzH5VgrDJ0eel8BFj3jt6A/Q4cYhp5h0Ap1
	cu6BZhTmJQw4WRNHl1obq18cv39Pchz8uRO4fXMkNOULK+tJgECLTYSnRvcdGwZEzst/
	HMBMhSZ7GCrUMvqJ9BLgC6TWUsHh5udNTNz5Qmn88e1fkN0aASV8ju+shfLgzAN960kn
	nkmBP39Q14sWtNOpCdAg5tvNk/pF4UhRxUmS7CJPFEqeUaAX1Wy5TYm2r4JZBHThggHp
	T9Cw==
X-Received: by 10.28.49.65 with SMTP id x62mr7475338wmx.49.1449261949738;
	Fri, 04 Dec 2015 12:45:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z66sm5052831wmz.7.2015.12.04.12.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Dec 2015 12:45:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Dec 2015 21:47:07 +0100
Message-Id: <1449262027-26919-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Fri, 04 Dec 2015 20:45:51 -0000

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
 meta/recipes-extended/texinfo/texinfo_6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
index 8fb715a..b0a6975 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
@@ -9,8 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
+DOC_COMPRESS_ENABLED = "${@ '1' if 'compress_doc' in (d.getVar('INHERIT', True) or '').split() else '0' }"
+DOC_COMPRESS_ENABLED[vardepvalue] = "${DOC_COMPRESS_ENABLED}"
+
 def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
+    if d.getVar("DOC_COMPRESS_ENABLED", True) == "1":
          compress = d.getVar("DOC_COMPRESS", True)
          if compress == "gz":
              return "gzip"
-- 
2.6.3


