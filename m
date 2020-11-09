Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.8731.1604910710931890166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfLVKM6H;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id cw8so10980012ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDyhgLHMw9P+n10TstI7Tyd63TV6+Y0YriV8Pfh29WE=;
        b=bfLVKM6HOK3lE/C67fhVN56zICuJdf+APnxhArXwG/uHN5kV2BFfB3UMWR3qlO4iE9
         DoCQhEgmuWUd2QKSz6jJPqYslBy7iB3F5/5hNQg2TGeOf2LoFEoqzHVPcd+NBGpyaPdc
         bXhB2YZiDquxA3jL/Ldxw28BiEuvageGjL+FmbaMMAXHJgMETfPicwYJHHCYagwotfMv
         lJ7LTG33/7uEKaz7POGWT9NMARyOfk3pcvcQHWKsNmoRuVUYSKu/4BrP3O501P3cXqmB
         VVaoLQrOn/DQyoX3iIiNDqxbXWbKAt8BkstvEgVV52LDWpyLyo30DIULGzL8xDKtHXYF
         onkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDyhgLHMw9P+n10TstI7Tyd63TV6+Y0YriV8Pfh29WE=;
        b=tLCGkp4TEnx2KkM3ailv9jNr2iOHMAAKyHDEo/4L8jtGMPMa6HxiPRuizHM+ywbQp3
         8m9yYjKISWETYDPy+H12RGxEMgyiSX+Uj5XrrMHUGqMs51h2nOf7MoaMV1nFwNOmV85n
         Jz8KdKeeWvUPM8uOADip3WrFpumFn4MTL5q8ARf+RBE7IXIv1bjgBS+lafQHQZwghQTK
         Q1dsIcZDTUyDO/GwcKqvi2j3LGiZq57CDPZEqS0cEq08b56tztYhw5SpC9eKiPQ4YjIh
         8xV3Bg6LOhuRGjSF6jBQ1Y0aB4Uyq5uYzdhFhleYm1GD8kuoho1NAJMFczPGNBkgais3
         0cCg==
X-Gm-Message-State: AOAM5318hmfW/IrDcgCj2FueiwuKjUdLRdh3bpRrphyODmU+VK2CMnsM
	f6FRiTFisTdc57yFfnz/GsMMWMRaBBp5VA==
X-Google-Smtp-Source: ABdhPJzOjG6Xczx4oL6Y754y3nrNN5A1jXSZqXqoiEWNJIjaBR+aMivbpVyWnrKiPL/Rnn5qzv/e7g==
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr13856832ejf.142.1604910709279;
        Mon, 09 Nov 2020 00:31:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 08/12] weston-init: correctly start under systemd
Date: Mon,  9 Nov 2020 09:31:29 +0100
Message-Id: <20201109083133.16503-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several issues are addressed:
1. weston requires pam when starting under systemd
2. systemd was attempting to launch weston twice (from
sysvinit script and from systemd unit file) which caused confusion
and errors.
3. runtime test should stop/start weston via systemd only if systemd
actually controls system startup, not merely when systemd is present.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/weston.py        | 4 ++--
 meta/recipes-graphics/wayland/weston-init.bb | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index 36b4f9e375..d3fbf8ba92 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -34,7 +34,7 @@ class WestonTest(OERuntimeTestCase):
         return 'export XDG_RUNTIME_DIR=/run/user/0; export WAYLAND_DISPLAY=wayland-0; %s' % cmd
 
     def run_weston_init(self):
-        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
+        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
             self.target.run('systemd-run --collect --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6 -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-0 /usr/bin/weston --socket=wayland-1 --log=%s' % self.weston_log_file)
         else:
             self.target.run(self.get_weston_command('openvt -- weston --socket=wayland-1 --log=%s' % self.weston_log_file))
@@ -66,7 +66,7 @@ class WestonTest(OERuntimeTestCase):
         new_wl_processes, try_cnt = self.get_new_wayland_processes(existing_wl_processes)
         existing_and_new_weston_processes = self.get_processes_of('weston', 'existing and new')
         new_weston_processes = [x for x in existing_and_new_weston_processes if x not in existing_weston_processes]
-        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
+        if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
             self.target.run('systemctl stop weston-ptest.service')
         else:
             for w in new_weston_processes:
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index b7a99be646..4b2a6ca983 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,7 +26,9 @@ DEFAULTBACKEND_qemux86 = "drm"
 DEFAULTBACKEND_qemux86-64 = "drm"
 
 do_install() {
-	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+        fi
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
@@ -55,10 +57,13 @@ do_install() {
 	fi
 }
 
+INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+
 inherit update-rc.d features_check systemd
 
 # rdepends on weston which depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+# requires pam enabled if started via systemd
+REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
 
 RDEPENDS_${PN} = "weston kbd"
 
-- 
2.29.1

