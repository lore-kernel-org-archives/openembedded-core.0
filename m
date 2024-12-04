Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1DEE77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.25627.1733345133685562435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lHws110u;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2155157c58cso1103355ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345133; x=1733949933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpY4Jr3RvVIrixaUCyADKlSFzZjh8+e5lTTkG/UXqC4=;
        b=lHws110u344XkeaHbi2kpOnsRifd86rrxEmSMhlBIaOory4YzIwHhpFZl5AGsd7F4g
         eELdzND76C5mxy9BeVZv3PGZVMiqIXwO7fFLC4jbY8fIk8oARrIvD57wq+niwi0SRS7j
         5kY2CixBhMZWvEz/1flAP6JhurZouRZ8dvNvFaW8elg0tsndOlBIuephKT7gvC4PKVm/
         TzrjZNz3ko9Wr0NeAjjM6uNyOH4wIvm6Vx5Qhre7S1Mlsj9nTT3Pet3KkLZvOq1peiXM
         R5LKTU2nLuypfsk2Nc46WO84exiuXPnPfRb08hQ3ySKjmWg9HKNM/2UZqgZFCr4ToSOg
         3wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345133; x=1733949933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpY4Jr3RvVIrixaUCyADKlSFzZjh8+e5lTTkG/UXqC4=;
        b=oPxCBDJG0nhSIPIFA2Mn3R2RLgxbK10mRGSDdTnnPs3jlB9c9Jf7JL7P/AJKdsaOW1
         mGUt8vcHNo1sjCZnvtTPbD4jbK2DAfFsuMkAGK8uih2JxVBpBw5bpWvUS77xQUGLoDGE
         WchoZohkwsVTkaNhGURS3+ZGK5cEJkP1TfNKE7dBUqVGxJPnD9STQWAuCnxQJKwC6oq9
         PM0YNpwjrZ6hyuXOuPDFn1dQvlxRaS/RSQfuW1XUbC+yLWDBoBkV4KbdVYVL/lSJkQoE
         AT1ibX8SeXx4/eutEGP284TUMTg5hgcnIUUQZR40VS2EoEbiyoBUECgPbtPLbAprCnXS
         TbAg==
X-Gm-Message-State: AOJu0YyoV7fu76Is87/xcJaOp2YeJXVF1SOMHb5Ylprzf2E2/MiwIBo8
	ugMP3f2DGdMNCIxzLQ2Pkq6cihxJ0nP3ydd7BPqhIJ6ivFYtwu7vwq0NBUapUA5tCggFviCVxGy
	D
X-Gm-Gg: ASbGncu7fRGyGiBVb7VN6pEh5rVlbooha5r4/Cm6X5li0oL9gFkymTiU9q0NaLOU/RJ
	GhnTwoFaG4qmLi4KbYcyfxnkmyXbHnfrWj5WjN25t5Q2hc4lDdskvAgDJLg0DB14WF42A/xEuMN
	o6Xh3ti6pgMTPEqpvVUoVcVRylBz5FHfctG0ASOB+kev2Wj4MmSPtn9l3uIJoLfahJxkZvDre3i
	gDnYo3Joyt6xM4gmB4kfEwNz7fSoSIPBCWAtHI=
X-Google-Smtp-Source: AGHT+IFmhz8gpWLFKj6hvJ9MemN/T6/PDeh7o3v+l2oZ2x71CINgyKfJC2AQ+VlfLllhtWE1ghTNcw==
X-Received: by 2002:a17:902:d4d2:b0:215:827e:3a6 with SMTP id d9443c01a7336-215bd16863amr100410265ad.40.1733345132965;
        Wed, 04 Dec 2024 12:45:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/14] selftest/reproducible: Drop rawlogs
Date: Wed,  4 Dec 2024 12:45:13 -0800
Message-Id: <d35e96785a07bba29a76c96f91751be12497f50c.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208348

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "rawlogs" data consists of a long string of results data which is
already in a structured data format. I can't see this is adding much
value in duplciating the data but it does create a huge string with a
lot of long problematic pathnames and inflates the results data size.

I suggest we drop this data as obsolete and not necessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b2c70fab2ffa409b861d83f048b65d458d03a90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 3d3f30eebc..ed73184b37 100644
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
 
@@ -299,8 +295,6 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-                self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
-
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'different_excluded', result.different_excluded)
-- 
2.34.1


