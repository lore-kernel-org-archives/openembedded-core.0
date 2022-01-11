Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D2C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:27:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.15127.1641940024401460966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RE5T5Tg/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r28so874659wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti21Q2KBt84TMqFkIDga7IGP5bnbq7GKHEYJBppU0fU=;
        b=RE5T5Tg/cya0l4L/vDteub4HmkDBl/AR0I7PehZ86C1g7fjYC4oy27WTXtDx2MZHng
         KpBheU4jAwrtBC51wO6qaUi+edSSdPKg17jm0asLwU0Cp95TsYwBjYEffZOvpuFb/xv3
         eWIBDP7M2SmQz0RXfIlTL0tHteHTTndybQB0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti21Q2KBt84TMqFkIDga7IGP5bnbq7GKHEYJBppU0fU=;
        b=gS7AvP0KPW2bMXPEwVLag6GZFLQ1gyBjGx/W5awFJWpea0zB/ExV009RNUmE6rds/3
         32TNtQ2ZPjsSQpo2LrEFVB0vKQYJaAaxQnYV1bv8Djand203vrgQ/pl9CDTcBKvwsvKq
         Tp8IGzY4cyl9nQN+HFO4V6LXh3sg6WPTjYnfyA8jGxr+JxM3LzMJMHo/OHCc9bqSqi9F
         GH5ZeOo4+9LIcKe8tb78ksLFXmv5rajsSp8+KSFIK6OiaSFTDGBN9oF1NLvfpBY+jlFR
         j3lcwVswrwd4SuciL+tVRmQgCi944yOneCUl+M7ztOKRJDgUgYCLUb1oyLT4tgukXiLw
         FDaw==
X-Gm-Message-State: AOAM532usMyg1v349UHK7B/h9W14cF6imILIe6GFwgnt+VaBFi39jAF6
	/Bmo1G9NX5lgdKLjIf/pW3SzQYZEm/xT3g==
X-Google-Smtp-Source: 
 ABdhPJz95mqlAg+E9vBHJXv7eYSCoqPQCVJ7eSy1aj6KEma40UFve5pIkLlvGiEhZ2EFVAT/i7NCPg==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr5504291wrq.327.1641940022928;
        Tue, 11 Jan 2022 14:27:02 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:60d:9770:8e9b:817])
        by smtp.gmail.com with ESMTPSA id
 p2sm1256149wmg.44.2022.01.11.14.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:27:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildtools-installer: Update to use 3.4
Date: Tue, 11 Jan 2022 22:27:01 +0000
Message-Id: <20220111222701.1653547-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 22:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160471

This updates buildtools to use the tarball from the 3.4 release which
contains some bug fixes and is what the autobuilder currently uses for
testing on older distros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 8554a5db679..10c3d043de7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,9 +57,9 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-3.2_M3'
-DEFAULT_INSTALLER_VERSION = '3.1+snapshot'
-DEFAULT_BUILDDATE = '20200923'
+DEFAULT_RELEASE = 'yocto-3.4'
+DEFAULT_INSTALLER_VERSION = '3.4'
+DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
 if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
-- 
2.32.0


