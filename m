Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7335FE8FDBA
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 21:25:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.2673.1696368294745765012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 14:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CckcVs8w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40537481094so13541785e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696368293; x=1696973093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4RAzjnDraEnBh0Qh7cVQCyxpt3Cp8XFCKUM+YGI2K4=;
        b=CckcVs8wlnJ1E1kUBa5Dh25IvFSirUbCGRVrxjFueSe0fEVcXY6TgCwdMB+RH0FYr1
         RQOG4DmSGCyNi6yPdKfhTh9fyx/pNkxbfqjLO8MvTbA1foj3I+PhVQCBTaE/PvCHGg6A
         PgHOgggnm5l54MH/TQPxRlFUlu+P6XecxXbkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696368293; x=1696973093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4RAzjnDraEnBh0Qh7cVQCyxpt3Cp8XFCKUM+YGI2K4=;
        b=Kep15IDvFh+t4UYVrRQMMiKbq8jqN3VRnjeEtq0CjFmZGJ3jGHMrlBtEv+oxpaQkYw
         oYLnJzvybl1Ss9fcf7j1+eLQV0rr5KXPxI2LJfh1x5nl0cL5GwufxefeDYeNMXx/o4QD
         WxsXk7pa0BC30AEYCGqmwEDjUDDp+Uy0JPrlihkOxrAeqBFcbETOpO63q+djr14eef/A
         MtILzlRfroA1QWGyazCf+ZCYOZiN4oRrPXESytzCOsCxf1CR9mdtonjsGjjf5SIp3JTo
         dXXS6C9BKGE//hpofjnOoVFjvwykZxQaP7zRN3YHWZlMJzhnm/9/m9B2MpVJbNIWLciw
         Aljg==
X-Gm-Message-State: AOJu0Yw35loO6xnCKOtzh7Pk9OR3JO5H1RqV6Th6Jd//CpoA4CJWuZRT
	l+HnvxFANxUuBQv2Ooy80ZQ9vHHf4g0wJvCBFlA=
X-Google-Smtp-Source: AGHT+IEhC8VltbWs50aokvsYQj3ZKRgvzQbrHFVePvJbrQxfW7S72/MoELbeICUdGDh7cXAFlHLvYQ==
X-Received: by 2002:a1c:f70e:0:b0:403:787:e878 with SMTP id v14-20020a1cf70e000000b004030787e878mr572318wmh.21.1696368292835;
        Tue, 03 Oct 2023 14:24:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id w4-20020adff9c4000000b0031980294e9fsm2387635wrr.116.2023.10.03.14.24.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 14:24:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Pull in stable branch fixes
Date: Tue,  3 Oct 2023 22:24:51 +0100
Message-Id: <20231003212451.2920697-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 21:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188663

Pull in stable branch fixes including:

* tunables: Terminate if end of input is reached (CVE-2023-4911)
* Propagate GLIBC_TUNABLES in setxid binaries
* Document CVE-2023-4806 and CVE-2023-5156 in NEWS
* Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]

Also set CVE_STATUS accordingly for the fixes pulled in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-version.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f5ebbb2ee62..19b98bc11ad 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,8 +1,13 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
+SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
+
+CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
-- 
2.39.2


