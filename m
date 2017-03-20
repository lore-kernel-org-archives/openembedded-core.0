Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E0CBB779C3
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490042843; x=1521578843;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=NF7X8AbvWQ503eP2TtnhbRgCAEL41WLWLHT4ifFuKWs=;
	b=N8L+a9lf/eSGF8kAUinHvZt1kWARb5opsy+/fycf4h5H3vA9EHbIj8RW
	MftZN/OeSWIILFXDQZA6qIH3UsR3Sg==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 13:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="238417853"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2017 13:47:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 14:51:02 -0600
Message-Id: <1490043063-11841-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490043063-11841-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490043063-11841-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, paul.eggleton@linux.intel.com
Subject: [PATCH 2/3] scripts/yocto-compat-layer.py: Dump log to stdout instead of stderr
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
X-List-Received-Date: Mon, 20 Mar 2017 20:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The common unix tools uses stdout as standard for log output, by default
python logging uses stderr if not stream is specified.

[YOCTO #11160]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 09dc5bf..8996fff 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -31,7 +31,7 @@ DEFAULT_OUTPUT_LOG = '%s-%s.log' % (PROGNAME,
 OUTPUT_LOG_LINK = "%s.log" % PROGNAME
 CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'compatlayer', 'cases')]
-logger = scriptutils.logger_create(PROGNAME)
+logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 def test_layer_compatibility(td, layer):
     from compatlayer.context import CompatLayerTestContext
-- 
2.1.4


