Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.696.1601076651050100758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 16:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtZTlPep;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id e17so884853wme.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 16:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IThRON52eVOdcxPHz7YRXu8oGzsgTH+AFyFhh5DJWSg=;
        b=NtZTlPepQ8zqkdHIef91gzDidx61wH1e9FcnrwOALeN6ntFtF8IEDURAMGLwXbwGn5
         UDDzYZRPF4oi6eQ/69mO9hakv3OB/acK+iZZez4zXhpUVwhyt7htj4wZ3viHYenojJrR
         Hktolba1mKRYsDPfOZB+r4Odv9n/c1rsJET98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IThRON52eVOdcxPHz7YRXu8oGzsgTH+AFyFhh5DJWSg=;
        b=Z+ovdljmgOowgX0fw3HZEImvYAbXs0A6GOTLns7SUlRbBCBrmz1j5SL2LqvRnxIjuT
         jhI3IZeCeGTp1P/nVAxC142XfSoJ2AsvSxSM0IZkoOqEZdblNl0hdBNtHKCiUHxwTSTy
         xqhDwXItG/cQntY1cVAMP9ZNOIYe9aw/DN7gxzj5BSpWauktO+1zsfDaST0GxvPYxDp7
         YSrEpCixgqpPBTcxakYaq5XKO3/0yObV+jw2AuBbZcW568P/ByGyRjApkqwxsTElsGap
         uAmGnU8lnqOaMkU6PD0LO4wXYDqzqTbKLMtl2Sa6EVRXifJF5H20/gVSeXf4fCcO/WmI
         c1lg==
X-Gm-Message-State: AOAM532EKFgv9EG5SchxwF0onojYGCp4EyeaaHkizOhzJOGTKabGRODX
	TGIdF3g6eKkAe3fHCqkNQLgUZ72WOhNgzQ==
X-Google-Smtp-Source: ABdhPJw7I7eHpsrUjI1hsKqGGDh6hIbekDWkSVj62cNHien4t27nxwHVASHKprObHSAyvgE6UyN5qQ==
X-Received: by 2002:a7b:ca4a:: with SMTP id m10mr875144wml.11.1601076648846;
        Fri, 25 Sep 2020 16:30:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id 70sm576076wmb.41.2020.09.25.16.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 16:30:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Rework and improve do_unpack WORKDIR cleanup from previous builds
Date: Sat, 26 Sep 2020 00:30:40 +0100
Message-Id: <20200925233040.2649208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have multiple bugs ocurring because when do_unpack reruns, it just
dumps the data base into WORKDIR. This means if a file was removed from
a directory in a file://subdir/ url, that file would be left in the
build confusing users.

Also if files are entirely removed from SRC_URI, they would still exist
in WORKDIR. Read the shadow recipe and the /etc/pam.d/ conditionals
for an example of how this can break in interesting ways.

To work around these issues, improve the cleaning code to remove anything
except temp/ since it contains logs of the currently running task and
*recipe-sysroot* since do_fetch and do_unpack have dependencies which may
be added there already. That directory is setup to look after itself.

We also have to create ${S} since that is a side effect of the current
[cleandirs] which is no longer needed after this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4c681cc870d..97b7e8feca6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -166,9 +166,14 @@ python base_do_fetch() {
 addtask unpack after do_fetch
 do_unpack[dirs] = "${WORKDIR}"
 
-do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
-
 python base_do_unpack() {
+    workdir = d.getVar("WORKDIR")
+    for p in os.listdir(workdir):
+        if p == "temp" or "recipe-sysroot" in p:
+            continue
+        bb.utils.remove(workdir + "/" + p, recurse=True)
+    bb.utils.mkdirhier(d.getVar("S"))
+
     src_uri = (d.getVar('SRC_URI') or "").split()
     if len(src_uri) == 0:
         return
-- 
2.25.1

