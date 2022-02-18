Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD248C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 11:26:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.9682.1645183566833887499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 03:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Flq9UhJe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id i14so13986500wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8/7ArKmJlaYXjg8UYiqkAv6Z1IzDMnd+ZTFClw3Z/g=;
        b=Flq9UhJerKZb1zcIzx5ubSyn1tlrZSNPNMCOmO/21Tai18fVlrBAN3kPVoiYx9K3t7
         lT60QbCyli+BFz1erg9p6vXhBRPRb5fAv1BwSWUOO+vVeEARP63vNNsKo9d+xu4ZudlO
         SXZo8bkNbwMnZrBtZEIJ6U4kd+W6ENomSK1bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8/7ArKmJlaYXjg8UYiqkAv6Z1IzDMnd+ZTFClw3Z/g=;
        b=lDDPXhpU8dIXaRFbOP4lTCYCp3iPUHHRVP7DGrc2p1pb4E6V80zG+YXyEEuVMFsuaW
         IwMYdD6sb1xRrfZ2+ePoULMY3G0x8cGDLr7nVB9vGC60ldLPhj6glFKTiSZ+8nWzsnGg
         ksH12tUaQQocPvk2CpGE22L+VTm215DU9Yn4DCVa59NR20qsl+gJFI/F+wyKka2pE2XV
         Ek3SfIkjRiDiQb0PlerROGRHOfe4Y/hFz4WvBUx+v+c012flV13dRhmXxtSSXyVO0leF
         QihzjZN75JmDOhYN9Mw0X6rhsWzcxlDjZd0VpyozXscR0cyclBDZ5unPXJJ3eQ7SV8l8
         JKFA==
X-Gm-Message-State: AOAM531khdful5yG6KxlimvbxQ+QCev0A6xZjWMzg26kpRGRKynOgZjY
	/0U+DS7BNOsFzzIFjNXCOraRUYAFX9tex9r2
X-Google-Smtp-Source: 
 ABdhPJz5aBTRKELAAZo4bY6ZFS5++34w0tcsJAy24wydu2CpYXfzibZeNnJzbWJQ6HzVdECYmgFEQw==
X-Received: by 2002:adf:ce0a:0:b0:1d8:fc60:8d32 with SMTP id
 p10-20020adfce0a000000b001d8fc608d32mr5385962wrn.689.1645183564880;
        Fri, 18 Feb 2022 03:26:04 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 12sm17143282wry.111.2022.02.18.03.26.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 03:26:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipeutils: Add missing get_srcrev() call
Date: Fri, 18 Feb 2022 11:26:03 +0000
Message-Id: <20220218112603.3003995-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 11:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161935

Updates within bitbake now require this call to be triggered somewhere with
floating git source revs. Add the missing call. Issue can be reproduced with:

devtool check-upgrade-status dbus-wait

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a0c6974f04a..872ff97b89a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1029,6 +1029,7 @@ def get_recipe_upstream_version(rd):
     else:
         ud = bb.fetch2.FetchData(src_uri, rd)
         if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
+            bb.fetch2.get_srcrev(rd)
             revision = ud.method.latest_revision(ud, rd, 'default')
             upversion = pv
             if revision != rd.getVar("SRCREV"):
-- 
2.32.0


