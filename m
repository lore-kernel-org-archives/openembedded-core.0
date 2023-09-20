Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791B3CE79CD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.35161.1695207488918015823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nm4YohWc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c7912416bso6263895f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207487; x=1695812287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n42VeLZx3OUuo7cIFQ0rW03T/RAdnGMA8htNqiINBsw=;
        b=Nm4YohWccfztfJvrWuxwLayba/etvt0ShpnnSfEOewR3p8rPjKxsLt9T3ZYJaE2IFe
         CPwmq4cAPOfcUNUSiJc/7SZM3FUErQH0c8oKSuY/Qgnh3pVrvSGcBD0TwM5pBreGep50
         QNZEK3CMxry/Hj57IY5+IakuCJ+OTLKsfOX0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207487; x=1695812287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n42VeLZx3OUuo7cIFQ0rW03T/RAdnGMA8htNqiINBsw=;
        b=eCfk2VLMxRJWKemuIaneMOhr/p03Gd4xlQvWhu2E/opL2UDqXVLhhtEwAZ9mvIbidr
         CQt6lS+MVfnE2YzBhGG0gSJhB9SEt8oyZ1oIBoMuqgP/SKVxXpu0qE99Vz/0w8Q//2in
         SUq6ZPh5HhAV0pdXz95SsIUz0ZRvRHmo4os0E3qp3Nsbojpe0+2j7ejQ3bSty4jWx6B9
         pHSuSELlyX+EIIYNVAQTClhzpbPepsi6hZjq0vtDR/gofIHgArt5c9heFhLhTPP1h8vq
         RKX6RocxjIdAGt3VJBLUMiTWUZ3yCk+i5J4Dc02UShSa8fkJ90OyLhm+wfyiuCXGGWcZ
         0S2Q==
X-Gm-Message-State: AOJu0Yw3bG0tGh+0myV65MYyOHBGFzgjV1tTKVDiqrY98uJx12yHCYLe
	1yHtV+sMcWYklCIqG/IEWSs1lf5zsz3gmorTcww=
X-Google-Smtp-Source: AGHT+IHkNhlWDd6OAIs8xXAbDx1PnJEiCNug0Rn79vKX/xfDjat+fASluCBovThHdaryih4Ln9tSNg==
X-Received: by 2002:a5d:6044:0:b0:316:efb9:101d with SMTP id j4-20020a5d6044000000b00316efb9101dmr1864091wrt.25.1695207487278;
        Wed, 20 Sep 2023 03:58:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] oeqa/selftest/bbtests: Improve and update test_non_gplv3
Date: Wed, 20 Sep 2023 11:58:02 +0100
Message-Id: <20230920105802.1008778-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187922

This test no longer worked with fixes to avoid overlapping license files
in deploy. Fix the test but also improve the logging messages so we don't
get "False is not True" messages upon failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 31aa5680f01..d242352ea2d 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -236,8 +236,11 @@ INHERIT:remove = \"report-error\"
         result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-3.0-or-later')))
-        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-2.0-or-later')))
+        arch = get_bb_var('SSTATE_PKGARCH')
+        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-3.0-or-later')
+        self.assertFalse(os.path.isfile(filename), msg="License file %s exists and shouldn't" % filename)
+        filename = os.path.join(lic_dir, arch, 'selftest-ed', 'generic_GPL-2.0-or-later')
+        self.assertTrue(os.path.isfile(filename), msg="License file %s doesn't exist" % filename)
 
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
-- 
2.39.2


