Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.12936.1594996750582415384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a310PxXp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id cv18so4146727pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=k1UpUeSuYsmIAHvcgYWbXcwFaCJjWowp0SMes3x/CPU=;
        b=a310PxXpCMaBro1LD2ZzzKHZeUo2/39q5AhQdzlRnNxs1HLp1BwP+5B3iUAv0P2dya
         TIKnoib/XNj+wkpv+TD0ezTkATSfhKJoAPgbJViH4hFuj3216X7fDhfkiwGa8ZYJzfMw
         n1Up9Wwa82ouUz0N3Lx20qWH5vidkqiXavy3ZaGSkfi+Um4z15JuneqJ4NdWYXIABSsP
         /ulSd9vyFk5iB/G9UB+H6B+ZRvlj0gCjCLQ7bs8IscyixA7ZSbDEYRf4ueqA3fBWkN52
         3GW2xoxKMabMkIFWakEO/Fr5YUAtPL9mjNmNpC7rmhZtDYzre2XQLplNZmqg97qgUsx5
         W7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=k1UpUeSuYsmIAHvcgYWbXcwFaCJjWowp0SMes3x/CPU=;
        b=HOOuiPDZWMU5Gk3UIhfl7+OJWgbyHpABj+zukj3QMiEIdwDjpQgHlWxJjzyWMBxKbJ
         2M/uL25IGZua7mSJ8uDbxiFGyZLWDYiZwKvyJDlDxbNE6VVYjSlNZULzmKj/7UUAgZhL
         Q94Gi4oW7VAoUuhBv/s3BkQHDy12CieGgmRqFzMUDDt3U0+wm8ZmWsPJz3UnXOnsvF2K
         uP2K2ZYaBVizps4lNrOWVpsEwFfNlkURFLMG6QyfX50EvHYmvOrww1pAzKuqytgLDVv0
         +OE5okR/TiMjyALbhMlVcuNSo/52YvrxbmmUZi0pV1jS+1YRO0xPFcOgEt/g/1k2VVUu
         zl7Q==
X-Gm-Message-State: AOAM533yesjasJQdLJIVlX9swtWRVVDwpIc/tzlcK7MRXi/zc6pHbTPE
	+hqgbLGy+qbTy0+wF0utnr7N1WkTv5E=
X-Google-Smtp-Source: ABdhPJyYd1Ko/eZ7Yj0vD1KTpnfgIYbUHJdrfHoPNr3/GgobqXqBLczTA29qz6zb7QQk/mBKypixzA==
X-Received: by 2002:a17:90a:14a5:: with SMTP id k34mr10822210pja.37.1594996749713;
        Fri, 17 Jul 2020 07:39:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.39.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/20] qemurunner: Ensure pid location is deterministic
Date: Fri, 17 Jul 2020 04:37:23 -1000
Message-Id: <a03c85fe0704a457bd2d92dd58cbbb4d37453f2a.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The pid location could vary due to changes in cwd as only a filename
is specified, not a full path. This in theory could be resulting in
some of our autobuilder failures. Whilst its difficult to know if this
is causing a problem, Using a full path removes any question of such an
issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55c186ff410c99570242478b99ac24ebc40aa6bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 992fff9370..486d2bb893 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,7 +32,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -63,7 +63,9 @@ class QemuRunner:
         self.boot_patterns = boot_patterns
 
         self.runqemutime = 120
-        self.qemu_pidfile = 'pidfile_'+str(os.getpid())
+        if not workdir:
+            workdir = os.getcwd()
+        self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
         self.monitorpipe = None
 
-- 
2.17.1

