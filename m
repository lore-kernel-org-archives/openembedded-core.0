Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.1448.1610718030285203728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 05:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mMSwa6wc;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id f17so10369164ljg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hm7XZMfoN8/aXDIrN2AwMEqvVaFFKBe9vGxP+TAOSkI=;
        b=mMSwa6wcfkqKAspp0NaDNaFw5mbvkwYK6LyUM6kXZj0UQz5KXFaQ3akDCeNSskuiMP
         WZeGZtFJ8XFHBSYU25vmHR05LlFxMEcdlqXF5KcQmCrPbVipHjQvumkxYTD9+gPXx6DP
         /Ud+wYNwgzbiN4oS+Nz9f9zgzcB9IykFHisHUy5IRnbUxSDtmU8zVP3kD0OLpzcV2jP7
         YfF550KF2oTBAIlup1HXYe5DFKfrmLvGXzmZqhoag2vfQfJI0Aui5jVf+Lh29V55H885
         j8WrthQlu6Gks8cKbmuGY9maucYBcgpubGpvSA7zIiX8KhiDVdYPMqI0X1jxymRo9PDB
         k13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hm7XZMfoN8/aXDIrN2AwMEqvVaFFKBe9vGxP+TAOSkI=;
        b=smGC4kiyhJ1kD1FOyV7Za0CHDmkZCE++a6pAC1KURxmRp3MawAdwRnJ4qsWwHSdRxU
         Cj3PqInYcfezxb/QIpMBIlQNteKH3HlB1vTkJx4dsawjXHcMsBU86K9VYwYREmkDjTbp
         W7EN1YXp0FL9gs3hWBt0cKqqEEVOqiDyUziRVMCqt68ICqXey8gtouPE9Mk1QKVXpzfN
         AoOZsDpy553l8WeTfmFKtWoUPm7Yy1tqYfk5XHK9Lo3u0sD9RxciW5vuqMslu+O/kTlV
         kxm5S4g21GWjo9rbuKBHw6IsTI2TefS7KDM/VbskhsDp1YxrfrGDiMAKlmjipA6JX8zj
         vuQA==
X-Gm-Message-State: AOAM531ZQ1dR3caITR5WElp4QianjKO20SQ703NWE+hHnaFI17Qyhb+f
	EMsFdAmFZioG3PEdR54RzWo8qNhUnis=
X-Google-Smtp-Source: ABdhPJwAMZB+4G8BMqg9DK5WX6ePfGQyYum/vgelp3F7M2XUtF2+upH1ZsPtygaKuMAyK106z2BSlQ==
X-Received: by 2002:a05:651c:114:: with SMTP id a20mr5282739ljb.392.1610718028071;
        Fri, 15 Jan 2021 05:40:28 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id r18sm904337lfm.184.2021.01.15.05.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 05:40:27 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] lib/oe/utils: Return empty string in parallel_make
Date: Fri, 15 Jan 2021 14:42:31 +0100
Message-Id: <20210115134231.5824-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cmake.bbclass we set CMAKE_BUILD_PARALLEL_LEVEL using parallel_make
function and if PARALLEL_MAKE is set to empty string then this variable
is exported as "None" causing cmake to fail with:
"'CMAKE_BUILD_PARALLEL_LEVEL' environment variable
invalid number 'None' given."

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 468c76f30f..9a2187e36f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -193,7 +193,7 @@ def parallel_make(d, makeinst=False):
 
         return int(v)
 
-    return None
+    return ''
 
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
-- 
2.29.2

