Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA556A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:01:59 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so42703pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZtTzPhsaVZLdWsmhAXflvw08osslhd/IOMfDAkGj4IQ=;
	b=hmKM5PKaZzPOHs2OSebfVf48VAGGxxg640/LodQbX2ZJxdH7CFPQSjtoyDFgTcbdcB
	CnStc1J2KWONAOwMmuZfPrmmctxazq5uzoOx3Tytu5S6QZE+TJSLZTdl/XWubbKmAPKj
	u48mMdan8MoWxNwcMZmIydUpvuZ8lNW1Zta4teJ392UggSfwDDyyNSzCvDTlCXnPaZRf
	OEw+kfzjfuu16Qy7XT6vH0t7IaafCULuAkgb4KZnnjzmwatgYEb7NaPLx6Y7CGq6+qPu
	VoKNm4o6N8puewcuexrlKDUZAkkbh+egUZc13DHE2xP1cyiWJunQ2wS+igP97XcGz7ba
	Tpug==
X-Received: by 10.68.239.132 with SMTP id vs4mr2850048pbc.147.1370581320738;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	wi6sm75851738pbc.22.2013.06.06.22.01.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:01:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:15:37 +1000
Message-Id: <1370582137-26940-4-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370582137-26940-1-git-send-email-net147@gmail.com>
References: <1370582137-26940-1-git-send-email-net147@gmail.com>
Subject: [PATCH 3/3] classes/qmake_base: update .pro hack
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
X-List-Received-Date: Fri, 07 Jun 2013 05:01:59 -0000

This adds support for lconvert and xmlpatterns tools and tweaks the
sed expressions to handle more complex assignments in .pro files like:
LRELEASE = $$targetPath($$[QT_INSTALL_BINS]/lrelease)

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake_base.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 3762887..86bbede 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -94,9 +94,20 @@ qmake_base_do_configure() {
 	fi
 
 	# Hack .pro files to use OE utilities
+	LCONVERT_NAME=$(basename ${OE_QMAKE_LCONVERT})
+	LRELEASE_NAME=$(basename ${OE_QMAKE_LRELEASE})
+	LUPDATE_NAME=$(basename ${OE_QMAKE_LUPDATE})
+	XMLPATTERNS_NAME=$(basename ${OE_QMAKE_XMLPATTERNS})
 	find -name '*.pro' \
-	     -exec sed -i -e 's,=\s*.*/lrelease,= ${OE_QMAKE_LRELEASE},g' \
-	                  -e 's,=\s*.*/lupdate,= ${OE_QMAKE_LUPDATE},g' '{}' ';'
+	     -exec sed -i -e "s|\(=\s*.*\)/$LCONVERT_NAME|\1/lconvert|g" \
+	                  -e "s|\(=\s*.*\)/$LRELEASE_NAME|\1/lrelease|g" \
+	                  -e "s|\(=\s*.*\)/$LUPDATE_NAME|\1/lupdate|g" \
+	                  -e "s|\(=\s*.*\)/$XMLPATTERNS_NAME|\1/xmlpatterns|g" \
+	                  -e "s|\(=\s*.*\)/lconvert|\1/$LCONVERT_NAME|g" \
+	                  -e "s|\(=\s*.*\)/lrelease|\1/$LRELEASE_NAME|g" \
+	                  -e "s|\(=\s*.*\)/lupdate|\1/$LUPDATE_NAME|g" \
+	                  -e "s|\(=\s*.*\)/xmlpatterns|\1/$XMLPATTERNS_NAME|g" \
+	                  '{}' ';'
 
 #bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
 	unset QMAKESPEC || true
-- 
1.8.2.3


