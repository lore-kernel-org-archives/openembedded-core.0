Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5788C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:30:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.14187.1647365447122580546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L/y4tcSS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id r133so1042085wma.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXhGTxN5cNu5LYpn0G/DFEVaosfGbRDKJ/lPMJGj9/I=;
        b=L/y4tcSS2RpxMQEQ2GO7ujsClQgOnkdl7swmcmqPSpSVy9u2VK4lBJWL6CPQv8S82Q
         wM772JAIfGlZcSb8/bM8Fid1rFLiGq8QyVmko6tmOzPRolIftW/MYX5izbZWcAdwNYKZ
         all+Br6XhuWlbqXaEURyRRO+a4BMf4CSxR02o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VXhGTxN5cNu5LYpn0G/DFEVaosfGbRDKJ/lPMJGj9/I=;
        b=ysZaZzUZM5btAKkbv2px95o4tgYMq0ykKN5MkZgDVCbsB6I39JkhhzcCKa1r1sjLtj
         ecRZ2aKVEujBPVN/Y0iKRV8kafjTxfD0TdpTxp5gedRpkFRDP07+qHiLXVGWX2kH7odX
         7GwnEjeUlNn3TIQ4GXv1CYvfXn1u+DaDvsvn7Wuao594eAQPkCLJc6UY0Bw2SohNp7WJ
         9Uheu4rGRhjrhXy2D/job1jtbqVtUE9ThsM1+ZEyVMlE8OX647EQaPhW7pSCr1m/Cbph
         7wjwtaqr//002QKEMwGpQ1HY/TUofpWXTN/P0aC6C639c3/TnyARdaybFwqU2CcaHSRo
         je5w==
X-Gm-Message-State: AOAM530RthVHNcwTMGqYh5d7xrUhkZmidSjXk78pKu65IiTYL9POKmMX
	zYpsEMrYDoYOX5Yqr3VVMZSCizwuEjL+EAF7
X-Google-Smtp-Source: 
 ABdhPJxRg342JKGualHeKTC8u+jJ8BhLH2X2UEk+aT9vI7t46CVkXrqZaQ7qrBdIsYcCHC7135PjPg==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id
 m2-20020a7bce02000000b003812007f75cmr4372999wmc.6.1647365445007;
        Tue, 15 Mar 2022 10:30:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm15860176wrx.47.2022.03.15.10.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:30:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf-build-test/report: Drop phantomjs and html email reports
 support
Date: Tue, 15 Mar 2022 17:30:43 +0000
Message-Id: <20220315173043.889619-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163310

phantomjs isn't reliable and we've moved to sharing the reports via a webserver.
Update the scripts to more match those being used in the autobuilder helper
where the html email support was removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/build-perf-test-wrapper.sh    |  15 +-
 scripts/contrib/oe-build-perf-report-email.py | 154 +-----------------
 2 files changed, 8 insertions(+), 161 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index fa71d4a2e9a..0a85e6e7081 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -87,21 +87,10 @@ if [ $# -ne 0 ]; then
     exit 1
 fi
 
-if [ -n "$email_to" ]; then
-    if ! [ -x "$(command -v phantomjs)" ]; then
-        echo "ERROR: Sending email needs phantomjs."
-        exit 1
-    fi
-    if ! [ -x "$(command -v optipng)" ]; then
-        echo "ERROR: Sending email needs optipng."
-        exit 1
-    fi
-fi
-
 # Open a file descriptor for flock and acquire lock
 LOCK_FILE="/tmp/oe-build-perf-test-wrapper.lock"
 if ! exec 3> "$LOCK_FILE"; then
-    echo "ERROR: Unable to open lock file"
+    echo "ERROR: Unable to open loemack file"
     exit 1
 fi
 if ! flock -n 3; then
@@ -226,7 +215,7 @@ if [ -n "$results_repo" ]; then
     if [ -n "$email_to" ]; then
         echo "Emailing test report"
         os_name=`get_os_release_var PRETTY_NAME`
-        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text $report_txt --html $report_html "${OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS[@]}"
+        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text $report_txt "${OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS[@]}"
     fi
 
     # Upload report files, unless we're on detached head
diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index de3862c897e..c900720f6e1 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -19,8 +19,6 @@ import socket
 import subprocess
 import sys
 import tempfile
-from email.mime.image import MIMEImage
-from email.mime.multipart import MIMEMultipart
 from email.mime.text import MIMEText
 
 
@@ -29,19 +27,6 @@ logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger('oe-build-perf-report')
 
 
-# Find js scaper script
-SCRAPE_JS = os.path.join(os.path.dirname(__file__), '..', 'lib', 'build_perf',
-                         'scrape-html-report.js')
-if not os.path.isfile(SCRAPE_JS):
-    log.error("Unableto find oe-build-perf-report-scrape.js")
-    sys.exit(1)
-
-
-class ReportError(Exception):
-    """Local errors"""
-    pass
-
-
 def check_utils():
     """Check that all needed utils are installed in the system"""
     missing = []
@@ -77,137 +62,19 @@ def parse_args(argv):
                              "the email parts")
     parser.add_argument('--text',
                         help="Plain text message")
