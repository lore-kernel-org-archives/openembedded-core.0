Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20EFC43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:01 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.2027.1667356974736462343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=V7Ljszel;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id gw22so2027419pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl66SfF/cusOOkVDLRMtzjsJYtFh0mbZVVr2mJE2QZo=;
        b=V7LjszeliW0m3183d8w7vVBdXOq+atO6k1W1N7gOVZ0tikunMScZQVdwi53i17oKtx
         U9QZ70MarO7/9feaGXIbWkSyBPYF0/bgo93ZkA3DiDezOh6iKVCt8dxhl/1ou6A7PEzO
         Z4UH6T0d0mZ1g7jubODVZ5e+BvO+cR+Rva3ClfB+jNjqfc4WZsUrJ3d3JGV2vJl9+aN9
         qpczaCicpH0WpCllxLwdWHvNztWGPQGgLf3EOBOKtNiyqa+4EsSRHk6HgV0MJH5BCKpu
         lG2cJoYZpn5nhMgjtagYvF3Cudo4Yexmqry6Z9YzFcngzaUWWgZCZ0paMO0lZCsQcaeq
         pyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl66SfF/cusOOkVDLRMtzjsJYtFh0mbZVVr2mJE2QZo=;
        b=VecjBMapUcaFF0XJaHGcdgrdEqUoK4dUYzsNCij1p0U2ttfLOPTQknONkiZ7tmjwB8
         iYWO2tLLYRR9VBNvQxZa5HBo9lLROtTG/3rvOPGKmxR9FK8p4D3Gdhx+YQiVmBImcbzJ
         brLGtJxPMq3x2Ln/OymvPNJ8kjp5/xzIMrwYYgbCuwqDSBRTVNvl5yiHIA266PHIpUkR
         kN/+/EKkttuzPIn1AxWQTt74OyQBc+Dg+pQfHwxakskLvbPrlPj4Gsv/WiaLGHthE1lV
         LWZMjlcBoY7BwejM+ebS60MDAM2Uwq5MC51EIi6vD3cedYVyxduNQHTUlF42VviJG4Bv
         sNlw==
X-Gm-Message-State: ACrzQf0Y1/lYyri9qobIe8rrjzkJh7oLlz7bDGx8rYGQYXm0rDhJ4Zkd
	R6s1bs0HWpqHKEdwuBr/CJcauVNuLZS5EWqh
X-Google-Smtp-Source: AMsMyM46G2kBI3ksObxId8M5JfeZeYOYVib9AX9WbwEyfCNlSpyJ9VRRVF9UvX6Xy1yzGzVY09ZNeg==
X-Received: by 2002:a17:90a:728d:b0:213:dfd6:3e5f with SMTP id e13-20020a17090a728d00b00213dfd63e5fmr14362283pjg.146.1667356973887;
        Tue, 01 Nov 2022 19:42:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/20] buildtools-tarball: export certificates to python and curl
Date: Tue,  1 Nov 2022 16:42:05 -1000
Message-Id: <facafa0f76af9cbf80f862497b66c18b3fbfa60b.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172555

From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>

The custom path of the ca-certificates.crt within the buildtools-tarball requires more
environment variables to be exported. Namely REQUESTS_CA_BUNDLE for the python requests library
and CURL_CA_BUNDLE for curl.

Signed-off-by: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 5c249db9de8ad8cfe0996ff4fee4c575a5ff1e34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6b59e4934d..de399173ba 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,8 @@ create_sdk_files:append () {
 	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
 		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	fi
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
-- 
2.25.1


