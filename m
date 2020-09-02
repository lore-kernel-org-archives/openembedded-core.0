Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.8805.1599057189173006055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lDsxuByV;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b14so4511797qkn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D0WBqpnChSh5PzynheRhxYmlH1iNDsIGa9IZGlDEwLk=;
        b=lDsxuByV9rZH8XHOl3iP9QH6K9MyUttTkktHQPvCYLxkDf0QO+SZNm9kZnFB6a0ark
         92jnmOn0ZL2H3fslHZO0WV7aK8JAiO9ufQI5sCtIFSaCrLwJSO9CfJNm2/aU9hNHfH0C
         e3oqDlYWMEFHkj1fx5Zhzh7H7qVGhaNXKpnRqHA732OH//8ogF5uMmNqramya2JZfh3L
         Iwz3ZqGWT1y7cvPGKUrnRGYKf553TpVF17oQhD33SF5FwY5vHPKy2AMNNzI5nATvX55M
         ar8SGBLbDiLhtTORyIg0p6itw9mKuM5USI/x3G2o0BBYVZ4XeLN/D0YeMfdLTO+4Gnuz
         h6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0WBqpnChSh5PzynheRhxYmlH1iNDsIGa9IZGlDEwLk=;
        b=fJ2kgMHh+4HspZS1wZ8ZmKd1mQb0RnJfmCEKgMuk4mry9IW/WyX3NTREZKxPvdAscg
         IN1zqYnA/m7o64Pg03iSS33usL9JKT4UuVhaUYhLCj9ZhenBqkOLteXNBgEIqBg8zP6l
         uWdLkoqqdB7BTgW+F3iQzSmBGa+ESgXOx3MTMuR2QN8AVNLGrn3C5DoJvD1JV3Lcydes
         KoLKJCkyn/43PHyPoF3j+f7/ZnBvZeaNg90cXrSH64SikM/8ZXL4AnQpKEHSzybIeobw
         M1OBl53wx+abJASaw2YwtKAfD3xud90DlEeY5gZreyJzG0tsrt5sHQMGnLG7wwi40f4x
         SYuw==
X-Gm-Message-State: AOAM531OLDjLIH+dAc6b1+Hy11QzVUukRT3xoLNaakGTUmEvduKWtfVY
	Tsk5xelSFDriog30HPrzhfM=
X-Google-Smtp-Source: ABdhPJyBa8grDnR2yAsCTF2pbF4q3eavmJP4dFX+n/T4avXnZ5sSBtucfHmcR/gSn1IZqbfgA/uHsg==
X-Received: by 2002:ae9:dec4:: with SMTP id s187mr7437400qkf.120.1599057188252;
        Wed, 02 Sep 2020 07:33:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v14sm4589461qto.81.2020.09.02.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:33:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel-yocto: only replace leading -I in include paths
Date: Wed,  2 Sep 2020 10:33:04 -0400
Message-Id: <20200902143304.22364-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200902143304.22364-1-bruce.ashfield@gmail.com>
References: <20200902143304.22364-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

We just want to remove the first '-I' in $d, hence removing the
g' of sed avoid changing the real path which is include '-I'

We also add an anchor to the regex to only match -I at the start
of the path.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index cb7614d64a..6e74d08dca 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -226,7 +226,7 @@ do_kernel_metadata() {
 		for feature in ${KERNEL_FEATURES}; do
 			feature_found=f
 			for d in $includes; do
-				path_to_check=$(echo $d | sed 's/-I//g')
+				path_to_check=$(echo $d | sed 's/^-I//')
 				if [ "$feature_found" = "f" ] && [ -e "$path_to_check/$feature" ]; then
 				    feature_found=t
 				fi
-- 
2.19.1

