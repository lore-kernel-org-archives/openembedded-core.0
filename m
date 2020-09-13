Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.32352.1599972564260736307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 21:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QJpueMoR;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id a9so3719115pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88QT9oiRB0ivQwbbQYg2xFhe0AW+TPHH12fOAUIgGLM=;
        b=QJpueMoRKZIuKXCmdslO560JtlvJEDL2LhUYEYUIwy28UbAFCDvebJ0L31krXAD0/2
         dL8kWDio+Vxe+a4ao9ezGhj0kluClAgrzsv9OaYlEnN0A5KXjgFgrDXHf5za4QidXI3u
         7VQMsMSasgQW04HFxPhPRL/OPgLba/gIqOKYpeVmVhF5p+cI97+GYMeSsKtQADJhltGW
         ntPC+XGziBnm8z3gda2rRv00LJXGupCbRgUGfnGSDWv93HlxVeLuttnoh0AMcnzEFd2r
         ZGc6v8vhDPG4KMddesHbsC4rhB3NpGXKI3N5hM07q0Y8Q7CsWxG2hJwpMTDn1KxIuTYG
         R53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88QT9oiRB0ivQwbbQYg2xFhe0AW+TPHH12fOAUIgGLM=;
        b=inHJR7dvzUd7gzuhTK6BpBSCIKPgOwIDmeUsf8K0E7aLREujMY4enKQ2gFbuDPN1GI
         EANDEQoFEvfL+21g3959aW4SQfLbvHB1dntNCQipWTEbw355ZlDwhXHmYy56uyIvre1t
         cwsVi6NVeq78EUBC3Eb4eTtEHqGluHTyTjewMBsXq+VTx3AlpNM8PL3ELHdgQLKTcmfA
         20RIbE6hNiOCzMJNZUoqehb6h7GSOzQ/CIB9hXKdjoOuIC+m4m6iM/qQlbF2YTLcsxhQ
         xdzss3x4fDz4Es8quhmNe48cLFAJ/l6MN64Wg8Ma0UKBar/C9imftYh7TvQIjmbS8ZzE
         3rGg==
X-Gm-Message-State: AOAM531KvB51WFiac/S7zVa7zGSpJJwLT+zvaLhbXrm0gaC7AOSdEode
	WaOThywMZ4RJxLGt5d4c7sxo4wcgl8lTYQ==
X-Google-Smtp-Source: ABdhPJwc2MCifTIv4ejGtQQtvykg+vPNAlRjZvLOfkxzGiqWpGx+A6Hm0ZZmvAyVATLAzm0fHTVvvw==
X-Received: by 2002:a17:90a:fb52:: with SMTP id iq18mr8605468pjb.207.1599972563438;
        Sat, 12 Sep 2020 21:49:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id gq14sm5341693pjb.44.2020.09.12.21.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 21:49:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] oeqa/weston: Fix tests to run with systemd
Date: Sat, 12 Sep 2020 21:49:20 -0700
Message-Id: <20200913044921.3457893-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, weston tests fail when using systemd, fix it by providing
transient unit file and inject it via systemd-run, which generates a
service file automatically and launches another weston instance to test
if it can launch a nested instance. Use systemctl stop to end the
service and cleanup, instead of brutal kill

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index ac29eca6e4..691524a92b 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -34,7 +34,10 @@ class WestonTest(OERuntimeTestCase):
         return 'export XDG_RUNTIME_DIR=/run/user/0; export WAYLAND_DISPLAY=wayland-0; %s' % cmd
 
     def run_weston_init(self):
-        self.target.run(self.get_weston_command('weston --log=%s' % self.weston_log_file))
+        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
+            self.target.run('systemd-run --collect --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6 -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-1 /usr/bin/weston --socket=wayland-1 --log=%s' % self.weston_log_file)
+        else:
+            self.target.run(self.get_weston_command('weston --log=%s' % self.weston_log_file))
 
     def get_new_wayland_processes(self, existing_wl_processes):
         try_cnt = 0
@@ -63,7 +66,10 @@ class WestonTest(OERuntimeTestCase):
         new_wl_processes, try_cnt = self.get_new_wayland_processes(existing_wl_processes)
         existing_and_new_weston_processes = self.get_processes_of('weston', 'existing and new')
         new_weston_processes = [x for x in existing_and_new_weston_processes if x not in existing_weston_processes]
-        for w in new_weston_processes:
-            self.target.run('kill -9 %s' % w)
+        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
+            self.target.run('systemctl stop weston-ptest.service')
+        else:
+            for w in new_weston_processes:
+                self.target.run('kill -9 %s' % w)
         __, weston_log = self.target.run('cat %s' % self.weston_log_file)
         self.assertTrue(new_wl_processes, msg='Could not get new weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cnt, weston_log))
-- 
2.28.0

