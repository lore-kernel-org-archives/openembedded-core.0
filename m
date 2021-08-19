Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.74636.1629400139618783947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i95S3OF2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so9985249otu.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1RwSNPwTWsCy8fVCup8aFiAMMJWBytpLtN12ioI43eI=;
        b=i95S3OF2eMwAjrjFNj36JHF4oWF+TEFcp1lY9uQNHeNo00kWB7A7QK1vfj4QXtIr9D
         Z5nvBC55K3+0QbRBojLaRYheWQfC77c4BuZQbmDv8lleMQK3VaIdiIt6n8rYpmBSXRNy
         mwRPPp0TsDGRY60nytwQYMzos0GiGOWDYr3iuwXKWjnzCOQBXr7qzmn6eEleuk4hS4sZ
         kZUQI4FBFKm53vvxStaTWFHWVACzzLIhNJY5HGzQMSpTHPr6NVfN3vMqr25dKj6Irueq
         fyc0rRr4N9EUWxRU8IyZWe6fpICyaRWcLx9/zkvHr7kJyKu64nbZx9vOHBigPl08781f
         0VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RwSNPwTWsCy8fVCup8aFiAMMJWBytpLtN12ioI43eI=;
        b=Gns/1ReLSMRV+l7On6w4wNmy7uTeE18dft9UoeVUXEx8lXzIrai8JJlNj1lYj9agkh
         416fxJqdEuvGnTeAzUOD+JtgmXvts1r1+icQl/32qrLEe3OFKf29EVX1/zO9Cal0eE7/
         Cjz8iugS7no+aLYd9Gao2zQFOMRtv4j2BXMnz7tM+LTpYNMN0rL6ss/4VShb0JJP8scH
         DNJVTsYc78xj0bpEglx/YqnAjWyPPpCbdxXm9S0nnRGOMoGa75xYHPQ/fflMBWlJEGzj
         znbABCxXIWcJfPc6W1aiUhwMvDi3U0ldWpUmARHQc4VgUoHr4IFhRKdjE0w0YlhL0/4W
         MxAA==
X-Gm-Message-State: AOAM530oYAOD77zBXmm8gz8o8FO7v4TPbcKOle8uaD5J2HHe9VWqYfon
	ZJqmhD58MxD/CmapM1A5siR3MAnKElqYXvL6
X-Google-Smtp-Source: ABdhPJyeW9XTJr1xQjB25Ct3B/n+Ykm8WyKXN/RbJhGIVGhCim0o1O3BEtjnJRGyxoHVW/+ietN8MQ==
X-Received: by 2002:a9d:4003:: with SMTP id m3mr13677919ote.62.1629400138580;
        Thu, 19 Aug 2021 12:08:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] ovmf: build natively everywhere
Date: Thu, 19 Aug 2021 09:07:56 -1000
Message-Id: <94f5c2d51ec8033e00b52ef2d4e0e4c334c14163.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The OVMF target binaries are (currently) x86-specific, but the native
tools to build them are not.

Make the COMPATIBLE_HOST assignment target-specific, so that the native
tools can be built on an arm64 build server.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58ebb47688fc98fdaeb78b4033bd31100218d5d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index a73bb916b0..b00119313b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -38,7 +38,7 @@ EDK_TOOLS_DIR="edk2_basetools"
 BUILD_OPTIMIZATION="-pipe"
 
 # OVMF supports IA only, although it could conceivably support ARM someday.
-COMPATIBLE_HOST='(i.86|x86_64).*'
+COMPATIBLE_HOST_class-target='(i.86|x86_64).*'
 
 # Additional build flags for OVMF with Secure Boot.
 # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
-- 
2.25.1

