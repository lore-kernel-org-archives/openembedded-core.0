Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61FB6789F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 14:55:40 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q7-v6so1693255pff.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SseIfRbG5vjtzxsyJH6GqLVXTFygjrhkySGGKwTjU4M=;
	b=lBRzI4vNyRB4PtwcxMJ0Tfi1z96gEFh0CJqLeruJpYlWs6se8RX+nP+jpqNN7voy0C
	0TZJlhAbktI5ShP5gG/gKYilRw2NDtNO+kWC0zqpyGm+V/4Arra8yi2YqXIvP15Fs6QM
	N3A924wlLSi/bY0Zfc38fXcf1ToBqEgfWZtnLN3U+tsAuI8E1nxbjbnHbxGx71vNeyG0
	4KWs0pGx1az+I7Ovnoe0KPF5MAwIhQYbVHiEz32IpuzmprDmDHhkourP+o2jSiMztiKp
	2DPUKoeb/CNu3N33HE3B4Gt+CEK1rLP5005+m/gq+qjiz7vXrIiYLwPbIEhQEZJWrqoW
	/Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SseIfRbG5vjtzxsyJH6GqLVXTFygjrhkySGGKwTjU4M=;
	b=t1J+0ZhCvpwiJU6aacrTBPBQCBbXqEgIdjgKijxDaRSLgQVpZj67QGzkp1hTPMM3J+
	FCYlCkvl1JseuuVEslH27NUvSgqgb5Gr7Tnahk2qTBToEz3tXN2rO9EPCWQSQBpZwvdV
	Hc7pMrwkV7jgVrCi4AqgRqbZm4JIVzxVZVllWp/DGZNPNqqnXTVGkHbRc3RNn0zwfOR+
	TImgyfJPj+Q0tcbcKCCqiuwKDHNfvYaMNIg2XycohAyqNjIs7bVVWdHwpOI7B8DcVDwv
	bt0weOMVCFD4M6I6ke4HFxIW4p4OWMvIbmYDTxTUU/UyJwj3bEEgS1BvjzvybEp3CpIO
	8IIg==
X-Gm-Message-State: APt69E3QAVFxGQigHm4W+7cJ6KKaC/+EFY5+/Awc0ZaKduhtdNKoJLK0
	+46WpLFHvDVtoEgTi+CNuB7udQ==
X-Google-Smtp-Source: AAOMgpeE/24jBvamUjjBMEKNM68atLsxg4DveXdezj9wcF8RYqIct8VXBw6SmsqJrAhjpk7P/SaokQ==
X-Received: by 2002:a63:65c2:: with SMTP id
	z185-v6mr2200052pgb.276.1530716141004; 
	Wed, 04 Jul 2018 07:55:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	s12-v6sm6312228pfm.41.2018.07.04.07.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 07:55:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 07:55:41 -0700
Message-Id: <20180704145541.30314-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] bind: Disable lmdb support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 14:55:40 -0000

with bind 9.11.2+ when the build host has lmdb installed, bind configure looks into
host headers and wrongly interprets that it should be enabling lmdb

disable lmdb to fix

| configure: error: found lmdb include but not library.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.11.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.3.bb b/meta/recipes-connectivity/bind/bind_9.11.3.bb
index 32f5365e44..1cb1f3fd34 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.3.bb
@@ -39,6 +39,7 @@ ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ye
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --disable-devpoll --enable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
+                 --with-lmdb=no \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
-- 
2.18.0


