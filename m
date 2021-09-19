Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.3230.1632084706175997690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 13:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LfKQqvTz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q11so25063647wrr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rV76P9JC16k1PNA0bhqTqgv62Lsks04lmzdQeRcRgqE=;
        b=LfKQqvTzUNCYelEb8WnRtGIhIg0TVt3TJPV+3KMaOFnQogfctDdUpotnHJ1uvSr5fg
         F5dD6GbnlW8i1xWrBCLBsIOlMypTsHeC8Ui6usmHVPjkEqKPhirwFOZ3nhFY4u5PfSvx
         J9RZjekF7lQUmpkg5fv4yTI9XJA/F7ur9c8lKqKn9/ujK4zlq1t1O0suth9FjvXSMnsL
         5zG7sV3deoe4Bc4H8DWQODWfptyM/PkNk3b1Gpz/ymhzE1mqCv/sOcw2VEvgeKqihBqq
         rqT5fceSoicll1eZLRahBZ7lTE/sEY3ZaeBBe12OLbkengS7aE7ZIV2QX3qn/+stBT1T
         iShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rV76P9JC16k1PNA0bhqTqgv62Lsks04lmzdQeRcRgqE=;
        b=8QF44eOfEWKnQdOu1CPydrOlNj2fNEPBY9ocStK6vESntB76hJS/KMkibYheCnvR+s
         u5ZPwuC3IIZ0lpUm4vOYMmYRm4p6PqQWzsgNCziyoIQBIZQhbkd+wA69JWLhSIgkF+ns
         ayRlc9sEx+Xd/cTH3UHJQ68r5qP9NW+Xb/EzLW4Cs4v9ORiIDzjvRoZGwncyXoJM4C7D
         7CfI0LGLkRiZRuFvktyWOSt0n9sWp+yDy+tCHn8eWsY12FeWnAfPiNnDFHFEB75lHMof
         lfZMn5x2YSUEJmbPXGzgQTfoVWaClyLI/61ZjFuEehP29Ep1XeH4IZWi1ok8HpCPV3V+
         Kcsw==
X-Gm-Message-State: AOAM532zGilabS3WudH5rDCd2qdbdd5Uysa8hp7fKcJeMIOWngwmxU0S
	QQhwMyRZZrmuEkl9cNpJXY8MuONX/r8QPA==
X-Google-Smtp-Source: ABdhPJx8T2QIo839gqZ8VRSuCZY80Z0bqh6itPAH9D85PHlOgtrOaRpGZlKsKAvDIijm9Nt9QTRESg==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr24976716wrt.267.1632084704593;
        Sun, 19 Sep 2021 13:51:44 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id v18sm13075423wml.44.2021.09.19.13.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 13:51:44 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] sstate.bbclass: cleanup the sstate mirror progress check
Date: Sun, 19 Sep 2021 21:51:12 +0100
Message-Id: <20210919205112.183447-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919205112.183447-1-quaresma.jose@gmail.com>
References: <20210919205112.183447-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only has the progress bar when we have more than 100 objects.
So check for this and store the result to show the progress bar.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index fc156ac81a..1be20e4055 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -978,11 +978,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
-            if len(tasklist) >= min_tasks:
+
+            if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
-        min_tasks = 100
         for tid in sq_data['hash']:
             if tid in found:
                 continue
@@ -993,7 +993,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if tasklist:
             nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
 
-            if len(tasklist) >= min_tasks:
+            progress = False
+            if len(tasklist) >= 100:
+                progress = True
+
+            if progress:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
@@ -1006,7 +1010,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            if len(tasklist) >= min_tasks:
+            if progress:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
-- 
2.33.0

