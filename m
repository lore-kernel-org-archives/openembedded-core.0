Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 78CD97833F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 0DCC62E2F6;
	Tue, 29 Aug 2017 23:21:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fhTPX2BT6oPG; Tue, 29 Aug 2017 23:21:46 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 82A992E306;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D55E1A0B2;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 529F61A0B0;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 471CE31FD;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLgn0030265;
	Tue, 29 Aug 2017 23:21:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLg0K030262;
	Tue, 29 Aug 2017 23:21:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:15 +0200
Message-Id: <34d28d52f32fd1866e3570fcd07f6d1a73be1774.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 19/25] texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:46 -0000

We do not build the Locale::gettext_xs Perl module and the code will
test for it and happily use Locale::gettext_pp instead if it is not
found. However, this still causes a file dependency on
perl(Locale::gettext_xs) to be generated, which must be satisfied by
adding an explicit provide for it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/texinfo/texinfo_6.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.3.bb b/meta/recipes-extended/texinfo/texinfo_6.3.bb
index d82731e11e..f58df928aa 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.3.bb
@@ -79,4 +79,10 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
 
+# Lie about providing the Locale::gettext_xs module. It is not actually built,
+# but the code will test for it and if not found use Locale::gettext_pp instead.
+# However, this causes a file dependency on perl(Locale::gettext_xs) to be
+# generated, which must be satisfied.
+RPROVIDES_${PN} += "perl(Locale::gettext_xs)"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.12.0


