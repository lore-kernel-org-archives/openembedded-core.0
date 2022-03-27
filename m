Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DF4C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:15 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.741.1648399275243233512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=30W8lKDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id k14so10468514pga.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ipoe5sIl4hW9avRlGEblIPwwy9n/DqtNS2beLuu/bUI=;
        b=30W8lKDfd5ruw57936w1zQo2hKR+/7U0KdcfSlMIYqof0yy0m784nxU+ijO6o2q8SR
         nWPZmt6kl0CGfATORaScWbuUqF42bSGR8X3C3KkUJEc6kiu7RwSagXe8AnVbk6PJKcA2
         7+K9Rfc/vT7UwwiWMFUZnTdFkWneiKAei0CCA2kPij1WhW98QrXvssU+vpJthh2PbmBC
         JM0NbOfkvYu162yLndmyygBfx5UyDLa8Ye+9Cqc7xtjd0JEA7RLbJYAPP4GyEp0TxjOU
         Qpg1pnQvCR8dtZlfRMYUmh+7QDcdzMz10Uk7Uqq7Xp8uc0T8rK77QB9RY8XzrT+InOR6
         yshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ipoe5sIl4hW9avRlGEblIPwwy9n/DqtNS2beLuu/bUI=;
        b=u7O4LjwrfuTmEWVK5dZ6yHoPh7hMy6GXYPlslj1X6PCyNuDAOOntBhBeUENGxvYAOm
         m1b48HY2raQfXnPpTfs7BskkmiOBg0bpURnEkiGS3vAMeVyeh+cpaxYpdKMOH/Geoxve
         YXJBaiMxFMBzTHGUiTjzBpnZ+3xTWYKRRuxNmhxpcNRy3cY7xxZdXM38K2w4PRbZ5E+v
         Zi4Z0lU9W+5XlIJp3tzehjc5CkJxlHgMNdL0boQ0grsG/VCCTM1LEBMAE/S4NMvJnsG7
         4KDZnHJvCoXuCFmYp8lv8iwEtR/kKl2okSyUnc17KVPUCu0blV9ByuDx2bOZK9qDQH53
         +yPQ==
X-Gm-Message-State: AOAM530zMzIbHhEQ+rHI6WTeuNeZhw/URa1h3+KV0ZW5NmUfFHiulSGm
	in0lhf1DOZ7kPPi83ljUYRs0tdToL8rQKB+DnwU=
X-Google-Smtp-Source: 
 ABdhPJzEFFB9amrJ+zyravNwj2mnzGf0q4D8Rfk3SAWthq2sB46rclJZYp+YrjBI/2TN1n86cPWWpA==
X-Received: by 2002:a63:5250:0:b0:381:744d:6898 with SMTP id
 s16-20020a635250000000b00381744d6898mr7429754pgl.388.1648399273781;
        Sun, 27 Mar 2022 09:41:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/10] libsolv: fix CVE: CVE-2021-44568-71 and
 CVE-2021-44573-77
Date: Sun, 27 Mar 2022 06:40:51 -1000
Message-Id: 
 <3096134d25fc4cf9bd18839838a62a6c89344e31.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163667

The existing patch for CVE-2021-3200 also fixes CVE-2021-44568 through
CVE-2021-44671 and CVE-2021-44573 through CVE-2021-44677, so update
CVE tags in patch to reflect this.

Reference:

https://github.com/openSUSE/libsolv/issues/426

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-extended/libsolv/files/CVE-2021-3200.patch | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
index cc8f53cefd..fa577fd533 100644
--- a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
+++ b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
@@ -17,9 +17,19 @@ CVE: CVE-2021-33928
 CVE: CVE-2021-33929
 CVE: CVE-2021-33930
 CVE: CVE-2021-33938
+CVE: CVE-2021-44568
+CVE: CVE-2021-44569
+CVE: CVE-2021-44570
+CVE: CVE-2021-44571
+CVE: CVE-2021-44573
+CVE: CVE-2021-44574
+CVE: CVE-2021-44575
+CVE: CVE-2021-44576
+CVE: CVE-2021-44577
 Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
 
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
  ext/testcase.c | 21 +++++++++++++++++++++
  1 file changed, 21 insertions(+)
-- 
2.25.1


