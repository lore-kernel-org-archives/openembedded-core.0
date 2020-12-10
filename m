Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.12478.1607604806980462508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 04:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0/ODERj;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id 91so5353089wrj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 04:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EHhhFHGQW9zwM6wh+UjpLtiHeL9wJJsU0oK3L3sEXAw=;
        b=i0/ODERjf0paZtTYnVrlpRlBXJzuDQ1PymraYChJXYv+wQ77z0uVI69+iBcVhJDy91
         fBTvXPNcHOXzpKPeiMf1RCxI5BaqfdX+TsdAlFFOztJgtw2JDD+4es5hIZlz5y3UFWGX
         1ORM8+MBK52BheOdu97NEFwxhDqEdjaXuBNvHDmt7ujTdNNdt6IsSzi70VKMxXie/Shq
         KkF4gi7E+SWYlaeIAhOJKkSe6XVp3mnhZjSGZFt8OzoT7xRqA63aMP/BXO+Jjs8DwqiU
         pnc+y207+4M9RXQVeSBBoEehBV8QUX/iSEccbxIB0Y2q4vMF33k9JxmpsmD/+ZFq4eeM
         OduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHhhFHGQW9zwM6wh+UjpLtiHeL9wJJsU0oK3L3sEXAw=;
        b=BzWRsuiFKETGRhFIwDz3qOKwcyHtP+ZPzL6oR5sxieSCYVLTXJ+aykQFLOsNyKFJrg
         GjZt5rlVu7UsNjsMc51Th8P9NunufWy8/17zIROvL3XIoUrp04ACYzt9LB5ajowtGt+A
         3zDavfC345a6sQD+Zhc3OZ9UHMwZQdCytO6XjqizoyP86CwLD0gxkRAcI1KTHjzdMf74
         9LUDYM/2c/nvbnu4JyDazsKlDtajAweYAeO539JTBqra8oo91X+KH69MBsUVABTYa8K6
         eYHuT3Ek3NMdL+IxYrL27+L+MByAsuGY04lCPZ22CgUu043gnBVbyGcj8O3wH5c6PVB8
         OWyw==
X-Gm-Message-State: AOAM530FZYCYi4TqfTSEJ+ZvN/LGBSi5+NQTdmJ0x3mRS+KzFvYBFqUH
	RLAmVHvkzeeePd7uKOkA5EilXgift5u30w==
X-Google-Smtp-Source: ABdhPJz0tKjuig2nj/eHYH09fiF/Ds6W3TRbpT2x3QAujKGlxgMfc2P7StaOSvHw2PehXZTvEjeUJw==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr8153448wrn.245.1607604805324;
        Thu, 10 Dec 2020 04:53:25 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id c4sm9521793wrw.72.2020.12.10.04.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 04:53:24 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
Date: Thu, 10 Dec 2020 12:53:12 +0000
Message-Id: <20201210125312.3302065-5-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210125312.3302065-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Some libraries are now dlopen'ed and skipped at runtime if
not available. Add them to the RRECOMMENDS list, to allow
users to exclude them for smaller images even if generally
enabled at build time.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index f20e86d94b..951bffa23f 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -603,6 +603,13 @@ RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-conf \
 "
 
+# Weak dlopen-style dependencies: if explicitly requested via PACKAGECONFIG, recommend them
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'qrencode', 'qrencode', '', d)} \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn', 'libidn', '', d)} \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn2', 'libidn2', '', d)} \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup', 'cryptsetup', '', d)} \
+"
+
 INSANE_SKIP_${PN} += "dev-so libdir"
 INSANE_SKIP_${PN}-dbg += "libdir"
 INSANE_SKIP_${PN}-doc += " libdir"
-- 
2.29.2

