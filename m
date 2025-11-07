Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796AECCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:24:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8291.1762511065375775763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=en30hGWs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4710665e7deso2437735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762511063; x=1763115863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcYpJssuYG5XRrXvpHCGmPgQbIFOn2h8NZvYLyJUfTs=;
        b=en30hGWsEcGkgxwYUaXWTtSiaprREyJbWJz1/fmCghYKvac7WTxOEof+UwWb59ATSG
         ZhFwyYhpX6InYBTb5VkkI72D67LAeQWkqKl7n0siH0funJlgxg3GSOaYlwVudj51qG+c
         eeFFiz6WF3P3nJg2WOmx3QtWcrYrdGtX/YhoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511063; x=1763115863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcYpJssuYG5XRrXvpHCGmPgQbIFOn2h8NZvYLyJUfTs=;
        b=w4XYn3mAWUtpvTrxXEpqXDYHVJFw7j8s3WPmWrv71/6v+3uV3w1p3GnPt0jMRQa39B
         U9RnaI45+LUC478T14GKPTve+RLH8tUPLDlVRoR1u/3KaW33VJOmH9i3z4bUDTC35AXy
         DK0/CrFxX4MD5CKjFomE7gaxWZgy1/bxcEXMPmg3L7YKdr2+Id6CIAXXZ56VPmJGaa5z
         R/K8CjiU5HY4T7fwwiK5vJrzuJkOy0KbY4sE8lYnNPWS4IwtD2RIvO9AH4HSOcXtXByH
         7JGHysPQtUT/nqR9IEUowZYCgIwUwF1bqNpoaEX66z0SrvZpuDfpNVrS47WSt02BqKmP
         kUPw==
X-Gm-Message-State: AOJu0YzJ7LNsue09u0WRFPJcQw2mwyeBAW42gFsYpa3r22iNSRNorye8
	TRK81kxJUwJkLeoq86qlHsHQhJo3Tvp2XYlWSWqvwYVmmmMnglM2QVqOnAgeVCzx9Ln8xovUpQ1
	OZHal
X-Gm-Gg: ASbGnct3bKiqpkDjbrnIxG24aVzSmAQphmF/FkGfTf8wosNwL59tmMOBEmoCG2GFOvR
	cY5KiKZtkdSUIEmo+GO7+oIy1zyootcKDs6Toe8+wtiO4WGKjQfYHZmsDY7oV2oGivDLTZqj0ub
	GNs4yh92MzGP6LdXUWhccrg4+7i3yOtgAyPUQFuruEEYkZWPjbrU7qf48KXNFcBWSNK/2qDF5IL
	mf8mRpUB68ES/IM/dYEwNksVpiQ5pRD1wuk2mUmmqQIzhnybZqkGhyCkJ8lIKUy+Z3JmmLIKvL9
	1dpvsrxUQ6mDrvujcvmf+N62PJuqgLdIYFDNWDbob2gf775Tj3anCQhnRMRWRt60oyQNIAJEO0r
	1nb5g5w1o6inUDgUBmQpXIWpjyCeJT2BR+pdc7bXFsf7O+X5XlUYJ4l2phJyXUgPyJZP+xAYoGc
	7esTFe3AP0ePaJvmsKO3nzrwoYeGF1
X-Google-Smtp-Source: AGHT+IEbnTuCcdB16HxBLzvZmueZLEQPIlsm2KElOeHfaz3Bf9qSoQi8kjgkxcIKkU/wY77ox5rrxg==
X-Received: by 2002:a05:600c:1f94:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4776bcae60fmr20985975e9.13.1762511063297;
        Fri, 07 Nov 2025 02:24:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb7:f903:75cb:8c09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcd521fsm47557715e9.6.2025.11.07.02.24.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:24:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/files/bitbake-setup.schema.json: correct bb-layers definitions
Date: Fri,  7 Nov 2025 10:24:21 +0000
Message-ID: <20251107102421.1615976-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226031

- improve bb-layers property description
- add bb-layers-file-relative property

The rationale is that both properties are relative to their respective directories
and that should be documented and clear from their names (without being too verbose).

Based on a patch from Alexander Kanavin <alex@linutronix.de> but with
updated naming.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/bitbake-setup.schema.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
index 5101b0de53e..7030f1d6d55 100644
--- a/meta/files/bitbake-setup.schema.json
+++ b/meta/files/bitbake-setup.schema.json
@@ -39,7 +39,14 @@
                             },
                             "bb-layers": {
                                 "type": "array",
-                                "description": "List of BitBake layers to include",
+                                "description": "List of BitBake layer paths to include, relative to the layers download directory",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "bb-layers-file-relative": {
+                                "type": "array",
+                                "description": "List of BitBake layers paths to include, relative to the directory with the configuration file",
                                 "items": {
                                     "type": "string"
                                 }

