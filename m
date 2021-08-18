Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.56951.1629303862649719398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s6NdPmWu;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so2139819wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uML2BmQSPou2mFLItAhP12pLqacyeEPDtH96oDc7xJc=;
        b=s6NdPmWu60ENpAn9x/7IU14wJ/F9li/bw3N4s9A8lhXKVPLAeZkiTUsEA8W846eY4A
         mzhvfkd0KgeqxLg6LSTBP58oC6+mQgf7ADi9Jcq3j456DOvzkn26oOs5gcZHq5LWvehT
         cMT7kJ0xI2gM98Z3xL9vHqEVLrJPMwZZJ51HvnTPPZ8p+NjFi9lfo7Xgi0n+dM3qobuw
         eirIPat3UBETawqQfPIc9n2H3NQGa+RfiOmKBtnYqVoOImGln6NBWhnF/UmAC6jE4AK1
         nphfI5YHoNZxyCDpKB1jJPH+WSpcMN66cqw0jLi4AIq0jYwSig5hqdAeggpmzJJMHhjW
         Cwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uML2BmQSPou2mFLItAhP12pLqacyeEPDtH96oDc7xJc=;
        b=gPcyFBxCF/Jb92s+JgF6GIASZOj7BgDavWxc1GV6up5R9BUk0DUMRX4y2LYabYSbtW
         1IhXfTWKxtub0LkdlfETOxU2cslE7xViTjGTzKot4Rm7JTi1oNaeDTYAlUM2QLhI4p66
         1lzZGgVcHcMczk9TqlFRHiW0v2nZm1Am0B88m58aDJH1k77pz357+oLEzF908sFIrCCI
         tewfKvzPYrQrt4m5zMkjjJf8VI9v98lA9f1+OHS9hU0PEIc5mqJKXtlZ/9bwQCKeyLlL
         wdVMCoHEaO6C8v+ogHf653Fr/tppFw+nClwzMVQQzuNgw5qBen/s4Z6aqS6lBTb92Bhx
         86Kw==
X-Gm-Message-State: AOAM533CI0/le//X2cKhi4LutRyubBe7tNwBwAnJIls+hVyVioP35PyI
	yzosZLLKSoOtO/ndsGhmL81/5CaEraA=
X-Google-Smtp-Source: ABdhPJw48bEoiGpOAs5I1gDJVvY/dWM7ZMwOOqSivLTeovVxtdqpLbZnsWBEHBBYk/u+KRsJY8Ojxw==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr9396119wml.6.1629303861083;
        Wed, 18 Aug 2021 09:24:21 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id g35sm6086688wmp.9.2021.08.18.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:24:20 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 2/4] sstate.bbclass: only search on the mirrors for the missing files
Date: Wed, 18 Aug 2021 17:24:02 +0100
Message-Id: <20210818162404.130067-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818162404.130067-1-quaresma.jose@gmail.com>
References: <20210818162404.130067-1-quaresma.jose@gmail.com>
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

