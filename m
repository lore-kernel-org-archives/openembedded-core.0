Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.5888.1609856743342503571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yss30sc3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id e2so16421923plt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Uk/xGBi6SGRi2w6TW1j3TZNUynZP0Ktp/hh6sGOYxaY=;
        b=yss30sc3QbjP3cnnzfVpX/oPkNDoVoG0m/WfOr0/r33VFYfAu3vdX89p9zlL/XUN9Z
         1aU0W0+eoC41UpU9AAcOJOAZTrTNHLRBpTqbHAkLKEG5Zs9seRPSiRmJ843kLZ7z1QjK
         bqRt8qlmzhMNowxMuQWrRX8HiuSftsV3vhE1nN84o17VIW/DOnEUEqZ7+awllcQNwHgN
         cMTG7jiB520ROmm20Lql4dFY2SrKd/4xsPy3yJdeUIuKABZgQpEK7vsrcaV9rffWd80T
         bM7EVeVprZJceDpZY4b//0Ry1+gbjaIp/lPshGf2tJdM3bXb3+7itMRglgQ6X2vOeLyu
         71Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Uk/xGBi6SGRi2w6TW1j3TZNUynZP0Ktp/hh6sGOYxaY=;
        b=O9ExSTnKvun4LiWolpeVt3nWqSoFofHydd9ZysVNfSQ/AuJ8afxByWnm6PPyZfDStM
         ob3ofQM/W3UDTYzlko2O3HoDvjDWl/Gpct7tWqBpnmY8zajUDOktnR8MS5flRG+L8/AL
         HeYnsDRsZ9wET6YJaNU5mfEQ4ReEZrczbq5Q2PdOjtGUH986tjD1gMYcmXZxRAdBrn0b
         7wxniwrO4+AQd3JC2hoGqss4UvEHZVBSYTOfgsq3BJCCKaW6bi2yd9pYHfLxEseS5z51
         RAu/u9a/MYR65hjJ9wPIexFe+RuRunXYStL4oQf8QTyM9VBiXJJEAA7zjrmi7OHiWjrA
         sqQg==
X-Gm-Message-State: AOAM533dyVX5/t/z8IqwYOoH7AAUEagxWe7TDrX8Fbie8VdV/4vUQPNr
	+AthMEp9HcFoljgtCTLHT3wbMz0fzAKAK2/D2JM=
X-Google-Smtp-Source: ABdhPJzDGSVPeUV58TYUZ9uYTcFcnDmGp5bjv+1JssSyNi21VRXTkYMQeC7cNErvLGVm5BYLkwcmvA==
X-Received: by 2002:a17:902:a412:b029:db:cf5a:8427 with SMTP id p18-20020a170902a412b02900dbcf5a8427mr77665783plq.48.1609856742521;
        Tue, 05 Jan 2021 06:25:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/30] lib/oe/qa: handle the 'no specific instruction set' ELF e_machine value
Date: Tue,  5 Jan 2021 04:23:42 -1000
Message-Id: <a4339b1c958b736be951ae3142e6be72702ecad2.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

[RP: Update OEQA selftest to match change]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7cfc0f51cc0b4866f913f6eae4fcc6f72d2578c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/qa.py                         | 1 +
 meta/lib/oeqa/selftest/cases/oelib/elf.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index ea831b930a..e8a854a302 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -156,6 +156,7 @@ def elf_machine_to_string(machine):
     """
     try:
         return {
+            0x00: "Unset",
             0x02: "SPARC",
             0x03: "x86",
             0x08: "MIPS",
diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index d0a28090f2..5a5f9b4fdf 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -21,6 +21,6 @@ class TestElf(TestCase):
         self.assertEqual(oe.qa.elf_machine_to_string(0xB7), "AArch64")
         self.assertEqual(oe.qa.elf_machine_to_string(0xF7), "BPF")
 
-        self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unknown (0)")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unset")
         self.assertEqual(oe.qa.elf_machine_to_string(0xDEADBEEF), "Unknown (3735928559)")
         self.assertEqual(oe.qa.elf_machine_to_string("foobar"), "Unknown ('foobar')")
-- 
2.17.1

