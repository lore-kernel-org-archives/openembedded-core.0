Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4249.1614119632756212465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 14:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e989Zmxo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v1so10232wrd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y8aOIYJ/Wuk3xkwOs0XSiW/cOl1olw1Nh6DR1phIJyM=;
        b=e989ZmxoBnhkX7TQV8PEEnY2HrkK6rEmmeXThYUWxWd81PkzxCm27lDYKwpHDb6Q24
         Vo0c5gpXAYVMhJRbZxl4ecaAc+qWkT6TZna+x99uYCpGRZxfhoakyJADrrhF99ao6+xB
         MgjHAT741qZ5UExqAzsq56ZGoqOjjDnu9b99Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8aOIYJ/Wuk3xkwOs0XSiW/cOl1olw1Nh6DR1phIJyM=;
        b=BpToVxDv1mipNH0AIbYShWs4kUvUeU38cOMmThmbKUZemJSzj3GuHVoGJFOkqiXman
         w/9bKjc7B1UPPc/Bn8wQ5nht8+c+UNci+JmIXyyDmTyB+pSdKjhWXPdxB+Ef2735imOQ
         ikuppBHOAnGh3aDz5Cnv1opIz3GN46zidESs/XcGceYUpqBaY1mMXUdSxhdWnzqU2dD0
         GeAhPKsehLlMYJCHYV2J5MAQt6zWqK1gLMw9GC95H9Cr3I+zkH2RNc+r+JQACBGRaAyb
         QbL1ctrg9T5PtXbLC14faskG9UjUd6I1+8/pK4Pof/w5VEljVM2FzPGLQLI/lyiVCxiQ
         azmw==
X-Gm-Message-State: AOAM532DOybxj+PvsVv5WVlFE9e5iq4TgkCkEEV94Lb1S0WZf8uCOu2F
	7j9ZtNProXiLXYNN63BH8G8v0g2eQG3tOA==
X-Google-Smtp-Source: ABdhPJxlg0QUwV7xvlhnZgnSHHt+wfZoR43RWi5ApYts4wmUierXdDT8ceomS3l/tKcZNvDE7rxqFA==
X-Received: by 2002:adf:bc46:: with SMTP id a6mr2548834wrh.418.1614119631274;
        Tue, 23 Feb 2021 14:33:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id z11sm1529wmi.35.2021.02.23.14.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 14:33:51 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] babeltrace2: Fix reproducibility
Date: Tue, 23 Feb 2021 22:33:50 +0000
Message-Id: <20210223223350.3809626-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223223350.3809626-1-richard.purdie@linuxfoundation.org>
References: <20210223223350.3809626-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

babeltrace2-ptest was referencing the host's python version in it's
makefiles. Whilst this could be fixed, its easier to correct the
python version being found to the target one which works much
more effectively and solves the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
index c65882581d3..32ba75bf366 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest python3targetconfig
 
 EXTRA_OECONF = "--disable-debug-info"
 
-- 
2.27.0

