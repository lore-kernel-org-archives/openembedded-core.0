Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.1683.1613676129937126808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bm7WTLFZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id x14so3293824qkm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y63V78oZEgtAx1C2rYv7/el+19LbOFH5bQzBI7/naFg=;
        b=Bm7WTLFZYi7rKbzFY9NHIIZTlKCqo5Y9HAC6djo00v+M3Mus4X46omt1fPxcc/SgKA
         7aEu5HqUH9lUWv+Ht3SjJxIMZpxEXTH4IRTgMCcWieEqZyHMbJSqC+dFz702G7oxB3kJ
         X2mL//L57o8ZrW2SiWZadu5cuwMRy4k6dXbIFjgLSD4qSIkh5A4bc/CHhLtr4L1CuzXW
         4yeYxDBuuK4wWOiZubAWdc8keGhgAwOXrcfVvnxWnZBQTY4Iy3GdXR0h5+9gRqC08XoM
         tvUau5NB3jPXSfifDCK8FbT2LnqR6jM1dpP2f1BGB+7lMfclyjB/A2RyjMVA0+C7Sg9F
         JzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y63V78oZEgtAx1C2rYv7/el+19LbOFH5bQzBI7/naFg=;
        b=K65NdsizBrsvoQTW/inr6SjaHpPpLyK6DKfWoWvvRklkgbbUx4PC15qjpdQxvTks/j
         cCsjE6laAnLADNVEUdmBy/iBuv/Z8Bo2rfE0AbSoj0SG2TDG3XXrL28DxzdEU4m8w7ot
         VevF1t3l7sfhBzQ88iqy0NpUeqZwisOc2n/iysQ8cuWYiGeoHzYqDWw5qPf5V4jD7DWb
         mG3zRzDPVsdRqJTqbX3PZYW4FyA6ge4lCDS/0R6Q8X1yfzmmym8X8uvq/fHA0e14eD4o
         Yc+SaTBJjZSZkvv1yAvfd2ISzN4HGrXtdQo66Sv5WlPSh/sPDrokEVv1oJl96MgzOtWN
         90FA==
X-Gm-Message-State: AOAM533nhfeR4b3SM2E6sKQTJp6OP/E8u1pMjhWCLydNyXp2/Hxryf1Z
	E6to6jMXcpjJAwp38disjYXqVmNxa5k=
X-Google-Smtp-Source: ABdhPJxXib2tgHm8BTiBbC+sLySkyyujIZ+lnI6dDMpvBjq18hH2ThGS/aYH8FtZxlUP9W+Gp99cmg==
X-Received: by 2002:a05:620a:cef:: with SMTP id c15mr5874135qkj.355.1613676128951;
        Thu, 18 Feb 2021 11:22:08 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id l12sm2674438qtv.41.2021.02.18.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 11:22:08 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH v2 1/2] Revert "iputils: Fix build determinism"
Date: Thu, 18 Feb 2021 19:21:37 +0000
Message-Id: <20210218192138.39449-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d10da5f6e6d6d3600645dbe43ed412ff23b55095.
---
 meta/recipes-extended/iputils/iputils_s20200821.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
index 28dd194a12..8b63a23c61 100644
--- a/meta/recipes-extended/iputils/iputils_s20200821.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -38,8 +38,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson systemd update-alternatives
 
-# Have to disable setcap/suid as its not deterministic
-EXTRA_OEMESON += "--prefix=${root_prefix}/ -DNO_SETCAP_OR_SUID=true"
+EXTRA_OEMESON += "--prefix=${root_prefix}/"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1

