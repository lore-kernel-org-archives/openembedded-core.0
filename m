Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.10046.1619186418928461558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UwKYgg9k;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso1313394pjs.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qiqzi8CuSD+x3LlI1c7YPc8GvYgDyvtwhCORmsEvmUM=;
        b=UwKYgg9kb262KUA2wMsz4+wKD0/VkRhMyM8Wr4G2uy3hbLWMQv2Kta3RPbvm4NYamo
         zwr1k/U4QdPuzdRZjv9HMsUlPkhdTnKJz87Psx3WMxzVn4VzyNDxQTIkwADhyWtiiKvF
         X3znnMRyeZY+yJzc0WLyTTF/aOB6j/eYcqtQd39yk762lAU2k5asK8bf8SQrX5cUidCx
         RE1AdFAcER7WH6Ha551Ks7hWVj+69TueMnbyJTBK1GjqnpjTk0irFevXD9/ZQkHZg2lJ
         9GI+fUWOuONKFY0MGbspohfJoPDSuwsuBwzCR1OeBC9qWYoako3vhJWVQdOkQgEmiR2c
         ewQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qiqzi8CuSD+x3LlI1c7YPc8GvYgDyvtwhCORmsEvmUM=;
        b=FZ+M4YuHY8Nhr58405JQS0uism40phU8A+VYoNIufiDjVbTpQhE0bUjbAIDZdk2DjI
         njJk8TerTNQ5ke6PzsjHFNX8XYnLxo1OZIbGVyWT7RdXCdELrNsi6GOU0qBiZu+1EXqn
         xc3/U+MchzcaygyqTSnTj4n/QnmX/NDjEGAe2P1XlqG04VeDaHXNKNtKN1BpVyuY2o3a
         XA1Rbt/JTK24I7qRf6REFMjqIG+CIA6k3r3sW9WrB7SFgDlbPzoBOZSAr+RPnMLr7/i4
         6UHjS8idykaZSPzhmH7df3vvZa3kAPqrnrNgHsq93Sdn3bhaP9PRx/SWxWj+kW2YqFL9
         +oeQ==
X-Gm-Message-State: AOAM5316q6NP8cFvu7mHNIg9Idhl70pUsOp3mX3ozwouiteeRD8PIwM5
	sMZToyB6YX3UeUJXuIlYSpMLdvbpnymxBIf8YKA=
X-Google-Smtp-Source: ABdhPJxPhEIkmVCXzrElXVJS5bNVRa7n7cQohj8NOFUkTp5c8HpHxkEFJiSnwAfDfP/oGZQZjPt8PQ==
X-Received: by 2002:a17:90b:1646:: with SMTP id il6mr5985252pjb.27.1619186418063;
        Fri, 23 Apr 2021 07:00:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/19] lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)
Date: Fri, 23 Apr 2021 03:58:51 -1000
Message-Id: <290747561ab91fcf38b2c787e13e0eb88eadb389.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Budny <pbbudny@amazon.com>

`tmux new -c` fails on tmux older than 1.9, when that flag was added.
We can omit the flag for older versions of tmux, and the working
directory gets set even without it.

Signed-off-by: Peter Budny <pbbudny@amazon.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c55c294be6f5119f4c58a4e7a0bc052904126569)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/terminal.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index eb10a6e33e..2ac39df9e1 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -163,7 +163,12 @@ class Tmux(Terminal):
         # devshells, if it's already there, add a new window to it.
         window_name = 'devshell-%i' % os.getpid()
 
-        self.command = 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{command}}"'.format(window_name)
+        self.command = 'tmux new -c "{{cwd}}" -d -s {0} -n {0} "{{command}}"'
+        if not check_tmux_version('1.9'):
+            # `tmux new-session -c` was added in 1.9;
+            # older versions fail with that flag
+            self.command = 'tmux new -d -s {0} -n {0} "{{command}}"'
+        self.command = self.command.format(window_name)
         Terminal.__init__(self, sh_cmd, title, env, d)
 
         attach_cmd = 'tmux att -t {0}'.format(window_name)
@@ -253,13 +258,18 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
         except OSError:
            return
 
+def check_tmux_version(desired):
+    vernum = check_terminal_version("tmux")
+    if vernum and LooseVersion(vernum) < desired:
+        return False
+    return vernum
+
 def check_tmux_pane_size(tmux):
     import subprocess as sub
     # On older tmux versions (<1.9), return false. The reason
     # is that there is no easy way to get the height of the active panel
     # on current window without nested formats (available from version 1.9)
-    vernum = check_terminal_version("tmux")
-    if vernum and LooseVersion(vernum) < '1.9':
+    if not check_tmux_version('1.9'):
         return False
     try:
         p = sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}"' % tmux,
-- 
2.25.1

