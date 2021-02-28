Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.7717.1614526649020138023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WyQhSLK1;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id k13so23541487ejs.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTaADV0abkO1XPS2BlYwTUw+IEh99N4cuv6AE3tF6Kc=;
        b=WyQhSLK1EqIZpT5nLQ/NvGgwB9fmi/8f8QDVOTxIOFPgv2Wkr1xmmz1Tb2RygwueQf
         ajVbeF7Ry1PvfQXIRTp+j18IuRdPjzPT51vQXtlxcWAj/eaA1dg+XJRrI1Qma3xyA/6/
         hxSB+/Ri+ODwbGoXFvJ5s2ipA1laPxlUe0vr6L16DujbMT77FzwyoTEK/njIdHyVkoxp
         7vz/Rd1mBmXk6ah9tsUwFMWe9M8nQayubtr2YGXA2Cyxdc7ck7nyrF4ax/qrwpvli05+
         PObBphAsrvAgZBDZvQFRlnJl59edOd2TWlIYnwBZLMBLO1zPgZMONX9EiXnCrd3WLhLG
         /Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTaADV0abkO1XPS2BlYwTUw+IEh99N4cuv6AE3tF6Kc=;
        b=rKNK/poWI5Lt3vQ+21RIU4izIJ5MPcLHRyhRmGv1/xSXvQYDsFzOt+0dygtElKSLtx
         dFhu2Y/lpOjPZH7V+/3XliwlYHG+LfgmY6kU1Y5dKse1Y15/gW88Go33LDPITfpWNsLn
         KWfSSu7JNFJcRQgcY53g3EvyVUPfToLpr1a29i4hLi3cAwtKpuVvO4tny5b/OWguzvhI
         QAHq+treGsAXCwYWSwybfUtZ86v/SI/9/T+7j//zYJi/ge9AJpIcjswBJyaBEH94+OZL
         7w+6WCRKrZADXOupq9d6ykbbxC7kuWbEF7Bjd4dCQX1eo+WMq9rmWnNxJr7srRrZwOXo
         uLYg==
X-Gm-Message-State: AOAM530F+VN8y1zXbvF2RMq9+qfYZfh0uyZus8ad5CxqmUQF7CaKrt/s
	t4J5gc/eVzDzAOUJsTBWNcOKMvGhTAsQWA==
X-Google-Smtp-Source: ABdhPJy3x7O9uVKWxefcpqecpjOSmjhNWgca+Uzfugqu6kekp9qWujYyY5rqsykWSqIczAkPs/BIvg==
X-Received: by 2002:a17:906:b6cc:: with SMTP id ec12mr11998010ejb.520.1614526647513;
        Sun, 28 Feb 2021 07:37:27 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:27 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/24] openssl: address ptest failures caused by perl 5.32.1
Date: Sun, 28 Feb 2021 16:37:01 +0100
Message-Id: <20210228153702.498275-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reason the new perl no longer has . in list of
directories searched in 'require', and so the file
needs to be copied where perl can find it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1j.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
index c431f22643..181790e6ab 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
@@ -199,6 +199,10 @@ do_install_ptest () {
 
 	install -d ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
+
+        # seems to be needed with perl 5.32.1
+        install -d ${D}${PTEST_PATH}/util/perl/recipes
+        cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util/perl/recipes/
 }
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
-- 
2.29.2

