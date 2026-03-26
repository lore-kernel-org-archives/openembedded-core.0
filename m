Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C018110A62FB
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48785.1774535440308390587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=av1RAQDw;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so960864f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535438; x=1775140238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=av1RAQDwc/dJAEbyBzC1BqT8eQL1dQOBnueb+Q8TVNsP6TG5Vora3KBcsIHplck89F
         RekgGNqb2j9SWo1RHHJfhWgKBo3Wu7xsIzvO1G41z+iWY9+ng9caQnW7ZIAfWlACwrNa
         OT1BUs/wcNysrN2uU3h9TBfdhLzTd1q694SUdu1VQF5ODb9/XvxZNIGMHeSBn1VzfX8T
         yeYD6QgZa77EXgUoC6dNHJ/1uetq0xDbSS4rqjqqNTuY0dl/F7eSpZJs4o/G75ISmDcs
         v/IBC/t/iusAaXaNJ/TnX5uOKEWdy0bLDi6d0DrzL5DUExQLz1ypwekV1SUiWQVpKEZe
         +ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535438; x=1775140238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=fEoHjOuHhsVc2xSWX4H55quYh0YgMaO0zNcut2R15o59WwEJjiTa3PGeWuWdqQaeu2
         Oap2pnWFA8B8+TyR4Ji52MIJtRIChMyFH8N4SjZBBw750fEHcD8Omemgq0WEzDNKj5sB
         nPsdjYw9krX6hnAF4lXIj615WyCjLYF/bgHxNVouPcO7g3WNtJbd1QmDUYPWd3RXp+Zk
         VsmeaqQVkia/sW+dppVDs2EkJApuGjXbw20l6fPLs7UISG50n7ycIeDQM7rahmPr/pNx
         vllZpMZU0fwsg5QJ/ruEFEblEFvq6jaxlb+kD1p9W/ESCyMZCQGk5DGNft2MlRrAdSE/
         gUwQ==
X-Gm-Message-State: AOJu0YySXvxUKEzEvg1Ue0SKkuOIVDyPmbdSzz39Due49u+3Y5LeGOcx
	UX9ZhXkav6ySy4YdYWNNcoedN+1yNqoPaH88ZnooWoUGGzTWwR8GYqfBWAkUFA==
X-Gm-Gg: ATEYQzz8iUfu/BE6j/ZSrvYEDDNZOJB/08NmrnCKaRWumgBhuadv73g+5XxHZmgxjjK
	aX8190MSrcngeglk4dg4HNrCmZ00JKinlC5LnRnJ43+rQrxDfzysPF5w+YtI52Ha5Q2kW1GsiQl
	ywyRqPbc4p2BDywMIMhxj4TGo2GdMfv6pbIMExtJQV/LQplsn2zUxhtQ86Dc+lZJ41q8XH8JMIv
	JGwKZ+mrhB9UMU4zGharZEf0o7GwsIbp6HmBWbtJrmEeOC/UAbFfMxVbeHYF+zux369wmnahvVY
	0859DyD2kW/2KU2K6BklyopKsc5/HZXpp+LX6GS7OZgeI4i/1JLINNcY6gecoo8DgMPamVBBsaR
	vIIRcS1T+OB0C9RkUrJwKfYrJ+6TvfULIK5lZGjSdKgsnKyveWMAWquQ6bRMS30uxxyyieDj3xT
	e7npJY1gT/7Wk3Aw==
X-Received: by 2002:a05:6000:2306:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-43b889e34b8mr12043043f8f.34.1774535438311;
        Thu, 26 Mar 2026 07:30:38 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:37 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 08/12] boost: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 15:30:16 +0100
Message-ID: <20260326143020.2083293-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234011

PYTHON_DIR now contains PYTHON_ABI, fix the settings accordingly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..7b02ed4282 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -174,7 +174,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_MAINVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
-- 
2.53.0


