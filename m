Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8DAE6400D
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:51:08 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49270.1775454667040482705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XvRNcOQd;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c74244dc0b3so2136203a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775454665; x=1776059465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxUU4Wrnj59xX7ByMLDUmOiPxySFMmCXYaO7AOFYark=;
        b=XvRNcOQddKHhokQE4hmSNEr3d6aOKNBFEs6JWilpDJfvljTe4tYFq7dLvgGcjnyKVZ
         bSuhhqk+Qr0oa2/i6k37t1h5kSSsVtvakcVwyJgpzqV0yyz04Hwa6uVsEzzXZgcPrq36
         Kc/AKTStaIxGROfttPqO8PuFURbiUHTnHVku8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775454665; x=1776059465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxUU4Wrnj59xX7ByMLDUmOiPxySFMmCXYaO7AOFYark=;
        b=JO9YJU4CRpVCkKIwY6zmz7GS9Q19MoTlIjVSl/XASGJR2eKlhvQCOEFNKS9paeVJia
         K185fokhJokSoX150wh3nkrJFvsk4y8HyoSKA1EJhm/gZvOp5Zcsw3BIDIEC8R40aIQ2
         VafkxDS1FPBlzZApRlpp+DFY+Igrg2jV84nv60JwVjwosJWPnbyhrK9hkW1HxKaHXX2c
         wcq4eOPxyZcOOpfuWViTQhBMxiSNK+EABR17ol5TVZjdjUp8MqXx0T73X72kOtqqIvob
         C/Y9zoggEhC5iRc0ACVpOTxOzIDYgnoQqHnMYHCkvuWtyI3PEsec+WCulQSX4rRr32D2
         7hMA==
X-Gm-Message-State: AOJu0YwlG5ep71QLQhvdd7wP5K/iYGMMkV0eXTaxa64fEmFWLuJURV8u
	+uCR7KHNYd6CXWrytvOd9I7NaUEIZKsc08L+91XB5oG0gfWwbC9R6H7DpZkU9Zzjh/o/Opb8Fp5
	wwdBG
X-Gm-Gg: AeBDieuB4Mz67HaLjkz/H2mGhFjVSuBH3tHLE4Ksw6Ys8sKJxOboJCFySZqOVmZlSMm
	/fgUdxR6fy4H1k9NfyyTnfvbuTS0Y+5XGsGF5htZF+tcf0gxcEgIszFa1Uc8U6/Pqn7e5lvue9w
	6mpvpKepKM70b1HuavBDH4kobp2G7V3yAqL/gtvCmG6U5VbZr93ergfXLzEyo894jEvwEJFUxm4
	Wdr3it8ttG4QpjYUTLbJYGeQiMEqLL7beK/rF+Zrl4T/a3zamIYK1Yxiyq9ETVrExGS216EmtjO
	pmMNim6REduCUfhwUKQbgkKvrZHC40h0qJOXmU23EtfGw1KVKLYg7lGXXgB5NyJdNDfGFmygTOT
	J4yG/pd8FXlrQadeBOcQHt+TYuP5DA/sErRCJ037D/2LKB5QQcdqlasj/smdlRqxTZ/Fh0cuXs+
	9oYNf+eXOJnLhMaGToroBnzN16mCGvhRuwVjrvJOw=
X-Received: by 2002:a05:6a00:4b56:b0:82c:2647:eeea with SMTP id d2e1a72fcca58-82d0dba1083mr12077133b3a.38.1775454665306;
        Sun, 05 Apr 2026 22:51:05 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:2171:fb10:85f3:b262:eebf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm16282572b3a.53.2026.04.05.22.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 22:51:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] python3: upgrade 3.13.11 -> 3.13.12
Date: Mon,  6 Apr 2026 11:20:56 +0530
Message-ID: <20260406055056.1209629-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 05:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234643

Handles CVE-2025-15282

Release information:
* https://www.python.org/downloads/release/python-31312/
* Python 3.13.12 is the twelfth maintenance release of 3.13, containing around 240 bugfixes, build improvements and documentation changes since 3.13.11.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/{python3_3.13.11.bb => python3_3.13.12.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.13.12.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.11.bb
rename to meta/recipes-devtools/python/python3_3.13.12.bb
index 2bc2389b7e..e30acebe20 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.13.12.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
+SRC_URI[sha256sum] = "2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


