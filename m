Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.5701.1614557850086192729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 16:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H5Cj8Vx7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id 7so14283238wrz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 16:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0/n9NRUdNOzMSZKBhX4jrKNPzzM8OX3BLXqPTapgR4=;
        b=H5Cj8Vx7hSJC0lanucfgcjMlcvzbs6fHzp/ePhkk7omvfIKiyDSR+d/lzybgcDXvuz
         iG2vNm02NLoRvHhFJU7R3vSbBuXOm+kiAXEi/hysmdFrbIh/v3Yxr9se+hDrJOfCAXCp
         6tiEL3K/0/FUvZPJJvGif3vQL8frH8KoZyfmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C0/n9NRUdNOzMSZKBhX4jrKNPzzM8OX3BLXqPTapgR4=;
        b=LNjI0r69Zv2axp9u3dplBY+Bnco30QIAUIFa4OeTV6KdoK/enTy33c/pguM75rZeSQ
         Tr1gvLUXTx4hQ4ua0wJz5HXM6sRjM1jVKZqpwgZT/dywQr71MfxLZI+QGIqP3tJF9NUK
         lZrDAb4b3NCUgMocD04aF2ZH9FnRsQ3B8oBMX59CsFLhM0YjUZFwhSwUz13bWo551x/P
         x57b4MPG7WjUS1eBll4Rh0Zj9AL27YdiYNKUaWGjzx6ikMGsxLf+WB30mXY7DG2GfEJs
         ykJbivlAcRtUaYW7At9RP1aZz9RVgxctDBb+1UbO4Plo6BpnKiwNVfe8So3qGhngZyly
         IOtQ==
X-Gm-Message-State: AOAM532p34yXXn3azNZROxsDLBykl9vs8xZnhXYmYeX4Fawvyv5NU8no
	+2ZXAwwOM+v+cCZmj8nY24FhsXSKCsMIrA==
X-Google-Smtp-Source: ABdhPJxwbCY1Hut3LksMuxCzE2miUPLzOCSb8EjNQTadGBp5cihQ3yVmerO8dAhfh533d9CR2FAJBQ==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr14034379wrr.104.1614557847989;
        Sun, 28 Feb 2021 16:17:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id c11sm22653836wrs.28.2021.02.28.16.17.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 16:17:27 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] apr-util: Fix CFLAGS used in build
Date: Mon,  1 Mar 2021 00:17:25 +0000
Message-Id: <20210301001727.2163322-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to use CFLAGS with the correct WORKDIR in them, replace those
in the sysroot file with the ones appropriate to the current recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 meta/recipes-support/apr/apr-util_1.6.1.bb   | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ad15d4dffe2..1fb2806f2a8 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -36,7 +36,6 @@ exclude_packages = [
 	'go_',
 	'go-',
 	'gstreamer1.0-python',
-	'libaprutil',
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index f7d827a1d84..4e183ca3749 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -35,6 +35,7 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 do_configure_append() {
 	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${B}/build/rules.mk
+		sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${B}/build/rules.mk
 	fi
 }
 do_configure_prepend_class-native() {
@@ -49,6 +50,7 @@ do_configure_append_class-native() {
 
 do_configure_prepend_class-nativesdk() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
+	sed -i -e 's#^CFLAGS=.*#CFLAGS=${TARGET_CFLAGS}#g' ${S}/build/rules.mk
 }
 
 do_configure_append_class-nativesdk() {
-- 
2.27.0

