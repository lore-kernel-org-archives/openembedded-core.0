Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A84C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:18:01 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.27896.1719411471253562889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zp1LfxJN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e72224c395so78374101fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719411469; x=1720016269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jirKTvAwaQC2tTKo+3qiguQUZr+msnDE3VVZPEQRtAs=;
        b=Zp1LfxJN7XhMvlb0NKqyJQcxWMIRta5vKRoTWpzcUB5xlI+49+GCS4HWBWEhTrc7ys
         1MGK55H++eNzAXLwsRUPFQgtDiGlPcRQLVvXDH33vASMZ8DbrMq3YpLv2yCAtfj3fboE
         EEhnNbALdMPvrgo7DpE1dNLnSXtAhzQ0Sd3PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411469; x=1720016269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jirKTvAwaQC2tTKo+3qiguQUZr+msnDE3VVZPEQRtAs=;
        b=LsLOijcQebPQ7lyYlQ0HwtbNd45xRO3DWKynrrtew8/aJOtz/aHf1p3imTzzMaJUtm
         3whS+2XePAbjyTUi4Dl8XqgzSOyJOPTMCBPvBgE+RrOx37lF7+MzVGn1T8xabysqlpZj
         sR7AKtZ400fVazZmuAMyWuX2LtNX/Qzw5u8gjkBRiobFZG3LjIwly3Zg+3CwTpTJMQVt
         Y18wv5B+w1jGV+K7+bVTyCLNkMX0v3Y1BSaN6Xml/OpGCdEb6PD35FHVy+4yX4ORV8Zb
         Z1GgxnDNLrV/VSJ1vpXOicx5xz+2Dl8Q3tfh/26uVoviXA193waS99j4hfyas6eZkmaD
         9LZA==
X-Gm-Message-State: AOJu0YwoYboZpxfmn6Lsb6v4erb2wdaOhRgJKKASdMTfy16oGmst0UxT
	74wF5fT4BRF8ktXwAlEnprl38cdVbHYr7lmtSmARRT9zp6uQXiRJuLy1wlsg8ChwxG+tU7I5e4d
	T
X-Google-Smtp-Source: AGHT+IHLdBURpwKGhcad5lEtlmeyv4dlDHpopAjhNjmNOc2wlyo4uUfSIIvrvwi16ZCx2IrzZfGO6Q==
X-Received: by 2002:a2e:3518:0:b0:2ec:5759:bf2f with SMTP id 38308e7fff4ca-2ec5b26954amr60224761fa.7.1719411468833;
        Wed, 26 Jun 2024 07:17:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1693:fa63:dd08:d447])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c823c28asm27015935e9.5.2024.06.26.07.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:17:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/parselogs: Add some kernel log trigger keywords
Date: Wed, 26 Jun 2024 15:17:48 +0100
Message-ID: <20240626141748.2138968-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201171

During testing we're finding some kernel oops messages and other key kernel
errors such as irq issues are not triggering our log parsing.

Add those keywords to the list of things to scan for, making such
failures much more visible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 6966923c94d..47c77fccd50 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -34,7 +34,7 @@ class ParseLogsTest(OERuntimeTestCase):
     log_locations = ["/var/log/", "/var/log/dmesg", "/tmp/dmesg_output.log"]
 
     # The keywords that identify error messages in the log files
-    errors = ["error", "cannot", "can't", "failed"]
+    errors = ["error", "cannot", "can't", "failed", "---[ cut here ]---", "No irq handler for vector"]
 
     # A list of error messages that should be ignored
     ignore_errors = []

