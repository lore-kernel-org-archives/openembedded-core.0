Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01503C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 09:33:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7098.1737624809162802473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 01:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLaexe6f;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862a921123so372271f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737624807; x=1738229607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edHMkzvV5Bc5KiEE8PlDlnI+MTDwTmL35HsqUGlFtW8=;
        b=HLaexe6fkqsg1JmyEj4kiHewLNIizmlvoi1YEqwJYx9H9i0RouYmMuA7pdoQAfk3Rm
         NYNxcU/H8vzigkiJ9JxnTPlbSmsGmLMb+HVcvw6t+tsSbAMxaMYCCpB5cCctxX3mN27j
         mgqi3tMRALyk/bfkML3YYakrnAK1IjcUMNGZIp6u9t4ftfLUzCDPAGmCCCFV4lTFGsYn
         tVW2RrR718rI4DFnt3cPC7+9RLt/Cyj9b0nQd2SbK694MuUeJC/HqE8PCDF70zf9zIME
         7sRpFjBnSrpM9hZWI1n1GtebGpQsf50UI6TBX3+GyYAnZmrFoigDf/3oGnTmV2hJgk/h
         cVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737624807; x=1738229607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edHMkzvV5Bc5KiEE8PlDlnI+MTDwTmL35HsqUGlFtW8=;
        b=IES1hUet27U18ZvCECqY/YYbSlWj2mxTGwbEEzaRizXQ+8NfLBIb1zvUw0TB6XW+JF
         owEvv/R4SGpn2vc5MKXgJxer5hCGIi5lXrgOO8sK/RaOpONTwtSRF9KNqMkHPjrpo0pQ
         lNjscFwioV3ax1kDbCsLL1JfUnlNK1r2BCHF/TN3MZmzGt6QoDpxUmIlbxtJ/wQspjgc
         i1kcuuTIChkd56pIbsoD44CcFCg4luGLHc7I5ufYC71DIxwoLkeBO0pKcBVM7EvrxSfy
         IQUMOtEu9VmKiUFEtBU+aVU4P0h9gDOYdOgeIYG0h7YQno2AxcGwYhS7EG5dXkvBNl0X
         9VHg==
X-Gm-Message-State: AOJu0Yxvn/cmPFLaVDTpS37w7KcQOXI/ePqS2HlbvX8WamDA4PyPiW9x
	4NEJgXxLtX9kr7J79rRy1+cZXzrqw/Fsxu8A0eWtUWIi9n24emLeCfDigw==
X-Gm-Gg: ASbGncuGGnlq8H/ks2/Tl3RoAM1eJ/oUOIG/0yXzPqofaFOUhdPjduQZ6aDcbNX4fM9
	zysNyzZIxWyd3bE+oUt6fTXDUvgtNHSNBdySjGwe0CqplK30by8xcoEKv4d4V3rtMMIDyBHo/5W
	PjPAdH3T/aoowZ5ai11AAM0TZdTnGzYVVM7p8hc/EKZxWeJPvsLROm2Ub87g4dIMIB5bn0g66av
	3I3USHZ6oPHbBJLtTjVnDB8EJ9opBAOE3K5bDdw8/xgQ7J0MPqEzpk/61yeYpm/Ye3icZexDRnQ
	JZx8NrYEyiab5SJAQMRcP7r1TlXTji31qLk4yA==
X-Google-Smtp-Source: AGHT+IGslhPLuCKbVKuqV+R2aJ07bEFIsNgPpiA2MgPobQA3QWjWyZOA+lJmfdpVNC2+uXM8EsX6kQ==
X-Received: by 2002:a05:6000:1f81:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38bf57a9477mr25959758f8f.43.1737624807380;
        Thu, 23 Jan 2025 01:33:27 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38bf3275901sm18950427f8f.61.2025.01.23.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 01:33:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaying Song <jiaying.song.cn@windriver.com>,
	steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [styhead][PATCHv2] boost: fix do_fetch error
Date: Thu, 23 Jan 2025 10:33:15 +0100
Message-ID: <20250123093315.722857-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 09:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210186

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_86_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix Jiaying Song's e-mail

 meta/recipes-support/boost/boost-1.86.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.86.0.inc b/meta/recipes-support/boost/boost-1.86.0.inc
index 2378b27575..7113a50049 100644
--- a/meta/recipes-support/boost/boost-1.86.0.inc
+++ b/meta/recipes-support/boost/boost-1.86.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.48.1


