Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C071B72665
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 16:10:13 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id hy4so3932204vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=XUxDLTbgpHalvIbJw8HeYYQDPrVfe4d0B+IA1fdx7UE=;
	b=LYARqrT8UzO/7JjM5DjjmopoSKjW5NV/EYdBZ7cTYzs8eXXZYHYsclr/zAJ6d6QHMV
	xZ2d+cQc/D/PYITaIHSSq0NMkRWj0fQ0FObMGcjCOWazi1ocjKM82uGTnxdL6Cmc081D
	J78Yas5pfkt40czdcN/Tvyv2RdUEKPoZ2b9WA0ojKMLyHuX8Ip6EJ5gK7RhyOeMNnUqy
	bQ4+bWww7I1qwu30fOnnWgMrL407XmIlzd90ECbLbW0CVl2ISnzmoNZ/TcRdP11O+wVy
	PxoYxvRK9NRPfwQoIxAX2GeveTxfx6aFtcE1emNn0qmwXPXoYnGLTt8ZGd2t7GbeoAi3
	2lkA==
X-Received: by 10.52.246.11 with SMTP id xs11mr18016557vdc.49.1419610213825;
	Fri, 26 Dec 2014 08:10:13 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id et9sm7620420vdb.18.2014.12.26.08.10.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 08:10:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 14:10:32 -0200
Message-Id: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] sed: Skip 'build-deps' QA check for sed-ptest package
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
X-List-Received-Date: Fri, 26 Dec 2014 16:10:22 -0000

The sed-ptest package has runtime dependencies which are used only
when running the tests. So the 'build-dep' QA check can be skipped for
this specific package. Fixes the following QA error:

,----
| WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
|     isn't a build dependency? [build-deps]
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/sed/sed_4.2.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index ea39dae..0139b18 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -14,7 +14,6 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
 inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
 
 EXTRA_OECONF = "--disable-acl \
                 ${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-regex-tests', '', d)}"
@@ -40,4 +39,7 @@ do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 }
 
+RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
+INSANE_SKIP_${PN}-ptest += "build-deps"
+
 BBCLASSEXTEND = "native"
-- 
2.1.3


