Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EA5A074538
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 13:00:42 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y7so25747805wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m6EHETiQNggur87o51LLsHR+vptmYvcvpYJJVE5s840=;
	b=mbKvt44/jko5S41g3YJ6NCmyX4UqvjdcW/wFwiY5CywkRFtvWsI18TgSzOXrHzgD6R
	QsDhZiALxLtVc5BJGXa9ifwkuN2gvw7ZE5vcoadI6wDlWBm34cdv6JHOf+2P14T/sMQ8
	dHYAs3DsY9lZpRDz0ngg/DvBIHgBeBASv6nUxu7Iz6yaJig39PYXsxlqUxj37l+P5Aq4
	ZJf3RtyvK7zzQCt+Ep++PQ2ZEEg4oPs8HAtQXTYL98c6bR+glScdI18WeRdB7ZiiBPn6
	UCECjdS0lG3m0XISK/oqPezRNjgsdY6MkHD55tT2Xx7Wlb6zepvFXZYdEweB62XlQ72d
	h7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m6EHETiQNggur87o51LLsHR+vptmYvcvpYJJVE5s840=;
	b=bSzbt5sINUwgbaKHJrWqYBUYLXmHNexCvuksR8EvCGSmwR+ZmFnvUgObH1a7IwW2ec
	ACIpqVmkQ0SC8E90T4oK9wz4E3B1jRrltwcG+UKFZXFP678HqDKdEukpN3sX/g2847Gy
	dPCzXuF2qe4V8faqlldVPC/PS3VfIe78phMMsJp2C30lOPZ2VQ6T8N3kGnSNfwqhZ8uA
	g+7b9qTG8SG1s26yzTy99L4B7V/rLZ/LvPGFGGhT3iIlHVu/ueEYMaUUvqqltlFWgxlr
	LjX0nupCpmCmYS6Q1rQrnOY4b59TAycu8lChfnC7sup1botXWy7Cz2Cp1QwSZ0dICn+P
	pEow==
X-Gm-Message-State: ALQs6tBAwjAJP/W7Zya2h3iL8XOsGE489LebaRGCnCT8Hb9UXVLOdwh3
	wOl+bXJrLRL31abRnxp+W7yGLT1m
X-Google-Smtp-Source: AIpwx48oUV6Vtl+RgU03SZyUYmzqpRS/YY7wHOahdNslUz2eivQYCD2Ld9K4CKaGIFsmnF2+iOAfsQ==
X-Received: by 10.80.137.201 with SMTP id h9mr31807918edh.225.1523883643260;
	Mon, 16 Apr 2018 06:00:43 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id o6sm3422518edj.31.2018.04.16.06.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 06:00:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 15:00:21 +0200
Message-Id: <20180416130021.4428-4-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180416130021.4428-1-koen.kooi@linaro.org>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2 4/4] python 2.7: fix multilib patch to accept multiarch style paths
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
X-List-Received-Date: Mon, 16 Apr 2018 13:00:43 -0000

Using 'basename' to strip the prefix fails when using multiarch style paths.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/python/python.inc            | 6 ++++++
 meta/recipes-devtools/python/python/multilib.patch | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 979b601..84bcb6a 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -33,6 +33,12 @@ EXTRA_OECONF = "\
   ${PYTHONLSBOPTS} \
 "
 
+do_configure_prepend() {
+	libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
+	sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
+		${S}/configure.ac
+}
+
 do_install_append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
 		-e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 1116dd5..d24bc15 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -11,7 +11,7 @@ Index: Python-2.7.14/configure.ac
  
 +AC_SUBST(LIB)
 +AC_MSG_CHECKING(LIB)
-+LIB=`basename ${libdir}`
++LIB="SEDMELIBLEAF"
 +AC_MSG_RESULT($LIB)
  
  AC_SUBST(LIBRARY)
-- 
2.9.5


