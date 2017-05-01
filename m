Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1564071DA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327299"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:58:59 -0700
Message-Id: <1493672344-21965-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

Building reproducible binaries may remove certain intentional
randomness intended for increased security. Hence, it is reasonable
to expect there will be cases where this is not desirable.
The user can select his/her preferences via the variable
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
build reproducible binaries) in order to minimize any potential
regressions. (Once the reproducible binaries code is mature enough,
it can be set to "1".)
If the variable BUILD_REPRODUCIBLE_BINARIES is set to "1",
timestamp values taken from additional variables will be optionally used
when building binary reproducible images:

    REPRODUCIBLE_TIMESTAMP_ROOTFS
        If the value is specified, all files mtime will be set to this value.
        In addition, /etc/timestamp and /etc/version will both contain the value.
        If no value is specified, timestamp will be derived from the top git commit.

    REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK
        Value passed via environment variable PRELINK_TIMESTAMP to the prelink program.
        If the value is specified, the value will be used.
        If no value is specified, timestamp will be derived from the top git commit.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/bitbake.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 227babd..6ce1a1a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -859,3 +859,14 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+BUILD_REPRODUCIBLE_BINARIES ??= "0"
+BUILD_REPRODUCIBLE_BINARIES[export] = "1"
+
+# Unix timestamp
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??= ""
+REPRODUCIBLE_TIMESTAMP_ROOTFS[export] = "1"
+
+# Unix timestamp
+REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK ??= ""
+REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK[export] = "1"
-- 
2.7.4


