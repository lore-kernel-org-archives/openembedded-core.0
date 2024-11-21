Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74826D7878E
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:35:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2796.1732206911696132961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YsW/3vCU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso13184115e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732206910; x=1732811710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ5J7nY5YY5zrDpAakXcfgWvRAj9gXMzHNSXZmioOv0=;
        b=YsW/3vCUUvkMrSijLNQS+PAyNU/P9N7GEQ4kTvYWQ6wdwZZUnfltjdGIeo1wWZyF51
         oaLbcCqRH5UgPQaVnKGwmxrAJzGMlqNKQlGs+SBWm0BCLL+oyN+MyHyADJ/V9z/ayEEV
         6hFPzu3ayM/t1wRLe/8p1dDscmlpl7s16gzQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732206910; x=1732811710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ5J7nY5YY5zrDpAakXcfgWvRAj9gXMzHNSXZmioOv0=;
        b=oveeu1UTek44oBHUaCk2HavwSevpbJAiEab5tPiMKsXZ9pLH309m+zk6h8KnzFleTw
         DbDkUG7iRVAC/XVsHg6vtP+6bpnlErwzvsqpmWdOHm/I4OYrALfJjIcbsgffUy+LBQUB
         HBY7StOvBTU5kUeFGiYX7PndQ4e9EujV7FlmjWnAfEU2+a8JLxmAvG4LuPkL7bTKB1Fq
         MNEEVVM8KFiMEU86KQtO0iEd6lOagPy/dsvX8Ecpu9e5+rMIldIVgfzvdCvXNiyHz7B1
         zYx5mgoxDl+wLpvkuOokn0VsDaDqmq5BEOR7BvUJAeSJkclMSCEySIO4F7CBD/aPpDVm
         jc7g==
X-Gm-Message-State: AOJu0YzK0VILHiCW9EKHkBlG3FnVURwTkKfwmUD9m2Fhsv02mmJFHZz6
	6b0mR3pdfGHkF/86kNCgOKmQznBUenosDPGXfbAc/k/hZtKjNorkU1rtH4yaw0Cx7vi+AEPecbP
	Y9zI=
X-Gm-Gg: ASbGncusr69BV17fXgoMquwZR7VfkgYNweJu7cCrXbSHkQynqYTtxqkK0FfTlvgHm5W
	cfK1GMBGslr3Ie2/E84AELdH8QUkrraSJZ4eVvrM9p/jg50q///xuDuJyHNMEqn/+PsyE9fBQCU
	ErZvMQEG2yqRvoA+Xg6ZRYYZ4oWgeCw5w34JdlEHffeGkBbT5ThMIMjl5JYps/qQLaR1Q4FnnLx
	uNqPMO906A5aMptX+4C6436uBhh2ha8r8BfAkU8ml82MbMX3sxudbZs69fN3EsYSoEvcnX/7rCo
	7y0=
X-Google-Smtp-Source: AGHT+IEjPxOo7oXsWKB/imV7+tQH2/Gl/HM5vvgDYZtw9EmZ/nbcMYX8BgZNF1vXKwJTjaXHTFBx+w==
X-Received: by 2002:a05:600c:a02:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-4334f01d3c3mr72873805e9.27.1732206909662;
        Thu, 21 Nov 2024 08:35:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a4ee:c091:1f03:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1046sm64034945e9.4.2024.11.21.08.35.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:35:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] selftest/reproducible: Drop rawlogs
Date: Thu, 21 Nov 2024 16:35:07 +0000
Message-ID: <20241121163508.2628148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207548

The "rawlogs" data consists of a long string of results data which is
already in a structured data format. I can't see this is adding much
value in duplciating the data but it does create a huge string with a
lot of long problematic pathnames and inflates the results data size.

I suggest we drop this data as obsolete and not necessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 415a1ef577e..1ea33cbe786 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -177,12 +177,8 @@ class ReproducibleTests(OESelftestTestCase):
             self.sstate_targets = bb_vars['OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS'].split()
 
         self.extraresults = {}
-        self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 
-    def append_to_log(self, msg):
-        self.extraresults['reproducible.rawlogs']['log'] += msg
-
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults(self.oeqa_reproducible_excluded_packages)
 
@@ -341,8 +337,6 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-                self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
-
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'different_excluded', result.different_excluded)

