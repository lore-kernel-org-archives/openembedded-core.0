Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3196.1595273527280066292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 12:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fxz0KQSC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id f139so606362wmf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yBV10hkpKDtWfds5CezeUUFZd0sc5b9N0D6WVvfZ1rs=;
        b=Fxz0KQSCDbN1svRyvtfHxASXsdEf/xmEGpnFJecCPyPKWy2H/bEjykpuOrzzVIwFZU
         YvLjpdVumNm90GxWzXr9UCPiFPTnQKZrS5U7PD1kdNNNkzUPgGFtzuxFUC4RBHkQeVxI
         Te5WsioH1JRxqqKa7RcGQWC3SqzwDH1OMTpbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBV10hkpKDtWfds5CezeUUFZd0sc5b9N0D6WVvfZ1rs=;
        b=ejD/TVOd0Desu+ZNISaNur4w1oItopgRC0plrjq+6fnbDG4zqXO0Z3RWgPFbuIFcuQ
         8wicfXkKnPSQWkPCxxriNVs1DGRrEF1XtGOdpJW6432ritIe3/e6BncmJDoscPJJjl7r
         2DnMbGIJPdECZ3GXhSQ8RbY4Yq8BBNuqWhDOmj9K9wFPZkbuNoTl7ZauyK/lVd9l3kIF
         S08YmekktdMcqNMG6vLOAuSwhV2fyo/lyULZSDflGDHTjPkHBFRZMcqjd5J8NPRJezlz
         P6Mk8jgqmcwC7wOH5HZLLO4auDAN4wwacXNRCA3ceSSH/QtSiXrIG40Jk6rQ1ZcQWN5y
         o9iw==
X-Gm-Message-State: AOAM533mxEuAFGjILe/uv+luK8gOTTGjr5xm/GloV93/n+doD9kwvMg1
	poOkoENhtrDi5RTTF6mHMCTd5zKlFPQOeA==
X-Google-Smtp-Source: ABdhPJwR2TlhBaZmnl5WuApMCp7bs4SST9ji/cVoid8XLbBwACSbmUveLcmZ2fZomek5zlQsT4/WPQ==
X-Received: by 2002:a1c:a513:: with SMTP id o19mr714371wme.119.1595273525356;
        Mon, 20 Jul 2020 12:32:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1cb0:3078:6c66:aaf5])
        by smtp.gmail.com with ESMTPSA id p14sm2843589wrg.96.2020.07.20.12.32.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:32:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/qemurunner: Add priority/nice information for running processes
Date: Mon, 20 Jul 2020 20:32:03 +0100
Message-Id: <20200720193203.100741-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720193203.100741-1-richard.purdie@linuxfoundation.org>
References: <20200720193203.100741-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're seeing failures due to system load. In theory we've set process
nice levels which should compensate for this. Add debugging so we can
find out if they're being correctly applied.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py     | 2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 01cbf52b8b1..519aa9aa1e5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -264,7 +264,7 @@ class QemuRunner:
                 % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
 
             # Dump all processes to help us to figure out what is going on...
-            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
+            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
             self._dump_host()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 364005bd2d5..5c92941c0a6 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -138,7 +138,7 @@ class QemuTinyRunner(QemuRunner):
         #
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
-        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
+        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command'], stdout=subprocess.PIPE).communicate()[0]
         processes = ps.decode("utf-8").split('\n')
         nfields = len(processes[0].split()) - 1
         pids = {}
-- 
2.25.1

