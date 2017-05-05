Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF52377D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:25:34 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id p24so2581933ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EmP56AufqY5tTgrjj/Ox2IfI/CJn+8Q4f3u1h2K0NpA=;
	b=XjKBzWEoq5gPcesppWSwrNqpemIfsg1Lh/ie64ArySBW7ZPI/dLXjgssN5YdjSQOmM
	iZTMSJCOhOIDV2xSx1NeP8hFZvrEyUgtk4lV0uWFU8SVhe0MoJYlOvxeDM3/rNs5GjjA
	ALbLqW+hCGc76k10o2KuNQe/X4okbZrr7uJ5ok/Y7jnAlqAKecGN7l6f1Hz4eYtUip2i
	D1Hy6fNi/Rk/D3t+NqAkMrzNVfdDKMU8QWVjBl0Sf9AYPx9lopCvnF3l0ILmROHIig0h
	+N2sRk4lhZPxoTa+kHK4TS07toUoIxHLg3wTe7qhO3O5YmiFeyYpneoTWS1o3S1FSvVm
	q93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EmP56AufqY5tTgrjj/Ox2IfI/CJn+8Q4f3u1h2K0NpA=;
	b=OvBWupJCRyJ0aok/zM26UAQre7I7Gc0AM795tb6QzLDJ30wLkPMFQlu+bMBC0HoiJ5
	f0uDuXLuNYW17i1kG6D02XrBlVsoma/p3PZndr4/WH+egbBy70bjwpmU7etlBhRC7Yw4
	8P1alrLhVoQG5YPQCpJjvEuEUMwkC1MtpiGuPjSZYw7Ns6J/LMQj+DT0y1kD+6niXdhV
	3hJUYBYnokYGkzVq6mN+APqHDomYVvH6yMX4Nst2Md9cajcOrYMwH9yDyx7uaos/afJ/
	hABDoFUIkgNR2hmdG6DnEhOxEzO9TTDq5d4YfDsrPOAuH9s6YQCUgQ0eElNvpeP0k6pB
	QTfQ==
X-Gm-Message-State: AN3rC/6S94t97ivv3lIQos6qQ3Y4M4L32Darn5J29xaDMzV2ClzlqYNd
	Oyvh+W3ckv8pBJodwrA=
X-Received: by 10.107.170.152 with SMTP id g24mr13527076ioj.101.1493979935516; 
	Fri, 05 May 2017 03:25:35 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E982.dip0.t-ipconnect.de.
	[93.232.233.130])
	by smtp.gmail.com with ESMTPSA id m41sm786759iti.0.2017.05.05.03.25.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 May 2017 03:25:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 12:25:24 +0200
Message-Id: <bff6f0c0af98e7f743513ab46621b904dfc4f073.1493979782.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
References: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
References: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] archiver.bbclass: various fixes for original+diff mode
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
X-List-Received-Date: Fri, 05 May 2017 10:25:35 -0000

The diff.gz gets created in do_unpack_and_patch, but
do_deploy_archives did not depend on it, so there was a race
condition. For example, "bitbake linux-intel:do_deploy_archives"
without a prior "bitbake linux-intel:do_kernel_configme" did not
deploy the diff.gz.

When do_unpack_and_patch ran first, it failed because the output
directory didn't exist yet and the error was not detected because the
result of the diff command wasn't checked.

Changing the current working directory in create_diff_gz() without
returning to the original directory caused warnings like this:
   WARNING: linux-intel-... do_unpack_and_patch: Task do_unpack_and_patch changed cwd to .../tmp-glibc/work-shared/intel-corei7-64

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 82751c1..ea00ab3 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -79,6 +79,11 @@ python () {
 
     if ar_src == "original":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
+        # 'patched' and 'configured' invoke do_unpack_and_patch because
+        # do_ar_patched resp. do_ar_configured depend on it, but for 'original'
+        # we have to add it explicitly.
+        if d.getVarFlag('ARCHIVER_MODE', 'diff') == '1':
+            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_unpack_and_patch' % pn)
     elif ar_src == "patched":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
     elif ar_src == "configured":
@@ -285,11 +290,16 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
 
     dirname = os.path.dirname(src)
     basename = os.path.basename(src)
-    os.chdir(dirname)
-    out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
-    diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
-    subprocess.call(diff_cmd, shell=True)
-    bb.utils.remove(src_patched, recurse=True)
+    bb.utils.mkdirhier(ar_outdir)
+    cwd = os.getcwd()
+    try:
+        os.chdir(dirname)
+        out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
+        diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
+        subprocess.check_call(diff_cmd, shell=True)
+        bb.utils.remove(src_patched, recurse=True)
+    finally:
+        os.chdir(cwd)
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
git-series 0.9.1

