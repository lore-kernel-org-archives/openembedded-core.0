Return-Path: <andreas.kling@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2677A607E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jul 2018 12:28:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s11-v6so6519006wra.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jul 2018 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hFsy4vghzK+M6DS1jrnRig51uuwnIPNoPjzArGLQbj8=;
	b=E9DbSX9TwzdvcTsx2Lgxp6q7RWk3KtOsVUbuJT/AvXtwS89NE2fz1MiUnHlnQE1q6E
	8DWX16cwOzAYWiFQH6kosPpuWMwHLk/7zZhIMDZgUdA6nedO5JQCq8q5qD3OLV/So9in
	JOmrbsLfJUy5m0ycXtecbXQ6I1g3IV8MaeyHICkXM/z3yASSCImWleGIPrMmwspIScYp
	rqfyBc+Yn9osifEzZJ1h7cvlzUnHohKl5RJfx971d7cnMoj7J3PmlxrP0nmqvAN/PEs2
	eg5tRDZJ29sER2j3aDnY1xWRzIPjjJ+EY9yS/BHW8LIw6g8xt7B85U23SLzajaNplig+
	aEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFsy4vghzK+M6DS1jrnRig51uuwnIPNoPjzArGLQbj8=;
	b=Bv4fWiogyXKJX0KB6iI/CpmgzvY/ZUJ5RjbRIMKYLggUJXQb6XH4tSdsaG41U4s51t
	uCIuM8aWewPcPYyI+Utt4zvR7wfCKvQmbjIx6CWwCshh9qG4PJQoKqIHuhZOXf+oSpgD
	ernW3vFGCyFrWAeSBdbQAvZJFnV0IVLEGldiFcEvJCrjG1b18xIE5ds1cjzU7s4E316h
	JHeeT7PT+P8Sp3KJoED4yB8ewK7xkSsDgqKQzvgjdA5FKaO7C8t68p3zktKuCmJvifIq
	3o0k9ujDs9qeo6fVOU1tZTlSJvubvYp3p8xL8q9FzIDCXmIk2v7up/iMdC6BclgeQNfO
	OPyA==
X-Gm-Message-State: APt69E1OeaCm4te2bWnX/PNSz1Ahmup6hf7Ps6e7zg9v9z7xvfSUOVhw
	/tVRUCNUEXC3CYlGpz19OGYioPFC
X-Google-Smtp-Source: AAOMgpcNxbMJrsMC2dbYm00DJvDS/vU3wp5aQPEk6c6lvF8gHpAQs31U9dQ+vUX2K162TvQJacWFQA==
X-Received: by 2002:adf:a64d:: with SMTP id
	k71-v6mr9552375wrc.78.1530966527636; 
	Sat, 07 Jul 2018 05:28:47 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de ([82.119.189.133])
	by smtp.gmail.com with ESMTPSA id
	y102-v6sm2511415wmh.9.2018.07.07.05.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jul 2018 05:28:47 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Jul 2018 14:28:40 +0200
Message-Id: <20180707122840.31909-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] systemd: fix missing path separator in firmware-path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2018 12:28:47 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

udev fails to load firmware for CONFIG_FW_LOADER_USER_HELPER
systemd-udevd[158]: did not find firmware file 'xxx'

function builtin_firmware currently assumes FIRMWARE_PATH ends with "/"
fixing the path passed to meson allows the firmware loader to succeed.
systemd-udevd[145]: writing '/lib/firmware/xxx'

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-core/systemd/systemd_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 3efca33e73..8ff049160b 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -185,7 +185,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Dsysvrcnd-path=${sysconfdir} \
-                  -Dfirmware-path=${nonarch_base_libdir}/firmware \
+                  -Dfirmware-path=${nonarch_base_libdir}/firmware/ \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.18.0


