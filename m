Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFC47DE28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 13:33:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FDX7II024859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 06:33:17 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 15 May 2019 06:32:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 15 May 2019 21:32:53 +0800
Message-ID: <1557927173-27875-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 13:34:00 -0000
Content-Type: text/plain

If do_configure failed, output content of config.log
to configure log, it is helpful to trace the do_configure
failure on the build system which is hard to login.
(such as autobuilder)

Add a knob OUTPUT_CONFIG_LOG to control config.log output

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/autotools.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8768a6a..5fc9d0a 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -82,6 +82,7 @@ CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
 
 AUTOTOOLS_AUXDIR ?= "${AUTOTOOLS_SCRIPT_PATH}"
 
+OUTPUT_CONFIG_LOG ??= ""
 oe_runconf () {
 	# Use relative path to avoid buildpaths in files
 	cfgscript_name="`basename ${CONFIGURE_SCRIPT}`"
@@ -90,7 +91,11 @@ oe_runconf () {
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
 		if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
 			bbnote "The following config.log files may provide further information."
-			bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
+			config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
+			bbnote "$config_log"
+			[ -n "${OUTPUT_CONFIG_LOG}" ] && [ -e "$config_log" ] && while read line; do
+				bbnote "$line"
+			done <"$config_log"
 			bbfatal_log "configure failed"
 		fi
 	else
-- 
2.7.4


