Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.20677.1599740605579012260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=POSvzO2e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id w2so5438115wmi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jnqMQ1C+GBndp3GYZqieHpa0bjzQihCpwW2bn3EnZkM=;
        b=POSvzO2el+iuKw6wE6DKe9jJ2JfFddyw3RW7fh1AOw1EhBWLyuub+/pZUNQSf+tHSa
         cSMLgelbstc4GBYlMRtwPIUtQRUJSaNAewXyGJwHpDsVRx0nJC7+dlt7IXLvDt4oS7hw
         e6+fyj6bva2XFWwc2XuqYFJc6Z5tTBwn9tdgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnqMQ1C+GBndp3GYZqieHpa0bjzQihCpwW2bn3EnZkM=;
        b=niksSS6rphA5JVjC/mso3oAU4VvqdWKLPPt7Y5MMZ21KY2fqAQbVUW/2JyJ1oa96oK
         eDXmc4mQzC0ND0UIoacv+LyrbphRQXl2aggL/4F9+9RqFIf6zcIWaKGxnFayPeLxe7Iv
         8I++xE5QTS5x4n0PCbl7ZYZsoxJneZ9vBmu8CKd+nsmjaC/qw994CsVo0tO8WQyzqhzM
         Oe7elmbM+ujWx2lulgH+f/r05QaRRh4ENcR8OlqQJMMFeA5Tt7a+08qr3nsahS9OpMNB
         qCscuOlP2zkGE0SOYuGNMdORErRMz08sKJ+oYlSBtklrCEj0bJL4r0hEmNFdH5I7o3hg
         DHSA==
X-Gm-Message-State: AOAM531DhIdVWRDcYlHH5P9jTqrYqSjj0ca/2fLbJnkKwLOPZCg/3xdf
	GNdTOLOu96xIZQh1zIsmI0lLN2SFvhG2uw==
X-Google-Smtp-Source: ABdhPJyou0HvdF059h1zIR9ohOOUj8PjzpEPZnr9dLpenRM6j5Q7OSLpzxyL1K2JRtqExaiPc5mM2g==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr8617091wmb.6.1599740603767;
        Thu, 10 Sep 2020 05:23:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 17/22] attr: Disable parallel make install
Date: Thu, 10 Sep 2020 13:23:01 +0100
Message-Id: <20200910122306.2040194-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_install fails on newer versions of make with interesting and hard to
debug errors. Disablle parallle make install as a workaround. Later verisons
of attr in newer releases don't have the issue.

(From OE-Core rev: 6043b9a2ea879f8960897b11eb947801508a94da)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/attr_2.4.47.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index fc88bef830b..c3da66a0c72 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -12,4 +12,7 @@ SRC_URI += "file://attr-Missing-configure.ac.patch \
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
 SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
 
+# Has issues with newer versions of make
+PARALLEL_MAKEINST = ""
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

