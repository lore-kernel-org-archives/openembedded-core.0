Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1A8CA0FFC
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.6629.1756330203108496011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S15RfHHS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b49dcdf018bso250523a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330202; x=1756935002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol2EHt8hZeM0W47mrNtDgsAWqDq43WDzSm4eAsoZKhQ=;
        b=S15RfHHSsnoTOy+a5RmjmxtLNX17D1WK5oM/CT4jQY5GPy9Ol4/InTj1IgU9Z8LhkV
         9YwxhHvDhltSPTqhI+/zru5Tb0qllShf4IKixc6XT/R4NknPI80Jq7yuPhzrMhOgjxXW
         umJnpPEKTaFTLBrAZU8Xv37HszQG3Pfck2URrD/3mXcM2Ac+aV0CbgMIQNAavrWxjF9L
         T0/5zDs99APcpTfg2yDJrfFpoqyITq8ycCd0GcU8RZQxg5XPrs8nzoxy0EZuQ/q8o7+8
         6MnBwgnx1b7zShLp9C1T+Rpa1dQOAGfFANo8D73TF57VE9IpNSndXZFDiWr7cP+QP5Fl
         yZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330202; x=1756935002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ol2EHt8hZeM0W47mrNtDgsAWqDq43WDzSm4eAsoZKhQ=;
        b=dR2JmQUpXgy8MBAFBeA7/3fbs+V9PTj/oeY0gv12o3avBGB3uiDE2ezHGI7fuUXr9E
         CPJSfYMoB65rNtWnN64qqIakjwY7/h/nAsjt084N0FS1vK/vSFMyDZ6pwsq5+QvAAnDv
         UkSTyJQZUuwTCCd9xT77K8t8L9NPofVHKMeQZoB0y9fXkA53mk15wSOOE419heIy1iwJ
         v5779NG9hiIAIppy9ogOFvsRIOvU1I4Cge/yImVG9jOwIa728QjLe53gx6zxni36heF3
         mbwGhk92mxtmGISrnWunIqwGZm6wPRSlfIe7KwGYmVTuVrSwLuu4BOtXBykO7qw5jf73
         6tdg==
X-Gm-Message-State: AOJu0Yx/TynHBdCV8zdzcIEkZ4iTu/psaXnRWQlF4btb5VQQcmHFXOIg
	B3VVE3KWJ8FTMooYID1v0cYJWfTFU4PLYVNeHtRpyfuZZD6jEwtHALE8Iy6eJAk6ZCjYha3Yaz+
	sVX+2
X-Gm-Gg: ASbGncskXvPcS0/KK3TtCUAhaeoIbxLq3tWjlrLJ1sDZA5Gm3liaQUn5UHEVS4j6AM0
	2F01VNtf4rIcvN7ngi3vCuX04zYScsIyWovXPbS2OjVPHoi0bnrmlopr+4XFBAKidUq4sJLTQuu
	O6dsR1pxasRP/ziIkCInGBffVhZWTX3SQUI7LhyE0lWOapgglZyf7+IIQF1kbrVFmkMqrja4Mx7
	YBwpP9Mk2O2MRPtB5andwVPSD5dvnP00/UvGUGHrguSQCBs2RrsX4BJ3DvmpkrlrtKpyO48S7m4
	OvANoswOkWMDET2eTKg5toixPbkk64NjVbCKNKIfO5KUrQJHbFFc1bCA6Udb3v0eL+couFclXrU
	EUALFLrMnFHpAVg==
X-Google-Smtp-Source: AGHT+IGTD6p+Vf9ooK+ue5jPeS+Dx0hJ17PooCNY9jslZng03V0SwJqf626S0uplqho0CSifXmT4ag==
X-Received: by 2002:a17:90b:4c85:b0:323:28ac:4594 with SMTP id 98e67ed59e1d1-32515e2e438mr22910284a91.5.1756330202388;
        Wed, 27 Aug 2025 14:30:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/33] go-binary-native: ignore CVE-2025-0913
Date: Wed, 27 Aug 2025 14:29:15 -0700
Message-ID: <63dfdbf774dc24ea4e736a6d13d6aa8c72ebee4d.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222516

From: Peter Marko <peter.marko@siemens.com>

This was already done for all other go recipes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index b15b60a691..7688a090f4 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 
-- 
2.43.0


