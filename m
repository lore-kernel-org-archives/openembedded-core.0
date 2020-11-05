Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.5755.1604573900348608309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 02:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=iuSw5Xha;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.193, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f193.google.com with SMTP id e21so1158420pgr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=RXgxUjcAY0jLiThnKWwPEbc+SKwokIpGU/N74g04JEc=;
        b=iuSw5XhahNsJkaX7EqEmRcFHZPTLbweMoxn/3yiz0vP9Cs/lFSBfbvAq87DUIsZF0/
         QABxRTkqtUeXiKZGVp7a+c28IVfZz5JVm28ixYeoTZ8lib/dY3baSWD39iZ5FP0oxSOW
         NQ/N19AJMPwmiAncGzJKvc48F+Mu+SR0sh7JjH7ACPzFN2onKr6mOzXytGkHlLDibu3m
         A/ivH05te/msoerIwVIcsar4e4t5iswYoN6kg6/qvDQ8M3UQE6vIzqdPj0nOp4cswLxJ
         8XumzAFS61N0a310oI0SUW6os6bY2nFQ6xliBGNgqz/w2mfEwFfe/aBI607zNhoscO3G
         LMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=RXgxUjcAY0jLiThnKWwPEbc+SKwokIpGU/N74g04JEc=;
        b=kNBUtrIsC9VHfSGvwPs/BpVaoJyvkcL9rwcc9mGt+1Xa35iqi82/7NY/h34WQmvC/2
         LqQo+E+oJovp3MlOu7RJB1q9uCGZyiZz6yOwgnkN69mK21AHoQvPucfdUZMNGoyPxEYh
         8rO/i6nGR8e2rhF3f+xuinDSZidED0AEItwaek9VY7sX/DjlTUoMl3EQ/SM/AFn5jp6+
         9072vjDmZkdsgUWrA/LLUaVgZxqf/1tHLmUtxN+cRxGd7oTkhTBreg6wtu4Hb7MdlD5g
         r5MuVO6Z3GI8aMEACa8OhhNonJcvk23ZBqHnhDNrFnZDKIHjn/gipimrBtOTYjjyAQry
         HBvA==
X-Gm-Message-State: AOAM530fewyIUNR2Eh6+LWrQmlXtgfRtTISn/dpiD4CAncgnkIwjXTaX
	pxlq0E3HWIqDbZHlDTGkNbZoL1ZEB2t+/qMY
X-Google-Smtp-Source: ABdhPJyoRZ6JHLji9qemQYsM5ZrI9rh6qAUUEXh7V4nB4HnK1krRU59mnmwrXTweIt9ZHSKomr+szQ==
X-Received: by 2002:a63:f611:: with SMTP id m17mr1883149pgh.178.1604573899476;
        Thu, 05 Nov 2020 02:58:19 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id j6sm2013486pgt.77.2020.11.05.02.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:58:18 -0800 (PST)
Date: Thu, 05 Nov 2020 10:58:09 +0000
Message-Id: <20201105105809.416631-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH v2] diffstat: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The diffstat tool is part of HOSTTOOLS. To support hosts that do not
have it installed with buildtools-tarball it must be enabled for
nativesdk.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- Change "+=" to "="
- Add more detail into commit message
- Drop native extend, diffstat-native is already in ASSUME_PROVIDED and
  is mostly broken when excluded from such, due to dependency issues
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index ee0a7e7bd6..61b2ea5dc2 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -27,3 +27,5 @@ LDFLAGS += "${TOOLCHAIN_OPTIONS}"
 do_install_ptest() {
 	cp -r ${S}/testing ${D}${PTEST_PATH}
 }
+
+BBCLASSEXTEND = "nativesdk"
---
2.28.0
