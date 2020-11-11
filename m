Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1007.1605059276924290511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 17:47:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JdWa5B+k;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t18so156299plo.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 17:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LFXIiw1Ytxn/PLLYy2J4wa5jpURglgzgNG2AJ9KbqY=;
        b=JdWa5B+kRU4rlluPlxqPsntwJ0zamjKyjYLGOSSv4UD7DaSqgfPJqIIbDOMNiGWRyU
         zlonUhyVrcKZnT7uLZymGzOg7xIl0ioVzxux0Iy4d/b/ITQsJHUW/FGtIIJXNbPs8ZnP
         OkGgGdYunnLoz/pUaBZBF5JGDjbL3rDsTB9LntEhrQnI1NIiJ/NS7lShTaUSkKB/3+MM
         2V51WthpBeig/wL80HFoP5ZaXFVC+PfSOVZifpZ8faogJbeP/qrPboIB5a5DqqW/UbSj
         FmeG4xuwKxpyL+M+BnfWq2xusyY2DfvxCZ4HI/9o8A8uFIQjhDViuwjhbWnfJblDnn0e
         I7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LFXIiw1Ytxn/PLLYy2J4wa5jpURglgzgNG2AJ9KbqY=;
        b=cE5P+SeliVF3rV2U6Y+bSXxsNWKwSkcxScZx78kqY4UxPp4kqyInnL+m9uQZDK9DMK
         qVcXn7e5LqU1xnd+Oq61471NZkg4A9AXXHnPT/Ac6hOaDhI5pqLTE+Xqzj9ToH9Mh3lr
         1hCDpvl4eyl2h/YsPbRbvXGd0dBRCdpEtlrrkQT9lyAqe7zf5MzUNAC5+8Y5fi+VXIIR
         8+U18UXId2kkwdbm0earAQe08SISNTAzLnMEgmtzRk2t6ZCGvGU13+MSc/PGE+0/iac0
         3NCsd9ppqPi7aRzIxurrmlUTK/zo2hORk3p80InZU5QJLH0gmRKRHgzFu4/F7tqG1b9I
         Fjmg==
X-Gm-Message-State: AOAM533jbBA+T+ILoW9R4dmEx9+M8jtI6XMTmn36iBvVQonrOMgllXI2
	lmBl/Fw2ZuZoVTNudmAwiYvl4PTS0SD0yQ==
X-Google-Smtp-Source: ABdhPJzX7YM/JAL8lcsT5zfdzKHsoH1Qp3j6V3ew+KTcbHCpLEwjj91+FiCbefrf2pSCBHDnB1g+yA==
X-Received: by 2002:a17:902:7c12:b029:d6:ed57:fe13 with SMTP id x18-20020a1709027c12b02900d6ed57fe13mr18786001pll.59.1605059276148;
        Tue, 10 Nov 2020 17:47:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 30sm259363pgl.45.2020.11.10.17.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 17:47:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lto.inc: Disable LTO for webkit
Date: Tue, 10 Nov 2020 17:47:53 -0800
Message-Id: <20201111014753.2878999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

webkit fails to link with LTO on at this point.  Some of the issues
are being worked on upstream and disabling LTO should be re-evaluated as
we update this change.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index bb957084b5..20895ad40d 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -19,6 +19,8 @@ LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
 LTO_pn-perf = ""
+# webkit is not linking properly with LTO, disable until next time
+LTO_pn-webkitgtk = ""
 LTO_pn-xserver-xorg = ""
 
 # Custom LTO flags
-- 
2.29.2

