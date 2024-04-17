Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB2FC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:28:44 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.426.1713392919785411814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IeDYmKbX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dd045349d42so305668276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713392919; x=1713997719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfutCvLmD9smrdk186M+buiN7rPp74JAb6q50H0DmHQ=;
        b=IeDYmKbXD76eH0FYCbiqYbo/DQrzlrInRCFXIwM4RHTtQLgYjWs+cLQVXOSY2EGHes
         ibORZSOJ3SNk5gT6m2fUxep8UepdgzJYGShHC/6zmQBMR4eY/wdHz/zi5L0GgqiJlM/T
         eKYahNV4rp7cFt1Ex+ak5cECRknm7hEBVJLz7GNIuccrF0bktkvatEBoYd64/eOJRIt/
         tG89Td9JXktfGdQHXtHEiIC5NYpCJ0wmFPGn6Bio7OKC0idR1DxjnCTRgleWlZfxDr4q
         Re6YA9M0HSFTGjgksFk0BZKBrj7ux69ZE82l/BA0TEx//Qc4CkFFmQ8G73XLXnkTcMvf
         1Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713392919; x=1713997719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfutCvLmD9smrdk186M+buiN7rPp74JAb6q50H0DmHQ=;
        b=JkpDIIYS9MSkO2La65RMtJ/ny1U5Ad0OdFx/I67zTbJjPw5dzMm/vGYuBxdiLKk0+T
         ApXSwYx68G/XWmls4jlBcASBUu5loBtG5EGmlNUMu2EhJAjLxPxSqF2Mw+PMhZMvt0mE
         NFxYEIdfNmf1wlC2J8Gn1VWvbxzXenF/DT+AT/IbMJj84Gv7JLovkFFKFfodX4RfiXXj
         hWJq6UAr1TIXMwMoytIhBgjNtUtiOgvA0iCh+mEDZ8sJLac+kKayCsIr/7hk8qcANkCA
         SD39ZBNFAgE1uGtdGLzssYaTygb4Vy9tNLkCUiPU6JyP7v8V6JakyfZVtZqxdZLV0XCj
         erfw==
X-Gm-Message-State: AOJu0YzanwxW9hZvgugmI9OMgyEK045tTMglRGmGDpg6wGbEL7y6H9+h
	JBRrWCAeiwD1j2ZSS7GSdvVVMgDLjjNhNVCsE4pURZZFzoMxaJ6UpDiSGqWCd0cwrzfvQeFvxbE
	=
X-Google-Smtp-Source: AGHT+IEgxARso6goK5byDYbpO6zd3y4BNohbWQUKrOYybUkikENoXo/yTEaTXXGDSOYvwk1eGAOSyA==
X-Received: by 2002:a25:1506:0:b0:db9:794b:5733 with SMTP id 6-20020a251506000000b00db9794b5733mr777340ybv.19.1713392918657;
        Wed, 17 Apr 2024 15:28:38 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w7-20020a0c8e47000000b0069b7aca529esm77765qvb.14.2024.04.17.15.28.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:28:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] liba52: remove UPSTREAM_CHECK_URI
Date: Wed, 17 Apr 2024 18:28:26 -0400
Message-Id: <20240417222826.3549176-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417222826.3549176-1-jdmason@kudzu.us>
References: <20240417222826.3549176-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198489

UPSTREAM_CHECK_URI pointed to a URL that does not exist, causing
UNKNOWN_BROKEN error when running `devtool check-upgrade-status`.
There doesn't appear to be a way to check on sourceforge for new
versions (and there hasn't been a new version in over a decade at this
point).  There is a way to use CVS, but sourceforge is decommissioning
CVS (and it doesn't make sense to switch to something that is being
removed).  So, just doing UPSTREAM_VERSION_UNKNOWN.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 684dd590ca15..d52310b8ca92 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://sourceforge.net/projects/liba52/files/a52dec-${PV}.tar.gz \
 SRC_URI[md5sum] = "1a2e77b4f7aacd858961a6b727710551"
 SRC_URI[sha256sum] = "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3ea3e766fca8d18e128"
 
-UPSTREAM_CHECK_URI = "http://liba52.sourceforge.net/downloads.html"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/a52dec-${PV}"
 
-- 
2.30.2


