Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.35497.1612792427783568260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YqrHhQEG;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id m7so15594331oiw.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B9pMSz1hi0khgmuW5sYuf/C5IWoUrKGb/+HduQgCpMw=;
        b=YqrHhQEGNIdevxW+LbgvafNvRE0LWzPaFJ9Qywrcldd9jKEhd/IHkXD8iyXN4aEWt6
         ckl5GM8gSpefTyCzNTTbRFkXy5r4N0uCgylLosCbKS69EUeUBWRuCuPV2iVk/xnJZ0Nv
         H/Em3MSw89rqjeU/LbJYpKcYMOnhdtkwOgLAEqofxdJ2lb+6vve27+3aBUOxqlFrFEYS
         4vqNbASZTryFfYRaz1jf8GG02DzzfylFfqjgkIuRYm2L+HONrulCVexKT46KDYMZyYN5
         tlMzY4AI3dKKFaXtFjngQFWHXc/rlSdVt9rzIoQjO+ivL+ZHHiz7n9UniLdDH/kg3UgQ
         Notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B9pMSz1hi0khgmuW5sYuf/C5IWoUrKGb/+HduQgCpMw=;
        b=uCLqlSRnIqRmpVj1VfxAZ0tlkfW1yPut/925tjNioWkDewf/9RTWbcg6DS1T2v3dmC
         wq0t9WDOXEVHDXuAdIrx7qaauH8D+FnkUsirhCJwnBu7ZhG5NRKynpATo63Fhj+QAS0D
         RYwe5oybjn0SNugtROJBLPT1Jhwg+RaRDWOU9Anr3+AOXXEuEQ9G3hyNJPCfyHtN6Kfb
         Hvkmcs45D794sqaaH+CkTHGYOPxAqAV3xRrdEgTiYO9rqn1OpxLtID/FG8E0HHHd/RNI
         KAANKDOAV/rMmpzyW9DtTNXziRLFTvW3LexaEWRNb3ppLYExUeWmCN8GbDBcHKSUpO9+
         uxaA==
X-Gm-Message-State: AOAM531a9UMM7GXLgCD6dZzVBRJC2jRB88LU+dV5LEtKuOB+2TQJHtTZ
	83Yfqx2j3baokne+U50TnjYpKZ4R2HmmK6hA+Po=
X-Google-Smtp-Source: ABdhPJxK5zbgjEXeaYyU4/rlGFcBsIIAIVJfDOYnocEjOZKGb7uIDqjS0jybzqwUYPCeZNbLxTiy+g==
X-Received: by 2002:a54:4706:: with SMTP id k6mr11338669oik.56.1612792426725;
        Mon, 08 Feb 2021 05:53:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/28] package: Ensure do_packagedata is cleaned correctly
Date: Mon,  8 Feb 2021 03:52:02 -1000
Message-Id: <4c4775d3e8ab132995ce4b69fab7abef8bff4a4f.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In an earlier commit, libprocps was split into a separate package leaving
no shlibs in the main package. A bug was seen where igt-gpu-tools wouldn't
build correctly in some cases as it thought the librbary was still in the
main package, throwing qa errors as a result.

The issue was due to an extra file being left in the sstate output of
the do_packagedata task in the shlibs2/ folder which contained the bad
shlibs information.

The reason for this was that the temporary directory used in this
task wasn't being cleaned so files which were deleted were not handled
correctly. Add a missing cleandirs entry to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50f17d0a655a3a2556f9fcad67259101c2814a36)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f8074d866c..15bff9c778 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2362,6 +2362,7 @@ python do_packagedata () {
 
     bb.build.exec_func("packagedata_translate_pr_autoinc", d)
 }
+do_packagedata[cleandirs] += "${WORKDIR}/pkgdata-pdata-input"
 
 # Translate the EXTENDPRAUTO and AUTOINC to the final values
 packagedata_translate_pr_autoinc() {
-- 
2.25.1

