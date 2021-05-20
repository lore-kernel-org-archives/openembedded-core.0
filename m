Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.506.1621543753354599360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gfwEuG5l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id y14so16881885wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ybro82EH3r4G8/8u6xvM0AfIskKxfXFDQvBK8i5RZpI=;
        b=gfwEuG5lxv6EidDIkTZc4XrG7xzKhXoz09/A7al70eGWY+G1EAs21vXVTBY2tRai3/
         8D7BATIZIYL8bKOtu123JjaonsDdulxw95MB9iLfi2le4NjLIYUyRyZdhvrxcYHoeHHd
         e1jF+cyoLcFDJ1EJfNSg6mz+NOpx0YcFzQIAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ybro82EH3r4G8/8u6xvM0AfIskKxfXFDQvBK8i5RZpI=;
        b=kZHTcHRxMc54y+T+meNIVnSJwepEytOlhuwiWYglqim93atTmOeagkFzkhDjLUL/Be
         tIeOm23DwlNkVQnk9DGOLKFS1/J14kCGu94tKDyAnODaiLromnJURK435n6p5jq2k7RC
         YUw5rh5bFFVNoY7SkLxWmsns+GhiUuhX1lrhJ4kdiNhpTlqOe7STcmFhhFir6LF5qvyj
         TthEbPRIp1wEZOAshl5oGH6/JyD7ydWi+0F/qtB8qVXg7yDf8xUJ6bzMhb1LPq1ejHin
         AuzCb+nOlHkgpHHhUhTXzwfbmIrEeyy90TfKa+wA/TFTXAzJrKEb6YSYndAKBUNDCbiA
         jawg==
X-Gm-Message-State: AOAM532VUrmXIHhmq2n/KbloTB2XBAbT2a9xUTT7WOmrxLYBNxM2VBT0
	TxAuDlM+WzAedrwHZN6JdPJS1MubF47Btg==
X-Google-Smtp-Source: ABdhPJwfVCNcaeCS/YxHEgVvuPD+NIFDAC0iRAj/j1tPdd7+9N2yCVeQ4AMzZppat46friR02LyJQA==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr5844245wrj.43.1621543751880;
        Thu, 20 May 2021 13:49:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 16/28] logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
Date: Thu, 20 May 2021 21:48:50 +0100
Message-Id: <20210520204902.2527687-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs apply to the way logrotate was installed on Gentoo, Debian
and SUSE, exclude from cve-check as they don't apply to OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/logrotate/logrotate_3.18.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
index 55684ac9fbc..c2115e7142d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
@@ -21,6 +21,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 
 SRC_URI[sha256sum] = "841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5"
 
+# These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
+CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
 PACKAGECONFIG[acl] = ",,acl"
-- 
2.30.2