-    parser.add_argument('--html',
-                        help="HTML peport generated by oe-build-perf-report")
-    parser.add_argument('--phantomjs-args', action='append',
-                        help="Extra command line arguments passed to PhantomJS")
 
     args = parser.parse_args(argv)
 
-    if not args.html and not args.text:
-        parser.error("Please specify --html and/or --text")
+    if not args.text:
+        parser.error("Please specify --text")
 
     return args
 
 
-def decode_png(infile, outfile):
-    """Parse/decode/optimize png data from a html element"""
-    with open(infile) as f:
-        raw_data = f.read()
-
-    # Grab raw base64 data
-    b64_data = re.sub('^.*href="data:image/png;base64,', '', raw_data, 1)
-    b64_data = re.sub('">.+$', '', b64_data, 1)
-
-    # Replace file with proper decoded png
-    with open(outfile, 'wb') as f:
-        f.write(base64.b64decode(b64_data))
-
-    subprocess.check_output(['optipng', outfile], stderr=subprocess.STDOUT)
-
-
-def mangle_html_report(infile, outfile, pngs):
-    """Mangle html file into a email compatible format"""
-    paste = True
-    png_dir = os.path.dirname(outfile)
-    with open(infile) as f_in:
-        with open(outfile, 'w') as f_out:
-            for line in f_in.readlines():
-                stripped = line.strip()
-                # Strip out scripts
-                if stripped == '<!--START-OF-SCRIPTS-->':
-                    paste = False
-                elif stripped == '<!--END-OF-SCRIPTS-->':
-                    paste = True
-                elif paste:
-                    if re.match('^.+href="data:image/png;base64', stripped):
-                        # Strip out encoded pngs (as they're huge in size)
-                        continue
-                    elif 'www.gstatic.com' in stripped:
-                        # HACK: drop references to external static pages
-                        continue
-
-                    # Replace charts with <img> elements
-                    match = re.match('<div id="(?P<id>\w+)"', stripped)
-                    if match and match.group('id') in pngs:
-                        f_out.write('<img src="cid:{}"\n'.format(match.group('id')))
-                    else:
-                        f_out.write(line)
-
-
-def scrape_html_report(report, outdir, phantomjs_extra_args=None):
-    """Scrape html report into a format sendable by email"""
-    tmpdir = tempfile.mkdtemp(dir='.')
-    log.debug("Using tmpdir %s for phantomjs output", tmpdir)
-
-    if not os.path.isdir(outdir):
-        os.mkdir(outdir)
-    if os.path.splitext(report)[1] not in ('.html', '.htm'):
-        raise ReportError("Invalid file extension for report, needs to be "
-                          "'.html' or '.htm'")
-
-    try:
-        log.info("Scraping HTML report with PhangomJS")
-        extra_args = phantomjs_extra_args if phantomjs_extra_args else []
-        subprocess.check_output(['phantomjs', '--debug=true'] + extra_args +
-                                [SCRAPE_JS, report, tmpdir],
-                                stderr=subprocess.STDOUT)
-
-        pngs = []
-        images = []
-        for fname in os.listdir(tmpdir):
-            base, ext = os.path.splitext(fname)
-            if ext == '.png':
-                log.debug("Decoding %s", fname)
-                decode_png(os.path.join(tmpdir, fname),
-                           os.path.join(outdir, fname))
-                pngs.append(base)
-                images.append(fname)
-            elif ext in ('.html', '.htm'):
-                report_file = fname
-            else:
-                log.warning("Unknown file extension: '%s'", ext)
-                #shutil.move(os.path.join(tmpdir, fname), outdir)
-
-        log.debug("Mangling html report file %s", report_file)
-        mangle_html_report(os.path.join(tmpdir, report_file),
-                           os.path.join(outdir, report_file), pngs)
-        return (os.path.join(outdir, report_file),
-                [os.path.join(outdir, i) for i in images])
-    finally:
-        shutil.rmtree(tmpdir)
-
-def send_email(text_fn, html_fn, image_fns, subject, recipients, copy=[],
-               blind_copy=[]):
-    """Send email"""
+def send_email(text_fn, subject, recipients, copy=[], blind_copy=[]):
     # Generate email message
