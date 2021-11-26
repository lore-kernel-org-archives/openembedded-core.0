Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D8EC433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.20186.1637901393108565946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BbSf0VaS;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so9074219pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qEtCKm7SuJfYMoMm/j4FpguJb6f9GEobi4x0WQOYXyQ=;
        b=BbSf0VaSwKCJIETnyp9rSPZ4yWrbBdzrxoNaK+dQHsGqyGYTBbU3WFY+VSsj9Bt9Mj
         9kJ+kDszePIUf8voQ315fiXoqMGiYM/+V8PlA36kLzFQU5uALr6P9kSsYKgnao0Ndwsb
         4CmZ5dg8MXACvpEqJSNEjRrbFZkBb7POe8z6eFKV0gMVKIrGWqn3a07cm0dNC1zTOrbC
         VK51ztyRfyV6KYtggjP08TTyYR68a6pPaRRyqmKgpUPcxjX81mLljLoI+b20z+hEO6nB
         6uPNxDs/kD2bzK6k2uknjo07uhyOOEv+qCYhXnCNqgVp4LdY+PMzdMbbV8/slbgt/tOY
         x4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEtCKm7SuJfYMoMm/j4FpguJb6f9GEobi4x0WQOYXyQ=;
        b=qpfgZnPs8kjuQViZqrUJO76Lype/v/zr5HvMUYFH1bZKXQ1hJC7z/OmCIQKN25zSLE
         jwQ/RaC4BBDYfPLKc0RRdcd65zBSZFL7hvFcXvRQUBHptQ0+bfaED64NOT1LAXtKgs0/
         e9GQLSbDWozBzUNZ3OuAjOycma52l4FOaXr4O4ky1wvrNVF37EeiXqaQEe+vUfRof9Xh
         KamEXBTLOBc+7rkSxjDitKEGm2Zjx9TysHXKXtjUCNmIOhPAGCiH2YQLp4dzXcrUCGdI
         tiNKLA2kCluKbDb7QSsxpRqchXW6F05x5cr06hJbHspf6KqHuObBqRVu0BTV6I25C7AU
         NtkA==
X-Gm-Message-State: AOAM5339ln6877UNs4k/gmMhMm+E0rq4Zz5iGpTKSEd5zvOBc6bz1JWC
	fpQOSf6avqVSb14Tve18OpXnlGIJe9k=
X-Google-Smtp-Source: 
 ABdhPJwkplzlbkKxFg3OLTycinTzX4UtfdAiSREu8F9U/QUOGnTWhuSiAuuign8Y6AOpvbWCtuggJQ==
X-Received: by 2002:a17:90a:ac08:: with SMTP id
 o8mr13058998pjq.87.1637901392403;
        Thu, 25 Nov 2021 20:36:32 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 21/26] waf.bbclass: drop usage of distutils
Date: Thu, 25 Nov 2021 20:36:00 -0800
Message-Id: 
 <f2f14ed5d003a2310645a191c63f539d2faec42d.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158817

Refactor to use newly imported bb.version.LooseVersion

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/waf.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index df0ab8d73ff..f9e240c272a 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -43,7 +43,7 @@ BB_HASHBASE_WHITELIST += "WAFLOCK"
 
 python waf_preconfigure() {
     import subprocess
-    from distutils.version import StrictVersion
+    from bb.version import StrictVersion
     subsrcdir = d.getVar('S')
     python = d.getVar('WAF_PYTHON')
     wafbin = os.path.join(subsrcdir, 'waf')
-- 
2.30.2


