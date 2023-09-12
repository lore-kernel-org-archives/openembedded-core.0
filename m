Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD1ECA0EE5
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.25450.1694526830090595175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cRYC8leZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c3bd829b86so16393335ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526829; x=1695131629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=cRYC8leZUGKyHQFWWWXRPqeJVmd3BxduppNx67EwbSMaD8iq4Ym6PiyVSMzycMLBg6
         4pw7trt+7VFpB3ZF6L1WrSV+qSMX6bS2P+ZYJ7p1VcvWpXdZnqCrc9r0BYT6R+J78SVC
         WgPoOKRaSonx60+4QhiLPDYE+iDfEdKYk6Xy0zJehto1ilFfcs8jdVQlhqI+LUVofkXH
         HtjK17o8e8JohK4Jc4jLgqH0fJE5ttxAfMU+qkG7U+PUq/5gGj2i+IYGrYCEMxrc8fkQ
         k1fsoQbcfBciEDtn0Adl5L3WOFt99dJmMAC8k4KWdB5SJDp8lc5ainlczXSQ/g0t4XRM
         ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526829; x=1695131629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=vnaOa0T/CDx7AANU7XhahBCbs6KwBsWCJV1bUshYHiJmPcKAuCugVRBsWmPP635mbR
         a4aWplGvWm7y1v7tmICIcVjfQ1a/OU+YBsKCCWHn2nu/VPqk+2IJH0LoDmhgkvXrB3w9
         DvRjzbsSoZRiQ5f/bDGhUddtA0DsZGMjKVObQB4pD4dnyFD2I+dK4ZPX5M0eS7d/xTye
         4IUCUXZMf81eIRfskr+L6EgRwmcIdPUYb6+aIjFHGqMGZyR/KJe8sbBy8dt5D1KIlAcF
         dohN3GG8DbAplRLqlts9r4ZbUc+1e+ghCCUgCzUYk1t+em16nlAX57zDEAdop0Y2h7dO
         /rKg==
X-Gm-Message-State: AOJu0YyXLdYSgwVO/+0Buo/zBIbfeljqEn3+i6u1atEqE18mZSdGZnNx
	byzwnZr2THrAJxeIlZ9ZZSDy4wE+mCzQEqg9TsI=
X-Google-Smtp-Source: AGHT+IFfRCtEwiXabYSxCddFiXjNhhtsTOtINb97YLwAg2rwxxS7NylnI0n9abpadL+uXGbzA98d8A==
X-Received: by 2002:a17:903:11d1:b0:1c3:bbad:9b7c with SMTP id q17-20020a17090311d100b001c3bbad9b7cmr5444342plh.31.1694526829205;
        Tue, 12 Sep 2023 06:53:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] resulttool/resultutils: allow index generation despite corrupt json
Date: Tue, 12 Sep 2023 03:53:16 -1000
Message-Id: <31b996c01c72749fc62821a3c9d1da70540bfad6.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187522

From: Michael Halstead <mhalstead@linuxfoundation.org>

non-release indexes will continue to generate when test output is
corrupted.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a9157684a6bff8406c9bb470cb2e16ee006bbe9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 7666331ba2..c5521d81bd 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -58,7 +58,11 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
             testseries = posixpath.basename(posixpath.dirname(url.path))
         else:
             with open(f, "r") as filedata:
-                data = json.load(filedata)
+                try:
+                    data = json.load(filedata)
+                except json.decoder.JSONDecodeError:
+                    print("Cannot decode {}. Possible corruption. Skipping.".format(f))
+                    data = ""
             testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
-- 
2.34.1


