Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1622.1618790795967350615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z3/Ym8LH;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id d15so21304793qkc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6j201mV5Rme6/KYqz4i7ynFYiEOkutf060CcWJwkkx0=;
        b=Z3/Ym8LHDXPAJ/ECJjuY1ywPe43TZ61Ot45GW/xnrY7xa8RGbRUWGn0CkreJOri1+W
         k3kXZQ6hgWb/wcXK+oCABSyTZA8JiQomLFQsffqgQt4WOIHdQMkLEEyPKi+gr13fJP1/
         cBByV9afNOwSGSoI5qgdqP9fKbwHE+oEymAJPQCQ6XAiMliJXjFCY2ESG8zwBCKC0USY
         8cmpk/NLJisKvbTNo/zFJbVtCw2wsPHjCqZBTHEHt+AGQyXdCuggwQMW/pHJuSjcfPVj
         LwaQJtgTJ4DofdhwUGQ08y6ha5N0P2hyx4mckrtzlfGzAhibILlCxfBvmSdB+B2fiTvv
         WJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6j201mV5Rme6/KYqz4i7ynFYiEOkutf060CcWJwkkx0=;
        b=QA8Tdv8VlBqdfST7998OFWFfPKjmJ6UkPFTq3dd5pGR9QuuOzwWiDZXhILLTsDNTkU
         Npm9JKOnOzk6rJrOQJt3Ktga1IQzDR01cSNtV2OaenKF8mraMZxGNZCnAXmCNTi3HtEW
         ZmvgZLGaL1ch7JsBAgjDgOFwTFlE93/ble3TdCjg/JU3HviP8iKx35zDBYVQGZZuvhMg
         WOI3ToH9V2fH1tnN2hWaP4itigvDMnjcnIXyQ6dgJ+SaEiQHy+zXnWEnv9gKDylfJ5SN
         /+zbxwiQFpDIRQjdtSt3YbTDtvgpB/5pNWmiscP/C1dopQn972ZYwcBi6utj9Ui+M87h
         hReA==
X-Gm-Message-State: AOAM531cM6CTdKP+Fz31pc7Qo1IZZYmXFFZp3TEyXvLD6pAwyM1rdCBt
	lyBz9xkSmdBpshyk07vLiqw=
X-Google-Smtp-Source: ABdhPJzZbFST+Iy9Le1D1it8ez5/7/jhyVfeyd5fIMUSu2sDySm0ECrpPxEel2IK3gWYfh3C0jhL5A==
X-Received: by 2002:a37:43d4:: with SMTP id q203mr9833827qka.124.1618790795164;
        Sun, 18 Apr 2021 17:06:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] kern-tools: add dropped options to audit output
Date: Sun, 18 Apr 2021 20:06:23 -0400
Message-Id: <71952a3534b9570aeddc867207074026c54e0675.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1618790681.git.bruce.ashfield@gmail.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The rewrite of the configuration audit code dropped the ability to
generate warnings for configuration options that didn't make it into
the final .config.

We integrated the following commit to restore those warnings:

    symbol_why: classify based on config.queue hints

    The config.queue has typing hints inline with each fragment,
    we should be using them to further classify the options, and
    not only relying on the special hardware.cfg, etc, files that
    are part of the meta data

    We also should be checking for options that were set to a
    non 'no' value, and that don't make it into the final .config,
    since without that check it means we are missing some warnings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1d900d85fa..70b8518304 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "8f6aaab7f64c6de30d267e31a73f7c3bb30125a9"
+SRCREV = "00dfcab64b85bcb61208724a1588662184ebdd59"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

