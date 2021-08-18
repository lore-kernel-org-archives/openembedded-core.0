Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.60821.1629318605295423701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=crj54p8O;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k29so5428436wrd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hH2kzQfqpMEG71Om4ZNFNLKkKjBn2MgxWUj7LDCC2Ks=;
        b=crj54p8O307n0npdJ9dbOnchtdPKWwplRNzMWzbX+C9x18P87OP2Qt1K6ZOhBJFmIg
         fcynms77EphG5e20y3IAvF2py+j//DyixoIIm+x/0cG+J0EB4RjHPHKvM7MrIb34ldF1
         tElrs5hi9eFmxfjPgIJ+Ao3wW+kgAyNDbx2KqhslR3fx6/1twKcREPmQ6nKZx3PdXXfx
         j4YFB9X6oS4fqts+JoP9o7hBTubCwjdMX1cpH+z49nJFekA/pwgxbk4T7xx/TJhi0KND
         9YUHsuLlUs1OKOX5ayi3ouRJK1QrIf2o+wkqdOVPj981+xoZ2NHd468Ebbahr6bh5Wae
         qlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hH2kzQfqpMEG71Om4ZNFNLKkKjBn2MgxWUj7LDCC2Ks=;
        b=T6pJOZp0kuKoFN4/zxqFgP9YMucptzMLotYTADs9fE/PYKsCwcnPy8WKV8Yzlt6Yap
         caxF9cNQWVPDapTXQFmBOeV6pwDVad2jdsF+AY1czIUhTRNP4lewaxV4oNmofq+dJGMi
         07KALLj8m4RXFS5EndkRE+R6nKw3lZfxovR7YkRUdqgWwT2+EW2SDxhMc38E+D0ObWgA
         ueQ2TQ3TMtu/WkNQLhTSNYyNbzVzZMYF5+FQGwOeqOheh0E0u2/a4sUJhzkqBGviAyWs
         ZF5u0H/FgZc2dzoO5ap6+6akcxLpBuMtJHyhaxQudNWGKHLJnk/7ChVT1Wch5ySeDIpU
         MDUw==
X-Gm-Message-State: AOAM530h9SOAmy4v/IoRVMsnWB3lTE5NC/BdA9j/6U7xZ66OJiqfu2fu
	iEYDz1uO4ok7NTlQ4vfRDHFgVt9y9bw=
X-Google-Smtp-Source: ABdhPJyONk8nPJ3cpfR6PCBIrqFi6/tknUSBWzc7AnpmwUFR1YatA+tGbEaTTBZ4k2TTuIRhjc/gsQ==
X-Received: by 2002:adf:fa4d:: with SMTP id y13mr12421352wrr.417.1629318603716;
        Wed, 18 Aug 2021 13:30:03 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id d145sm5966189wmd.3.2021.08.18.13.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:30:03 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 4/4] sstate.bbclass: sstate mirror progress bar cleanup
Date: Wed, 18 Aug 2021 21:29:54 +0100
Message-Id: <20210818202954.143099-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210818202954.143099-1-quaresma.jose@gmail.com>
References: <20210818202954.143099-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only has the progress bar when we have more than 100 objects.
So check for this and store the result to show the progress bar.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e86c003726..9c19002a11 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -953,20 +953,24 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             except:
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
-            if len(tasklist) >= min_tasks:
+
+            if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        min_tasks = 100
         for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
             sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
 
+        progress = False
+        if len(tasklist) >= 100:
+            progress = True
+
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
@@ -979,7 +983,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
-- 
2.33.0

