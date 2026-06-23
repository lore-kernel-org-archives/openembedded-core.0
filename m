Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD827CDE007
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20458.1782220486740769692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3q9zeNKP;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4908b92904fso80113905e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220485; x=1782825285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX/kHUxfa+LCnYOehDouzHV9/zTtokhkAeJ8FtJb7XU=;
        b=3q9zeNKPhoevKNBL6ePfNxxArloRmcm6mDDbk0bW1I9dAG9W0nraEzWG78RvOL10hq
         4J7UynPnmI1n0kfkcvW1bA83i7f+jID8xymLQAq60JxVLdvxZ/99CI77unwrvqq5mjo/
         Dzm+jpkHUn+rj7dmsMAwEy1iDg7DIoOeR4l/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220485; x=1782825285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XX/kHUxfa+LCnYOehDouzHV9/zTtokhkAeJ8FtJb7XU=;
        b=atE+Ai3foDdMrfoZeRVHkatOtp8R6J96e3hdLusX16k86qU36HBaDyzI0XEzJlC0bb
         wTQoQJfLAizOcBngEGr+TYSrh3wmBZJRs+3zSkD6VuY42clwD/88du479hbHOArvPPK2
         daVpb5EOP5tIRcfexuQ2IP+kZ05YuZqr4xvZ8rRY///Nnnjllw9aiWgKhXqSrg1l/+q8
         wfPtHUE2JVcAQVlVdmGrhiqRMUCPYksVKDQG04v2sQNcA9BfZDOYgqj7pG1J0Sbi/1qw
         a9OiAJ7reHVj8ukYG/g/sS/SXmnZHz3h06wZXByxrPizRhGKraeIf1A9lbX6JAtTT0bC
         J7zw==
X-Gm-Message-State: AOJu0YwNhOdajDaptw56pfPa+dnj1Q/f1AmbcS/8UYljJhxsXpe2TgSt
	/shIXhCSWsHPLwdmD7avvURqDTjGiJpVrvbpvVGE+UpcSOia1HyOJlVqtSk8HOkNJRYj6r5xU6N
	w8EVp
X-Gm-Gg: AfdE7clZvtTRDhsLA85HK8dpKDLZo88cZqxF1xrtbiJMCqS+ZCotYLvUFBqOjJJL2yC
	h7DsroaCN1KYPHMW+/h+aSu1tfS/ViZA2CXunNjh8bNzXtZYiXSeZ1af2ouqMv1daKyDJLz9MR4
	v72K9pY8krrh6VqF9xKoN0ITqVismTas1WTk9XnU9YbUQqRiw6LoFKfSREffIa9majgjUxz0Ver
	11s/3r4PX1mQFhslK23mxdRTYKY9TgWsW24FBU9b+IWBls6NR9A5mdGAyPLm4VHxweRMbLHqzAW
	4qMxbNoJkJ8mg2GA/1PlP2/52y53c3dBzJUBn2IueSe8VmjqqB0mglHTKcMHpfF/B8s49/PKEc9
	xF5lNmhnLJW3EBLPViy/IkA9cv83E8CsTeC3gfHsY8Pz6AO+vpwwDlmmY4GBAdygLZB58DZlvWy
	G9vPDo6HJlRlfrzzcKkIAOt09DCqLBfUt8QpoqjUpfw6avGxLPUPySYINrQKVr1hEXkNWJi5XRh
	XWQ4e3iQVFXZSSW6Q==
X-Received: by 2002:a05:600c:81c5:b0:492:4ed1:77cf with SMTP id 5b1f17b1804b1-4925b35338bmr36013445e9.11.1782220484753;
        Tue, 23 Jun 2026 06:14:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/26] go: set status for CVE-2026-39836
Date: Tue, 23 Jun 2026 15:14:06 +0200
Message-ID: <324359dcb7cbeb15ef51f5cc18924f590c81b1de.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239390

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f85104d6f15..c825ebd25a3 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -65,3 +65,4 @@ SRC_URI += "\
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"

