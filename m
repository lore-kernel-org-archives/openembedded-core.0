Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A342960030
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Nov 2014 04:36:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAM4a3a3021277
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 20:36:03 -0800 (PST)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 20:36:03 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Nov 2014 12:35:53 +0800
Message-ID: <1416630954-13871-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1416630954-13871-1-git-send-email-ming.liu@windriver.com>
References: <1416630954-13871-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] binconfig.bbclass: add base_prefix being processed
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
X-List-Received-Date: Sat, 22 Nov 2014 04:36:03 -0000
Content-Type: text/plain

Add base_prefix to binconfig_package_preprocess, this is necessary
to adjust text like "--sysroot=${STAGING_DIR_HOST}" in target binary
configs.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/binconfig.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index db25b77..abeda57 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -39,6 +39,7 @@ binconfig_package_preprocess () {
 		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
 		    -e 's:${STAGING_DATADIR}:${datadir}:' \
 		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
+		    -e 's:${STAGING_DIR_HOST}${base_prefix}:${base_prefix}:' \
                     $config
 	done
 	for lafile in `find ${PKGD} -name "*.la"` ; do
@@ -48,6 +49,7 @@ binconfig_package_preprocess () {
 		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
 		    -e 's:${STAGING_DATADIR}:${datadir}:' \
 		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
+		    -e 's:${STAGING_DIR_HOST}${base_prefix}:${base_prefix}:' \
 		    $lafile
 	done	    
 }
-- 
1.8.4.1


