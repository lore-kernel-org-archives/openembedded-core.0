Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EFECD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105039.1781424211386144781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NopbwXsI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905529b933so23218985e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424210; x=1782029010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaWbSWpzWDR8gIPAcKxd+dI3upj3tsRDpoDDiBHq610=;
        b=NopbwXsIVgl6m7Fk4OEvENr9CONDES75CId0oKxae7whxum9B3HTOsPlzqJwmTetzy
         OqoR0UMKpkv8SGqkgbMvQlBFXQw7cPIbznX4m6JkAB8SoowCGMQlZshIu6+OoMAPlKye
         upeN2cFQic3JuwhLh7Gbt4bUiSbC6Cnnoc6I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424210; x=1782029010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MaWbSWpzWDR8gIPAcKxd+dI3upj3tsRDpoDDiBHq610=;
        b=cEDJgNasfzehvjMQZGMbFh38sEDfUbHMwhCQJvVA8Ui5x1ZXshcCJH7eHV8dsYrdjC
         FAw33xKhawSdmxnUD1zujQcTTurOSLQF7hEq5vKqImxeqzxayfjL4SRzjuEnv/pNwDl7
         g9HknSbMD+MZ3N5VvbNJhRMKWn7QIYSgkqF8Td3sGLA5k40GndJt06vNFjb1aflicn0u
         88abBhLdCOR6Z9Idu/LmhmG3vTjYJNisylTJDHmFHWrWFcnJoGUOULBUgQPhX1isFFvE
         +PgRI9uRT/gcojtqaDEc12Vw5CsyplKnm8Uo+jSKbfn5XhzbQGSwz6TYmCdF1qgvzHkV
         Q0WQ==
X-Gm-Message-State: AOJu0YzhYkNN9VhwFqXF4LRf+rjEKnivm78/RsHIo3CeyDYk17FnEanG
	zNmXA03PqU2xejhsL179FTJvJaWL5x2FYGOPS7Y6z8WOwmoEVjeN2HJx05fBihdYBENTZScfhd/
	29xYh
X-Gm-Gg: Acq92OHrUKvQcOsu6anVfSVbbz8/Z/uJGsn1aCk/jNGTd0L1FKyad5GzRakzAQt6hBJ
	iwIlexdEgikv0w8TbEeapjZmoD7Ju3YmlohXDP5tD+BPefPFFQKByrkNfifU3PvX3icfLhpFbEh
	7I9VtRNF3ZuuqT3Vp4zvVAwXWMypGLQHM5bCJ0v0YpS+uLtqfkbfuDbRFazFtdyU71lVmHVo36j
	65nVmg2hrUP9NnX3BtuVIylfHQB5uJhR8HdJxDky60B/9AJgvooMZkFL7XMKFbkqi7c69xjUFRD
	pl3X2KMU6liyOCP15Ul1uYRxTlxOflLRL8FLSZRQXkYg1eyd1RJcE7mL0lPUQZfS0qw1CUKI5o8
	AkTV01vifVU9oO5IFFYZV//HJUfP1Khr1x8By3fl7ADwLbfv1gE7EtIXfU7a3unaOx/CR5F1O68
	lQ+M1XHh162t3bIjV5bZntWNH/F6dprW4TBqz+zHGJa02DnTGO6lfC
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr117093035e9.8.1781424209463;
        Sun, 14 Jun 2026 01:03:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/56] enchant2: upgrade 2.8.15 -> 2.8.16
Date: Sun, 14 Jun 2026 09:02:23 +0100
Message-ID: <20260614080307.4017177-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238696

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.15.bb => enchant2_2.8.16.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.15.bb b/meta/recipes-support/enchant/enchant2_2.8.16.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.15.bb
rename to meta/recipes-support/enchant/enchant2_2.8.16.bb
index bc1c5f7a676..e2c6eed602f 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.15.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.16.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252"
+SRC_URI[sha256sum] = "d73162b5eff401a6397e1215e2b103bcef83f921c396c7f6b1394d2450d124e2"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

