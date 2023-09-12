Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18228CA0EE8
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.25679.1694526834433220042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w2GJS2Iw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso38246215ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526833; x=1695131633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=w2GJS2IwP44uURBhDoO+vdFTqFmL+AQ4dyzEKBGncdO0sn93d+44I+gDYXDShO4NR/
         GuKUGD7B5dEqZL4lnKRpQYV6f33fUF2E9VELG3HBprh5ob6WgNcpGuQ6PPeZmFJeaIJN
         Nvmgz38uAQlfDyOe8N0yWdxG2I1mov+A3OjPGkqEaHPACJMxs8JFVoHv8NZG7zsBYCwP
         1U48TMEg3QJieKuH96rSCVw1zLmzCRaN5kntUNUVODdXdDgxYSJcDF38HEJ5VUxoUPB9
         b1UFWkCqiWKPsatTEHkjMq8Z8bMlAt/Ypf434B0kGKg/qYhQDwyWXiozzzFlYW2kSdHJ
         X/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526833; x=1695131633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=m/Os4CL02/1VmEm3bMPcx876NNesXRzW0vvVa6A+4Z9CswG066/evNjb8n1JbHrV/Q
         MHOVe1eyG3AeneB1wsWCkYoktCu3Mk/aJHn3YVDNdn1xa/UNkaMfaM5ubaY7lUsem12k
         dT3WbxSWTeRHQJ4j99t9w1CC9PP/m1CkRCAB9S4MAhYSkPFmmwXjLMpk5DwvNU+j4+nD
         VuN8FEy5bCMThQL5g9P/t4pvRvjknIKISQSZkVd4HxDeIDj6NwyUiqx7tEwmmHsk3gVl
         gEeRqmji8eMFmIZqc0S1op9xLvIf5MMpxfNhFhmtPHAEguVQKQhkilxTbhKz3ANcLPkk
         a1DA==
X-Gm-Message-State: AOJu0YwpvM7DVqBBuvnV9hRgVwDpIZTRL3IDoZrLYktXb2fdbr06Vxr9
	ST6bY/uYwHS1V1btJXVATdV0gVE5pCr36M9u/gg=
X-Google-Smtp-Source: AGHT+IGj9/Vz/0GDtZ92ZSunXjHVa8x8ws2va+kCFmq2dYsnMmI+km6mEPe7frX3dlS6Ep8C5NcgJg==
X-Received: by 2002:a17:902:f80e:b0:1c3:da0a:c55b with SMTP id ix14-20020a170902f80e00b001c3da0ac55bmr1065215plb.62.1694526833542;
        Tue, 12 Sep 2023 06:53:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] glibc/check-test-wrapper: don't emit warnings from ssh
Date: Tue, 12 Sep 2023 03:53:18 -1000
Message-Id: <781c52bb8f9ffe6aeb456fb0c0d628917641fb22.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187524

From: Anuj Mittal <anuj.mittal@intel.com>

Dont fill up the test log with ssh warning about having added the host
to list of known hosts.

Also helps fix a test case failure where stderr log was being compared
to a known value.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63b31ff7e54a171c4c02fca2e6b07aec64a410af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc/check-test-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index 6ec9b9b29e..5cc993f718 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -58,7 +58,7 @@ elif targettype == "ssh":
     user = os.environ.get("SSH_HOST_USER", None)
     port = os.environ.get("SSH_HOST_PORT", None)
 
-    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no"]
+    command = ["ssh", "-o", "UserKnownHostsFile=/dev/null", "-o", "StrictHostKeyChecking=no", "-o", "LogLevel=quiet"]
     if port:
         command += ["-p", str(port)]
     if not host:
-- 
2.34.1


