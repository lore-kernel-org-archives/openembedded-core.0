Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7251162132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:39:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 25 Oct 2017 04:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,431,1503385200"; 
	d="scan'208,217";a="913566165"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2017 04:39:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 14:39:38 +0300
Message-Id: <20171025113938.25060-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] oe-build-perf-report-email.py: add images as MIME objects
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
X-List-Received-Date: Wed, 25 Oct 2017 11:39:41 -0000

Add images as separate MIME objects instead of directly embedding images
in the html (as base64 encoded pngs). This makes the emails better
suited for certain email servers/clients.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 42 +++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 64e85c26ad..913847bbed 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -25,6 +25,7 @@ import socket
 import subprocess
 import sys
 import tempfile
+from email.mime.image import MIMEImage
 from email.mime.multipart import MIMEMultipart
 from email.mime.text import MIMEText
 
@@ -111,15 +112,6 @@ def decode_png(infile, outfile):
     subprocess.check_output(['optipng', outfile], stderr=subprocess.STDOUT)
 
 
-def encode_png(pngfile):
-    """Encode png into a <img> html element"""
-    with open(pngfile, 'rb') as f:
-        data = f.read()
-
-    b64_data = base64.b64encode(data)
-    return '<img src="data:image/png;base64,' + b64_data.decode('utf-8') + '">\n'
-
-
 def mangle_html_report(infile, outfile, pngs):
     """Mangle html file into a email compatible format"""
     paste = True
@@ -144,9 +136,7 @@ def mangle_html_report(infile, outfile, pngs):
                     # Replace charts with <img> elements
                     match = re.match('<div id="(?P<id>\w+)"', stripped)
                     if match and match.group('id') in pngs:
-                        #f_out.write('<img src="{}">\n'.format(match.group('id') + '.png'))
-                        png_file = os.path.join(png_dir, match.group('id') + '.png')
-                        f_out.write(encode_png(png_file))
+                        f_out.write('<img src="cid:{}"\n'.format(match.group('id')))
                     else:
                         f_out.write(line)
 
@@ -170,7 +160,7 @@ def scrape_html_report(report, outdir, phantomjs_extra_args=None):
                                 stderr=subprocess.STDOUT)
 
         pngs = []
-        attachments = []
+        images = []
         for fname in os.listdir(tmpdir):
             base, ext = os.path.splitext(fname)
             if ext == '.png':
@@ -178,7 +168,7 @@ def scrape_html_report(report, outdir, phantomjs_extra_args=None):
                 decode_png(os.path.join(tmpdir, fname),
                            os.path.join(outdir, fname))
                 pngs.append(base)
-                attachments.append(fname)
+                images.append(fname)
             elif ext in ('.html', '.htm'):
                 report_file = fname
             else:
@@ -188,11 +178,13 @@ def scrape_html_report(report, outdir, phantomjs_extra_args=None):
         log.debug("Mangling html report file %s", report_file)
         mangle_html_report(os.path.join(tmpdir, report_file),
                            os.path.join(outdir, report_file), pngs)
-        return report_file, attachments
+        return (os.path.join(outdir, report_file),
+                [os.path.join(outdir, i) for i in images])
     finally:
         shutil.rmtree(tmpdir)
 
-def send_email(text_fn, html_fn, subject, recipients, copy=[], blind_copy=[]):
+def send_email(text_fn, html_fn, image_fns, subject, recipients, copy=[],
+               blind_copy=[]):
     """Send email"""
     # Generate email message
     text_msg = html_msg = None
@@ -201,8 +193,16 @@ def send_email(text_fn, html_fn, subject, recipients, copy=[], blind_copy=[]):
             text_msg = MIMEText("Yocto build performance test report.\n" +
                                 f.read(), 'plain')
     if html_fn:
+        html_msg = msg = MIMEMultipart('related')
         with open(html_fn) as f:
-            html_msg = MIMEText(f.read(), 'html')
+            html_msg.attach(MIMEText(f.read(), 'html'))
+        for img_fn in image_fns:
+            # Expect that content id is same as the filename
+            cid = os.path.splitext(os.path.basename(img_fn))[0]
+            with open(img_fn, 'rb') as f:
+                image_msg = MIMEImage(f.read())
+            image_msg['Content-ID'] = '<{}>'.format(cid)
+            html_msg.attach(image_msg)
 
     if text_msg and html_msg:
         msg = MIMEMultipart('alternative')
@@ -251,10 +251,10 @@ def main(argv=None):
 
     try:
         log.debug("Storing email parts in %s", outdir)
-        html_report = None
+        html_report = images = None
         if args.html:
-            scrape_html_report(args.html, outdir, args.phantomjs_args)
-            html_report = os.path.join(outdir, os.path.basename(args.html))
+            html_report, images = scrape_html_report(args.html, outdir,
+                                                     args.phantomjs_args)
 
         if args.to:
             log.info("Sending email to %s", ', '.join(args.to))
@@ -262,7 +262,7 @@ def main(argv=None):
                 log.info("Copying to %s", ', '.join(args.cc))
             if args.bcc:
                 log.info("Blind copying to %s", ', '.join(args.bcc))
-            send_email(args.text, html_report, args.subject,
+            send_email(args.text, html_report, images, args.subject,
                        args.to, args.cc, args.bcc)
     except subprocess.CalledProcessError as err:
         log.error("%s, with output:\n%s", str(err), err.output.decode())
-- 
2.13.6


