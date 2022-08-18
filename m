Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D1DC32773
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.44946.1660841833319294611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=clW9K+G4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso2415817pjr.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qKiqOcnMcTeLZSrqW0GW6d8LlTcEljJMnCEVRtIwYV8=;
        b=clW9K+G4hXNugtjUEKKOW16btKVbXxqb/jMN65rch4fHZxlECyrS0XhJhpt4VshBfm
         vi39NmRGT0DhUBIsTCEihl7Fc46FPof51pLfEoryvac7poa5EHhYhq4lvtXmZ/9VrhKH
         1ZFv1DNgOy2uYbLvgyPxioRxTVT4OfkYOu/O+agslXlL0e5RlXA5DD+VMUEdlGr2zsEQ
         OIiKThPAa7iVLxSn2rqmsF3R+Co1nOZat7fZ9w1EqHpz1W1FnNPq+QbxyzuHbSyBZMvB
         T1UeKhDfYNRLEEKmbmhKHuiyMrig04AGw+MTiw1MKUibSVob9CWnGMq1mDNbsWxzIrNo
         MWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qKiqOcnMcTeLZSrqW0GW6d8LlTcEljJMnCEVRtIwYV8=;
        b=YiFJRo8tzsygwyKD4QT06ErqXt7cGPVTF5zDoIvA7J0dXLDVhFmNA1Ss8AsNiTYccS
         TjUSsvIF3EtvRna9kaFkEdjuWJem7vgfEWkZpXcGDgbGP7MiHLOTPrCBx8uC/p8+4uk3
         03ZtextnXaQq3lHhq3tg/B8oVpNYbd0rOkT7nTAX99lRtpnB/5aHw29e5vdQFPxeiIbQ
         6KvyuhlcvM+fW8NIwuK41h7g2ePlWIx75my8CTrcnWsANV8L7I1AV+kdiwabD0DQNmKK
         lpyW546p6STybEp7BFySEkRXeHZe5ZOx0HCfdgAJuGwJMrISnw+jHJT3nd49XO2pqnhe
         PDow==
X-Gm-Message-State: ACgBeo3+XpRVa/0/1WfoPqBkz0St8NzwID+PRpf8lC2gkVtiWL8MZKkP
	Z7bvtCWJ8fo9dYtMW3eOzB1S113H0CEKeMHv
X-Google-Smtp-Source: 
 AA6agR7gCUphzUFCuhFUvLPod5TBUNNdS1Cz6cC+R7BAorWPXEjyy0QMw8zH3qd2TqNRQP10oCzf5A==
X-Received: by 2002:a17:903:24e:b0:172:6c9d:14e0 with SMTP id
 j14-20020a170903024e00b001726c9d14e0mr3590763plh.84.1660841832230;
        Thu, 18 Aug 2022 09:57:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.57.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:57:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] rootfs-postcommands.bbclass: move
 host-user-contaminated.txt to ${S}
Date: Thu, 18 Aug 2022 06:56:27 -1000
Message-Id: 
 <a3ed7e18f71e546c9470b86304aa437e0a5525dc.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169532

From: Ming Liu <liu.ming50@gmail.com>

This is to ensure host-user-contaminated.txt would be removed before
do_rootfs runs, since ${S} is in cleandirs of do_rootfs, otherwise, a
host-user-contaminated.txt file that generated from previous builds
could be used which is wrong.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 54a3fd63e684d070fad962be97e549f3af7ac111)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0fef52af40..d9e2aeab64 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -305,7 +305,7 @@ rootfs_trim_schemas () {
 }
 
 rootfs_check_host_user_contaminated () {
-	contaminated="${WORKDIR}/host-user-contaminated.txt"
+	contaminated="${S}/host-user-contaminated.txt"
 	HOST_USER_UID="$(PSEUDO_UNLOAD=1 id -u)"
 	HOST_USER_GID="$(PSEUDO_UNLOAD=1 id -g)"
 
-- 
2.25.1


