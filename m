Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0172C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 19:24:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2114.1748028276703175469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 12:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rHRhyPeX;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3681aedf8so197812f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748028275; x=1748633075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6tnVgbJVKGc0666WAEgAVWi1HD+TzPf+iBk767CjAo=;
        b=rHRhyPeXZS7xioql7iVLZqqNxVg9HreivbaP1UrP5V+O1oAxXK5s8eCildMGojrKE1
         YlFtOyN/nutTi/JvVtUSuNENCUREYqVeIE0p+0mDTPszJi7HQJqlPj6rBfTQBYK9dkHx
         DpjLbamouGH/zW1l7cLQdZTIjSvi7pbXvpC8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028275; x=1748633075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6tnVgbJVKGc0666WAEgAVWi1HD+TzPf+iBk767CjAo=;
        b=BsIv/CxpDBwLxTbOD7VXu8dCv1c9XYuUOkshhNZl1J2s1+t8/wFoXEhl2H6YYso9LH
         Megd0UhS3D/koYdVACWyobRcFoB3DlSrDq/kd9t33iRDc1MP4VJGhL0Uj+MEXzKeEGe6
         HxL0ta4mGaqA/VcXYh8MYpCfKJkjBJ9XiO1+Wo3KPVTpbfr57leQMvoGNzPeZyjQlf/j
         NlFaIHN7RvESPzz6tJVFm8gRwzrG4rFy1n65W4gJsrSRjsKhK094aXgBK+Ac+TicStUz
         u5EwAt02vBBLUMQDDp36VySwsqUDnw6PYUtpz8AQ5dI6NT/pE/mOTf5t2EmOdKTJNoPD
         45AQ==
X-Gm-Message-State: AOJu0YyFJ+z2Oavz5D2xb702bv6flP8s/B/m7z/izB1AeYFvGmHOrgPg
	pbCUzNRLDMAfCtM4V8E70kk/x91L3byMR9/8GJYBYM7CYMDEglS2DMZ4CR9YyvP2EBFF7RteCTI
	OPjiMhy0=
X-Gm-Gg: ASbGnctL7LZieI5JaX58RzZWAeoNS5Yyx5HfusNRok14N/p5hbsBuTbxYYQgTqCEE/R
	0OxiIS4MJjQFo1v1Yr9Vmz1A/UA47OAV0X074HBZhFg4536Yly287q0H14aLX4WFaBJDSCcsBiH
	nBh/uJd2DHGFPVzN3V3SpMgJ1j1TCnxCEg99pixivuc5k7URraeHnn74q6Htkyk5hieyyl96Hy7
	Z8mc8wK/m5H+MmmHnDF53QiqvD9ouc4ufC7ua9p1dNu5t6UmsMdVCICmu/rxxlxnrmPcJVI+6rJ
	O7+fJxnusCKQSJmbj396KBZfjLKWf6bn2J1y0Axm1OrmmIM68YZdSMPMroLEZC0zdRdBd9mKZ+h
	zVxUtrDc9MA6TcD63rPcMQ7gqoZGiK7krtwWjDfDFyCwsASJvkAzMfobgBw==
X-Google-Smtp-Source: AGHT+IHJzQeouLPviHGZ0EBRrkF3dCdm6kVXz50QAvS6iFlztTUVrT+hncBCxOqEWxUDadTWn3T3Ug==
X-Received: by 2002:adf:edcc:0:b0:3a3:64b9:2ba7 with SMTP id ffacd0b85a97d-3a4cb49ea2dmr404899f8f.56.1748028274713;
        Fri, 23 May 2025 12:24:34 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0086ff4d0504b52e6c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:86ff:4d05:4b5:2e6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35fa8c6d6sm26593359f8f.26.2025.05.23.12.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:24:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] selftest/reproducible: Limit memory used by diffoscope
Date: Fri, 23 May 2025 21:24:29 +0200
Message-Id: <20250523192429.545443-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 19:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217218

From: Yoann Congal <yoann.congal@smile.fr>

When working on large diffs (eg in  meta-oe's repro test) diffoscope may
use a huge amount of memory and trigger OOM kills on parallel builds.

Use the max_diff_block_lines_saved option to limit to 1024 the number of
diff lines saved in a block. Also, limit the number of line in the
report to generate a report even when the limit is reached.

The chosen default 1024 comes from diffoscope default for a diff block.

For a random 10MB binary (packaged in ipk, deb and rpm), this does
decrease the "Maximum resident set size" of diffoscope from 1.3GB to
400MB.

As an added bonus, this also make diffoscope bail out earlier, on the
same example: execution time goes from 30 minutes down to 7.

Fixes [YOCTO #15876]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1e094892e9..f06027cb03 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -97,8 +97,10 @@ def compare_file(reference, test, diffutils_sysroot):
     result.status = SAME
     return result
 
-def run_diffoscope(a_dir, b_dir, html_dir, max_report_size=0, **kwargs):
+def run_diffoscope(a_dir, b_dir, html_dir, max_report_size=0, max_diff_block_lines=1024, max_diff_block_lines_saved=0, **kwargs):
     return runCmd(['diffoscope', '--no-default-limits', '--max-report-size', str(max_report_size),
+                   '--max-diff-block-lines-saved', str(max_diff_block_lines_saved),
+                   '--max-diff-block-lines', str(max_diff_block_lines),
                    '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
                 **kwargs)
 
@@ -132,6 +134,11 @@ class ReproducibleTests(OESelftestTestCase):
     # Maximum report size, in bytes
     max_report_size = 250 * 1024 * 1024
 
+    # Maximum diff blocks size, in lines
+    max_diff_block_lines = 1024
+    # Maximum diff blocks size (saved in memory), in lines
+    max_diff_block_lines_saved = max_diff_block_lines
+
     # targets are the things we want to test the reproducibility of
     # Have to add the virtual targets manually for now as builds may or may not include them as they're exclude from world
     targets = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline', 'core-image-weston', 'world', 'virtual/librpc', 'virtual/libsdl2', 'virtual/crypt']
@@ -391,6 +398,8 @@ class ReproducibleTests(OESelftestTestCase):
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
                 run_diffoscope('reproducibleA', 'reproducibleB-extended', package_html_dir, max_report_size=self.max_report_size,
+                        max_diff_block_lines_saved=self.max_diff_block_lines_saved,
+                        max_diff_block_lines=self.max_diff_block_lines,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:

