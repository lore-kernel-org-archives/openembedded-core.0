Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.48353.1600033970169350643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 14:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A6DTedr9;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id z19so10867029pfn.8
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8S/4eIRepEMjS2raCyHuE9RrqvCVP2r4gAyHET3zoCM=;
        b=A6DTedr9xrSv2YLEfFJEBf4QRkilvOU8Vbnw8j4a48y1rnGUkcXxmoza2oUBuZWq6l
         m9J6NDQmHsN9g3bbSKRg/jBg1ZLJAxnYLHX/vul7IXgsoTCz23Br5VNEX2TwVmmdphPJ
         TR4VG1nnakbLi9mWn2a5EdyVEU5GRg0/2so2S7I5BM1XsCd04tKUP2keRH7QNqp1HFr5
         Dujg96Qk4Uxx+4vseqHXse34wSm8bhM+i5XQgMBoUoYGYgV6Ra4ymM0R7pndW903uQ7S
         LTgmvo+l4kP0QC82dLnNZhpJtUQzVL2oboXSsew5R3urRk4qK6cOJhslfShj/IjznqUk
         KdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8S/4eIRepEMjS2raCyHuE9RrqvCVP2r4gAyHET3zoCM=;
        b=pANsUijl593C4/zkbyMnsHMcLKIIofTKVAxo9a9R0XK9HXVDpQ86c31cTjfaAMw/sj
         71qvGWFbRoa9mGDUD6LafwRogBaBInHnEXZUW2TNmMaLHhGSsXgZsSoEsgFVtNP6BkRr
         LxuKuZNHZqzsXilYt8b2A5CjLEGN200nm63Ea7ZLIj79vljPYY1uwBG3pSxdQl8jVzjG
         NLLNGkpBTr8gglKzvRQz3C6u4VZiuCvsEibnoeu+LHMZSSav7cLQUN5FKVNVJkfAjppu
         fYIatbLyoeb6Kx+Z8m3rE3BaJ8SCGJg0tL+g4Ua6q5eqfnrO+1QMUPSkcttChZ5+Z43N
         sW0g==
X-Gm-Message-State: AOAM530SfZql7uH7aedHHkIdsuybMOtOaKzw9bKYLmzb9J6G+YxqkWD4
	xeNEbe3HIMaMSfbQe0hNXodZ+w3mWyR2/w==
X-Google-Smtp-Source: ABdhPJzQHldwExMa6us1pajNMXrS6j50b9AQldQO0KO/tvsmrbSWDie5XJ0Xedic6wTHn1LGgx0jUg==
X-Received: by 2002:aa7:8b0c:: with SMTP id f12mr10915834pfd.58.1600033969422;
        Sun, 13 Sep 2020 14:52:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id n7sm7997364pfq.114.2020.09.13.14.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 14:52:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] oeqa/weston: Fix tests to run with systemd
Date: Sun, 13 Sep 2020 14:52:43 -0700
Message-Id: <20200913215244.3825034-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913215244.3825034-1-raj.khem@gmail.com>
References: <20200913215244.3825034-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, weston tests fail when using systemd, fix it by providing
transient unit file and inject it via systemd-run, which generates a
service file automatically and launches another weston instance to test
if it can launch a nested instance. Use systemctl stop to end the
service and cleanup, instead of brutal kill

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix non-systemd run of weston with drm backend

 meta/lib/oeqa/runtime/cases/weston.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index ac29eca6e4..36b4f9e375 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -34,7 +34,10 @@ class WestonTest(OERuntimeTestCase):
         return 'export XDG_RUNTIME_DIR=/run/user/0; export WAYLAND_DISPLAY=wayland-0; %s' % cmd
 
     def run_weston_init(self):
-        self.target.run(self.get_weston_command('weston --log=%s' % self.weston_log_file))
+        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
+            self.target.run('systemd-run --collect --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6 -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-0 /usr/bin/weston --socket=wayland-1 --log=%s' % self.weston_log_file)
+        else:
+            self.target.run(self.get_weston_command('openvt -- weston --socket=wayland-1 --log=%s' % self.weston_log_file))
 
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

