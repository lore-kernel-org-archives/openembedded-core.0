Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581C8EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13096.1692801438440638558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=U8bLSt+t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bf1935f6c2so38788395ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801437; x=1693406237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=U8bLSt+tSrLEZvYSQCbpEZtdh9cRt6XxgBuPoDWU2YFf7Kd6JLRPK2gG6m+FrR5xVd
         6Hxd5P30HmmtT2hCo+R0Eu8s33WQVvM0HDNWALnUKAui7qrWO528EE7PGZpg8mxJgBuG
         YQdMvK8TFm7R4D3uyJ+qXBI7F3R0qV6HDYU5yXI2PAzyKTBTSRfUJruSDQ6ZTHvI8q5G
         d87aakni9H8zt5Yid6BQRTPyOIPSRsCaVG3kbmyrdXganuWsC8HvV1CGjlyL0xQejdaX
         YwOwdK/hBBa79YHgUYElTetwFrdOvRaKBaABu6H6s3t0WglqJB2fdTTN3NQvWSUgUQr8
         d+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801437; x=1693406237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG1pCgQOWcxZ64wSbiaSMcYDunGvZByAvA5Jqz1ujpY=;
        b=ZUaEYHMxjntIWtNdrLjvIXE371o0LvQWUqMUnX4fg1/qKqBgHiIG7cjFl+mJzefIrE
         7QzU5WpZ8rpHY5AKwfABG8kcYv33DgfJc95kKQCXRGlFV7cmhKblZTBxZ+Xeyc+oSMqN
         ZTndAKEeXceB+7mAj73fLYjA53pmCw5GScYYa92a0fZP9QVI9k+74wyNI9D5m22gPoU4
         WOx5O2h6qnNjIKYqFIdDHQV+E3/hvZBBAdgMtgZkPwG/sB3JXVePoIzwNb8FPsYmXHOj
         hSlsjufI2R8JQxLdTX7oKCcnp7QPq4RHW09HqiWV4o1CVNP+p+Ql61Jqit+XXhiCrYhy
         d1Qw==
X-Gm-Message-State: AOJu0YxagABzIyQSxtgXlCrg4HWvgZQPqNiz0iE+3zFQBr+URZxwI4X+
	ebt/ygRz5+/aW2rKcpctLbRiRGWTeQHWYfNNoLs=
X-Google-Smtp-Source: AGHT+IHVL57kOKTc4RrvASGq+XOPfzQJHYmaHw0SpR4aWEutfwMGi//jhdwKC9WOhBDKdhz/DLFHXw==
X-Received: by 2002:a17:902:cec9:b0:1bb:85cd:9190 with SMTP id d9-20020a170902cec900b001bb85cd9190mr20495958plg.18.1692801437562;
        Wed, 23 Aug 2023 07:37:17 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/36] glibc/check-test-wrapper: don't emit warnings from ssh
Date: Wed, 23 Aug 2023 04:35:58 -1000
Message-Id: <265ba5138bb5859b9f5915f99a818a45df88a279.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186609

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