-    text_msg = html_msg = None
-    if text_fn:
-        with open(text_fn) as f:
-            text_msg = MIMEText("Yocto build performance test report.\n" +
-                                f.read(), 'plain')
-    if html_fn:
-        html_msg = msg = MIMEMultipart('related')
-        with open(html_fn) as f:
-            html_msg.attach(MIMEText(f.read(), 'html'))
-        for img_fn in image_fns:
-            # Expect that content id is same as the filename
-            cid = os.path.splitext(os.path.basename(img_fn))[0]
-            with open(img_fn, 'rb') as f:
-                image_msg = MIMEImage(f.read())
-            image_msg['Content-ID'] = '<{}>'.format(cid)
-            html_msg.attach(image_msg)
-
-    if text_msg and html_msg:
-        msg = MIMEMultipart('alternative')
-        msg.attach(text_msg)
-        msg.attach(html_msg)
-    elif text_msg:
-        msg = text_msg
-    elif html_msg:
-        msg = html_msg
-    else:
-        raise ReportError("Neither plain text nor html body specified")
+    with open(text_fn) as f:
+        msg = MIMEText("Yocto build performance test report.\n" + f.read(), 'plain')
 
     pw_data = pwd.getpwuid(os.getuid())
     full_name = pw_data.pw_gecos.split(',')[0]
@@ -245,25 +112,16 @@ def main(argv=None):
 
     try:
         log.debug("Storing email parts in %s", outdir)
-        html_report = images = None
-        if args.html:
-            html_report, images = scrape_html_report(args.html, outdir,
-                                                     args.phantomjs_args)
-
         if args.to:
             log.info("Sending email to %s", ', '.join(args.to))
             if args.cc:
                 log.info("Copying to %s", ', '.join(args.cc))
             if args.bcc:
                 log.info("Blind copying to %s", ', '.join(args.bcc))
-            send_email(args.text, html_report, images, args.subject,
-                       args.to, args.cc, args.bcc)
+            send_email(args.text, args.subject, args.to, args.cc, args.bcc)
     except subprocess.CalledProcessError as err:
         log.error("%s, with output:\n%s", str(err), err.output.decode())
         return 1
-    except ReportError as err:
-        log.error(err)
-        return 1
     finally:
         if not args.outdir:
             log.debug("Wiping %s", outdir)
-- 
2.32.0


