Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93349EB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:34 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.7301.1687919425638024816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yBHVyoUD;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-38e04d1b2b4so3840306b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919424; x=1690511424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj3McKblatoVXUNxvN+0DtxcESMAePSUydFtdfJH4KQ=;
        b=yBHVyoUDt0N4d4qii+8KxZlYc8lw1aafKBhUd2XhNZ8/CPjkXibNB9HJGAzTA18zBx
         v9tfnLsjmQckQV/G8s6klYvEQhSL2DMvlJMv5+nafsvfKcOKRMMQJKgS8D2lFFW2Uww2
         IpulPlA++uw4QHiu/wZfwBYbSKkPuVsmGCwZXu+BJtzTNhh3E044FWLinADxyBtYUJLu
         ZxwS3hneD0kjWLokNHtzB94XPvpQSW2kP6Oo6gZO3W7rrJyzREXVFojn0XC41YlBod2k
         K8ImBgqThsvPl3b/5gDITsYJiaOrTy47RmsJZYCK0K86fVYnPp7p5frLocZ0EiMy1I4e
         wgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919424; x=1690511424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj3McKblatoVXUNxvN+0DtxcESMAePSUydFtdfJH4KQ=;
        b=LLWPhMuer0nGaIgWO6RG7Esu3V6hI64l17qON4dLEqPfn3mVZVHoTdR8YAs6Tonc2B
         WLy3735zPBEL8zy+d2pQR0pXudwftcDpAeVoQSeKvtnsVK2bYUdsCjv6rC0vrX2A7iD7
         lk7u+Wzk1H5ddEUzUlkSI3KOn7FeNSOOVGltbBMzpcFmNn/OCoL7tT8zQdZQ5Ng+ILF+
         oaIzg9u5/wagNBCwgeUP3poIZpaRdJaxVgWjaRxpYNSwlMOV+CneKjsVeHkiexOpJ5aT
         L3Dr5eg/jWLSsZWS6Vzwod7x45h3764GUtFd1JHlBNaAy5vLnEOZt4n4e4UEdmXuk5Na
         BIAQ==
X-Gm-Message-State: AC+VfDw+MdXfPA9W6fblUxhzy4JGbWME2O26BJJAmdMdw9EXYDTqOH4x
	Lvl3kdcxs2UQTdW5fTnqWy0NOwzdfCWCt6O6eAKzzw==
X-Google-Smtp-Source: ACHHUZ44M+Ur7Omvj4cSczHqDuHjUJ1nv4LNI+D/PN2KH221a/BOQCECt8fMU1D+wmejNAWvnBSeeQ==
X-Received: by 2002:a05:6808:1924:b0:39b:a87f:91e8 with SMTP id bf36-20020a056808192400b0039ba87f91e8mr49298085oib.45.1687919424499;
        Tue, 27 Jun 2023 19:30:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/30] dpkg: upgrade to v1.21.22
Date: Tue, 27 Jun 2023 16:29:34 -1000
Message-Id: <eddc394e6ad88679b6cb8db30ccf9c8134ce87bf.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183527

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

  * Code internals:
    - libdpkg: Handle missing Version when formatting source:Upstream-Version.
      Reported by John Scott <email address hidden>.
  * Localization:
    - Add Portuguese scripts translations.
      Thanks to Américo Monteiro <email address hidden>. Closes: #1032562

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 56bdf69a06be21ea376303fbb4d50e9dd570cdbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
index a19a96ef06..04bcc93321 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "9ef736b7b3a5fa0d6e991e8475eb2e3151fec345"
+SRCREV = "48482e4f16467e05a08aa3b3b8048e08f0024609"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


