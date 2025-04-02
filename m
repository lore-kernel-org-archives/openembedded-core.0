Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060D7C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2265.1743577912350255690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z2f2sNxl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso44121655e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577910; x=1744182710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQOc0Kdu9azAPZQO81j7pzsx5HLUtl4lBGaufmqYIXs=;
        b=Z2f2sNxl2lOPc2jJlrcqvJ3JYWW/mrSpX/3NBEGSX3VesBdebM2HumRezsXOzDpi6V
         6HnJKNMP050JeNkmfDKGm5m9tLDSDZlV92bcgUklyNUy5Md5X2leYjAi3uBmdEGy5pjE
         JmqV2AiZ+4dScOZRPikQnnEJ6y9vhCT+omSYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577910; x=1744182710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQOc0Kdu9azAPZQO81j7pzsx5HLUtl4lBGaufmqYIXs=;
        b=r9jwECCtjY8UHxSn4HPeNW11G9pmdK78FCYiidNw4fBVSRpyXgzOeeXleNcBwJHAEp
         LHXL8rHH473vWHOJiczPVlBpkYZQxsL+5wY/43iIICU6MEwPyQ7YBzaHJ5hi0Vh9NGq6
         vVFlvP6LCY4KHC+/d8bh0Y6QiqzZgbw+BK3XB4j4x4icRSZD+/AH5ws/Mwxu19cISGJj
         nbFWnThjVzgKWUBbR+3bI71p2AjouYlwdwsQklREQUJxIEhzJXBvnrnJNHR01P/g106J
         A9+a2gzZLzLjG6uRkWMv9KoMlrFGXmkw0nGN3KgxPZ63QDKlkvolXW/ZoCB//e/ogAZu
         xuKQ==
X-Gm-Message-State: AOJu0Yxnhqazt3+NMDm8kODDb2NNZjFLNFul/B7kk2z0FDgSDz7ggGh2
	DwtpWWaY29wVjxUPRG+epGMcHZ34KzMTycN78pMZFoDmqxGeHcR6Cvqt7v6iUsmdPAP+bp59iv1
	Z
X-Gm-Gg: ASbGncuhgYqZ+PKQQM1nJRDwOUpJp5fWtnjN51C6HeuaKbyxjNSHGisFHB9QES/6mzV
	pXKlOgv0xNJJWCHHLcoCnhs0UTbaMzNZXYbSV9mTzPKmO8ABpS0bSPI7a5ZLyB2ipRr6F8jsFgp
	ByGOHzjk3ThnF50l4Y1YQdJtmEso/wsRTEcpKgcxBNqkp1rHI4k81kgK9VlGM7ag/lbzyqMuhzN
	uNoWh+Jn5qBuAuOuHfdQ3REtH8P4usbuutt5/tcwRZKiMkVoAiR1MAApDFsx2//hI0Q0wQ/GiSP
	LvBoXPegdEfrclKvb46rjimMAbuHZCmU5utT++SeGUtoKNM34bWwiKyZdIT4J9V2fhlxvPM2Og=
	=
X-Google-Smtp-Source: AGHT+IECWWDa2+Bk3T3VBiKd/Zss6S3yg8R6eAKf17Cy41uAi1Ax9GTVpgE7Q4bAs8EqRSct5Rr5/Q==
X-Received: by 2002:a05:600c:1c9a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43db85268f9mr138545525e9.31.1743577908885;
        Wed, 02 Apr 2025 00:11:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/48] python3-rdflib: upgrade 7.1.3 -> 7.1.4
Date: Wed,  2 Apr 2025 08:10:04 +0100
Message-ID: <20250402071017.2157620-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214208

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-rdflib_7.1.3.bb => python3-rdflib_7.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.3.bb => python3-rdflib_7.1.4.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
index 50be6695a13..01841cda4f6 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
 
-SRC_URI[sha256sum] = "f3dcb4c106a8cd9e060d92f43d593d09ebc3d07adc244f4c7315856a12e383ee"
+SRC_URI[sha256sum] = "fed46e24f26a788e2ab8e445f7077f00edcf95abb73bcef4b86cefa8b62dd174"
 
 inherit pypi python_poetry_core
 

