Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.33.1613667412439739534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DHfn/7b1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id i7so3092320wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R7SVYhmGWZyupDAnfPcjWQDGCZVIgU/CzFLvkasTzLI=;
        b=DHfn/7b1DRpLwzqFrwkNmxiQZbk+n66ZG45doDxrGZD9bDhdKpE5JlM4Q6l8ECCgA8
         iVXP0DU7aqFOwd6DX3hEghFYal8XKTYDmzvCMfXV+od8ArqJVSeOurOGO6ZprM3KtARE
         UbLfb//TlIojjccnzP3i9LFC8GZmPFvQzsKCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7SVYhmGWZyupDAnfPcjWQDGCZVIgU/CzFLvkasTzLI=;
        b=eqjQNOiY6oF+iO6sDC4OA95lF9JL4novz/8Mg18Gf1wiPCAuMYjN1ClZuZb6YvbLVX
         JsntPcayDvNg6MSvr5cFn02KFwhu5uJ0BgrGH7DTBjczLkjlOIAs3Sf69JfNqAcC7FCv
         1ROzob7Sht+sMV8H52i9IqowTwEvn9So6OFefN32dc2daYpKQFk3DmYK7Thabf3352AQ
         13akLQ1edCxb+R218lygFFcniEi8mgxHKa3bke8pTXds+DE/UeyBDhRlQtm5PJeyYJuX
         umyDihrEE8JjnuWnPwZBLsDMcoDu2VfoN9k3NEWvzYkMitGp9qW3RJ3+ZvuUlUyW6Gzu
         +6MQ==
X-Gm-Message-State: AOAM533iQwZhh+or7LoKFpNUHzlZHY7ASvooXEU6rtmwKJsAQRQy2irH
	T43l71VfwdLap2ILK76uFhqC3oek1jBOCA==
X-Google-Smtp-Source: ABdhPJxm6033vJD7dUD3Qj04YSCh08k732mcvpWRvAw2NGHdzLyZ/iI/gOqsRjdJwfYgLvwYWZHynQ==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr4448954wma.29.1613667410834;
        Thu, 18 Feb 2021 08:56:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:50 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] license_image: Do canonicalise package license
Date: Thu, 18 Feb 2021 16:56:42 +0000
Message-Id: <20210218165646.2109894-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function being uses here makes comparisions with the canonicalised
license name so we need to canonicalise it for the function else
the comparisions don't work and can give incorrect results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license_image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index c96b032ebd4..13178f51eb1 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -50,7 +50,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
         for pkg in sorted(pkg_dic):
             if bad_licenses and pkg not in whitelist:
                 try:
-                    licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
+                    licenses = incompatible_pkg_license(d, bad_licenses, canonical_license(d, pkg_dic[pkg]["LICENSE"]))
                     if licenses:
                         bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(licenses)))
                     (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-- 
2.27.0

