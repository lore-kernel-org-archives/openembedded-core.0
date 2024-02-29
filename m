Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D08AC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:00:42 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.21242.1709200840574048002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=2bUJfSMM;
 spf=pass (domain: smile.fr, ip: 209.85.208.174, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d204e102a9so7284421fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 02:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709200838; x=1709805638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfqTNL93mFJ2tMieIsXjLZTWlTeZytKi5QncrkVczpA=;
        b=2bUJfSMMWdag0YlbONVHClWM0jOzxAhS0P3BM7VF0/+yFwxXmuraY5v0/enJw/scF8
         w3D4ap2BV9kxKKzhaA0hYSmI3AYZX13r/DOAK28cGbKuz5k2cf9UfcS5yWzr7QTb3WtS
         Vfbj1LYkYE5XW87r7UFeMawVU8Iyqwdiw3rf3r5K/A2v28KoXAZAR1s4rhdgYFtKPCzj
         uSLMMnLQjSpG+VuQ2DZBhEbnmLfOsqaY5GqiFKC+d18WYxrsJ4rbf1aDLWIXAaC1kM9I
         D0kxXEDOhCmvtYKaYWH64Ir6TpTsb8Fl/xwVse71f3+N8DUuPoIQ1PxFjFswMSJVH9Tn
         Lnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200838; x=1709805638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfqTNL93mFJ2tMieIsXjLZTWlTeZytKi5QncrkVczpA=;
        b=OgajTehrGvwO+ILsVwjJHZEEUzZvNaaV3Ne6uvfodb77upQXgUjGK94JrHhv1fr0Bg
         XhbIpj72JCLkFoNuAev5C/rmgc1hjMYCgDDQh/5db2cpUZsM4s1Px4Mg10ya10ixZRY8
         Zsck1U7jJuqyCKU1Xfw+2SYNknaqRuufkBmcZ9d/d86fTAPd1oSOKwfLEEDmCzhDX8cb
         jtgloSl/qPFxHKLwoSIKJNXmBLTVGfSoT5d8fKFJYfMJu+ZDqzlzIrNArr0FKRSJw9Si
         8prUdeQ4TDo4Z4E2JQ4TyQhVp0AMYDuii7Wn1jN9wCJsdUAB5GUQb4kVYLs6mJFA4xZG
         JglQ==
X-Gm-Message-State: AOJu0YzbCcSSdfKojtf0JSli8hoXOZDKvqEd8sVTp6+AAlfpU85iQ/Ay
	1yHXzIcqZb64D1ZKLCAIPP0TuU3fI7rxC8Rw+scLy5hC+K6H0kNvkpDamztWngmqUJ78x0g9mEI
	O
X-Google-Smtp-Source: AGHT+IGCESUvRNcA1PGRimH1n2Fu0VqS5Fvyo1iebsRvzbJMEr9/qH08Wayk6QdC28fd22EZMdUn2g==
X-Received: by 2002:a05:6512:1243:b0:513:2a97:5254 with SMTP id fb3-20020a056512124300b005132a975254mr418226lfb.7.1709200837584;
        Thu, 29 Feb 2024 02:00:37 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id d8-20020adf9c88000000b0033da430f286sm1283250wre.69.2024.02.29.02.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 02:00:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] waf: Improve version parsing to avoid failing on warnings
Date: Thu, 29 Feb 2024 10:59:36 +0100
Message-Id: <20240229095935.478575-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196425

waf uses an inline tar file extracted by the tarfile module. The tarfile
module may print a warning when used with default 'filter' argument[0].

When called to get the version, the first time after unpack, the output
may look like:
  # output from lower modules (e.g: warnings from tarfile, ...)
  waf X.Y.Z ...

This patch makes the version parsing more precise by looking at the
first line matching "waf ".

[0]: https://docs.python.org/3.12/library/tarfile.html#extraction-filters

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/waf.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/waf.bbclass b/meta/classes-recipe/waf.bbclass
index 70bf3be8fd..01707c8e2c 100644
--- a/meta/classes-recipe/waf.bbclass
+++ b/meta/classes-recipe/waf.bbclass
@@ -54,11 +54,21 @@ python waf_preconfigure() {
     wafbin = os.path.join(subsrcdir, 'waf')
     try:
         result = subprocess.check_output([python, wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
-        version = result.decode('utf-8').split()[1]
-        if not bb.utils.is_semver(version):
+        # Output looks like:
+        #  # output from lower modules (e.g. warnings, ...)
+        #  waf X.Y.Z ...
+        # So, look for the line starting with "waf "
+        version = None
+        for line in result.decode('utf-8').split("\n"):
+            if line.startswith("waf "):
+                version = line.split()[1]
+                break
+
+        if not version or not bb.utils.is_semver(version):
             bb.warn("Unable to parse \"waf --version\" output. Assuming waf version without bindir/libdir support.")
             bb.warn("waf·--version·output = \n%s" % result.decode('utf-8'))
         elif bb.utils.vercmp_string_op(version, "1.8.7", ">="):
+            bb.note("waf version is high enough to add --bindir and --libdir")
             d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
     except subprocess.CalledProcessError as e:
         bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
-- 
2.39.2


