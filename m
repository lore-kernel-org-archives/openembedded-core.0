Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D4FCA6009
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48866.1791301594257708454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pv4Xbwoo;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2724366f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301592; x=1791906392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQHCuQ8FK3nsGBLpVMLHlaTWt2PwoS9btnzncrcrhPY=;
        b=pv4Xbwoo7HfayKAO4l0USZS7z9B2cRNm9GFvq+sRppIoUFELoyb1YV6ScLzgmy/MsU
         C8TVdo4gxVXd2d2v1LkTe8MNkwdHR9GTfN7UGgXkjCnwLEu+alW6S3UCy0iAQDUmI5kQ
         GOspnD4QE0lC9qgl4ccTvimuLIOzjSO6tvTrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301592; x=1791906392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQHCuQ8FK3nsGBLpVMLHlaTWt2PwoS9btnzncrcrhPY=;
        b=fuxcU0w2x81gVIszvOSkDAIbwhGdnJ/HR+VuTgOr07ST8J4TLZfd++wNocCCVPtYNz
         aAlah+j1jlTyqg/nih3glFXznABZkvxFqXUtJd472cC5GKIQAWk/eMCdqW60wPy5oJ9T
         9oNWL9Jk1c9u5xxAgQtrWEowBHpdLp0AbhBipgjWO87JW8Ng6pfMF84OMNbAhXF3Ctub
         HvGH70gk4FQLdrcEFdJvOYD3udGnNSPYF5qzEx2uTUPXj90pIs9qs2IrCYTNYW4dUbaJ
         HzSlTWba29rnj5pj8P7fWmXhHfvcdHwMWj5SudvNnGbmBDkGcSniCnmaflQbm1WeHoDl
         UNOA==
X-Gm-Message-State: AFq9FYLZUWOCN9cEhZwwyxNTXcBVWEX4UepkwNKgiVhxbNTs23+ahOGs
	MFHa5OMW1i+ZywFT7zG6U7igPUnZtSe9wG9CTm+Fl1Kao8NymKEBJwWel4BuVL13AD1I5OI5zTC
	5EcRLDms=
X-Gm-Gg: AYBFou3EtEM+rl6MzqxrySCC9LJ+35O0Bv/Q4OGcQZFa6VDyguw0FPirp3nwuRST6iO
	pHar1v3nT/RAvUVYLCa/XxDLlqKBL+Jxw0sqCCVwAlRSsUMDcBPUTXhZ1pQQc4yfl+rlO7QTo6o
	rqvjj3+iPEbT0wGNVu2wMjqd6UBbq5mcPpD6Ry6KRsyKPsbH8sNbTaAcKd5qC0YLygd0DlU3Wys
	mBFOh6864ohyouw3FoVqfq3wZx0j4TMzXXOfZmv9qTWwL6UfHytzaxDoRmFU8nct6LZVcbPvpny
	B22HJdBEd5fBDxEGIdVvG2fblOm2xRd/R8gP9y0B5fsQgI8R60pFcJbcj5FZ9aQumsg2KTGpmY5
	imrfRJowCOoOMZGvOD3v88qCc0ELlBfULs/unHT1qOd21WZfvHnDR2aFvokAOfVXanzhlpFVuir
	rdXhzKuA+catC0v0YIMpxmUT41VrqrP+jL/olTN1AN5VDERy34Bp/vo97riMRROqXmOh1cvRD1Z
	ZeoLhhGYRR9eswQ8BFiDxaJ92S4jSc1g1lp1HNlV6l+RpeoF1rt5Fcl+ZhInydJr6KOdnZCD7x0
	2hMgdg==
X-Received: by 2002:a5d:5e8e:0:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48c4800c7d1mr18087090f8f.46.1791301592402;
        Tue, 06 Oct 2026 08:46:32 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 12/19] util-linux: update flock test patch Upstream-Status to Backport
Date: Tue,  6 Oct 2026 17:45:58 +0200
Message-ID: <fd4cd57dfdcb6f6787a256a77cb601c0aea810c8.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247298

From: Pratik Farkase <pratik.farkase@est.tech>

The "wait for flock child" timeout fix has been merged upstream, so update
its Upstream-Status from Submitted to Backport and point it at the upstream
commit.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92026bfd34a6f8392e310d8e52cdbdc826f8aaaf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...0001-tests-flock-increase-wait-for-flock-child-timeout.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
index 7213b007861..30fc0641f1d 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
@@ -15,7 +15,7 @@ Increase the timeout to 30s. The loop exits as soon as the child
 appears, so this does not slow down fast hosts; it only adds headroom on
 slow/emulated targets.
 
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/4639]
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/ab519f323c620a32b21a0861285f1a4a5591d3dc]
 
 Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
 ---

