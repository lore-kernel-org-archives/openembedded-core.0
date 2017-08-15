Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFC6F784EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:21:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FLLanR026529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 15 Aug 2017 14:21:36 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:21:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:19:49 -0500
Message-ID: <1502831992-47827-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
References: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 3/6] texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
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
X-List-Received-Date: Tue, 15 Aug 2017 21:21:39 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <pkj@axis.com>

We do not build the Locale::gettext_xs Perl module and the code will
test for it and happily use Locale::gettext_pp instead if it is not
found. However, this still causes a file dependency on
perl(Locale::gettext_xs) to be generated, which must be satisfied by
adding an explicit provide for it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_6.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.3.bb b/meta/recipes-extended/texinfo/texinfo_6.3.bb
index d82731e..f58df92 100644
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
1.8.3.1


