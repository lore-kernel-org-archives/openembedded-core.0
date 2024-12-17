Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7D6E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.79327.1734433970456797248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=peUco+OG;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.42, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e971a2a0so316640f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433969; x=1735038769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf0GY98f8dwqhADLcF5Vg1ElRt8lUes0v3wrR1kK99Q=;
        b=peUco+OGl8onh5Le4nX4RkXVMN7Iljg+2tmghh8vOB2e+plWTC8gw1pcosVty9GmiO
         QzJoK5culzGLn7Bxtm/7jzTMSr4WAe1/Zewe399/m1t+irozmKa03zgc212oKn3tzhOd
         7YVwzNG1A8Qs1icfJNhwUE9Rva6wRTpfYEZki27f/bJb1A4cn4+mhvfzmhiRMDs2uXRu
         9PfMrocv7i5HRzNCs0i1WVJ0BYwJA0L+Y07Ma2wivABh5gHV+sM3nz5QFSNjatsFXkmp
         f6ZgZWbaMDIz1KuexZ1bUKJyV1fxDJgvY+YqQy5F2lLqpiEG3zk+MwRw7bgMDlOTMIG5
         fwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433969; x=1735038769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf0GY98f8dwqhADLcF5Vg1ElRt8lUes0v3wrR1kK99Q=;
        b=HzqNH5HN73SdTT7AJk8W8Omx6AUtv353PmrGNjlLFGdt6KdifHt7WDp+vdsOF1AvIz
         oqlbt0cNrAeVlopo66fEEz6eKjnk4TOWkAys+KtbjDs3clZ19gVL4L9+Ni/TK172xxUb
         vZSXj4HjM3RLRv3DGDcQBASxWNLWEZjmVK+kuo53k8kb55bc4AG5q9xz+x/N+WMTBjWH
         nDOPqfsFUHY6xWscHbC+Y4vn2Os8cM2QMhf6X2HYw9dwVLlizs/ZpnRA0+ZlPt0bK/hJ
         9IzhnHhkws3tYHTCb+oJIwBtgC2Aoj2Ct8rv7oeVqxFnPxaeaPxaLaSQbhGk4nsO7Trj
         apvQ==
X-Gm-Message-State: AOJu0YxoEUvGU18XvD1SiAjk3uJwmEDCSByrfB1g3v4Zk9a6r/68pK+E
	19L1kZJRUJyUQo/XL8a4YO8wc/hZh947ddGg7eRZwKfpeAHYMw/hV6lCBs0Pn6Vqf2PKIEXv0p5
	UHrL597eEQrPldgodNlEKnN3lT5aljpIQd8prelDdbx1Exc7nCiOwOWhmrRYFQ2w3LLXQgwSNnK
	OMfCtNsFTR
X-Gm-Gg: ASbGncv+qFBk+CnpYBEtn1SrufIQDv0pQM1nwlpXnrLqxqm3d/SzylY7LpNCLBlMTPJ
	eUQzprHhmK9s9nCbi1S2bi/+UKznbeVwfidCqulwpMgGAoR6mtLqovKD2H5Z4XWJTPbnCSnRX/v
	GTISTZwd33hFmt6bX1Lm9oCCVTmMpSJsqxbweKWnjMFNL/C250gUsveLgX/HDNgbw2s7Z4lOoSx
	m5HFmdxlV5ruSTeXmpKokGX2JJKVKAcxTw6Yw9itEuUaJKgwlAV0f3cJQl4MEUMgSlbxLSkMa5y
	tdTy8q/D2/ruz7W2PA6QauhdjqBCkTwWHQ==
X-Google-Smtp-Source: AGHT+IHRquRWXiE5TLeCR6DlCVvsMjatdbDuHrgK7FW68i0h9QHyztPp070sK01jnzIm4TTiBfvkEQ==
X-Received: by 2002:a05:6000:481c:b0:386:3c21:b1f7 with SMTP id ffacd0b85a97d-3888e0bb65cmr5087247f8f.7.1734433968771;
        Tue, 17 Dec 2024 03:12:48 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80120bcsm11134591f8f.5.2024.12.17.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:48 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 3/6] base-passwd: Update the status for two patches
Date: Tue, 17 Dec 2024 12:12:26 +0100
Message-ID: <20241217111229.60698-4-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217111229.60698-1-jonas.gorski@bisdn.de>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208835

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The two patches to disable use of debconf and generation of
documentation have been merged upstream.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aca8844d7c05b4ba937625e59275d3f7953d3da7)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 ...0006-Make-it-possible-to-build-without-debconf-support.patch | 2 +-
 ...7-Make-it-possible-to-disable-the-generation-of-the-do.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possibl=
e-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/ba=
se-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
index 61ed1641a126..6e236993f51d 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-bu=
ild-without-debconf-support.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-bu=
ild-without-debconf-support.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Make it possible to build without debconf =
support
=20
 Not all systems have the debconfclient library available.
=20
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/=
merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/c=
ommit/c72aa5dd25a952da25e307761f4526db2c8c39ec]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am     |  1 -
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possibl=
e-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd=
/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patc=
h
index 2bec065cdbdf..5c6359914362 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-di=
sable-the-generation-of-the-do.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-di=
sable-the-generation-of-the-do.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Make it possible to disable the generation=
 of the
=20
 Not all systems have docbook and po4a available.
=20
-Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/=
merge_requests/11]
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/c=
ommit/2a6d16e595c93084e279d0dcbef37d960b44fd1a]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 ---
  Makefile.am  | 2 ++
--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


