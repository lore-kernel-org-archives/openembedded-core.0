Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8842271975
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 16:41:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so26551422wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+u5Dm6v5EBkklMFlriIXszjwK67vs8nD+XRdXrbqicg=;
	b=SA5aWjiEbm7sC/6oSAxbYV7Au8H59QmzHH2IA1kKB0EwcE58t6meP93QYSs1JItCgh
	fKVh/jV+IBhZ0OPG6AR+4OY6z49xmUrN3Z7BzAgcXgDGEDfzpgYfL9/6KLJTAvJChQXK
	bhfcPNwMV93m5YEmwFuxm2O1ZLaQyKJHHIdJwLWg9rkZ8z4mfLIjw73z5tPcTvKCeBwx
	3TuCS4VqPJeHURqUrF1pocUw4OJXWf2RknbNrCN1VxCgOwfMPjbz2gpnzAFJhXeKqcjG
	c+e/VpHOsftBsyMSL7fSTUGdWSDyls26GscryTsXr4hnR7Z6RLTwCu7DFtFvlDHgSxel
	m3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+u5Dm6v5EBkklMFlriIXszjwK67vs8nD+XRdXrbqicg=;
	b=WFw3i6FzZpDTTiFgdXQ15NSRzXYeL3q+AaUNiuFuaQFFWvH0cbT8sE0SUjL99Fea2h
	w8jGIlfKH6DQv/zeiWu97TXHAZfMmBcwqQrZcry06UMRMHXcCKRgljzJFW4U/e1K2o/n
	O7crb17zK/i24SCKXHxXSN+fxlGzrGd4sPbsHcRfpxTGYIWHoADdJL0MS9QD8khvNEH/
	rkk8jtU18/TJXGs6jz8hwwyCGjMUm660xUQ+i1saEMdPyPnzW+mxd0zl+j4uESeE/RUf
	OPfN99VQBsaBLjYiQSGQR/eBvuqC7bbn4Gx//W73+ykm+Rh03/QpnvbOPZ/lMjxtW02U
	PEvA==
X-Gm-Message-State: AN3rC/4X7TWA8k9TZr86Sw96Si3f7i3sTkuna2zk+Jmg+vsTXEOPnttI
	b/PGu8LFxXqEZcNe
X-Received: by 10.28.229.145 with SMTP id c139mr14221175wmh.107.1493138510131; 
	Tue, 25 Apr 2017 09:41:50 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id h8sm2693595wmf.28.2017.04.25.09.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 09:41:49 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 18:41:36 +0200
Message-Id: <1493138496-17870-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Partially revert "volatile-binds: correct some errors reported by systemd"
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
X-List-Received-Date: Tue, 25 Apr 2017 16:41:49 -0000

Suppressing default version of etc.conf for systemd-tmpfiles-setup prevents at
least the name resolver from working as expected when using systemd-resolved.
The missing /etc/resolv.conf symlink breaks application relying on this for
name resolution (tested with ping from busybox).

This patch brings default etc.conf from systemd recipe back, solving the
broken name resolution issue.

[YOCTO #11331]

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index a6e3254..943e6ba 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -74,7 +74,6 @@ do_install () {
     # Suppress attempts to process some tmpfiles that are not temporary.
     #
     install -d ${D}${sysconfdir}/tmpfiles.d ${D}/var/cache
-    ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/etc.conf
     ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/home.conf
 }
 do_install[dirs] = "${WORKDIR}"
-- 
2.7.4


