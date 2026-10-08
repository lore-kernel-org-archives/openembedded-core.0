Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D5FCA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 09:54:26 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12012.1791453262317900849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 02:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XGppV3dN;
 spf=pass (domain: mvista.com, ip: 74.125.82.173, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ceab2900eso4900716eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1791453262; x=1792058062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+JFQ3JsBp9VOWdCcDVnzX6Yymk0A7mdyH9AWP0vF2k=;
        b=XGppV3dNUuxtGDlgV9OrrXIojWOFNdxhCkCD2/2y3Rv5FK4kezg0lipeqaipugEuPO
         xiqUPnpC1dAS6eKUbZ6GBYTnOQFfhYzPHMpYh2YBwYxrMvIwFVRwmu2ckc8AEVH2h+2B
         cTsqu4sD8EH/ioN/YaBKkCeH3fSBhZvz3pQzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453262; x=1792058062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+JFQ3JsBp9VOWdCcDVnzX6Yymk0A7mdyH9AWP0vF2k=;
        b=tsYlG+nkt0J9ABNbB+U3+OyVQGtmD5GCXW65UpfJnVwA69kXWvoVANStDrDOuFVkd0
         lPFAnPj39laOn13k9ALvSni1vaQwU8CEo1EUzhm3vwy4c/j6i79hDXdEQnSzz/4tqqsE
         82lYyLWE1wIIiS0YxorT2ittBihFJqULHMkX83/w0XCt5mcXLiKbusW6FHJC3YI5gL+2
         futg43B5nwldOiBHKB0vMEnAGmxdjyI3CSX+KuuB4tj7Z2hsP++UthXxFuwSYOPTEzcs
         3pF7YLe+wIiigSrZ227naJyEaFFsdO7245wT1IoaZSrNWYEpyRecjzj6WDwXwj+ux0Gf
         +OnA==
X-Gm-Message-State: AFq9FYIF4HwFFtPHHS8oT9R+DDsLy21HFfPeZJh4BtMxFJPUif26JIRM
	/cePvyWDksIe4ucsQoyxJAslgoMFiK3UVaLGrF1NtRXtzQEcSSnJMOsbbNsvVyNPNWtyH694L1H
	Dft594+c=
X-Gm-Gg: AYBFou20Kehblb+TFqkFZLlAbUAuU/JM/O/vDtacPZJePfSOhGc5bt6jria7QGmSRe9
	MdySKwmJFZHGEZ2v0HcvKuyH98TuIEGDr84ZwBLdt55jLX34DEjsMXqNgSfRh0OHbfuKR/V/C05
	omwgNZeMlhX0Xf/SDLsO5qq3wi/a0UnTgMK9cpQ9Rr/Q5Fil6wvwrh5v27Z88eFG/69DCjDKqls
	tW0SLDzyIJV8R4s8AqNwRnmtJG5y/D+wCOuzUdvnGLt4nCCUMWpscM6jupumHBk/PCIXAwbUH5i
	I8NADVOeCidjZ4RwKX6vW1G95eYMYIdpKV6f15HkPjXF9ijYpAV0MpoVKE8qHOMevO3UCg8Uj4r
	og+/H8M0C4NXjRbYZIXNSCerjzFVJhgRiELwQ1zeI1587nkgHWizw+KbQ8oqsp38iN9zwyI8zHJ
	C5R7VOXHLOWybYoGO7k7L0XADvXnlaDi+n3OAFKqIOUBM1GAge9wnxNdKw3yiXN2vdySKOKC6Uc
	qeSIdtU
X-Received: by 2002:a05:7301:670a:b0:351:595:750b with SMTP id 5a478bee46e88-3515dec9a10mr10167933eec.36.1791453261504;
        Thu, 08 Oct 2026 02:54:21 -0700 (PDT)
Received: from MVIN00352.mvista.com ([106.200.27.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515a8b7c5dsm16757750eec.0.2026.10.08.02.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:54:20 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] python3: upgrade 3.12.14 -> 3.12.15
Date: Thu,  8 Oct 2026 15:24:11 +0530
Message-ID: <20261008095411.1492881-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 09:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247424

Release information:
* https://www.python.org/downloads/release/python-31215/
* The release you're looking at is Python 3.12.15, a security bugfix release for the legacy 3.12 series.

Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-82049 CVE-2026-15310
CVE-2026-19672 CVE-2026-15806 CVE-2026-17084 CVE-2026-87910

Changelog: https://docs.python.org/release/3.12.15/whatsnew/changelog.html#python-3-12-15

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/{python3_3.12.14.bb => python3_3.12.15.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.14.bb => python3_3.12.15.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.14.bb b/meta/recipes-devtools/python/python3_3.12.15.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.14.bb
rename to meta/recipes-devtools/python/python3_3.12.15.bb
index 14be125180..6c6289b0e6 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.15.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a"
+SRC_URI[sha256sum] = "c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


