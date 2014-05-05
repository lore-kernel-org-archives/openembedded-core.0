Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4189365F80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 17:55:50 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl10so5080265igb.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Pt9Ben0eZs52TtLN3YumX0E5Y37200uHu8i6ltOkcPI=;
	b=XhSvLQzH09aAer3mMBnSIRI1ph6gOkpOOKheMAUbjK73Pg7UqCfuzrpg8Qi3E5gkB7
	Qj/gZ+4iY/i+yi1Y4g4D0dYFljDWzQjwq4yyEWfnuI3oiIvOorNrcp7V8oMzhaWljihj
	ywDp21rf5VHzuODZK3+7yLkSEjFMLoVP3wWXWwxeq+DkbSJBNg2jhX2kjq3mifKCXrA9
	Qu5PcmMj0QyllCGWlCIwkwGMUTmr3JjVySubBgDaQtvjCzcgUONqPk9zOyKo9c5VvZB+
	/AaKatNG4l+5KtQ9efCb9yn8gczQNiOvoF1amAJnu/w5wpeOq+oqalM7frPChABezr/T
	5WXA==
X-Received: by 10.42.25.147 with SMTP id a19mr3982389icc.89.1399312551760;
	Mon, 05 May 2014 10:55:51 -0700 (PDT)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id p4sm29614167igy.7.2014.05.05.10.55.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 May 2014 10:55:50 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 13:55:42 -0400
Message-Id: <1399312542-31067-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH v2] python3: Substitute correct python version in shebang
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
X-List-Received-Date: Mon, 05 May 2014 17:55:53 -0000

If python2 and python3 are both available, scripts that are subject to
this substitution can possibly run with the wrong python version.
python3-config is one such script.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---

v2: Update comment

 meta/recipes-devtools/python/python3-native_3.3.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 7238eaf..ead0348 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -69,8 +69,8 @@ do_install() {
 	install -d ${D}${bindir}/${PN}
 	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
 
-	# Make sure we use /usr/bin/env python
+	# Make sure we use python3 from $PATH
 	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
 	done
 }
-- 
1.9.2


