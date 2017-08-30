Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 88CF5783D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:38 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494560"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:17 +1200
Message-Id: <b1dd615cfe8498d211564f9371d259c763d265f2.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/13] scriptutils: fix fetch_url() to use lowercase dummy recipe name
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:38 -0000

recipetool create (and hence devtool add) and devtool upgrade use
fetch_url() which creates a dummy recipe in order to fetch source.
Previously the random part of the name was using uppercase characters,
and this triggers a QA warning after OE-Core commit
4713f8b2c4f2c74239d284adcf1e59e61aa66576, so use lowercase instead as I
really should have in the first place.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/scriptutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 11f1a78..85b1c94 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -134,7 +134,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
             # for do_fetch and do_unpack
             # I'd use tempfile functions here but underscores can be produced by that and those
             # aren't allowed in recipe file names except to separate the version
-            rndstring = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
+            rndstring = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(8))
             fetchrecipe = os.path.join(fetchrecipedir, 'tmp-recipetool-%s.bb' % rndstring)
             fetchrecipepn = os.path.splitext(os.path.basename(fetchrecipe))[0]
             logger.debug('Generating initial recipe %s for fetching' % fetchrecipe)
-- 
2.9.5


