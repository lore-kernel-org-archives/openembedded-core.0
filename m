Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.105580.1597910481338843132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 01:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NXfdh1bF;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g33so757145pgb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVIbZAuQ0LZAq2bmplp1jCqjeRRlPB8iDX56h/Tc1VI=;
        b=NXfdh1bFv4B+8EkqtKD3l+WQWuCA/XiU5d1GZOlG6C1l8ZRViiGng7kpeGmszNu3ud
         YOhLfcLh5fnyH+TTv9DZ7iDqUIHgpS8AhjCZjVieDb/4UMOViChPaRWDJhK3D1OAg02F
         zcwBCcXrnNvUncI1srAywvJyhQ7qCZpsDAkxHIDr2o7Ltw+z7iMly4JHjPFFk7LdR/iY
         VCCxMB/p9sOmzk4HYOlCKVa3Cg4OyyKMocpBH+EwK84BBv2tumRRZP/T81t+bmslm77U
         ykLdfnKmU2Nj4EaUX30o8ySLsvMuJkUpLpYFUzzf4LNmBhqyY+Nwoe3wC/AzTro6z8hC
         PeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVIbZAuQ0LZAq2bmplp1jCqjeRRlPB8iDX56h/Tc1VI=;
        b=gmHNGvInQZgZYozw+x3bzD57j7HdCSQSr+sbtAn5h2U58O2Jzn5F7CGrNf0GLErdQq
         PQhtLsszTBX3KGaUE2tFH+F0+aORlXl2mK9/pIFhh8T1MFewQkXh6+ZBowp+JZI0Q/ht
         vCWNXW9W14DRySa/7fpbhB0djnU+OBk0LzlN9+inHby+6WNJQOIHWWG9wrHFgRBpPOJv
         /GWjO0JqzAMPgQfbI1qF9fiw91hgXdppnwVPADYxmt33TRHfVE85v/t8ouakrwf8WT0w
         ZK43MofK37WGdWGAZayCfaJLlELQN+ZWdS5RQUpina61GJGNp2bbZOlHlK+RWasECuPT
         VFhA==
X-Gm-Message-State: AOAM5337DEakKfqhaHQrjzvK4g5EU+etaY7pO5N8I3NxpB2Nw2m5siY2
	/Xm/E0jBcqO739nTne0QS6JTvRhC/WA0Ng==
X-Google-Smtp-Source: ABdhPJzIIR2MhfO0aei8nVNCVCkXh0QgeKZjA0/3Ye1RC4kwVEMJpXvzxNKFIpd38dWD2oEvriN62A==
X-Received: by 2002:a62:1a56:: with SMTP id a83mr1353078pfa.314.1597910480028;
        Thu, 20 Aug 2020 01:01:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id mp1sm1402119pjb.27.2020.08.20.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 01:01:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 3/3] gcc-cross-canadian: Correct the regexp to delete versioned gcc binary
Date: Thu, 20 Aug 2020 01:01:15 -0700
Message-Id: <20200820080115.2715139-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820080115.2715139-1-raj.khem@gmail.com>
References: <20200820080115.2715139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After gcc 10 this expression needed to be adjusted, its better to use a
bitbake variable which we do have readily available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index c5935b978d..d3875c94d3 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -106,7 +106,7 @@ do_install () {
 	rm -f ${D}${bindir}/*c++
 
 	# We don't care about the gcc-<version> copies
-	rm -f ${D}${bindir}/*gcc-?.?*
+	rm -f ${D}${bindir}/*gcc-${BINV}*
 
 	# Cleanup empty directories which are not shipped
 	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
-- 
2.28.0

