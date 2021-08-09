Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.20749.1628502553747508047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcLpwNhK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h13so20561365wrp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uML2BmQSPou2mFLItAhP12pLqacyeEPDtH96oDc7xJc=;
        b=EcLpwNhKwjJ8RhPWU88KS9LmiLKHp+RCSvYWSINkKtV6FgOT5JcOEFnJZOKL88WbL2
         J1OAw/i6UyMZiTbbSJE9a6MG3X19K3LlwaJ+Tmc5n1uC4VGpHtAtT86SJj+4ZQczgw+U
         SZjVQHQ/PJOHuWdtOiKLv5Idz0ovY7w/AjQkvqbBo7cwUOm22fKa7wPyUspHj9x45ODj
         ZwRSfuopSxDY0WyMjxowWFjgRmCmZiQOJ4x6Y0KVGaWiNq5BbghIv0dJcz5h0AQiFmRT
         aAx8zil09E8J75JszP33zjO036f86VZq+Zk2EML7urzpkX6w1YkhZFE76PjMY9ZZykpX
         kktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uML2BmQSPou2mFLItAhP12pLqacyeEPDtH96oDc7xJc=;
        b=hkSB2YrmVx6E2n3fXddQKOlTqBQwRdXetCTz4c/onrdOh8/B4aYlnu27TakeRTWbRz
         /AfOBFRn2pJWhHn/2x1f9sDNvjJxKFchX6qzkTWhxP8Iiv3wKsoGiswASulLbKtvNvsh
         8786FRphw9P78waRtLBEX/SbPO3BKcHPIDjptRXtnz3kbeEH4LidkFv/wjZdi9eyc+My
         CjFWrv/hYhdbb0FI4D30YLORcND+3BdnZRLm4X7KUvsl5lFilH0eESvD1m9WkZrPpHh4
         P3RoC75tZAJLbVxEQ6AAc05UQaIukM6zTiFzo8C+W8e8Xg1p/zu3upalmmVIdpLQ1oto
         UJLg==
X-Gm-Message-State: AOAM533u8DPeA0Bi0VrMWAvVZ7L4xUXaLenv4GB0ljdUH91McZ4Xv6+S
	kV8QcxTEfhtrgvAnaMI62her/OVWJPc=
X-Google-Smtp-Source: ABdhPJwkVHVU6YGdpdb9JHdtVS4bG9MbreKBOueRVndjtRzf1bQI9OHYYrirkGp/H1M6YvbQq6XiFQ==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr23799426wrl.135.1628502552019;
        Mon, 09 Aug 2021 02:49:12 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c190sm17314303wma.21.2021.08.09.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:49:11 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/5] sstate.bbclass: only search on the mirrors for the missing files
Date: Mon,  9 Aug 2021 10:48:50 +0100
Message-Id: <20210809094853.3619155-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809094853.3619155-1-quaresma.jose@gmail.com>
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the first search we found some files on the local sstate cache.
The missing files are know as well when this step finish.
When we have sstate mirrors we don't need to iterate all files again
because we already know what's missing.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2575750247..c3c145e7f3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -949,11 +949,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 foundMirrors += 1
                 found.add(tid)
-
-                if tid in missed:
-                    missed.remove(tid)
+                missed.remove(tid)
             except:
-                missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
             if len(tasklist) >= min_tasks:
@@ -961,9 +958,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         tasklist = []
         min_tasks = 100
-        for tid in sq_data['hash']:
-            if tid in found:
-                continue
+        for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
             sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
-- 
2.32.0

