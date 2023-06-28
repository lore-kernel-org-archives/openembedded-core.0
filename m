Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2379C3DA40
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:37 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.17586.1687961611191376764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yMEczqDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b7dd061e9aso27543975ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961610; x=1690553610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmPQr2rJl56a2qql32V2OdWc3MEraY1hpYRmMZTd1wA=;
        b=yMEczqDf8g3jdQI+eQZrCsMfPKLUswNLZMj0WCRoWVqvatljeNHbA/wY5zMKD/4BDE
         ZR9/RhZfZ3rDH9n/0cOWJnJLV70WFh09ljkBveblluZWCgmd9CceQuZbMdED8tKDXPSq
         AtNX/ZXUXfRMyCrS/9SW+9+L2tDeGXT51Ap4r0YFpriWVvmjYIxkPElVbVlCe8M2lf3G
         5/riZYix42ffkarQ26jnR2ngs2t0BR3XssD/eIJD/WPZ07MnkcsaCYvXfwf3HVceJ63+
         ahssoWEqc4vJzher+1anNxasB7XPVhXgz187PPg3mwWcBXHnNJHQ+9dOPgJMExKhNwXT
         PBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961610; x=1690553610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmPQr2rJl56a2qql32V2OdWc3MEraY1hpYRmMZTd1wA=;
        b=DX91NSir+/QQy9p5dsGGatqjHo5MT6ck7vZzkfNsKYaH9JE/RPGgPOWtg6Df/m+8fC
         0kLUbPmL7HPx33tcREerS1a/yV2H+pP3p6UdarmOkLAP102XAHQJ4yIhhj2S9rPb3KvM
         iRqygQvogq0LnTN+7ESW25jv5gRcSSyv2GhYB6QPzEqwLFPX/Exyd57wm9eYi3XnqfxZ
         RhU+9qkMasIApYutSr4mcPA91UoE9hKO/mVpBKHR3MCytmQipATccE7U0fHH1gVMa9JZ
         8ehLdo2FJKHKCgeWDd0Bi79Cv2Wp88B9/pfjIDi0kE6E9F7chmiRmvQBEq6Aywq/cGOj
         6HIQ==
X-Gm-Message-State: AC+VfDwgKYVQ/sCCuvGvY4l9E+zB5u9ATidkgVc3PWeV14XUZGA5+Fo6
	JGRvDDz2yhTfLNFrPB41DhSJMaylJm8v5wlMX23Niw==
X-Google-Smtp-Source: ACHHUZ4yJgL94Srg7RHYsi0ujVNrfVWhrXUAQceBzqGBF41fcV/ksWFvEIbriXljWxPw/zMZhRqmXQ==
X-Received: by 2002:a17:902:ecce:b0:1b5:561a:5ca9 with SMTP id a14-20020a170902ecce00b001b5561a5ca9mr11881674plh.50.1687961610196;
        Wed, 28 Jun 2023 07:13:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/29] psmisc: Set ALTERNATIVE for pstree to resolve conflict with busybox
Date: Wed, 28 Jun 2023 04:12:42 -1000
Message-Id: <b40a33f0665c7086e806da4f670a3eb25351216c.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183572

From: Frieder Schrempf <frieder.schrempf@kontron.de>

If pstree in busybox is enabled there is a conflict with pstree from
psmisc resulting in:

  do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If
  the intention is to defer them to first boot, then please place
  them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

And more detailed in do_rootfs.log:

  update-alternatives: Error: not linking [...]/rootfs/usr/bin/pstree to /bin/busybox.nosuid since [...]/rootfs/usr/bin/pstree exists and is not a link

On order to fix this set ALTERNATIVE:pstree accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit deb2176df76dcb16c0d90072ad63d308a0ab1158)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 12539dad53..44b82bd325 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -54,3 +54,5 @@ ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE:killall = "killall"
 
 ALTERNATIVE:fuser = "fuser"
+
+ALTERNATIVE:pstree = "pstree"
-- 
2.34.1


