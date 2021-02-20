Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13432.1613861545372696651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 14:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9oc2fxm;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u11so5379286plg.13
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 14:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sk+2mFHQeh1S18jIiSTTMMbjFaczVC7RO/CCvPyr2Y=;
        b=C9oc2fxm40WwIZMGUfAqsjO1HdRznIEjSorB/CgLWQ47yjazMOQg6qBZNLET4v/IIb
         LnzYd7D6KVmb9fmPl4mDQVlPQHk0Z86P1TIL0jtctWglX2rHEcRBP2LZb+XAhmmNJnpp
         LUj9FNxPUQ/7l7wIbBdaL8FChiFQWvXIPzGTbB4a+04uYbSYJ/qTMONbU596+JnisHOr
         Qnly0DOUYEkXC25lqjvbWNYPGD8mEwAQBYvvnjH43qBq82N3IyoJITVhALChi++6ylKi
         jWnJtcIcK9r3PAJt3/UARwTMDEZaJQVNi9ZyjZZAQo95nO0vOC5tJTRzGoai0UDWVHN6
         mFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9sk+2mFHQeh1S18jIiSTTMMbjFaczVC7RO/CCvPyr2Y=;
        b=B72IQoNcvNZ61Gl/7DMEmwjAoZWUmU1hOIRn4C07TZnE+tJXJZq29kPcuwMhhLjToO
         hpY4mUlYWsWxh+sbC6jVFgsCp6LkojEfXoixEqJSCAt3EtlGl1yQ7gdI6uRK10jvM5/s
         xrAstq/f8u2HkU/ACMDdXL77OQQuyhdLCX9Z03UnKdY79kGHHCuzc8+dRCynMK6L05Qg
         QealNLQ/7Opy+BHsfAiZi0PJ5WOIfIoLO90hq/KjIwqOlqs/zX44jIE+fp0IONWvqdOQ
         9uSByah7yBvdOHX5O+fQymeUNJgZOG96QVdaZOh/oj4hg6VS7c3iSCJOPGHmeSyd8R2n
         enMA==
X-Gm-Message-State: AOAM5300iF1XCWzoF30kjQNph3zMQB33ijCvrQz2sQMhIiOCiVU4Vqm1
	WaGPtos3k7TaVW3Mxr5WWOffHb+LFPspsQ==
X-Google-Smtp-Source: ABdhPJzwdiCgT5mjZe6fhziCQiZFKazz2XzC0sTeDClozuHBUXukPPS2sgcnII4v9zAfcl4jo8DPFA==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id t19-20020a170902b213b02900db3a3ed8admr15750708plr.73.1613861544623;
        Sat, 20 Feb 2021 14:52:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id u9sm6000100pgc.59.2021.02.20.14.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 14:52:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] runqemu: Add new option to disable vga emulation
Date: Sat, 20 Feb 2021 14:52:21 -0800
Message-Id: <20210220225221.55097-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using nographic, explicitly disabling vga is needed some cases
since some qemu firmware (OpenFirmware ) defaults to std vga, and
when vga is enabled then it disables output to serial and redirects
that to vga which is by design, hwoever we expect the console output
to go to serial when using nographic, therefore its important to
disable vga with nographic especially on qemu based ppc platforms

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
v2: Add separate runqemu option instead of tagging along with nographic

 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..532f2e338d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -65,6 +65,7 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    novga - Disable VGA emulation completely
     sdl - choose the SDL UI frontend
     gtk - choose the Gtk UI frontend
     gl - enable virgl-based GL acceleration (also needs gtk or sdl options)
@@ -489,6 +490,8 @@ class BaseConfig(object):
             elif arg == 'egl-headless':
                 self.set_dri_path()
                 self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
+            elif arg == 'novga':
+                self.qemu_opt_script += ' -vga none'
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.30.1

