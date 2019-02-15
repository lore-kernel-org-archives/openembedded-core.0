Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27CAF7C64E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:06:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F26iWB020180
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 18:06:45 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 18:06:44 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Feb 2019 21:06:35 -0500
Message-ID: <809eb7abfcb491007e7480032b6414f3191010df.1550195817.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <cover.1550195817.git.kai.kang@windriver.com>
References: <cover.1550195817.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] bitbake.conf: update DEBUG_PREFIX_MAP with -fmacro-prefix-map
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
X-List-Received-Date: Fri, 15 Feb 2019 02:06:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add option '-fmacro-prefix-map' to DEBUG_PREFIX_MAP. It could resolve
buildpaths qa warnings which caused by macros '__FILE__' and
'__BASE_FILE__'.

Though option '-ffile-prefix-map' could cover '-fdebug-prefix-map' and
'-fdebug-prefix-map' both, it is not supported by 'as' and causes
buildpaths qa warnings of glibc:

| QA Issue: File
|  /work/i586-poky-linux/glibc/2.29-r0/packages-split/glibc-dev/usr/lib/crti.o
|  in package contained reference to tmpdir

So only add '-fmacro-prefix-map' to DEBUG_PREFIX_MAP rather than replace
'-fdebug-prefix-map' with '-ffile-prefix-map'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6e063dc14d..435646a946 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -601,7 +601,8 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+                     -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
                      -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-- 
2.20.0


