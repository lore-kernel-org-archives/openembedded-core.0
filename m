Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EDEC624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:23:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14936.1788531829269199564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bex8rPTa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso12449865e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788531827; x=1789136627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DC5ToaSjTrvnnkiLlD1++OOdUKVGMAoJKUg1JbEhRH4=;
        b=bex8rPTa07spJxhaVyau2WexJyRtW7CElNFH7bh61LaYJTtGYCO8ucXWWYmDhONyyH
         Rw7vVgHafkNYzkem6xuve8irSCuqPtZD6rvAcL8TlI86U2CEPSenTCzE96xGt/rGbe+C
         CJvLA1HBoyFA8aTUsHrmAXvwygp+YR5b5Kens=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531827; x=1789136627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DC5ToaSjTrvnnkiLlD1++OOdUKVGMAoJKUg1JbEhRH4=;
        b=hRr+s0VGCKe+x9PmijMgS1rwfCdpJ2vodtVAGQJ5h2SWfWZjcmcb67XxGDLNYJr+w6
         JxO9l2tYkAw3d8eE1aCpQeGQpqsgZgFoAusDPhwwh2CMbpkrzBktVbTtWbVfi5o23wxZ
         dVda9jCxV6hXNUg5Bcqa951w7KJefMWxU6yPq9g4Sxu5V9ua3IvR8GW10j16/oURviwY
         4C7a61gZosmSfpj6bs+IrO0x+t9Wdrv+Y/vcvdxR88+NgIggBYfw4VGxPbNRDQDup5Go
         qxFCHYB9bVB4fyUI0+umydwMfTKGr9dDfwpbvg68xoniT2ETYdhpc/2RWG2+NVMD4rNu
         u1uA==
X-Gm-Message-State: AFuF++nJGMR3U0QSqrUpGt4x8mk5rwh8qtItUyKBs2GsqoTfsab/czmA
	AVm5ijjV+w3r48urfrzapMM1JKXNN/FSWvNEWLiGddp6WYbtgUR7MOI5GXAizSpfo5ZtlC9Dh+u
	oiHra1U0=
X-Gm-Gg: AYBFou2YWs8v4CGU4Tiv7QlXwfT0BPQv4Jceiot9ZkPVGCQepfvAPiQROBTYTvcniSd
	kBMunvG0+ohdo9odfSnB9P5HM0ipJh9mojGUbjU2nEc7QQQdnsyQqdMmD4IXxg74eSTZG1RjVo5
	Lf0GU0+815lE1DXpG2hs2EYdD8V0zyYdqELz11CS2k45vXHYnluVUPlZ/eyF1E/My8E9XJm/M7/
	TBqakrBWsGeudD3hoi/Flz8guiu1X21RBD6BnUwsacQ1i4mxYsIzmG7afeAOyR7+Aj2AYmZpjEe
	x4f8j+at0dq1OsWmjngFTp/WiAbsI8DS1elpkUvI1suKi8Ut2ZHt7hVEmoTlGupiJh4XRDJ6vOe
	HG7ZpkH34TWIA1d8tikhot5xDdquDEthC6I16xg9crFrzPKGssmcQQzns4+eRjOvyWlLEYY0BFP
	EC5SzLZboaGvhFCKyyqEXh8MbqJgDKBkaPV/uhsHA1aBs5ZxUy/IBU7fNVBvs4Wxq0o+ukLS40+
	/78LYKbupr0DiNpyCmK5TP3gxFc
X-Received: by 2002:a05:600c:3495:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49cf8279f41mr66355495e9.14.1788531827380;
        Fri, 04 Sep 2026 07:23:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:23f6:3417:15e4:9ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm137868375e9.3.2026.09.04.07.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:23:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-setuptools-scm: upgrade 10.2.2 -> 10.2.3
Date: Fri,  4 Sep 2026 15:23:41 +0100
Message-ID: <20260904142343.1608107-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
References: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245118

- Do not run the xmlsec download regression test on Python 3.8, where no lxml wheel exists
  and `--no-build-isolation` leaves pip without a build toolchain for the lxml sdist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...etuptools-scm_10.2.2.bb => python3-setuptools-scm_10.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.2.bb => python3-setuptools-scm_10.2.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
index d6f23321d05..0af4bd24f5e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "36b5dcef6bbeee0bc76b7756d1b574b3762e2138611a4f18e898f22f1aaee462"
+SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
 
 PYPI_PACKAGE = "setuptools_scm"
 

