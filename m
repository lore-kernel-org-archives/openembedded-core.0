Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79445D12683
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:20:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.998.1764713998023602327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lJ5Twx4j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298456bb53aso77864445ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 14:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764713997; x=1765318797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2gvikw2MEH8NzIYuHSaTgeqWlLkklsIgY1kvq4bwNM=;
        b=lJ5Twx4j0isOX+NyPR/N7lTFFoXwKKDq2TT5yK+9SipOz0srLnm0gmG1hoKPYZU2BH
         d6d+IpK5W5rwXf+V+24M6gQwvkCPEBDHLYoxySvnVuMjXZXkY6OwBBsLqNXyAdCNNFYR
         vQk7rlDa74zVSCLTOBCtsK2Pr4i1pDc6arFyY4v1q51ss+gsNGCiJM/kEhifsJ83xY93
         kg2wUiwQbP0jDvElANmHUbCjNfXGF2JhBpW97r9tuLUr6StV/AqZxjN8+NnOr/lb4sCs
         qxLOVSZqQVS6xEfF8fmx/0PJFQUHUpdUFNR3CludGi741QP3MgWmpsj4JyW+fs2SoS1O
         ajXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713997; x=1765318797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L2gvikw2MEH8NzIYuHSaTgeqWlLkklsIgY1kvq4bwNM=;
        b=t5DpGytNhTOJRtcC/uctmNEfB7VK45Dx05gLs7Ql8MO6MHctM3JVQxWWaYWyiMP7xB
         5HKrhdedPf0LP5OWVyoWUCX3QsZaJBBbOTUAKxPzA3unuB3n3zaJ8M+T7/ryAzfx0mAu
         KSARisNRmlnbGr6habmYmx8BsKYjrf/iDuLeQu8ZwZ6KkvlwsoytSks3RtOC5AZP7O2c
         2Zzai2VUBDpg0wmL+jc/zH29xPvR9VT7lD38xgEEYybhb3DHIbH6meEc3jbQ7JtyOc8p
         W6fFTXWRzdOAIaLUHsSui+oTC64qJJQrDoNsYb/uxt8tqdTaDXSR8XoZOUb36vPkzXBv
         MhOA==
X-Gm-Message-State: AOJu0Yyh0Vmch+GTXucEsPaL6z5mdAm6M6Seng9TDUK/K2KoNWxm7c+x
	+hGR0g+iogPQwN/n0ik8Lt0RENRRv8pDux+gJp0JhvjSXbRMSArpQthS3KuOPBIppk3TssIqnUX
	y7Dai
X-Gm-Gg: ASbGnctHkTLCHFqYGWvgs1gKn2XG42I8JSIi9MU1PTL15qA5x9ymNZMs0HwzlYTcRQm
	50VgWhfqMnyb0eHxMpmmhKDAYr4ABcIViA+tvwaggqIykUqT29WVAEayK9Nqv8f2AM0sbwuFt4E
	mX/tQQjhZB2+0YYj5bBdpvfIZ11yi7ZXXLXbRyA+x5xED7SjnurTLwx/E7wMOPFt1kQOlMTPjki
	i8qg44Lm8t2mFShJsvdS25A3oqS6xjztmcTa1Gzdz6keT2fgt5lRqhhxrjro1SKe7b8Mq6pHtvV
	JLRhy5EZLYap54kqWOWXzNc/60LhRkAu0i/ZeumxHVKSPqdaPaJz8mL9I2mN4j1YgoMX78rMEjh
	n0D4fs2R4hQ8PbTr6v/lxnU1DXzbIQJ/WTLxQ/hsF0SDc1FH03o5VFf5t6MASwNKNFP+VvPG5X8
	gbCw==
X-Google-Smtp-Source: AGHT+IGftLJAnfRCyvz1b/4v3pm/9EhYDxbTCAldoJY4UVPiUzAFZ3tM1CdhSjb0dxOnE9Acc3CuKA==
X-Received: by 2002:a17:902:ef01:b0:295:425a:350e with SMTP id d9443c01a7336-29d682a9d76mr1195055ad.8.1764713997174;
        Tue, 02 Dec 2025 14:19:57 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acc7sm163700565ad.2.2025.12.02.14.19.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:19:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
Date: Tue,  2 Dec 2025 14:19:30 -0800
Message-ID: <8508cd916d3030228c801be9246ea13c579267b0.1764713862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764713862.git.steve@sakoman.com>
References: <cover.1764713862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227194

From: Moritz Haase <Moritz.Haase@bmw.de>

Due to what looks like a copy'n'paste mistake, the environment setup script
might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
untouched. Fix that.

(cherry picked from commit 545e43a7a45be02fda8fc3af69faa20e889f58c4)

CC: changqing.li@windriver.com
CC: raj.khem@gmail.com
CC: Peter.Marko@siemens.com

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 581108ef35..b948db2cf6 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,6 +1,6 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "${CURL_CA_PATH:-}" ]; then
+# CAFILE/CAPATH is auto-detected when source buildtools
+if [ -z "${CURL_CA_BUNDLE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-- 
2.43.0


