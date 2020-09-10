Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20661.1599740590281545154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hgwd0T6u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id a65so5419374wme.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bGXoVUns59MJpeEzLMaUgz6DZTyiWKz/nfY4QziKTV4=;
        b=hgwd0T6udrQW5WP0KCGDQmeZpjdj0IDnfjY/ujjCc6e+ZXNw4qoL+3WuGv6nAwzEpC
         GsRMj+xTd7gQ2JkqkIjRyoPaAieidzgdOHPrNrmM/Z44MTEpceVUpJZeObTK3PHASc1f
         3aB05a39BDTcWQEK6cSp+E4jzyeRFM7jkQgXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGXoVUns59MJpeEzLMaUgz6DZTyiWKz/nfY4QziKTV4=;
        b=NkUpsVbyK4+V2ohdyhntPs5GyAq1Ehvlzj8eogDTQxLzOUExUep2UbG+bU9uQJWPq1
         Iqv6Rasb+rJdbsW7g1shrIETTR38Ygzxh759OO90yURI9qkpXw0nztjpMdk8gByf1BD1
         jYAKQiTPMGbuIQwmu90vplnCnHz1ZaL524axdZSVVoHNtq38AsTzq6zvB4H2SwFyPdlu
         mv5kbr8rAjnvkD2iRj/gtJ8mYZzlrq/1DeClrOcz/uiW4NFZCEPDtcDZU3dl3ht7ZzAr
         OZ5OqF2nb0nw0BKX6bXKLg+Ey+4JkZfKi60edP81gTJV5BgNnn8+aOlVHeoAAQQhuZ4z
         ThkQ==
X-Gm-Message-State: AOAM53388YDH9BX4NlrepoWkXLqQ1eUArPHz8KbX9LSJEOfk1QToIYrE
	DpsFdSU8MXcqKgRYdVbC3xRUruPh84ammw==
X-Google-Smtp-Source: ABdhPJwJaHQiAMFQWMBzf7dcsU4BW5cvylH7zzo5ziD63nv+B+qRcvFFJdZPbIIGSta9EWAUgFbOJw==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr8705402wme.131.1599740588245;
        Thu, 10 Sep 2020 05:23:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 02/22] buildtools-tarball: Add an ld.so.conf for nativesdk-binutils
Date: Thu, 10 Sep 2020 13:22:46 +0100
Message-Id: <20200910122306.2040194-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to search our own libdirs, then fall back to the system ones as our
customised dynamic loader will. Have ld.so.conf reflect that.

This ensures that binutils finds libraries here when linking too.

(From OE-Core rev: ab729c362684474a8346e5256d636200826feb47)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 91df6f1ae9f..eca9f1c0e1f 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,6 +73,10 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 
+	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
+	echo '${SDKPATHNATIVE}${libdir}
+${SDKPATHNATIVE}${base_libdir}
+include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
 		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
-- 
2.25.1

