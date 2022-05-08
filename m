Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C73C433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:39:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.20076.1652013572386207127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nys432JJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id q20so7002436wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s3mtCQ9IRYYdmxPL5Zl3Ufa5yUGsHaj5KuwgSBRBHJw=;
        b=Nys432JJ+YfSiOw0T9ng5A4zBJ83sNl2k7GPFpE1HEmGd8Bz+ajaf6ct9jxAzu+mir
         8rH1lPIDQvkV6nVW1N7DJ8iqmOh6V4BISpR7wsrJKkUORmsVzS8WlwZIZthMJx8HU8jO
         NTVUHls621Jp6i49Rd3kYrPcF/PhmiqugkPIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s3mtCQ9IRYYdmxPL5Zl3Ufa5yUGsHaj5KuwgSBRBHJw=;
        b=GBJfbfJl/xn7/y5/S1MV9lG01ndz4JqqiUraUYkfXtIbjOdr03qXVfrG4ZmCJEBLcK
         oOUnU/5uUtddL80qgY4vp2mTVCXjMS1bODfa0tcYVKmYzo9lCGsXR99Ua5B8fqUf6/8T
         FpqMHS/vfabizmLc+XR7SvXa+gIHKAcr93pKBXqkbHXDVVna0qTN9NrJJpWa8GjqD6lA
         HznYSH6DSbG4DFB1UHYfLI0krCUIGPflIVmszWp4mDfu0raTfmGvY0J3MUdqMbMSjpNJ
         dC5V6+CTgJbnhxQeOPIFu0pU5I/TL5s6vRvS9WNE653ptZc5fOtQQZ01c/XYcdZjVR07
         wbxg==
X-Gm-Message-State: AOAM530q16YCw/IsJw6+oPlw+ORL7gT7fB8VrGKn7JrOKw8WFX1uFaIP
	V2oFlTtqvJmraphcCeVJDji7NYMEhhwZgHo1
X-Google-Smtp-Source: 
 ABdhPJx4Gn9ASAIg+GBOYAoduCPcE/Di22CXVE21b6yLU1IE6f/mbsWflmy9LeWytMS+ynwioVH2WQ==
X-Received: by 2002:a05:600c:19d1:b0:394:7661:6de9 with SMTP id
 u17-20020a05600c19d100b0039476616de9mr11644182wmq.76.1652013570409;
        Sun, 08 May 2022 05:39:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b0020ac8c19ecfsm8048472wrb.3.2022.05.08.05.39.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:39:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] package: Ensure we track whether PRSERV was active or not
Date: Sun,  8 May 2022 13:39:28 +0100
Message-Id: <20220508123929.159466-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165372

Currently the signatures for do_packagedata don't reflect whether PRServ
was active or not. This means that if you have mxiing of PRServ usage and
non PRServ usage against the same sstate cache it can rarely become
corrupted with one referencing the other.

This likely doesn't happen in general but does on the autobuilder as PRServ
is tested. Add in some variables to ensure the binary state of PRServ being
enabled or disabled is tracked (but not the server value). We continue to
assume one PRServ is used per sstate cache.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 44fbc32df6aa..62050a18b8d3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -662,7 +662,10 @@ def runtime_mapping_rename (varname, pkg, d):
 # Used by do_packagedata (and possibly other routines post do_package)
 #
 
+PRSERV_ACTIVE = "${@bool(d.getVar("PRSERV_HOST"))}"
+PRSERV_ACTIVE[vardepvalue] = "${PRSERV_ACTIVE}"
 package_get_auto_pr[vardepsexclude] = "BB_TASKDEPDATA"
+package_get_auto_pr[vardeps] += "PRSERV_ACTIVE"
 python package_get_auto_pr() {
     import oe.prservice
 
-- 
2.34.1


