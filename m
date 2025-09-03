Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC87FCA0FED
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 03:03:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3623.1756868609050289852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 20:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvjQqbry;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so5037196b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 20:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756868608; x=1757473408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRC93obLEl8K1oY3SU8c2oTPcwZji7yVuvp0jOUSTTg=;
        b=KvjQqbryRLGMFkgAZAEF0444ufxmzJC/4HfiMqbEIXdmIogqzDrgS19nj1qW2yaoVC
         geBSl1RaYuVGOmQp4uTbEYyhEuCnMCg+ZqdqYRi9+u/7GRwOzY1GlVzpL9Ik/I4biZrF
         xStoNk22GnpZAVTllqTLOMN2QeRlCIylYTdis2LzRV2e7n4i+32Fl4gb111CiT/S1raw
         jqA4N4AslXPuVx8wLR3mUhujhmIVaJHk/Iel7nWl23mR+i3y8iNmqFwjnLIbqN7IhPQv
         lnF1BDM3tnL6SaDIsAXOi58kIHzzeFSsjwTV2lbHTrPjhDjCNY0Cax/b4F+zU3cI4WSo
         qVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756868608; x=1757473408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRC93obLEl8K1oY3SU8c2oTPcwZji7yVuvp0jOUSTTg=;
        b=d7gw3gDg9uWc5xnfcqzq1eYrOcM/BrUG+1XYO48fLMmuZYNabo6Qjn1dKcZHZ+JV0y
         D6D7gVN3rH8MXrYCz5U5ff6ctbh/Bg460dHGmwKbrwYkpv3UPHs5gaxQ6hT6+YTlukiy
         pq0ay44nPHs2l/+AB0kd7tiO8clgZwNSc7gF/xqmYWFNacKYNkhB5Awkm7DG71xFO+xK
         oJax+56cXETrin9SoTau56k5sQcxwukaemxLCEk7ju3yY6zG69bF3ozdk33exWA2Mq3X
         7XxCftme2RDk8JJWg68BIHzzMiqK30zUk0vhLF3hK3bGvbRoqfs+NQNfclRF5Rt4MFP+
         jpBw==
X-Gm-Message-State: AOJu0YwGbZlbnfOUaoCu0nOHxJPDcYC7yHhFRxLX8UMoA58qZfUHmy0t
	rys89GZD+PNTF1O12Q9zCZNFh8RLrlgwJWENpP5TRfo4hineNDW4WVSU6KYHsZYo
X-Gm-Gg: ASbGncvg93/SKLFD9KjyrzhL9Ct2ATMReL7ul7PUHrUFe40EdyxChkrx+dhM4C/7PtY
	q36KfKHqgCGvuJF9Da+zdr19/9zIEcUvs7o11W/6wqgghmA+5Ech3Xj3D53AMHW9tsBbaqc0fBV
	CBzmdJcUOmY+VivYHDk3Ok2zqSpAO3lo9isjIhIvbpInpRy9cnxG6YGqpwUeyzweE6HEvv1tjz9
	wG1fS0I+Rlo6qdwbDo4Ja3jfZkskBfPVejqnTcFucJ40cBLnP4Orkgq8HjAWtFxCbBNSmkgUQjU
	ceAwRndLSUb14YwObjincu6cxBuuQ7bKmuTuHWMhdaArdDAHGkPeNs8zEoBUF+l1QnPXIRJFC2i
	4v+Frydi6BiwIORmb/1kt/WL92PYuPlpqJlVGiE0jbIdK48sd6nk7BADrWG/J3g8RbCmFyEHurk
	30Qh+FJ75nqvocG2N2BYRaGm6MmH04ok2/Xwu/vkBm
X-Google-Smtp-Source: AGHT+IG8vvEqc/euMwiCeN21e9k9YaHuqQEls8y+KGsWJ7iWINRQbgoHHy0BgyZ352G9eyJ5LPvjRw==
X-Received: by 2002:a05:6a20:918b:b0:247:b1d9:788 with SMTP id adf61e73a8af0-247b1d90a5bmr1493296637.8.1756868607992;
        Tue, 02 Sep 2025 20:03:27 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327976b5074sm8993845a91.4.2025.09.02.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 20:03:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] bindgen-cli: Upgrade to 0.72.1
Date: Tue,  2 Sep 2025 20:03:23 -0700
Message-ID: <20250903030323.3669364-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903030323.3669364-1-raj.khem@gmail.com>
References: <20250903030323.3669364-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 03:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222839

Fixed bugs

- Apply a fix for a breaking change in Clang (see issue #3264 and related).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{bindgen-cli_0.72.0.bb => bindgen-cli_0.72.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bindgen-cli/{bindgen-cli_0.72.0.bb => bindgen-cli_0.72.1.bb} (91%)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
similarity index 91%
rename from meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
rename to meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index b95faeabc0c..2f3ec04e822 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.0.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0b9a98cb3dcdefcceb145324693fda9b"
 inherit rust cargo cargo-update-recipe-crates
 
 SRC_URI += "git://github.com/rust-lang/rust-bindgen.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "d0e7d6b5b763e93dd38f9ece05230979ede95a0a"
+SRCREV = "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"
 
 require ${BPN}-crates.inc
 

