Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 68EDA7473F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:57:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r131so16237996wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f8iXbbB9CDkNiinaPRtBmgmCOmpoZhwwJ0F6WBv4Jtw=;
	b=JHErB7T2uHMz607zym1eBUlfEXyNnd5Jb+emwKJlX2sh67fAG7Y4U8PigdCb4rzU2c
	NHDZxZZcBsVHjcZeMHqEJf60xXTdGaI4RIysCdeBhT3mSCHyANzgX2TYIU3wZ5xchIlY
	UIrvcdPd+QW8Kbzw7CjfL9SIzrIHoPYq5W6qF6VdLyhXXmUopu0YuHU5yiN1Up8J8Odv
	gCqRTPHNrDJIHF51C4adp8nLJS32ws/QaGQ93i/tPKsucYL1UOVdqhW7MNteEkm5tbqP
	VEkzk1jGAmfukyFA6aKZ2jVgVM46H5yoTdsyiN6nbuhm2ptnA9ac5iPSC0ThJvhQL2EE
	m9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f8iXbbB9CDkNiinaPRtBmgmCOmpoZhwwJ0F6WBv4Jtw=;
	b=C30doX8/fJORkSkJN0imBVK9jqJWd61oXQN3a8SXJDFgKOdGKV5eK21f665w+kJC2j
	6dYD5GkI+hOw9erPR1nNLhMW/T57zHq2YpShtJu/xMaIcJhxLPvYEN7a/RllGvqePY5s
	43XJ8WClabTUFndHFPG0jThTiEfTK5EQyl/h/l8H9qM9HF0H58sZx5kWS93LLtj0yzJF
	JBKun39GjM2PeqWmihxm/Zz1dLDFchnVLiceFE8GlnDA2BqBRxatm9hzZktOsvmtJS7c
	V9JfnA1pfQkF7wqUc07pygMtYj3QXbpCpTDD0+1FlOyYK4gkYrxbI+0lrAfbfgPg3/RQ
	ljTQ==
X-Gm-Message-State: ALQs6tCe1yFOuKqpGTZpuEDhTxFIDJo5GdwXpYHd0LmZTA7v0d2qVrV2
	TfP+EQS0fBUvBKVRqM8iemX3/pcs
X-Google-Smtp-Source: AIpwx49WdjBYsfdK/Zkme+iRbmxDRnvaRGqni9B1avgBJSzCwr04x/RSuIRzkMcqwVh4dEMpG4orUA==
X-Received: by 10.80.139.141 with SMTP id m13mr21576866edm.164.1523275022858; 
	Mon, 09 Apr 2018 04:57:02 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id b31sm266070eda.70.2018.04.09.04.57.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 04:57:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 13:56:56 +0200
Message-Id: <20180409115657.16651-2-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180409115657.16651-1-koen.kooi@linaro.org>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/3] bind: fix openSSL detection when using multiarch
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

In multiarch /usr/include and /usr/lib/<tuple/ are not on the same level anymore. This change will pass a correct includedir, but a wrong libdir, but the linker picks it up anyway.

Tested on multiarch and regular build.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835b..20c8d7b 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --disable-devpoll --enable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
-                 --with-openssl=${STAGING_LIBDIR}/.. \
+                 --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
 
 inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
-- 
2.9.5


