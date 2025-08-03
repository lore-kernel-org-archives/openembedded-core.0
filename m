Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE5C87FD2
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 01:04:53 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.9363.1754183092002649140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 18:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=Dv0JtNE3;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.222.182, mailfrom: anakin@childerhose.ca)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e33d36491dso326855585a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754183091; x=1754787891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SurNLxKASI4TMPfHPdAgF6EJHmhp71PYTyaxC0fr3LU=;
        b=Dv0JtNE33eutTcLNfYnRgQ+6zDVJXN7baFkHaae8/30JYPCd80KStdEoK5q5ynq4IV
         9/P981hcH2tHX+n8Ct/PWFjPlW5l+eUpPSAXYn5McGjW2odxbuSaC+JdY/UXEqxM11zO
         pn4Bk1/+ZJMV9B04Tx7SoNlL/GxeFX7OSBg0KNyDjdbHobZl/z0e8G7s+6Nhkfuh1lxa
         ndT0Zn13zKnvkcl3g2G+7ZXN+6Bxcwra5ChupdJbdhbcwCpSJgDRn1nLKPX+DrxWImWa
         M2ywUUXeUIjm8FUG4Nrppki0+b8wB/3xrvSN6FsBSLA3gEnCOdG0+fdnwoUsmOI4flfi
         k7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754183091; x=1754787891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SurNLxKASI4TMPfHPdAgF6EJHmhp71PYTyaxC0fr3LU=;
        b=VyALwHp4YSHs3Zn0TcNdzHuQQDb3CZvQZaIwew1gNFKCH4QTq5pn/uwcLmFa7dqwpj
         jHtiXXCEQI+qt+S+EXVNZpA2SMRryh0WJj5MOB0LWXD18SrINPDO0Qlks593VLz9OEiV
         Zc4BipDmN7B4Rm+a+ZNMuUvtDzXc4czXzgyCVyVevQOQjWg7yJG4OkuhylNJs3cwx4Xb
         vTOwGFme2kMdNXHi0XOWAC3ia0A/vYYeRyuzqMqMTtaD2wVTUjXgpQNYAKTIaKY5U/4+
         9Ae9gL0ZygILMFM2M2mlaAh8PGkB+DfRd3/rrJuD+QW10hKUqjjHeIXXL1WeuCQApred
         ejYw==
X-Gm-Message-State: AOJu0Yy7aAuL6OekYynR018BJifwGncYhmjwSct53mAQxY3Yz9G8AK+r
	+RqC9BkQFvIEQ44lKHlIMCr5VvtefI81LZXBsi812f1gueFHBhgD90jAFhkWBrV5tFDfMTOseqL
	0kEqO2rAl5w==
X-Gm-Gg: ASbGncsIoQpRAsv5o6K/C37B/Q2f/O7s1ndXt7issn/07o5jntwqmB5cDJNhiO4dhmI
	OOE6pdg2lzmdmsBD70ZVrtShiD09v8S9fmtlKR4AcgqT/mDNlORQMgTdUHJXx3tCX7wqMaGMwvC
	IgiUbUERvmaLD//wjFngwKU+NMx1c3Sb3QcmeBoWcxvqASWEg8DDVKVdcvfj5XqAyezKOZNiuzN
	ldmldhcEWLUNVaVjgd0l8txeEX4UYtyk8DGUOk555s4cGl3/nYSTC4daChctdoYB9A/Ln+bZQ+9
	ohk579IJou9E+c1Jhx8a7oQ8Gew+ETSnL4LmC7cB55myoVrsgjn+2KAHL3WTRVm5lhgvQtmy1Zw
	V+pjS2EaRK59HW/CL
X-Google-Smtp-Source: AGHT+IG+040tPpSEZabYJeNUGFotc3aoVG9ADLTSNkn5T2HdZN9DUPUa+RR1lhZRJOnmnTylItop1w==
X-Received: by 2002:a05:620a:5601:b0:7e6:5ef5:c7e4 with SMTP id af79cd13be357-7e69639d1c1mr639953285a.64.1754183090651;
        Sat, 02 Aug 2025 18:04:50 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594206sm389169685a.4.2025.08.02.18.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 18:04:50 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 0/3] Automatically add compile_commands.json to ${S}
Date: Sat,  2 Aug 2025 21:04:20 -0400
Message-ID: <20250803010422.21838-2-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 01:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221396

To better take advantage of Meson and Cmake's automatic generation of a
compile_commands.json file for the clangd language server, link the
${B}/compile_commands.json to ${S}/compile_commands.json.

I accidentally missed the initial commit which provided the
compile_commands.bbclass. This corrects the previous submission.

Anakin Childerhose (3):
  clangd: add compile_commands.bbclass
  cmake.bbclass: inherit compile_commands.bbclass
  meson.bbclass: inherit compile_commands.bbclass

 meta/classes-recipe/cmake.bbclass            |  2 ++
 meta/classes-recipe/compile_commands.bbclass | 18 ++++++++++++++++++
 meta/classes-recipe/meson.bbclass            |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/compile_commands.bbclass

--
2.50.1


