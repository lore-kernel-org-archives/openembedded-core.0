Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f170.google.com (mail-wj0-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id AE6AF719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:18:56 +0000 (UTC)
Received: by mail-wj0-f170.google.com with SMTP id tk12so19973498wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2016 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7IHKrA2rZP/97ZRZSHwNMWRjV+SRL7gwBkAv564vdPU=;
	b=LbeD1Bc7gyq/RjPArHispmYhXEPglhYDfP8a51UMPCuyHjfpfjz6LxsD9jeSvyniAR
	A1BzzXM8CX2qkEWrJl+2QV42qeXCrPfiw4+o0hPHHWMNiommg/5gxeStk9q4TEr2PY4U
	EXI9KaLEqD46msl9FqIVwBF1n0lSryxxFlDjg+8aOY2ia/ICvjLOAKF5S2utJ2pw9dwa
	w0RBeUV7FHdoTP0AzO2JjD2eff3Gpd2NLtba7vKPEivkD8Fq8ZLlnDBSt4cybUnNhMga
	uofRRa58XavsH6dPEAVuRkHOtzpvelb7MCY61e/7WkWJcE/cRX5j0kzaceVMfLeopp3r
	x8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7IHKrA2rZP/97ZRZSHwNMWRjV+SRL7gwBkAv564vdPU=;
	b=QLdxBKddfn/gxnrczeTLxBf/SYnHgDFRxnyhu6NewZiebI05XktOKgvGkVGiXYza5u
	4OZaq6fICMoeDelL58jDT6WF+dR6B6ME35jjkHr51B5jZ9vELYPGf2TjTSDudn1mqV5x
	t4X26yhcT2zKIKFzCXPE+j4a7KnEQ7t10YQJMsmA/uMsDUJHAlQHnidwP4XVuoR5BFkZ
	D/WR8YNnBIYRNG6Q6xglm+r1pryaHSS0u/8vh8vj98NDyn9sdmsWwpEw1WRiUSwfgX5U
	fgX5m//2S6LwC5/2a/KotxD01DGcEGn97/NMT6klyQZMWQYpEW3BESVVO65h/hZZpk24
	TPog==
X-Gm-Message-State: AKaTC02zRdIqA9+UcueEf9jX99P/+ikM86p2+QgOJAkoZJ01ZN6M1ZJTTEvpVdTiZNGNhI7O
X-Received: by 10.194.171.104 with SMTP id at8mr70346410wjc.159.1481303937283; 
	Fri, 09 Dec 2016 09:18:57 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	d64sm21549585wmh.3.2016.12.09.09.18.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Dec 2016 09:18:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 17:18:53 +0000
Message-Id: <1481303933-32539-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] rm_work: add do_write_qemuboot_conf to task list
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
X-List-Received-Date: Fri, 09 Dec 2016 17:18:57 -0000

We need to add do_write_qemuboot_conf to the list of tasks to be wiped as
otherwise the second time an image is built it will fail.

[ YOCTO #10758 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rm_work.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 64b6981..263ad8b 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -66,7 +66,7 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
-            *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*)
+            *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*|*do_write_qemuboot_conf*)
                 i=dummy
                 break
                 ;;
-- 
2.8.1


