Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C18CD72F87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491462618; x=1522998618; h=from:to:subject:date:message-id;
	bh=uCsgiyDoUICDeRTNhEexOz0oMQx8Hch2yjnSZiH8nGc=;
	b=DVCX6X1DFXefXSrtWh2QIHhW5JBaeqP6Blolvu1tgbFMc+ZUMYmwom1D
	K67QkCByYwt2yMz2O+nHhlUG2Y2bLQ==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 00:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="85432719"
Received: from cleane-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.237])
	by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2017 00:10:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 10:10:18 +0300
Message-Id: <20170406071018.6106-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] oe-build-perf-report-email.py: fix one file path
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
X-List-Received-Date: Thu, 06 Apr 2017 07:10:16 -0000

Sending report email was not working correctly if the script was given
an html report path that contained directory components.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 7f4274efed..81b58ab020 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -243,7 +243,7 @@ def main(argv=None):
         html_report = None
         if args.html:
             scrape_html_report(args.html, outdir, args.phantomjs_args)
-            html_report = os.path.join(outdir, args.html)
+            html_report = os.path.join(outdir, os.path.basename(args.html))
 
         if args.to:
             log.info("Sending email to %s", ', '.join(args.to))
-- 
2.12.0


