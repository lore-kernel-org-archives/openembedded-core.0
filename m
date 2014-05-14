Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA67F65F09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:31:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4E9V8oq002506
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 May 2014 02:31:08 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Wed, 14 May 2014 02:31:07 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 17:30:49 +0800
Message-ID: <1400059849-7711-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] autotools.bbclass: fixed bash build error
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
X-List-Received-Date: Wed, 14 May 2014 09:31:08 -0000
Content-Type: text/plain

When build bash, a error occurs, the cause is that autotools uses
improper Makefile.in.in which is from path/gettext/po/ but not bash
itself in bash/po/,so to avoid some error to occur, we should use
package itself Makefile.in.in file if it has.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/classes/autotools.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 0dc1e6b..db46e3b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -230,7 +230,9 @@ autotools_do_configure() {
 			# We'd call gettextize here if it wasn't so broken...
 				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 				if [ -d ${S}/po/ ]; then
-					cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
+					if [ ! -e ${S}/po/Makefile.in.in ]; then
+						cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
+					fi
 					if [ ! -e ${S}/po/remove-potcdate.sin ]; then
 						cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
 					fi
-- 
1.7.9.5


