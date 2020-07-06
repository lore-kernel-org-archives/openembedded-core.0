Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.61437.1594051904726500479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BILev5zx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id s14so15510489plq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ORMV81O3czUIFwW3acp12shk8AyCXH1SXzuEkqXDnaw=;
        b=BILev5zxgIHl6BmrQk2sGuUOi05O5vn//TynCdy/DFplT3PYFyNseY39rKyX8Fs8fO
         7auow7Zb2x/YW4ghp/c3v09h/jv2UrkUJuQG/zjvvk05onHDEwzc7idYG+LnS+4Z4UXY
         Y/1fd9RvvRxhYqkMfcChAciS1FxyaXjQZTLfjlY8DetatiM0IHbv8dNqcH3thX8XZiKL
         Xf4a4DFf2zsRmVEGyEGubC3SX0sGzpbhbMiegT7i4pLPrEa6rz/GJgIa1G7yxiBBJf+X
         BB4MrfZNLFhTJUMzgkhl+aRbhnTkHm8yUzUnGHPc5K+El4R3ZvMoif4n289u3HTIakyN
         6HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ORMV81O3czUIFwW3acp12shk8AyCXH1SXzuEkqXDnaw=;
        b=d6Dz1/NCTMSRbKbhocrm5IqlFVkiyHUkHQlSXk4/EpKz7InMuQQ/tj5Q4eqfbQ/zHT
         3dv1LPP1yc+Gcs8+QKObSCJt0Dgr+e3th0v7gQciy6Jtrw9mbqLW9zQMSeo4Vjy+5sfy
         JTtmtQJhv+QRHKvfvUQ/OLS1mNUv0ZN+RLrKzGWCOv0CRm1HqKtnRoyXAHkAd0QqiZpb
         CB5O7/tVdkNSlBbIzGSY8BCQsGLVjlcK1jEL3kJM5pjVJztbJ24KpwEjCtagCv2otN7S
         98/qFs8Bg8Fb7tNQRpnVxl4yl2ouD+DvnTsx1+RQLgDZVKN2vG+Y+fiba6xacMhvLFWd
         0o/A==
X-Gm-Message-State: AOAM531hYTm4xhGv/lJaAIuK6P9ZkJAH5YvJ0ROX80qEe8bzHZtUDFle
	6OtQEmZJ1/jKJOwUi13PX5MA0r+PA0hMaQ==
X-Google-Smtp-Source: ABdhPJz53luaCKBNWSCwdfrOzUwaK4igzCEu53i29zmjLAjhluQuGmmaxVl+QaVaR8pAX9qfGDOO1w==
X-Received: by 2002:a17:90a:ff09:: with SMTP id ce9mr34061549pjb.149.1594051903798;
        Mon, 06 Jul 2020 09:11:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/25] oescripts: ignore whitespaces when comparing lines
Date: Mon,  6 Jul 2020 06:10:18 -1000
Message-Id: <70499483b859e98d2b7b279ac79f232cd7bcf61f.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

list-packageconfig-flags.py determines the whitespace numbers according
to the longest package name. This is reasonable for the tool as it's
trying to generate pretty output.

However, in this selftest case, the output is hardcoded. This results in
"pinentry                       gtk2 libcap ncurses qt secret" not recognized
as correct as the expected line is:
"pinentry                     gtk2 libcap ncurses qt secret".

The difference is only about whitespaces. So we should ignore the whitespaces
when comparing lines.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17c89ad1596dbc7cefdd2c01dcd95aa9e93c5dc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index f697d29b50..726daff7c6 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -133,7 +133,7 @@ class OEListPackageconfigTests(OEScriptTests):
     def check_endlines(self, results,  expected_endlines): 
         for line in results.output.splitlines():
             for el in expected_endlines:
-                if line == el:
+                if line.split() == el.split():
                     expected_endlines.remove(el)
                     break
 
-- 
2.17.1

