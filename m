Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.5790.1591152858810392272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=quHpE++6;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id p5so997672ile.6
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wFWLywHUm0HXSp6XmwReaLd6W54PUwvEWB9wsisPuqk=;
        b=quHpE++6ovglI6j+qdQwvHbhiCLcGpG7lWCuhqdG+fdAnZI5isPSq4ZDk4eUA/XGHR
         6speeuiiGLBetaKIQIGAk57o1ABGPBEuWl953P1EhN2KJ5wxW5sk4ZPZo3n512tXeDFx
         SPzj/TUvGAEu27MbcJGPXmcHxVchxUyoLgIw7PALBVt4foPYl43XFa371+B8bQoiNtIP
         PTKnpQUls9zwPQ5w9bQPowCXPb1dYEhnDnsIBLTN+SwwyIGTbF0awhiwWj1j7fq5QJ02
         8M7jGe1KxLfiUslOVLXHutsxISbKIbtbSPPWj3oJJ2Wn7s1RMq607eHHG0Qvb5AGvHut
         SHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wFWLywHUm0HXSp6XmwReaLd6W54PUwvEWB9wsisPuqk=;
        b=DaQuBXdvdxMMsyMjvfQ+xPXO9Hu624Tog9rpHj/SAMwKeuln4wBzE48LjjC8FmhYvu
         dUN76GjSrsfU5vFRvtqYv8SZM5y7g7vIlAT2mlRVpBHHUJhV4UGwWB98CcsfJxMJ0eGd
         JuDrZXCiz4ZbBl02Vi57TCnXrtxnVhJOnlgOqTJK1wclGBdP8+dZmIOJjKFFZCsyHF5F
         JrTi4M42Oqa6Sp7QsIz3Rq3DZ0PrYw+HKe8EQS0jSEeL+qVl8tubQ6rPkt0SrHWVyY55
         0lyyBuMhnh6o0k2dXADvgMD02k4co+7t8rIq397VJ48P485RM9rFjK12/Ic2pJLpxkOj
         NgWQ==
X-Gm-Message-State: AOAM531eyAQTFsZikeucUe8ZdGf8TYAjJZrgR8y9Ue4NTPbnX8lZ9d2D
	/juq/GvDyGWKhWo3caOKFWHiOndS9Mk=
X-Google-Smtp-Source: ABdhPJwSt39WTTo1fKu2ZYCepIQ1UN7ZynJ7FCyx4HrSiNqdBgQQrCLSoRZrKnREjIROaA3fbJ5YNQ==
X-Received: by 2002:a05:6e02:13ee:: with SMTP id w14mr1924270ilj.190.1591152858033;
        Tue, 02 Jun 2020 19:54:18 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:17 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 8/8] bitbake: command: Move split_mc_pn to runqueue
Date: Tue,  2 Jun 2020 21:54:05 -0500
Message-Id: <20200603025405.26885-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603025405.26885-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
 <20200603025405.26885-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the other multiconfig splitting functions are located in runqueue
so move the function to split a pn/fn there also so that its easier to
see them all together. Fixes a case where the findBestProvider() command
wasn't working for multiconfig because it was looking for a prefix of
"multiconfig:" instead of the newer "mc:"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/command.py  | 8 +-------
 bitbake/lib/bb/runqueue.py | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
index f45b6e5320..8ed3d8f679 100644
--- a/bitbake/lib/bb/command.py
+++ b/bitbake/lib/bb/command.py
@@ -138,12 +138,6 @@ class Command:
     def reset(self):
         self.remotedatastores = bb.remotedata.RemoteDatastores(self.cooker)
 
-def split_mc_pn(pn):
-    if pn.startswith("multiconfig:"):
-        _, mc, pn = pn.split(":", 2)
-        return (mc, pn)
-    return ('', pn)
-
 class CommandsSync:
     """
     A class of synchronous commands
@@ -438,7 +432,7 @@ class CommandsSync:
     findProviders.readonly = True
 
     def findBestProvider(self, command, params):
-        (mc, pn) = split_mc_pn(params[0])
+        (mc, pn) = bb.runqueue.split_pn(params[0])
         return command.cooker.findBestProvider(pn, mc)
     findBestProvider.readonly = True
 
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 3d54c2b88a..cb5aa80f2f 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -46,6 +46,12 @@ def split_tid(tid):
     (mc, fn, taskname, _) = split_tid_mcfn(tid)
     return (mc, fn, taskname)
 
+def split_pn(pn):
+    if pn.startswith("mc:"):
+        _, mc, pn = pn.split(":", 2)
+        return (mc, pn)
+    return ('', pn)
+
 def split_tid_mcfn(tid):
     if tid.startswith('mc:'):
         elems = tid.split(':')
-- 
2.26.2

