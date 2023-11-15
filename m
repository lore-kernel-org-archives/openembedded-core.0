Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A01C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:45:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9037.1700037899733775288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PoAz/sRh;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33139ecdca7so3110321f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 00:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700037897; x=1700642697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOJw9dzOSsDdRQkwP403w7tN9hgtyQN6JmWfHb6ldFk=;
        b=PoAz/sRhhGx5R5ti/f+aedtSnhPiPv47S+GtLPq5Ni15aElAKBE/A6CTnyCb9BJKIy
         J5gauXwSKyJ2vPSxQ5jb6Ku9pDLwPheA2MfHwi77FbB8wYxpRztQ5XtswQNbGZSZpejo
         sn+mjdGGjUX13jzBr04v2/Za0C2j/lQR7OPbmjM8EJvCNIuoSkbN/wMMlIcSDHo+jQCp
         yOm9X1WHgCr4nT2x1kUttai4Khve0hG5fTyBzasDidWyXbxVAcWfu2tmYUsWXbeF2/Zg
         Ga5ih5wuzQBqXzi6TS2D80dLqzuk+rX4snLU43X2q57+AIhXuMbm62ul2+xMHY95O3L/
         /K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700037897; x=1700642697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOJw9dzOSsDdRQkwP403w7tN9hgtyQN6JmWfHb6ldFk=;
        b=VG47PLgi/4Qz3cFtokxw4cqzifTflOFDxZJ7+EHN2ZKnrWqTHWy6bAvVCozGTi7jYj
         GCkTeDhjzV76vwH7Gd3inp7iZN9qutFUHQ0DeQvFkIsmso5JVPY5z//nU386PA2y4SIw
         dlN0rzbvbtThafuxIZ2EcalcsxLTrTwn+Na1Ggr0Bcu4MppbGxcZsmM55NAGaR5ooKnx
         Wlz/6QXSAZ/UY1Qoi6NqEUxuqf9V3ZL5OE9l+LIzmYYDWPOnWl4HT+07+djCMIHmI28L
         yFSbK5Hn7u/1S1oI4g33t6ZRODVCrZFwiHerkjZYTlpiZcidmaYxKA446NEfXgk0R1yW
         bLag==
X-Gm-Message-State: AOJu0YwvAkVP7pfoEPKBlaPuVYkve06wZkveIDH19jfm2KkuP0+tr8E4
	x0c9aG9sKMowxaKTjeDrx7w8usVrUfZanApRS9Q=
X-Google-Smtp-Source: AGHT+IHX7fCX026d9ZwkxkNDFgGOzqQnGZDZhHtzfGSQcoGrOliCGXfPRwj7kvozYbXC6qdUdUk/PQ==
X-Received: by 2002:adf:fb50:0:b0:32d:bb4a:525c with SMTP id c16-20020adffb50000000b0032dbb4a525cmr7033911wrs.14.1700037897516;
        Wed, 15 Nov 2023 00:44:57 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d456f000000b0032ddf2804ccsm9899290wrc.83.2023.11.15.00.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 00:44:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/2] selftest/reproducible: Allow packages exclusion via config
Date: Wed, 15 Nov 2023 09:44:41 +0100
Message-Id: <20231115084441.543855-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231115084441.543855-1-yoann.congal@smile.fr>
References: <20231115084441.543855-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190577

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES can be used to prevent known
not-reproducible packages to make the reproducible test fail.

For example, in local.conf:
  OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES = "example-not-reproducible"

To quote the original exclusion commit (4864764667097b32a3ee1935e2c52df732d55632)
> selftest/reproducible: add an exclusion list for items that are not yet reproducible
> [...]
> Non-reproducible excluded packages are not given to diffoscope and do not cause a
> failure, but still saved side-by-side with non-reproducible failing ones to make
> investigation easier.

NB: Patch was written by Richard with small fixes and a commit message
from Yoann.
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index db24bf24d1..029b6af331 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -45,13 +45,14 @@ class CompareResult(object):
         return (self.status, self.test) < (other.status, other.test)
 
 class PackageCompareResults(object):
-    def __init__(self):
+    def __init__(self, exclusions):
         self.total = []
         self.missing = []
         self.different = []
         self.different_excluded = []
         self.same = []
         self.active_exclusions = set()
+        exclude_packages.extend((exclusions or "").split())
 
     def add_result(self, r):
         self.total.append(r)
@@ -161,6 +162,7 @@ class ReproducibleTests(OESelftestTestCase):
             'OEQA_REPRODUCIBLE_TEST_PACKAGE',
             'OEQA_REPRODUCIBLE_TEST_TARGET',
             'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
+            'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
         ]
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
@@ -183,7 +185,7 @@ class ReproducibleTests(OESelftestTestCase):
         self.extraresults['reproducible.rawlogs']['log'] += msg
 
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
-        result = PackageCompareResults()
+        result = PackageCompareResults(self.oeqa_reproducible_excluded_packages)
 
         old_cwd = os.getcwd()
         try:
-- 
2.30.2


