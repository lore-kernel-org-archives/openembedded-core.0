Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.31656.1590746533911635555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pgXGcYB+;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id t18so2839300wru.6
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zxiABiSFJE6g8mk1YKJmTkaeIZvEDmGOrtB1hOGNV/A=;
        b=pgXGcYB+uHFpo/YG9tjZ0bq+pFV3/uKBJ74uC81GENRHfTPjGhSL0Hht/4XXJydrEk
         me/c58iV2/+XV4OZWiAbCzCmB4MILvO5TolMlXiHD0BowHAgd4seMFkgFgJYMyD6a6C/
         /PBPUGyOqbXuJpG9OLZ4EHVrcK8HfSZ04vWxaQQ2hMWah1mr6l13KrDLkDprIJ+pYfH8
         BpAgK+8ki4LmvJ/lJV76IEmc9XRBIM+4xaYU37Ad8/m7YuvZRxB1g86AW5WbS36MRllD
         163MIQiD+NRgQhjyT40Qa7aUfRhWRx6gdR0twRp32DcNtdXwVLMJYTDCYMK9ObnmU3jj
         ptRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zxiABiSFJE6g8mk1YKJmTkaeIZvEDmGOrtB1hOGNV/A=;
        b=XOZSx9v4iQ0dToSlxXG5/Dxm0g7AKJjzPAgSOQYbIsNBztnhPIE81dGq117gJw0hS0
         lHD6XenwdNF4zOCRKXg3hvavgoUA2ptPr+mQjqflbAljGgSVGWrKbmrI1gLFrN6KqEXG
         nAV0S0eAJbO4aTstgrX/NyynqVfNKX4ACH3prfTyLAaaLaAHcE1QfQH5MOxoDRs/Onm/
         2IDHvbH3JRkGbs5sMEsxKjkl/aG8FWzjdbFjAUA++RBfN280XVEr4EkHz6pQMWVSGSip
         z3tiCFzQVoXCpyLTwztBgcOhSinGw+RRAYn/J8GROVXH/xogBAfQpHPCa+bySvzPTfhv
         eKlQ==
X-Gm-Message-State: AOAM532npLr6ttfQVcZJh53nNZZ2XO9gl0PL5AHvk8vYVTy8hYNrBcT7
	fGgJC/LtBWKos66gy/ZFBdMwMWxjfuU=
X-Google-Smtp-Source: ABdhPJxbKVewbo/9vRrnsAx7dRA1Ajh473p3aZOJrxQqfBWbr7iWEwv+5FHqoUPhoWe/SEywn+GfWg==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr7913386wrs.100.1590746531710;
        Fri, 29 May 2020 03:02:11 -0700 (PDT)
Return-Path: <maurofrqueiros@gmail.com>
Received: from ctw-bre-003.criticaltechworks.com ([83.240.214.249])
        by smtp.gmail.com with ESMTPSA id u3sm9445322wrw.89.2020.05.29.03.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:02:11 -0700 (PDT)
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [PATCH v2 2/3] git.py: LFS bitbake note should not be printed if need_lfs is not set.
Date: Fri, 29 May 2020 11:01:58 +0100
Message-Id: <20200529100159.32393-2-maurofrqueiros@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529100159.32393-1-maurofrqueiros@gmail.com>
References: <20200529100159.32393-1-maurofrqueiros@gmail.com>

The message "Repository %s has LFS content but it is not being fetched" was
being printed, even when Git-LFS was available and "lfs=1" was set. In those
situations, we want to fetch LFS content, so that message would not make sense.

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
---
 lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 4c7d388e..eab76a10 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -509,7 +509,7 @@ class Git(FetchMethod):
         if self._contains_lfs(ud, d, destdir):
             if need_lfs and not self._find_git_lfs(d):
                 raise bb.fetch2.FetchError("Repository %s has LFS content, install git-lfs on host to download (or set lfs=0 to ignore it)" % (repourl))
-            else:
+            elif not need_lfs:
                 bb.note("Repository %s has LFS content but it is not being fetched" % (repourl))
 
         if not ud.nocheckout:
-- 
2.17.1

