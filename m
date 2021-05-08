Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.4441.1620465428183722538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 02:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GuVMC9b4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id n84so6502569wma.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vM8R7xEhNcNm6I1xRdlEX9ncVGDKEoJa6NfPGQparEo=;
        b=GuVMC9b4KcUmrdYju+oIFuXIBKP2xcpZRiEjhP5dRfjs6rUi6PhcDStsEUQRhLu457
         MlgUi37lvCSGtPFbF/ARX30tgRvOiwDnJ9dg2z8X7/kfAeJCew+csgm5SMS3/GIyJSOp
         ScoZ01A6stScoD0ozZNeGFZj2vTMKnYsPlTKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vM8R7xEhNcNm6I1xRdlEX9ncVGDKEoJa6NfPGQparEo=;
        b=ep0gK94QJFCbRJEqygI9s1q10KRXWGxZZv2eq1SO1g46EqYfGJ7Gl13CdTV/RetMvg
         KOBYwoFENtldqNo4nPYugmtKV2SP2YJsYLw/G+vaw25orsg3i8RFi6JOEMoIaLVXWvKN
         jHElXJSW76Ne1PRUn8NPWzdkiWncJGcheSAIZuNuQ+ljjBiJcA49Xc9wX6JY3hZU95E4
         fQvQAyFvbtoVYWyRt/lRlBzbJxKaI1wul5WRx9y076MH7U9TFCCl/g9ZZyPBWDXgNA5n
         pUSAbaYkj39wS5RgZzc3YNxGSkPLwLD031xdX0V+M7RHw3pCbS/2TLV3K1JwMkXKdPKL
         U11A==
X-Gm-Message-State: AOAM533NIK+Zve4q/zcMqeJcUajIpTTld2U32N9uNsj3A8vO/vHgis9q
	UoOM11T4/rsmxMkQCIDx+sCpRO6BiBTvtA==
X-Google-Smtp-Source: ABdhPJw4mogIWhsgUllZ9fENOK1b5S76nW/96AUWwhADajXAeEOoryZ2SOXdY5R2gBwS/HgOqhtWww==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr25663015wmj.43.1620465426603;
        Sat, 08 May 2021 02:17:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8b6c:ea91:f112:97a5])
        by smtp.gmail.com with ESMTPSA id n20sm7193296wmk.12.2021.05.08.02.17.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 02:17:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Fix binary vs str issue
Date: Sat,  8 May 2021 10:17:05 +0100
Message-Id: <20210508091705.2084982-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent logging changes for qemurunner showed up as errors on the
autobuilder where decode couldn't be called on the returned string.
Since the code returns binary data, return b'' instead of '' to match
to avoid tracebacks.

One of these cases was newly added, copied from the other which has
been there for a long time, always broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 69fee27511f..899152c7adc 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -724,7 +724,7 @@ class LoggingThread(threading.Thread):
             data = self.readsock.recv(count)
         except socket.error as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
-                return ''
+                return b''
             else:
                 raise
 
@@ -737,7 +737,7 @@ class LoggingThread(threading.Thread):
             # until qemu exits.
             if not self.canexit:
                 raise Exception("Console connection closed unexpectedly")
-            return ''
+            return b''
 
         return data
 
-- 
2.30.2

