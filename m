Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 312367198F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:57:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g8so18497683wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Kxi6np2WAtqolUyyy+JP8xL+c2Hsg0YrPttq6TCO1E=;
	b=wsCIHbJXDJyxSLnKabZInHZevK48zNNpSla/+PuuKymvRwySE8p8bDDfh4Tccehr9o
	1pyb4CDjXpUk4oSPaljDDUXL1zvePnhmJjBMRR2rMIej10g/Rl/xusZ9AlfLNlXC2MzA
	1FUSFR9kAAR1VOmjMR35emJUTNUjdGpUUc1lNZFaNHrmpAxOzmW2Tj/bPOAuWpAVVmvr
	fx+oZW8alfTeXNfDBQBm2Mn41a29G47lRQgZyv45qlTKhWNFx3zMcu2ukJLhpVz83nJl
	UxbagayxAC98uQKQQAJQJHTS1+Vvo9/z6hStsfG9oY77eVe+W3N9y0Ay+mCgWTxG1B/p
	bYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Kxi6np2WAtqolUyyy+JP8xL+c2Hsg0YrPttq6TCO1E=;
	b=ePlwzzeZf6u0s1ZJ4kUSKkDdqcgSL3Stern78ND8XXLD1HSbO6G2tU8FX6AmLVzBb6
	WSgpwVk8JQvIMKG3h8kXUEzw1Z50sX87FcuWz6VNGX1d/dRfO+JHmv4Pno3PdHyFkXcD
	TpstLQ26OB+QvQ7z114+73AKdyHVUJKvc2P7STMq2YbKpRRoi2tP88LOqD8VxB11NrQJ
	0M/gKqqXgw3a7NKQi0HKtJZ8SocUD2NNZrYpCpRhzqFDk3wNeAyb9QyhBDwYEndFxrty
	HPCQJPpVEFXRijhFGypUVsNdISD9EYRCorKcWRNsPOBkoPg/Ro9/02tXeEYNHZETfW58
	6tng==
X-Gm-Message-State: ALQs6tAXNXOGtO0PXpwY4hY+sOpwdLSGVVoB22ZlBOd4Mtbe5MKIYLya
	gFdPVCMt0u75Vk6ss9Lqd5a5A+Dk
X-Google-Smtp-Source: AIpwx490sOfwi9rMhtGe5t3tEMEEzZ59r9rL7p0G7O9UduZqrYOepQg6hU48p8rqb0MVEVYheXIMpA==
X-Received: by 10.80.212.204 with SMTP id e12mr22150581edj.275.1523275023590; 
	Mon, 09 Apr 2018 04:57:03 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id b31sm266070eda.70.2018.04.09.04.57.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 04:57:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 13:56:57 +0200
Message-Id: <20180409115657.16651-3-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180409115657.16651-1-koen.kooi@linaro.org>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 3/3] python 2.7: fix multilib patch to accept multiarch style paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 11:57:03 -0000

Using 'basename' to strip the prefix fails when using multiarch style paths.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/python/python/multilib.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 1116dd5..3577eda 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -11,7 +11,7 @@ Index: Python-2.7.14/configure.ac
  
 +AC_SUBST(LIB)
 +AC_MSG_CHECKING(LIB)
-+LIB=`basename ${libdir}`
++LIB=`echo ${libdir} | sed -e 's:${prefix}::'`
 +AC_MSG_RESULT($LIB)
  
  AC_SUBST(LIBRARY)
-- 
2.9.5


