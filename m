Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE07CC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.8462.1633096246805006097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f1agscU5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id z2so7290510wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T4mRowAGkpBkaF7SqHEU1OFgGofUcTUlPwA724yGpJk=;
        b=f1agscU5MBvsmcSTbdeeiXF3BsC8pcI871falWpkwbRjwKIbTfyY/qCLax+FrJBMD3
         +mpJZg3Z8E8pyeDFY5TNQC/+28WFQqRyB8xyhQn3v7iorM5CjyLl9qBiGpxr9fGGRkK5
         GZKnsTlZgtEvstT/QHpWb/W7uYYW5e2eLYF2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T4mRowAGkpBkaF7SqHEU1OFgGofUcTUlPwA724yGpJk=;
        b=GC14JQrNs2yWexQNZ+59qE78mgRnBAOE/Lr6QhUf0JhUdd2YRfgubAYbmRnX9AIvtp
         yK7RSRwkFpqepphfSCBvDgeVPU8NTcwPVYE3lIGDxLaTReJUJAiritqtFlSy8ye9GGub
         3sVXpGriTyrfUl+XbcRDSrGvvc/GqtbWrgHF0CcyGY9YAk17IQHWopxzZRYbntcmezfE
         E2L3lgXdkbHh+0/x7S7H6aDxrBtdNcq1sk5seVR6brxhu2QAy1d7IxPXW2D2o7+/k2Bm
         dAgn0EORk5DuB1BJCbJFzVaUTz7RKjZzj+yPvHSKvdFFkb4++rUDC2mXvg9ehDBOEph5
         Vnuw==
X-Gm-Message-State: AOAM532vPd2cSv7PzBWx5N/S9a4660F4WUyNH92D7miVHaJ7mr2C6aZ0
	6O4rSvuIxDbsemmPIjTsHdURqL/eaWBMLx41
X-Google-Smtp-Source: 
 ABdhPJwa77UAvMBT2A5leGyaPxtXS0cVATGI4229GSsBlZLfzVfgxy6A8ODDKJ/nz6hYYowH+Z46hQ==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr4721061wmq.91.1633096245236;
        Fri, 01 Oct 2021 06:50:45 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] oeqa/selftest/bbtests: Add uuid to force build test
Date: Fri,  1 Oct 2021 14:50:39 +0100
Message-Id: <20211001135040.2251283-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156524

With hash equivalence working properly, this test breaks as it detects
an unchanged tasks and doesn't rerun subsequent tasks.

Add a uuid to the payload to ensure it doesn't ever match
equivalence and the test works as intended.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 8831de60658..65623640746 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -83,8 +83,10 @@ class BitbakeTests(OESelftestTestCase):
 
     def test_force_task_1(self):
         # test 1 from bug 5875
+        import uuid
         test_recipe = 'zlib'
-        test_data = "Microsoft Made No Profit From Anyone's Zunes Yo"
+        # Need to use uuid otherwise hash equivlance would change the workflow
+        test_data = "Microsoft Made No Profit From Anyone's Zunes Yo %s" % uuid.uuid1()
         bb_vars = get_bb_vars(['D', 'PKGDEST', 'mandir'], test_recipe)
         image_dir = bb_vars['D']
         pkgsplit_dir = bb_vars['PKGDEST']
-- 
2.32.0


