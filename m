Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6527.1599512005690703439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P/cQABeL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c18so16929031wrm.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ugDmZhFctWWVSjyPNheUluMAzzGsmhMp7G+8jpQ03xI=;
        b=P/cQABeLZmNfK2G9UtOWDg8GiR/7zqSxw+7pwrx6U5vAff9hKb9UHu36GUok1/7ZAP
         Fy16gHmpuUcmiCi7NZ6Vly8x7jl3oQi/UUtFEdpxvZAEGll38KyhJyR11YX9PGjmQ3D2
         taR3TWBA7k/n+GRqObAwjq6ATAqVfNlikCIQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugDmZhFctWWVSjyPNheUluMAzzGsmhMp7G+8jpQ03xI=;
        b=rKVcbGfwTraZTX5lSErf5tzj2p00GsfEfhAfv0nKdmktiFuMuzHM5OLmUWILeOeHpR
         VnLdjpfS0W8y7nT85vwGHx3jYklFv871jUZ0xkABtrUtnY9+vJKw1hNipSDENRVwOEdE
         QTLpGgj6pQ4APJMuXHFahRzoTlAQLBhci1C7oXPf90buWYfL2TRlD25qKPGUfvO/rJE2
         hFgAAj75USaPFhYdy5T01X3it1x27hT1qjBv1tpEDRI1FPXEP480SDqlDg6jiGSlfrUt
         ppHVpThebtlfzC034M1x+6bYPgLISrFVnKWsXYVE+HV20dwb6E0HRWGZWwZX8B9IJZwt
         JnnA==
X-Gm-Message-State: AOAM530QsxELl5uVCz8pU22wcFspKNfyS6NbFmTEv6WDaPc84Dn9Vrcw
	JHqry4K09MFW83zuz8MOrSFWvrsbH5ozmA==
X-Google-Smtp-Source: ABdhPJyNcK1p9Dmp/oUDb9MKip10v/zSC9+HpkfzXldguWb1oMt7K/IgB+jFzH+3V4USNqSNQW3KXg==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4387526wrs.227.1599512003665;
        Mon, 07 Sep 2020 13:53:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 02/19] buildtools-tarball: Add an ld.so.conf for nativesdk-binutils
Date: Mon,  7 Sep 2020 21:53:04 +0100
Message-Id: <20200907205321.1941682-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to search our own libdirs, then fall back to the system ones as our
customised dynamic loader will. Have ld.so.conf reflect that.

This ensures that binutils finds libraries here when linking too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 66201514d79..006c724bbda 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -74,6 +74,10 @@ create_sdk_files_append () {
 
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

