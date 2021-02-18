Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.41.1613667411095108659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H90Cxahv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b3so3747974wrj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Wh3g5INp7DdjptWJvs2fTImrUYK3NSJJKaWf13uV/M=;
        b=H90Cxahvjrs13XwqFeETK0mjRCqNxT0dE92vZQ6XVYyUWLxkXtAdPQ1kGN/Hjds5Rm
         867lxMDNzDKvZahieeO30wIV1kK0ti+Bhg/GVnkH5SaSBJojrirbQYcIGUkNTpfvx2VF
         kytHTknaQB1i/gDq1vHl84H9D7eRagr+fm8AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Wh3g5INp7DdjptWJvs2fTImrUYK3NSJJKaWf13uV/M=;
        b=HtR0Uf7DFt0kYmQm7RSL62zeRhxAAmpgYofHHeK/frgJq+um+uF1rz+oCDddYeM92J
         LUQwN8+E4G6FsHij6gLTKUyH127fcKwLrXB/nxVKL6lFNyFKjHp3uK8gaSS96YwYkb0N
         qzOPeIjRJ9pNdhTEmATPK9eUSkkKlvMPC3wP0UU0rcaw6wvu25fox6LjftAH0cMwvIKd
         dQbN/diMvyPn/mqne6QUKRZZRv0Lo6x6ums2+y48iPPphzPX6EedmDspoTOKfftg5Vnb
         RVcP91pvLt9h4V+RqR3crVDYiricZYrGLK+w/W3Jop0sSdkhCZqR7wNuPMEpq0UIrtJz
         9o7w==
X-Gm-Message-State: AOAM532QgPv3XjqbaXbvuYf4uFOJHH1wGoMZLKCur6+TUtTZ40IxuwYI
	vTSHlJ5YvHY9GxxUQKQviodeySN+S5dIOg==
X-Google-Smtp-Source: ABdhPJwTQxcCM+6+qKS85qn4krrsHmoiKI+TDsHslf1k0F0vd+YIoq69k6D+vn+dYF4MHUU2TvBFyw==
X-Received: by 2002:a5d:6b45:: with SMTP id x5mr5008690wrw.415.1613667409361;
        Thu, 18 Feb 2021 08:56:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:49 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] licenses: Fix canonical license for 'or-later' handling
Date: Thu, 18 Feb 2021 16:56:39 +0000
Message-Id: <20210218165646.2109894-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPLv2 and GPLv2+ are two difference licenses with different meanings
and we can't just pretend they're the same thing. Change the code
to treat them separately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dc91118340d..358c716a801 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -252,16 +252,9 @@ def return_spdx(d, license):
 def canonical_license(d, license):
     """
     Return the canonical (SPDX) form of the license if available (so GPLv3
-    becomes GPL-3.0), for the license named 'X+', return canonical form of
-    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
-    or the passed license if there is no canonical form.
+    becomes GPL-3.0) or the passed license if there is no canonical form.
     """
-    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
-    if not lic and license.endswith('+'):
-        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'))
-        if lic:
-            lic += '+'
-    return lic or license
+    return d.getVarFlag('SPDXLICENSEMAP', license) or license
 
 def available_licenses(d):
     """
-- 
2.27.0

