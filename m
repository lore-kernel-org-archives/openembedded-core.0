Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2F18477DBE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491565906; x=1523101906;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=unRBJEG4POvvgq28oTbhcly2Yj2ILYxofFXyeFAKjac=;
	b=e7o75RK9jHXTx1iykob4KMAzXuq8Xuw2N+DMwr8DXHnFmDe/A153tHNH
	s9zr8rdmriN+NMe4TXiY2x6w/yUE8A==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 04:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85948613"
Received: from cleane-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.237])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 04:51:45 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:51:40 +0300
Message-Id: <20170407115141.2564-3-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
References: <20170407115141.2564-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] oe-build-perf-report-email.py: use proper fallback email address
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
X-List-Received-Date: Fri, 07 Apr 2017 11:51:44 -0000

Use properly formatted fallback email address instead of just the
username.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 81b58ab020..055a7b12cf 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -21,6 +21,7 @@ import pwd
 import re
 import shutil
 import smtplib
+import socket
 import subprocess
 import sys
 import tempfile
@@ -211,7 +212,8 @@ def send_email(text_fn, html_fn, subject, recipients):
         raise ReportError("Neither plain text nor html body specified")
 
     full_name = pwd.getpwuid(os.getuid()).pw_gecos.split(',')[0]
-    email = os.environ.get('EMAIL', os.getlogin())
+    email = os.environ.get('EMAIL',
+                           '{}@{}'.format(os.getlogin(), socket.getfqdn()))
     msg['From'] = "{} <{}>".format(full_name, email)
     msg['To'] = ', '.join(recipients)
     msg['Subject'] = subject
-- 
2.12.0


