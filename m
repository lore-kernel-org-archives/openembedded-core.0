Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53EEC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:29:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.23915.1710512970557310763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eLgHfwkz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33ec8aac149so978105f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710512969; x=1711117769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5DaLC3CRYYoExoEpLvCk5tD5E/24fK1MDlk36vKRUQ=;
        b=eLgHfwkzUy52yVW5xZreLOizBUUc5Ic8yNtaqMFskLm6OMSRflplAM4go6ZQ7BkYd6
         uXuMzuAKPU3f4KznXBXKwmXqxNL0wxlcn2MXJO6HYNWVxqgRCODNYPGhRGJwFCFnq+pm
         jo2n7sutvwAA7t3eawicTOsptP6b2PlofzPps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710512969; x=1711117769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5DaLC3CRYYoExoEpLvCk5tD5E/24fK1MDlk36vKRUQ=;
        b=A51mWBHuOCtWQ9EviXJOL6Q5vyA3qa0VPW15nBdkLwzIgDaaTgIbqXVzopUUC0Y2HM
         auN8AlhgfsE1/9v6ynMbW1gi0rXM9Ovem1uagiUclHMLCS1VLMoArfYlbWvdF7WwpVLh
         Bhd7mvqb4o5JTgvKO/R7HyQ+IBTVx9naeOiHd0RpT1P2gHZxix53TFaPKq55YCnFQrb6
         AdzkWrfLjrlEA8SFmid87Ol6c/Sa9B0T6ARkkLmPJ+EZfJmEmsHA7rC+dxcp5CQ0K+Xp
         T6v6B90fzPHb/3QfI5vbxLmVTjrT1yE9GXPxYmbmzqNsaICCECThGDA7th+DPD2cUOCw
         bDiQ==
X-Gm-Message-State: AOJu0YxfvQcz+ZgYLCVCAPCJnEaiFjAy80OvTc8Y2qmkBuae3W2VIKFf
	sonjFUKMKd2184L9c8qEM5JVt5QJ0RCPwa9iX1VUtZRMRD/lf2C8kuuuwvAL3S+2mqbWXGaT4Hq
	z
X-Google-Smtp-Source: AGHT+IFMuS4gEu+w+TrjuGVROCg1hFTaTs3/6D95Dv6KpDnn/vamoTn/WIxedJqxgkvN6uauvTx3Yg==
X-Received: by 2002:a5d:5910:0:b0:33e:ce0f:5c79 with SMTP id v16-20020a5d5910000000b0033ece0f5c79mr2959546wrd.9.1710512968790;
        Fri, 15 Mar 2024 07:29:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6f03:430d:44b8:f326])
        by smtp.gmail.com with ESMTPSA id dz18-20020a0560000e9200b0033e73c58678sm3315477wrb.15.2024.03.15.07.29.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 07:29:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] uninative: Add pthread linking workaround
Date: Fri, 15 Mar 2024 14:29:26 +0000
Message-Id: <20240315142926.3832940-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315142926.3832940-1-richard.purdie@linuxfoundation.org>
References: <20240315142926.3832940-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197132

With newer glibc versions, pthread was merged into the main library so there is
no longer any need to link with -lpthread. On newer systems this means that linker
flag is dropped from places like pkgconfig .pc files. If uninative then uses this
newer library on an older system, the flag is missing and linker errors about missing
symbols occur.

Adding the linkage unconditionally to our uninative linking flags avoids that problem
at a potential cost of slight over linking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 9b8b4565dd4..d05b61c48eb 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -143,8 +143,8 @@ def enable_uninative(d):
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
-        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
-        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER}")
+        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -Wl,-lpthread")
+        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=${UNINATIVE_LOADER} -Wl,-lpthread")
         d.appendVarFlag("BUILD_LDFLAGS", "vardepsexclude", "UNINATIVE_LOADER")
         d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
-- 
2.40.1


