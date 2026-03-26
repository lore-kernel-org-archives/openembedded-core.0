Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD9210A1E98
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46597.1774529490548599394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OKhJ237B;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c6fc2910so595195f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529489; x=1775134289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=OKhJ237BhI8QCvhMPh9z9q0/tzm/hJ99J2IogiBeMEktshjqvc+HhSyXdFukVdVkI5
         fZwhckwpq6f6nNLksXG/1r3ExeLOzzkQxVgC6tZD2x2uJjLPX48K0buatp2qF0ioBHm2
         VemjI5m/rElXGgF465bAiBnwW0j5+Frf5NSbzjnFyXnhngZaJQ6KYUf+yb60IUXWCWqi
         HoTdja8qORWk9krh1wNW8bbDB7AQuJvx4E2Fj2k9Yj5eOYKZJt20Wkne2m4WRIMiI3Cr
         I9Np3+yLrYdmsd0Qj1XQJ4Wr3+9rUc2VgwXsLzzudDVK5W3LjrI/JumWNtvu5h5gjsEO
         bvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529489; x=1775134289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=B7G+hsYVwnBO9Peeyn3aJNb/a1Yi5EmvE5KieEmUd2PvDkrfBYJTtgRsOu5ll6hZ5T
         MGczLWNBtCEkFxGhjdGT3QwVNQvuGdBMPqKnMxTnYovFanoANDlji/1WMjwsZp1o9pa2
         6mhmG3ksj9utGfKU9SkaWPIaJILpEIBRdALB76D1elUyP7NdeEtMF4PORcE5T3DuN9UC
         Nm6jxS1zP6QpUIIE37m9nZUixDfNyBZ2iWucAYLwOV8+18tClcjkDN8HVr2gFXTDhUn2
         dbAsAGGVwuq8zi2wDvb/ZkJN2NuLzF5mBAeiu1TAbMZcqeDjpO1jkxwQwjRskN6FG5bZ
         Vxgw==
X-Gm-Message-State: AOJu0Yy0uhg7EZADKOiQbCOXxZW4vyocUdUPKPtCiPdgp3KrhgbZ0Nao
	gY4W5k5jBycGLdgaYpBFg33PYRceCEb8kzPGvZzPFqZVjf0cgNLe3thR8gkKNA==
X-Gm-Gg: ATEYQzyhQlGHwfEmKGdCdDnR9kVWYuYZqyomH7l+xafFetQGrzrZfsJaBBZq3vswdRL
	IdouLOiMJ8yZYE3XIVf6EIKkClP3KMXukevOAIyBE4yRBK95nSBsEsWz/QHk2Z8XDX7DwM58EjT
	IWB7+t1exYHbyUvXniF0lWNOhGufXd1Dbmu2WW6KITA3id5mKbYDuLmZTteE+c2HvuU+W4LgaMA
	HdHVF+8h8N09UpHbjg+RRPmKpGOAqzGJ+ko2EWcOk+FoPnOnsY7HOaXiIbhsCX1VVWRm4Eksb5V
	2gLPHAIw7ZmkHAnM8G9TQBruBJL7aKEdwQ1/LRkqjTjwd913+40MiRZflVb5k3Z9l3cVwOKy9T/
	7FlnGysr42mXtcGcGNnHRAfUOnJim1gvGQ4t3PMQxUUChzb7tfe2V+OLT6IWEtZWj85FYnkuLzp
	DK+MXv0ZETm5XbYQ==
X-Received: by 2002:a05:6000:400b:b0:43b:86f7:2ecd with SMTP id ffacd0b85a97d-43b8899d1ccmr11822637f8f.8.1774529488637;
        Thu, 26 Mar 2026 05:51:28 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 09/13] lttng-tools: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 13:42:30 +0100
Message-ID: <20260326125113.1853869-10-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233994

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..ef80c53e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -35,7 +35,7 @@ INSANE_SKIP:${PN}-ptest += "dev-deps"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-- 
2.53.0


