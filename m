Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 275E77325A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:11:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5Bdjk026147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:11:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 21:11:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 21:11:37 -0800
Message-ID: <14ff920caae337da99cd7e5954986749fb26dc82.1452489034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452489034.git.liezhi.yang@windriver.com>
References: <cover.1452489034.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Mon, 11 Jan 2016 05:11:39 -0000
Content-Type: text/plain

The absolute path (/path/to/configure) caused VPATH in Makefile to be an
absolute path, and then it will be in elf files, use relative path to
run configure can fix the problem.

This will reduce a lot of buildpaths QA issues in a world buld.

[YOCTO #8894]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/autotools.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index d546a5c..44cb422 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -83,7 +83,9 @@ CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
 AUTOTOOLS_AUXDIR ?= "${AUTOTOOLS_SCRIPT_PATH}"
 
 oe_runconf () {
-	cfgscript="${CONFIGURE_SCRIPT}"
+	# Use relative path to avoid buildpaths in files
+	cfgscript_name="`basename ${CONFIGURE_SCRIPT}`"
+	cfgscript=`python -c "import os; print os.path.relpath(os.path.dirname('${CONFIGURE_SCRIPT}'), '.')"`/$cfgscript_name
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
 		set +e
-- 
1.7.9.5


