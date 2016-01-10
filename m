Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBAE7422C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e65so2210199pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nh4vBsE2xlAs9Y9EtyQ1mQj9yBg5rv/vCxA/hZPvazk=;
	b=qMCc/uyeponMKfLedSCtpxBKfelms4lN9rA2tnLU2NuPTRpsxyyLhBzih/1v8hQC0W
	W9f63wo8wbd2pNxJ+Rf8LSnRaucKSWEQ4Vn/6fVBpqgFzNdx609a5c3Jrrev407B2lGK
	3qXwv4EuR3SsyZVzyuAlndwOW4CJ/rzssQaKBvrScPDXC+Bt6uU63ir/QsI1u/IwebGD
	05Xt36Zp+bObXEifUOiGppiFRIE//rxXkHNu1BU9tWQ9XJWzl+0mRMDcOcDFeMiqpV5c
	MbbWsiMw284c00C2lQyWwaV5vB0FPkzK6No5vRXI0LiPGGtj3pkC6/Mt+GJ4JJUGShtZ
	2Bug==
X-Received: by 10.98.18.76 with SMTP id a73mr15513994pfj.65.1452385874434;
	Sat, 09 Jan 2016 16:31:14 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	dz6sm176283063pab.19.2016.01.09.16.31.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 0E77DFCC847; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:36 -0800
Message-Id: <d39c154929a5d8da4bb6902b34fc8fe6a256abe8.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 10/20] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:13 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* we don't want the do_package signature depending on INHERIT variable
* e.g. just adding the own-mirrors causes texinfo to rebuild:
  # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
  basehash changed from 015df2fd8e396cc1e15622dbac843301 to 9f1d06c4f238c70a99ccb6d8da348b6a
  Variable INHERIT value changed from
  ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
  to
  ' rm_work own-mirrors blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index cf9dcfd..3394474 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
 def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
+    if bb.data.inherits_class('compress_doc', d):
          compress = d.getVar("DOC_COMPRESS", True)
          if compress == "gz":
              return "gzip"
-- 
1.9.1


