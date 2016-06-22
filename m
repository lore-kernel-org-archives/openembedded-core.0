Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3D16970100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:22:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 22 Jun 2016 03:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="981029920"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.10.238])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2016 03:22:28 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 11:22:25 +0100
Message-Id: <1466590945-10412-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466590945-10412-1-git-send-email-joshua.g.lock@intel.com>
References: <1466590945-10412-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] openssl: prevent warnings from openssl-c_rehash.sh
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
X-List-Received-Date: Wed, 22 Jun 2016 10:22:28 -0000

The openssl-c_rehash.sh script reports duplicate files and files which
don't contain a certificate or CRL by echoing a WARNING to stdout.
This warning gets picked up by the log checker during rootfs and results
in several warnings getting reported to the console during an image build.

To prevent the log from being overrun by warnings related to certificates
change these messages in openssl-c_rehash.sh to be prefixed with NOTE not
WARNING.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
index 0ea2263..f67f415 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
@@ -106,7 +106,7 @@ link_hash()
     do
 	if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
 	then
-	    echo "WARNING: Skipping duplicate file ${1}" >&2
+	    echo "NOTE: Skipping duplicate file ${1}" >&2
 	    return 1
 	fi	
 
@@ -153,7 +153,7 @@ hash_dir()
         then
             TYPE_STR='crl'
         else
-            echo "WARNING: ${FILE} does not contain a certificate or CRL: skipping" >&2
+            echo "NOTE: ${FILE} does not contain a certificate or CRL: skipping" >&2
 	    continue
         fi
 
-- 
2.7.4


