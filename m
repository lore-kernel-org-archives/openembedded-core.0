Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968A710A62C3
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47406.1774529493584040749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rN5zfdbk;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1522640f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529492; x=1775134292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=rN5zfdbkhwH7aJoOuYhVqCeRx0QAQo2Vk0eAMw2oOSMOW3t/uEBOTDAkaZnzR2Hb/y
         v48/DXNzRBXHO6w/ucYzLu5ZP85Ww2jCCU2fqaPhy8wQ2tOiwHVMkzm+QN92rRNf+FmK
         xulbE5vs5pyLDWi1RYGv6T2RzWpx5nnIJS6voCLPwNSJF05hoJlu/0jpCr5nlbWMX9gx
         V9NCbmVIQ4BY7zI/L/C0YYX0Eb+axvZIRSz3I/ScqvQxZk+UZ2Q1xC+INuFCR2CvNrV1
         QY+34FY7z65RrIys04tHJnI77duLtqAzufOfBCJUQ69uCKcLCog4eVQIJbJINqV9dmHr
         Ft+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529492; x=1775134292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=El5rtaKWwqXdZSxpy7Gg4QsVQ78ToHvx0KrZPj11tGlNWsX807pWUBeL7yWlfkrOm5
         H/F2LrGTJd7zehhoHjySuzKzPwVLHNc/k173qL7YenCg2ByvWj6Z4JfjEycr7grPnpZs
         oeOYr2LReBFIdKn1+rYBOEWMG82PVMaSNap12q27f7dGXUb58/bfYHkR4GPTP7JoBm2q
         FjlO9PwVIULMmD3F4QmguldDpff3WlX2epkNOttA9HTCqjJ6tvMrDCm66onXy5tMRXPO
         lrQFf3UOSg3zI6/HE6/jiW6vdbj0aOZasBdKgDReMHjNrXd52Rz95KtN0Xwv0IRvq1Gf
         /25w==
X-Gm-Message-State: AOJu0YwJwK/wGQh7Eeyk4AYJpQRnK1f7jNyaVlFHDw7zxD8WXa+x7DAN
	I9guPyzQSU9BVyVXDeho85EFPJ7TTEJwq2D/pSAL4OW+qtD5e9AB/MYhVuTTuw==
X-Gm-Gg: ATEYQzwiiAtjoGovTtla+jDieJlsogVQCUIF4OZ48aTRJ7QsqmHus0MP6kDQdNrzk9q
	51ijNLkpVYZ4yT9skYUX08k/fhBBE6IFf+2IFuqlMCYYkV34k9M4zT70expE+T1iO37xVrB5gyO
	SxTEsRJaEtUteqV6pOIKnG2elVlZIwt8ya0DZxJaRhcZeZPTniweu2YZ3lnAh6f6kPlbMrl24KH
	hRDmCJhJFatikZS1FCquYzyCj4BWqqlYhwAdNXmdQvFWjzGuWFkrDMP8XZqCwQQ5VrLKu2pFXwM
	pfNLj62jr0MbWxcAbK5C4d2Jg2QSdpOCDZYrlljSJFPwxxEnHpRSSJd6IWqT9IDncvcb+SwlaLe
	nPRI76fjlwc3WlWO1rbUyEVbJOkiMbqPox/4gBLpdBalT4KDGTn3uRcZLYVXwgXKjiXR2Wk+FYp
	xBWZcExUK3ZHO6/g==
X-Received: by 2002:adf:e183:0:b0:43b:4166:b855 with SMTP id ffacd0b85a97d-43b97a4b81emr2522968f8f.14.1774529491572;
        Thu, 26 Mar 2026 05:51:31 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:30 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 11/13] libcap-ng-python: Use PYTHON_DIR for FILES
Date: Thu, 26 Mar 2026 13:42:32 +0100
Message-ID: <20260326125113.1853869-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233996

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f702056f02..f13c2eba17 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -14,4 +14,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
 }
 
-FILES:${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0


