Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C16C44503
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88759.1783067414459976968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JMCqknAw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46ed4f66256so262091f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067413; x=1783672213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIaK4q920o6KcFjW1rcn4iMsz5wIj5igDzLq8167r9U=;
        b=JMCqknAweUi7T0l0vt/gI9SCPID28RSp/4PNeXyINBI9VLhrY3CvabD7XcXgZenQzA
         CIDWzADE6gSYVsxf895QB/qZwj/zyj7jLwYbAKWbrKvPdnjSBiHnSEmxqdOuHbi5bZQy
         0SpHlTZij9xya+jYvqqYHc2Ms57U9JZ1ZQSTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067413; x=1783672213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GIaK4q920o6KcFjW1rcn4iMsz5wIj5igDzLq8167r9U=;
        b=eElreITSd3t6FLmA2MR5+8jqHe2FvUNBzIIFrRLa/8hy+TR2gI/xO7rHZUUQ1xh47Z
         Wk8vaLa6V05qTI0hcrkTyXq+ykIStIUlTiFQ1TmyI7KDtwsu0qoQlQFuqekvIJ3e988T
         blXtEmSdWjOoMlBmFQWZFA5caB7jPSyNiZkdUWflJ8AM+WUbFOJeToNnpzUF6dMR+C3g
         IlmOLxcjI4DOcz51urD9O5XbuKOFONQvomfgfU5LWIYqmmay+jeQiN9m7zzu2GJbgc6K
         2TH7uDvpCRUx2Gvm0vLHBdkROffVAcuoNUro4LfG3Im0YexBhxk6ikntozyGsb7YKcHp
         QapQ==
X-Gm-Message-State: AOJu0YymvTFWifpFj83ejxQYroozWua8Zo4x8TGp5RCsHcA/OwNNRb+1
	zqWJZWjO2j6zHubY8pnj3+/Nc9WTUxaGm5QqYcTTSMjZBJ8C3FKhAJH9zSkFoWnrh4c65vlZ0KN
	Yu+yFWlk=
X-Gm-Gg: AfdE7cn21WGUDKmZfW5ru11cClVo0oGyPDSZO0qhPpHysF8aiNAhvweUplAnndsHklD
	tZf10qH2oN2RFKbTJhdaVjAjbYP/0v0GXf0cVHay1c0Yq0/ZqnUap6014040Mt7d7wdJTq3BF8k
	Fm8cOhBadr5NlliZC4jWkoQ2xBlCXp+vNSckwP4wCfnRc4Qah1PoBRlDt9isSqHpBYiKZdeNTIm
	04pAS6eZoWPsYOyxfwQrIgpyOMxQ/JSq5xlV6ZWJO6rA5+WgmwR7WqsCxsQfFaUYIoPBsBJV0vk
	JcY/YJ6AUvVABRkSUv1leYIQhjqx/jZ64DaYKHJzqZxA95+u4AVNdJsRXt5Gycv6j7mx5JesyAe
	zjQCOdN8YkzmzmFsp8MkI40fUKpPKudrlAINRmL9+HDW7cNCyXZbd1S6liDz8v/mh7lpuzgpd4f
	s6fsTL7+prNQQiI6nQbCpUG+28y7KOs2km+OvE2HxcLw==
X-Received: by 2002:a5d:5e86:0:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-47759c267a7mr14329781f8f.3.1783067412417;
        Fri, 03 Jul 2026 01:30:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/15] libjpeg-turbo: upgrade 3.1.4.1 -> 3.2.0
Date: Fri,  3 Jul 2026 09:29:54 +0100
Message-ID: <20260703082955.1585712-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240096

According to this commit, the zlib license does not apply:

https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9ef0d03e1e5f0140636215afe627954b81602c38

however the zlib source is still there and still used by libspng so I'm leaving
LICENSE unchanged.

License-Update: Upstream changed the wording around zlib but it is still present

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../jpeg/{libjpeg-turbo_3.1.4.1.bb => libjpeg-turbo_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.4.1.bb => libjpeg-turbo_3.2.0.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
index bb8d1207f29..ad9c640ce99 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "IJG & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e22220994831d7f0b91d09d94c89a63"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d21daef3b4b318f77062055059c72934"
 
 DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022"
+SRC_URI[sha256sum] = "6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)*)"
 
 PE = "1"

