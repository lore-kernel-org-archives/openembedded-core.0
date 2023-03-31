Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60029C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.48080.1680241535413671187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dyjo4i1h;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id v6-20020a05600c470600b003f034269c96so2886000wmo.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=dyjo4i1hZhy/BYvTzqY3r0rjKS7z3yN6cYhziwL19FFgvJfED5HOTr/Wvg4w2YClw+
         FBNYWOl9goX8sYCK0rUbCPrBEI8kESMpB6VFSMPo1+wH10TWTWpI9lJec99qCfCQcZlo
         /2qMRIxgIA8FEHD2LGBBvdRqJ2EWBtgrlT8OtCAMmJMvHKUxzd9D4uABunafDw2JUvVC
         zGqRjvX2fDqxb35HN8ozM36ptav6uj8pmDxQl9jHJQNdRd6AVRScySj/hweb+p4f6CdG
         wMSUydMJDPGezREhDp8OmFDKHWzbTSzKjIGwh56P35wmMC+HhYIcaSckEHFYNmLcI1aF
         upnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=CWy+I97kFCpdKKnNhgn69acaSOvqWA28YEalwYUO+NhW1YHK4n5d2WrFQnD7Wtpe8U
         BVmkwVRaAE4nC0MBGCbDrMCN0w+qfVTQkPv3okqfBvBi0mO30sKmiHwit4y6ZUfy/FNI
         MV/T7TNNphlMs2doJjgAEuER8HzW/kTx/kxLn7haseOCHlQSOnHpIZLqJx5YaIpMbX5p
         gL4rc8kSkAyKwwfb+HssRVFX4WNQHHYYLCJMvVjwRzo0IGlNsocg7o3dLqpk5pIZJF75
         moRIeFbEvRfEFeZnuLgDQJh1B+b5E79HjI7pqEWkBrbqJhv0j52/jaRqNH39b8/cjuux
         yeKQ==
X-Gm-Message-State: AO0yUKW3rOeAfXWFJkSRm4TOm4G9oL0Y8c5wIG1rJh+0CV4aG5r2VN+C
	eRgDOiL0tvcMY052660ez0ewtqKleI0=
X-Google-Smtp-Source: AK7set9T0Io2nvj4rV1dNutBeN89o0zTPvaibVwMdq7NacnZqkgBaDP+Vv/2ZCuK2c9aorn1/7chdQ==
X-Received: by 2002:a7b:c00f:0:b0:3eb:3945:d3fd with SMTP id c15-20020a7bc00f000000b003eb3945d3fdmr19456810wmb.14.1680241533188;
        Thu, 30 Mar 2023 22:45:33 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:32 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 2/6] cargo_common.bbclass: add support of user in url for patch
Date: Fri, 31 Mar 2023 07:45:23 +0200
Message-Id: <ea7b3ac0931d61327a3e0cfc05f5f484c56251e1.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179396

From: Frederic Martinsons <frederic.martinsons@gmail.com>

To handle url like git://git@repo/project

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 63b1382908..82ab25b59c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -134,7 +134,10 @@ python cargo_common_do_patch_paths() {
             name = ud.parm.get('name')
             destsuffix = ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-                repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                if ud.user:
+                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+                else:
+                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
                 path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)
 
-- 
2.34.1


