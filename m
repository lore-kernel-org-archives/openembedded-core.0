Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8BB60602
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:18:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Sep 2017 03:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,425,1500966000"; d="scan'208";a="1174448337"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.27.138])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2017 03:18:39 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:18:34 +0100
Message-Id: <20170921101834.19047-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] oe-build-perf-report-email.py: add cc and bcc options
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
X-List-Received-Date: Thu, 21 Sep 2017 10:18:40 -0000

Enable carbon copy and blind carbon copy recipients for the performance
report emails.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 261ca514e5a..64e85c26add 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -71,6 +71,10 @@ def parse_args(argv):
                         help="Only print errors")
     parser.add_argument('--to', action='append',
                         help="Recipients of the email")
+    parser.add_argument('--cc', action='append',
+                        help="Carbon copy recipients of the email")
+    parser.add_argument('--bcc', action='append',
+                        help="Blind carbon copy recipients of the email")
     parser.add_argument('--subject', default="Yocto build perf test report",
                         help="Email subject")
     parser.add_argument('--outdir', '-o',
@@ -188,7 +192,7 @@ def scrape_html_report(report, outdir, phantomjs_extra_args=None):
     finally:
         shutil.rmtree(tmpdir)
 
-def send_email(text_fn, html_fn, subject, recipients):
+def send_email(text_fn, html_fn, subject, recipients, copy=[], blind_copy=[]):
     """Send email"""
     # Generate email message
     text_msg = html_msg = None
@@ -217,6 +221,10 @@ def send_email(text_fn, html_fn, subject, recipients):
                            '{}@{}'.format(pw_data.pw_name, socket.getfqdn()))
     msg['From'] = "{} <{}>".format(full_name, email)
     msg['To'] = ', '.join(recipients)
+    if copy:
+        msg['Cc'] = ', '.join(copy)
+    if blind_copy:
+        msg['Bcc'] = ', '.join(blind_copy)
     msg['Subject'] = subject
 
     # Send email
@@ -250,7 +258,12 @@ def main(argv=None):
 
         if args.to:
             log.info("Sending email to %s", ', '.join(args.to))
-            send_email(args.text, html_report, args.subject, args.to)
+            if args.cc:
+                log.info("Copying to %s", ', '.join(args.cc))
+            if args.bcc:
+                log.info("Blind copying to %s", ', '.join(args.bcc))
+            send_email(args.text, html_report, args.subject,
+                       args.to, args.cc, args.bcc)
     except subprocess.CalledProcessError as err:
         log.error("%s, with output:\n%s", str(err), err.output.decode())
         return 1
-- 
2.13.5


