Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B26C7618D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:42 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.11669.1678807358417657171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1zL5Qtve;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id rj10so5181842pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJy39ujqfqB8vy/MMS5y5XF0YZkjMj4L+Z1xcJ4OHnM=;
        b=1zL5Qtve6/F1ydJJZ/KkdIhRUvGj7KPRHUJgmab4oTS03vQ3lRsEFIFegTo6/2Eoic
         OcvlA3yqAon/3gNNRqpZe3EeOKHguPV5AI7wLejw9/FkmMwT5i4UBb5t6iz1HyANnMR7
         Xq64OBHJJgr+llBIX8WqdaDiFP9OtKHvzsDVC2uw789nO057uH942mBqCrHOM6e1AOiR
         ucdtrVYnIZ8hgicmK/a5plXi65G0KwpDJ2Wer/K/mRV4gQuLPKyl+5Rp0lmcqGFwMh/5
         nXKWqrnkPdrcsuOK4Rb5E7wUNyVJ6vI0qf38LoYDBIJEod154mlaSW6xgJGOQHpawaXX
         Cslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJy39ujqfqB8vy/MMS5y5XF0YZkjMj4L+Z1xcJ4OHnM=;
        b=srAN8l9Cdq2eOIoTE7NP/9LeMg/wRk0Op07bu9X0Y1pROtPUieywJXRDvMyRF2qGfR
         t4tKeLrUcd2ITu84Nl9QjDxEpHnJ+MKP/IccBQQp6ympPKs2Xc5yINiFBffW2rhtxd2I
         lJpU1D76t1jNp4WHKoGtRnAsZsCUaXBXFkjIO58JWkI7cKvfyMVyZPj/zoV4Uh2uuHzW
         At3zyWYRGmvAOJb1ph7qLOd0lWM9f3HNaLr/fNZADxJxdXQZVlNhmDjuj+pYdS1OlC3p
         d2WHNC1a58wrIV4sacn3c91n3RErvXxyj1zF49KvykgKl19HV4C8eA3fQe+GK9FhbSCS
         Bctw==
X-Gm-Message-State: AO0yUKU5BAcfrJ4i5sp6wEmPCiExadHDzCb+2l45n9vXWf5ekSpGhmK2
	fvBANV9uhimy+6OkQk4ufUGd7QMFXnO+ZtrzXRA=
X-Google-Smtp-Source: AK7set8IkIBzDiDEqYRRnXVj6aOKVuAZDLp4UEC6w7A+D3v2H0zoFbz950F2szuc9fhPjpRXAkvweQ==
X-Received: by 2002:a17:90b:4b92:b0:23d:16d6:2f05 with SMTP id lr18-20020a17090b4b9200b0023d16d62f05mr5754497pjb.22.1678807357386;
        Tue, 14 Mar 2023 08:22:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] shadow: ignore CVE-2016-15024
Date: Tue, 14 Mar 2023 05:21:52 -1000
Message-Id: <9d5a05c27a01b3859eae70590ba7dd836abe2719.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678807105.git.steve@sakoman.com>
References: <cover.1678807105.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178504

From: Ross Burton <ross.burton@arm.com>

This recently got an updated CPE which matches this recipe, but the issue
is related to an entirely different shadow project so ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2331e98abb09cbcd56625d65c4e5d258dc29dd04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow_4.8.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.8.1.bb
index ff4aad926f..9dfcd4bc10 100644
--- a/meta/recipes-extended/shadow/shadow_4.8.1.bb
+++ b/meta/recipes-extended/shadow/shadow_4.8.1.bb
@@ -9,3 +9,7 @@ BBCLASSEXTEND = "native nativesdk"
 # Severity is low and marked as closed and won't fix.
 # https://bugzilla.redhat.com/show_bug.cgi?id=884658
 CVE_CHECK_WHITELIST += "CVE-2013-4235"
+
+# This is an issue for a different shadow
+CVE_CHECK_WHITELIST += "CVE-2016-15024"
+
-- 
2.34.1


