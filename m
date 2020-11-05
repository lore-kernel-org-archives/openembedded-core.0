Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.5955.1604574173903917340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 03:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=ZBBRwHAC;
 spf=pass (domain: nathanrossi.com, ip: 209.85.210.172, mailfrom: nathan@nathanrossi.com)
Received: by mail-pf1-f172.google.com with SMTP id z3so1214256pfz.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=bdvcqs5f7eSdzCIGYUuuhNu8ZkB1dBlB1SK9C7lwbI0=;
        b=ZBBRwHACVERGMkXjL2dzc4vY9GeKtyHb5xWZxYG9t9cZjUdzj77C1SiNIxf5gT9QZC
         Rv3S/mCyi+nE/D7N6dLnLePmlg6yXFomhW24HXjC6VjkkpvKXZQwGPHxvlSvzcGfd+WL
         lz4H2JIfewRMbgCmfgN7jj2qKZkSlusAHXsbQg+gBReuMHQSUQluMaQz2pPFELsn0Oyq
         Q/HUH3HsGLYj3iZVlwh6Se2reNTFA/rK+uEVCGH1UzRWVYX4d8U91i9X+pwKNF7t11MX
         jb4JA78DYvh/UwOrHN28yBUToEzHkEsHtJiw08XKv5T8Ewj45Mawb2xIgVZ5xjn7e7rs
         FoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=bdvcqs5f7eSdzCIGYUuuhNu8ZkB1dBlB1SK9C7lwbI0=;
        b=HJxKEE6QfrRJTKlcRAE5WsUpgEucPEtA92s4Vhs9v+tPwmHgfw6mYyll75QZ9wIsb+
         8S8GBvJ3aqOaEW2hO7l6m/qERVx2O3jN6N9U420cFzqovm/zyvH9DzF9YKdu9qbPcPoM
         Bgp+3Jrf5yotmy/LHcMBhQGUq0S0ijrnih//x/jx/vs/TZC7YLbzSWlHjNTJlLgC2FFq
         ynu2HKv3wT9PXSxxkru1IuPfB4S2rMtxrHPAK9U/gFXVj3jfZqh/ezF5b6HJinMy9kbL
         oGFYnsPnGKSrNRzRyErJ8w23TGBqrj9w+gBPBhKsfiaEGcWjKiiKREjJNSjmW9nUj/Gw
         z+sQ==
X-Gm-Message-State: AOAM533SbtmBnQ155XgNMh7PDLcDlIl113F7nd3Y514AohzIN/mO5Wok
	PxCCTk5fRCApdzlib2WwnwNfehtK1udU8yFy
X-Google-Smtp-Source: ABdhPJya2d8uScNij2Suqb2+WuetRGQGENKD5AwilrdkFZb22Sy8BWCFTYJYFvdUjonkoyAGiiz8zg==
X-Received: by 2002:a17:90a:fd8d:: with SMTP id cx13mr1904933pjb.138.1604574173206;
        Thu, 05 Nov 2020 03:02:53 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id i10sm1781056pjz.44.2020.11.05.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 03:02:52 -0800 (PST)
Date: Thu, 05 Nov 2020 11:02:47 +0000
Message-Id: <20201105110247.417380-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH v2] vim: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Enable nativesdk build support in order to be able to include vim in
nativesdk targets (e.g. buildtools-tarball/sdk). It is useful to be able
to provide an editor in a relocatable form for when hosts do not provide
an editor. Additionally the vim recipe provides the xxd tool.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Add detail to commit message
---
 meta/recipes-support/vim/vim_8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
index 709b6ddb55..7e4654e472 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -3,7 +3,7 @@ require vim.inc
 PROVIDES = "xxd"
 
 PACKAGECONFIG_class-native = ""
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
---
2.28.0
