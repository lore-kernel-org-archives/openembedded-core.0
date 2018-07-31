Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 196B6748D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 13:58:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s7-v6so9130317pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZTot2hCaP33N8QEasx5rVDA0TRD+9quF9HMHlsrMfJA=;
	b=TXKunwIueVZDdQgkHSqKLohji0lBuO+o9xoMLbe+tNNp76vR+buAs+/zq3iHnLTuWE
	O/WNbnACJY+drfuwhR7PMfLaf8xcVygf7SgY8Y6B+7gDCncxu9qx9zF8vlD3+37b2upm
	6RprbNFBLss35nVABI8lEV4lSirA3otyy5nX5GaM3hnAu/DXsVYnGKfCd4ITziNlKtlB
	Ch7WDbRuT/Va5vu+x8co3ruvrv4uwC1I79NUqbUtmp0VIRz+KdGV38/9HkeaOsUfXK5f
	31nE0YQKPCFY6ec1hBkFMZVMpadnVJW5GK4QPlvBr7YkFcwRS2FFyfsD30+HOGp+noS9
	i4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZTot2hCaP33N8QEasx5rVDA0TRD+9quF9HMHlsrMfJA=;
	b=iBmreMl7SLwBucQPG9V25msnIL+LCSp091HHyRzOttrU+YOaQNqhgsQ4QmGDDT9834
	q5gpuzwl7Ki5caC0DsTKdC/sbXN16a9ndNDswCHw9YACfoOY8NhS63nyM8Q87yO6fYQt
	VX5IDlZI0R59CvPBa+xaiHmDRssyEdQza5ejdvIlgkJ6xP2IeIlcmOk3KxnqI5vYDn5f
	SZrhynHycIJe4RHvNgJJB9f36Ev/GdgkJjM23G1WkwgOhBpxMLzM7q9VKRUMAJrnw+P8
	gjPwJn4yrZ9BJC8tKjl5JHGcDXj/S+mh4njFWYc3HrbSZz/+FLSvbM8aw31CUvb9x1ST
	0Fyw==
X-Gm-Message-State: AOUpUlFobOG7n/4K6H6GjY0oxwTpj+bidJ+pyFjKEVdD0tnNiRCNdTld
	Z6bvoVch3dp555Hf9hP7s/Edj042
X-Google-Smtp-Source: AAOMgpeC5oSl0lkZYauAKb+M9MPPJWV+Sz6iV254VHQuJ3cHfqS7PYwlBUHB/vE2Xc3Uw+IaiS+WZQ==
X-Received: by 2002:a63:c742:: with SMTP id
	v2-v6mr20557700pgg.331.1533045486048; 
	Tue, 31 Jul 2018 06:58:06 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm26372515pff.162.2018.07.31.06.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 06:58:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 06:57:56 -0700
Message-Id: <1533045476-3974-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl: fix missing dependency on hostperl-runtime-native
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
X-List-Received-Date: Tue, 31 Jul 2018 13:58:05 -0000

Openssl 1.1 requires perl in order to build (just as openssl 1.0
does). The missing dependency has gone unnoticed up to now since
hostperl-runtime-native is included in ASSUME_PROVIDED.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index a7cd6a4..88ef42e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -8,6 +8,8 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
+DEPENDS = "hostperl-runtime-native"
+
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
-- 
1.9.1


