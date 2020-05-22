Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.6224.1590114177797083859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 19:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id i68so7256433qtb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 19:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=qDXMZrPX9DABazsQnYSQwcDujItizlSGRE1ad4FOFg0=;
        b=RceCOyWKup3untqnKezccJ/0Y3NTa71yILonOPp21rGK0Q/dS3c2gtkfZKH0ITukEV
         hha6bbjo6MpWGzQgkHc8mV8FMjos4IkHyFkQKZno/eCYN6DGnjwCC4fOMv900aEqlf3j
         zF/Y2AgwDy4CCzGeU4koebll8BanQnehLYSc8AVSBaW2YSn4zl+KS668kDCYij7V4vic
         /kdPbDUr13p+fpQ4XZUJ6hk4Vu0vqyiK8zYFoO0ROYE6rFb8Bb5kvH0jQNxNeH+M98yT
         fKGbZo/AfjJ1bf3CWjgtYH3IzoLLTwQGR6zA7BuA+gy4ArTO1nrafLU1mhnu4AjgUkPH
         X2ag==
X-Gm-Message-State: AOAM531DnOl7uhtclWQsvXTmYOHHBol3HjXMXClB+ajbTmuC+pt/NItw
	+wQKjQ2TE8vIMCDjLc/TNkKXWQU4ev8=
X-Google-Smtp-Source: ABdhPJxiuRuPh3s50zIPcXj+cYjr2GOY/cq3R11Za1tHlfpTEKGJIbvzmcyO6+LAvGbUMBRuaLWxdw==
X-Received: by 2002:ac8:2fb9:: with SMTP id l54mr12916586qta.211.1590114176705;
        Thu, 21 May 2020 19:22:56 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id c24sm5975539qka.25.2020.05.21.19.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 19:22:56 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] glide: Avoid use of 'go mod' support
Date: Thu, 21 May 2020 23:22:35 -0300
Message-Id: <20200522022237.3568393-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522022237.3568393-1-otavio@ossystems.com.br>
References: <20200522022237.3568393-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Glide utility must not use 'go mod' support, so we explicitly disable
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/glide/glide_0.13.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index ebad0ec60a..31295edf90 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -9,6 +9,10 @@ SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 RDEPENDS_${PN}-dev += "bash"
 RDEPENDS_${PN}-ptest += "bash"
 
-- 
2.26.2

