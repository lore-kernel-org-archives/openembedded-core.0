Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.5760.1602333415927400335
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 05:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bUSotu5s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id x7so4431180wrl.3
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E0TTniQcZiAmZ5rEeD5QNYG2PcZFZdENJbX0kJzEvvE=;
        b=bUSotu5se6BLBGlXQAxTA5ORI5G4VnPmpuvCwiFzSful8OVKXz6bBFImF73SYvmoJM
         +dQaPTjZAHr3qg+rj7zS9mywKHOiw/dyDDELFNWAouobDMmiTM+H8eUsgKQD2HltDdWQ
         hdU3Hs52ikbq0FXtJKa594YOlK3x5mOjwhaos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0TTniQcZiAmZ5rEeD5QNYG2PcZFZdENJbX0kJzEvvE=;
        b=STqj2vbm4qgSCWH6XOpIEXmdcngRuB3YR63wIDSBiPpGo+wu4YHTJmbUX1yQaknXBa
         JELXzYj+4SIfhcVmD5JmOUIx0mHTkPO2nekJjgU8YPEeUOEqQ6JK7TnJS7zv4pdE9FqM
         aVX7TMMRimfKB+Y3R1joTRuYMzlpejZrHkxz8u0PQXo9AlcSOyf1XaajTrh/eN4GPd56
         Pnsz43cn/xtKiiEtfA95PD65wdIgLwERNwTTCenRqEGvm458JmCIwQ0U09jhbxUGBp0i
         iqQ7weKwkmpmnoSAoI5SZv/gsPuKCxo2khc0co5fWBX3HtHojHPLQG8etZm4B2fyijaE
         PnjQ==
X-Gm-Message-State: AOAM531M2H7plLSX2Gh2BeIXWgnKfEDCh5AdL5/p8UIy6I/iSVZYQ7ss
	GxR7uzBZ6eO1sKg11qgpj2VWkPHSAR8JlQ==
X-Google-Smtp-Source: ABdhPJxHgxZ1s2VRtWlRs84ukqH57GicaNUQGDt5/YKf32ONpAVoCFcKEWcrTW8QLu++HcZWbz8W/g==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr19912053wrm.295.1602333414239;
        Sat, 10 Oct 2020 05:36:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id u12sm16478387wrt.81.2020.10.10.05.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 05:36:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
Date: Sat, 10 Oct 2020 13:36:52 +0100
Message-Id: <20201010123652.3321544-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201010123652.3321544-1-richard.purdie@linuxfoundation.org>
References: <20201010123652.3321544-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid pseudo abort()s like:
path mismatch [1 link]: ino 6295376 db '/tmp/oeqa-feed-sign-2mw7z81v/S.gpg-agent.yocto-native' req '/tmp/jwkivmu6'.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d89731c6925..1bb1c4bee40 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -161,6 +161,7 @@ class TestImage(OESelftestTestCase):
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
+        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.25.1

