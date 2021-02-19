Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.12327.1613757220068481333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r6RkmoVZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id z128so1817562qkc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y63V78oZEgtAx1C2rYv7/el+19LbOFH5bQzBI7/naFg=;
        b=r6RkmoVZnAZ/8fFZSkdFDpWa/E5TjnbBOcN8w0fILJSElGmkxWgwtGoCu/nwqDwFip
         xAc851eVEE74Tdo9+dOOi+o+5ZCqURhe4vwPSrCX8TA6xN6nioH8/iZT0/+AoZNCjPkv
         Xx28oy441Yh8ahEP0QKCR8FaZUoU+U7l0U3iRS8Utp1r944bt8jaNwdrOwclSDI9aYkk
         UM4KTs6HLKx98YDgZ16cm63gmlEvos6bVUPN/EjNO60nIIzWykiBqS+fOTJ297lcGGOS
         w85zNP+iSOkSvsFKOu54IK3c5YHiLULk6ko74YU2iNvwQkgnII+ZvE5J6sN54lV5Z7MG
         DgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y63V78oZEgtAx1C2rYv7/el+19LbOFH5bQzBI7/naFg=;
        b=TJUxrzBN/bC08HEmEI0nSr+Bd3YPDc3UV5VOl+uTwS5YFpLiZEq8/LqGEXNe/A7YGF
         ATmn1UnXy4jmwraE9sWtjoc9k6jYXsBhpjfu+eIbwmF26m+3FXvTQOBK/VDOEtGBWhD1
         uOvABoQQLinJko3LEPLxPCxPID34TKA1vVCh4glrR9jBnCuOzW7gFo0Q2vPzaUEVkl3j
         VKwbMSDUh/FzcY8AWqJimIeny0YIpSOaJ+Jb04FH9LRrsbvvLaZ1vE6iNcHwnR+lbKqp
         ygn50QsttRy5izBKpu2nnCFc4aA3S/bYYQXkmt2fOLR4o/Do7rxfoHMsYboOqJjIH27+
         /pJA==
X-Gm-Message-State: AOAM531Aoa2DDZDxtl/CcyhzzLKzXCfcafd70cq3IvZPyXboNZjHv6hJ
	xxbER+wlyX8DlnhuSzw/Wl8v2u9k1FhkXA==
X-Google-Smtp-Source: ABdhPJyB9zx/dFKRk9OLAhU2jquNnVLVrwOb/k24nlsCkSxtNHG9rfFzCyrNBQUWRduVT967NEniyw==
X-Received: by 2002:a37:a694:: with SMTP id p142mr10108045qke.400.1613757219079;
        Fri, 19 Feb 2021 09:53:39 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id a16sm5659694qta.69.2021.02.19.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:53:38 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quaresma.jose@gmail.com
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH v3 1/2] Revert "iputils: Fix build determinism"
Date: Fri, 19 Feb 2021 17:53:06 +0000
Message-Id: <20210219175307.46218-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d10da5f6e6d6d3600645dbe43ed412ff23b55095.
---
 meta/recipes-extended/iputils/iputils_s20200821.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 28dd194a12..8b63a23c61 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -38,8 +38,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-# Have to disable setcap/suid as its not deterministic
-EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
+EXTRA_OEMESON += "--prefix=${root_prefix}/"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1

