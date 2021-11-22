Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4581C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:37:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.8057.1637595469076406009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VF6Qgioy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso17160509wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVBoZSGUwMmzzhoKlJNfOco5kQ2TiBFvgti2KAfUpaU=;
        b=VF6QgioyQs2uOJrv6ALDnrvl8EMxPgNC1320WppaMq04DUF7m+sIcQ7bbBmAo5smuW
         1YUmQ3MIh7G6DNs76Den0u6PN9fX9E/RlV7/7XB89x6V+HIita9dWvmai4HyOk7fzVuY
         JvBggbGwz6DXCPZAfYnLnmfUO26x+SngR7LRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVBoZSGUwMmzzhoKlJNfOco5kQ2TiBFvgti2KAfUpaU=;
        b=5QUq+aztv0oDGz0bOx1IWzMB7PNB+UOmhXTlo7WCI3cd25ljOlP+2qoXfcrhAjZckM
         lD/PVTUcTb+zJ8ZaRLLUE4byZBUvNt9PnX8UbB0IvrkAzm21AW9zrnSVYUUKSjezcwi0
         qs9O5y/dUNSs9WvtpF+1o2AdgIWz3LtCRoJdJiVq6Rfytdz0DAvf5iFZnz3YAJ2pTMLZ
         ZIkYyNPYTbRtfPTFNUBJMxX2o/32cCmSjMOAdb9mhnIRHpCh5fMAPv/tNqufQ2005XgF
         6jvilh/xhexc9A84kC0Ww78ZV3D5YLJfdKHyK5B4Uu7/Pq5gvXvxavzwyp8C6N8CIOc6
         y6Ew==
X-Gm-Message-State: AOAM5330jC/iDr3KPl4aIB+4mPX43c1q0+qY5RTEMpL3b2MCuZRCssO/
	53HT0SrzQ2+WqOC2PmWS2WtLPz7j5AQ2xw==
X-Google-Smtp-Source: 
 ABdhPJyyGqJQCZbWqcWUR7xyFpxipE0jswzPNWO/Ir4fQZKrDbIA9YUB4opjGxPpQycFHPASCz87RQ==
X-Received: by 2002:a1c:9dc7:: with SMTP id
 g190mr31978762wme.130.1637595467264;
        Mon, 22 Nov 2021 07:37:47 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e31:269d:c208:4e1f])
        by smtp.gmail.com with ESMTPSA id
 k8sm9040596wrn.91.2021.11.22.07.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 07:37:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] buildhistory: Drop support for older bitbakes
Date: Mon, 22 Nov 2021 15:37:44 +0000
Message-Id: <20211122153745.4183422-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:37:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158579

We've bumped the minimum bitbake version past the point this fallback code
was needed, drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7c44fec2d18..e62b45ab7d2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -933,22 +933,12 @@ def _get_srcrev_values(d):
         if urldata[u].method.supports_srcrev():
             scms.append(u)
 
-    autoinc_templ = 'AUTOINC+'
     dict_srcrevs = {}
     dict_tag_srcrevs = {}
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
-            try:
-                rev = ud.method.sortable_revision(ud, d, name)
-            except TypeError:
-                # support old bitbake versions
-                rev = ud.method.sortable_revision(scm, ud, d, name)
-            # Clean this up when we next bump bitbake version
-            if type(rev) != str:
-                autoinc, rev = rev
-            elif rev.startswith(autoinc_templ):
-                rev = rev[len(autoinc_templ):]
+            autoinc, rev = ud.method.sortable_revision(ud, d, name)
             dict_srcrevs[name] = rev
             if 'tag' in ud.parm:
                 tag = ud.parm['tag'];
-- 
2.32.0


