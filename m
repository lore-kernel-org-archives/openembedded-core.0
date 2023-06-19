Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967EDC0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.7396.1687180949021799337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=xGtYhpCQ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76246351f0cso252749485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687180947; x=1689772947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeu7QD4fPrHFvFPsUHDwn4N4ktcKdBPoItqTgV5WydQ=;
        b=xGtYhpCQ3bEc8JnX8eciXIbTSAqlummqnnBIFki8AMIivjzPNhGUrk/NZ4Zi40R+hb
         h04tXlQwHYwTcB0IkBgqi8teZe0QivInphQ58swlF0/nIuLEa6JcLedE01y/kErSb4kg
         TPN6XlXiSfXtwREoof7DKs5wldt/danccGlivLr7+Eu2/e+egdSzZdBuxlrVM+WaDm2F
         TTSAcyVVDl/yzOOkG1icHZrlhVycjYb2G4ZxzTIxK4g4ekbiisNcaWTtZAczy3JQVURh
         gVQAQDkfO5iEvsC9F26Gqv6FooebsLBKH0GHo1qiWHdEbO1Ws7d8Fr9f7Yo1Qy4Af4i9
         L0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180947; x=1689772947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeu7QD4fPrHFvFPsUHDwn4N4ktcKdBPoItqTgV5WydQ=;
        b=bU6oCHIlUS3xwsYtEMezZJM4NIQ7e8v2v92PLb1Shi80ZD1BNWG5CObg4U/NU+a24Z
         JkHBgEUBDTO7/Cp9x7b1RZDG7877crSUQGBx4UnOla24VrGR3CFXwiRZIxQu1Q8jW5kT
         IgYO/3tSPlQV1I7ipsYi1xyz/A/qc9Erza59bB0ULh92b9CkYwyll4d3xY1geCs9duuj
         TaZn6w+UCAq22J5SuxgBpv2moD7u5XzyY0kO3ZrZtlzlWHCxQWkJ6QmitbQORYvIfjsd
         cMPgFIw6KbKeD+Mf3xYxd/dZE2ttG/uWfaNUgwsFynU2qNR3DGODagYRhmP3jHDSgH9K
         VASw==
X-Gm-Message-State: AC+VfDzKkcLkHqPYZvU6H3IzF0L4c8iDYifNbv1U9P/PJVT/egEQlZ6M
	bnqpESqQOQi6AVQX5B7HrUGvpjput/yTssWTZK0=
X-Google-Smtp-Source: ACHHUZ7uBsrJqTa9YaN3V8VGhyH8/OEITV6ewPWS3usSz+CkDOmOhIgvLDGIc9vDEhGWOGO25xiC1g==
X-Received: by 2002:a05:620a:888c:b0:761:cc6c:d9b4 with SMTP id qk12-20020a05620a888c00b00761cc6cd9b4mr869200qkn.20.1687180947484;
        Mon, 19 Jun 2023 06:22:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a8-20020a05620a16c800b00763a01c6791sm624012qkn.96.2023.06.19.06.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] runqemu-gen-tapdevs: fix missing variable quote
Date: Mon, 19 Jun 2023 09:22:25 -0400
Message-Id: <20230619132225.1618014-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183107

Commit d43c41fcaf061eaf8bff7bc03de19cdc80226796 refactors the script but
there's a missing '"' in one line, leading to the following message:

poky/scripts/runqemu-gen-tapdevs: command substitution: line 62: unexpected EOF while looking for matching `"'

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/runqemu-gen-tapdevs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 4f8ea979d2..ec3ecb03b9 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -59,7 +59,7 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 fi
 
 if interfaces=`ip tuntap list` 2>/dev/null; then
-	interfaces=`echo "$interfaces |cut -f1 -d:`
+	interfaces=`echo "$interfaces" |cut -f1 -d:`
 else
 	echo "Failed to call 'ip tuntap list'" >&2
 	exit 1
-- 
2.40.1


