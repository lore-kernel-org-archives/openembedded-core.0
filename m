Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.3199.1613534460597536529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 20:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIm10dd6;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j19so19312307lfr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 20:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Th6AOXZ+aXGjdFo1uNlhJnA+jnk7ns2KBHuYV2GIhG4=;
        b=jIm10dd67IW0sAo0We967CrVPxrZWLqezQIeGm5tTwcQvMeNQG4Y9CxHzsJx0IXaGw
         Gg/qDq2ExylyXYh/uJWaEDUPNKu61VjtsmcVQVHDBbJdnKULZddcvc/mxAeQmH/lyRlv
         T20qubjyPDPdKse1TQqI9W06tSAyf7WWPRn2fujD+0rSsV5tiBIody6OOVF81vwlmULN
         Z/nXvlLYnmEPeoKxrzIQuI9UjIn22Lz0gusDLB7YAP5RBLRoJQZ62qqurWtsymRKfiYm
         CiDUEmnxV6FqAoQC9ntv23+DL5FpYnuwGpcMg/PHx1HdZeL02FeY6uRoK+oWaPU0ZtIh
         giiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Th6AOXZ+aXGjdFo1uNlhJnA+jnk7ns2KBHuYV2GIhG4=;
        b=sHQ15V0C1WjlSZRHy16jboSD2/nLrzD9EiJOdQQZTy8zRHm6nbKFzbsE7lj0uMJ9Iw
         M7kJFyaNO1nPgNshQt7Vv30x+UKyDEI6g+aFGoXi4wVWRBLR/Jq9MeIFpxoh344ahb4p
         o8y6T1sZV3lC3goEKUfdEOvSnNgp0BkgG+tZeLzWPBkHgz9BkoFMLVDMjoWTnkWQbjEY
         j1TPpHORxdH9gQ1UmeCimJuTcQ01+8R/ezgsy1hflWtPuvQGA9zUxEDYZM9T9U+7A0pT
         t44Vra/+ZDzE/Rsetx9rN1IaKZO+wiwEclQ5/x7krWpejwvzcgMKku1essqGnfE8+W6b
         S55A==
X-Gm-Message-State: AOAM5327eqor8w30RJAxksqHjOJ0cHfu9f1mFa2C1hgIuhuLI2UkV/lL
	jjbnL4R941x1XeM0Jd8ddyuIYXhmgJIu9g==
X-Google-Smtp-Source: ABdhPJxOagqSVU6B1PqhjqXD9n3JCOI85cAzoam7YwuX1arUF9uK5rQWfNMeGjh6FS5iqttmUQqMtA==
X-Received: by 2002:a19:6c3:: with SMTP id 186mr12558889lfg.399.1613534458754;
        Tue, 16 Feb 2021 20:00:58 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.101.17])
        by smtp.gmail.com with ESMTPSA id 5sm101464lff.176.2021.02.16.20.00.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:00:58 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][RFC PATCH 3/5] package: Remove false positive lic warnings
Date: Wed, 17 Feb 2021 05:00:31 +0100
Message-Id: <20210217040033.21541-4-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added text to distinguish licenses from sources and those from recipes when warnings are outputed.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 14c8475cfa..782d9d00b3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1780,8 +1780,9 @@ fi
                             computedpkglicsperpkg.add(lic_)
                     else:
                         computedpkglicsperpkg.add(l)
+            # Displays warnings for licenses found in the recipes and not sources
             if spdx_lic - computedpkglicsperpkg:
-                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglicsperpkg, spdx_lic))
+                bb.warn("License for package %s is %s (source SPDX headers) vs %s (LICENSE)" % (pkg, computedpkglicsperpkg, spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
 
-- 
2.25.1

