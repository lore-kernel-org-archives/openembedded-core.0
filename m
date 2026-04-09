Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08DEF364B8
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 20:17:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.141679.1775765815904431020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 13:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gc3FoSjl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b983bb07eso811709f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775765814; x=1776370614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0JZjSF6Ic9ef3srxDFeBGVeUf4rjahQdNdQ2ZCpSzA=;
        b=Gc3FoSjl5jrEzsm1RpDxHHrAEHc0z6E1i8KS3GPsoyhm4A3ucOfpo/UUrf9hSfN2lq
         zYuj9E93GWVmdLRRoFJIZmo6E/+t50tWl90l9JNcJQw68ghFXFYSKjijkQun6T0OyOLB
         71v4gey42t5BCOVcFlGsoanIcz8112MfZLf0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765814; x=1776370614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0JZjSF6Ic9ef3srxDFeBGVeUf4rjahQdNdQ2ZCpSzA=;
        b=eKQAqgd/LZuuv/GPXOOI6Cm+WZwC/v/V7BS3YmKMRCc8NJFq0FeqLkZWH/If38FaxX
         M4z13gIV7Zw7ROzHgZYzmAn8//BAV6CBmmCzjgp48FMDQ264Sz2EW2TAzsgXV2nZkjn+
         ONg0JIER5QPp4ZaFAXILeqhxosKOqAauYilF9K8c5Gh/oSYRPjpKnfIPuMfg/qN0NlN1
         APW0at6EC0pZnZznyp6qS0pr5hIhaksQcjnOCjsrCob5mQ8yW/FkOGQoS5TnJGSK+/M/
         03ocoLsv7N8PHajL7gvDRzolt+k3yGuCHfhwAjmCX8UYTsp3UlDhz4YXumPcCkTLwUsv
         HzAA==
X-Gm-Message-State: AOJu0YzwdbbHwtwjrTwFwg3Xn1TX98UblfuHD/Q85BTrAdDxeMjyjHGz
	lWvNB93zwvpC+0A8J+TnaUyqIIDq/xKjW0Hu699/PKXKD396N2tJ4B6VkGm2xHIxTRWpFnuHCQ5
	b2tjX9pg=
X-Gm-Gg: AeBDievZmjWo60gsF9a01Tj/FQr2zQKMqrokkrPviTEyniikNiQX36DK0dEEUB5zA04
	yo3u3TgTee6mOTjss4k5orcb+vpcAvc60RFmLLkiavqQHnBaTLWU6KqRqJiLfw+q2J612URItrl
	bV7QoibYjSILKdsG3tv60cCOut2FicNeWatkQy9CCo6C7QUzmYMtVaoZdPehftQ8RMO5uZd7Ym9
	8j4I5D7pkt75lQ0GQ3crFUqAX5VmF4Bwzc8wfNU70Xy3xppH3orA6GUFoLuiGbBMpv9VQDKm+ER
	k5gY2TQCN5bsVaKxaIw6kpRtjyrKnPGDrSQKIuz6rMmI56lchmsUuh9E5LV6qGyIMJvtRrbu12G
	T3v+zbEnnTwFx/9n0cCVXsC2944jg4IgEZzHwofckURTTBDBpYR65265ncHG9gFKZ9cYFM+HLmy
	4Q7TDvrhOHgUeuFORjW6Zk8j/QmmMc2/i2B2PFeEiEL4MiYrleYCZZ
X-Received: by 2002:a05:6000:2383:b0:43c:fd7a:e757 with SMTP id ffacd0b85a97d-43d642c87c6mr586532f8f.45.1775765813873;
        Thu, 09 Apr 2026 13:16:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e51600sm1450643f8f.32.2026.04.09.13.16.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:16:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libgcc: Bump PR/HASHEQUIV_HASH_VERSION after reproducibility issues
Date: Thu,  9 Apr 2026 21:16:51 +0100
Message-ID: <20260409201651.3485286-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 20:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234945

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc_15.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.2.bb
index fdcd6cc0da1..59c70ea4323 100644
--- a/meta/recipes-devtools/gcc/libgcc_15.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc_15.2.bb
@@ -5,3 +5,7 @@ LDFLAGS += "-fuse-ld=bfd"
 
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 = "arm"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"

