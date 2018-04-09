Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15E667198F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:57:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t67so18666070wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+li2hcEdCoLW2q1B8Occr9WYoXPn4/QrMYT/rqFt86o=;
	b=sbxI3WZSmTcqcVLvzhg5j60o5pryYGj5fRIVaFMd8Cvj3eXWvr9heRECwqcAjDuIq+
	fwCVLr70xNDJbQHP9LfUiiBCndRfQeyX7tm+J270bhQalyKql9+JFJgmc0UMnN7I8cME
	yJBGatVASfRFymMsw9yIE0JvX8Mt7H3nJXg2RbymlG7omaKsQ3cQ0cGAOuDewmc23wAj
	TAhq80yMbfvnyVG6twN057bpikQEYHTpRv1nGgvpI0aE+YoLp5rYM5irG6ikfqt0e8Sf
	McbKcnS5vmIAa35+6m2+r08RBID7jSmiMq3mhb6ukhKIM6ZZSEEU4lNMbDJBejgZj3DB
	iEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+li2hcEdCoLW2q1B8Occr9WYoXPn4/QrMYT/rqFt86o=;
	b=VWOi063kg5vjkimFcIksnFpBbnoTUdXBbzkGs555KwXK7WGu3/pxZZx4OFDcGKQiGo
	y9fDNCotipOKvVyfyLdBqRHdXMA1rEi/OvbBdyWMcFktJH/12/wnDjeGxkKqrrXRjGCq
	RXJWL6OXDOOlcpY8JwHHZMhKPyJoH2GjxBHeTpg7/gpt2id7KS7OJiMtpqu7gUdQXTp9
	75gkBdnHXvq7UzQCUtkEatSWAMs+Tkvyc8U/vzLcXJggfjt8Zqjl3WsWinLGjAPDZL3M
	//OMw6Fye3t+MLH/DqZvGxGTsNja8pflNCiIwf0C/YK7IJad/vfc2p0XDz6GLgG8XIGQ
	2lSw==
X-Gm-Message-State: ALQs6tDDpOGX+RDqSEE3v037Zb3Qmz0+Xxly+vqBNGlx15wqZHNc2BnP
	0otPQsskSKPXqwjGm+J7iREwdY/T
X-Google-Smtp-Source: AIpwx4/HlwQW8VE861ReP1wJxOv0YGFTekRGMROcQMGvih8unJsaKLGBAPZHZgauA7I9QUndeJv/rw==
X-Received: by 10.80.235.65 with SMTP id z1mr21607999edp.154.1523275022169;
	Mon, 09 Apr 2018 04:57:02 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id b31sm266070eda.70.2018.04.09.04.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 04:57:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 13:56:55 +0200
Message-Id: <20180409115657.16651-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/3] libcap: fix (base_)libdir usage
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
X-List-Received-Date: Mon, 09 Apr 2018 11:57:02 -0000

The recipe wants to install libs into base_libdir, but uses "basename $libdir" to derive that. That breaks in a multiarch setup. Use the proper variable and remove the inline python usage.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index d619a2e..47ecf34 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
 EXTRA_OEMAKE = " \
   INDENT=  \
-  lib=${@os.path.basename('${libdir}')} \
+  lib='${base_libdir}' \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
   BUILD_GPERF=yes \
-- 
2.9.5


