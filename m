Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.12322.1598965201985764145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 06:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=denkSL9W;
 spf=pass (domain: linaro.org, ip: 209.85.210.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f196.google.com with SMTP id m8so750654pfh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=GxSTkRoVdSyena9c30HLZxU/fvszq57iE7I/Tx4ZtWM=;
        b=denkSL9WyrtnPwfSfLBVgT+Gs9E3PRKKOVBF9R8KkmxFeQBTf8Nu5o5Ig0ptZRRLpc
         UTTmOfrF4IPoGsvaoK0QZMg0UrAOjHiJTGGM6b6609tcTYlK639rvf+87c5r9eHSRXuW
         FdVltY3E4gsiCV7+bNtXERGN8rzlYnI/VbZ/06mBILEZEXrLLWAqCCnPN618A/BCC9rY
         07fLhrva+9yQV8VtJQ/AOlcy7iph0pda7IEbNaYmV3HRZ43wbrTwB6hz6/YyuQmXNV2h
         cUpTI4gmxUQ7yDx5UyZkAnev+F6vTWnofkR8XEjZX4GrLbmSiz2epqRSZr+c0sxcRVQc
         xDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GxSTkRoVdSyena9c30HLZxU/fvszq57iE7I/Tx4ZtWM=;
        b=i5y2gkzgmn/CZF2phGYwC2Xv5Ud77TyWao8SZwavfuX2pqL54/RlPawDLEb1DPRlHy
         tVX9W75tiGEjM84bXRJR2HQeJE0eqHc5vRF/iHrjmVn37REP1X4XJsyR4hmgzpyDBhz7
         y8o6er9Dl4xnJHJTVtuAlyOkU09XhIatsmwtqS1eW6uNUK9O5CdJCt5KHWXi90NXf61o
         uqXTuKCtK6ssSfb+pvr3JoC5Z6wawp5/H2MCVlCwsAx5fOMEFnBkYnRzgsrpc3gc/eU7
         Vy6DMSV9GvdyyKrgOiQZoCvRXJFIAOWJ67ujkzBhyRnx1wZ7bYdcXOSxEyv9XPpGenMb
         Ra6w==
X-Gm-Message-State: AOAM533VC0Kl/fCGZZbDpfW1JqhUjmrXmC48dQigX87jI+Ih9yXU8NIn
	n9IzpvKGnz2Bst4g6qrS6UGj4lfzLepLKw==
X-Google-Smtp-Source: ABdhPJxffXFQGgpAiiFEhzxrgM4N5BDicZB/cWRJ6FZB3VF/TPNrygiK11ac9ff0sqVxj2/A9A3FKQ==
X-Received: by 2002:aa7:984e:: with SMTP id n14mr1805591pfq.272.1598965201026;
        Tue, 01 Sep 2020 06:00:01 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([2409:4051:4e9c:e68a:656c:53ba:1ec9:d63c])
        by smtp.gmail.com with ESMTPSA id u62sm1931041pfb.4.2020.09.01.05.59.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 06:00:00 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] insane: fix gnu-hash-style check
Date: Tue,  1 Sep 2020 18:29:23 +0530
Message-Id: <1598965163-14017-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Fix gnu-hash-style check that always returned True after commit [1]
leading to false positive presence of "GNU_HASH" in objdump output.

Fixes: 9ff90bf04a4c ("mips: Enable gnu-hash-style on glibc") [1]
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ee19ef6..c32bf25 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -438,7 +438,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
     for line in phdrs.split("\n"):
         if "SYMTAB" in line:
             has_syms = True
-        if "GNU_HASH" or "DT_MIPS_XHASH" in line:
+        if "GNU_HASH" in line or "DT_MIPS_XHASH" in line:
             sane = True
         if ("[mips32]" in line or "[mips64]" in line) and d.getVar('TCLIBC') == "musl":
             sane = True
-- 
2.7.4

