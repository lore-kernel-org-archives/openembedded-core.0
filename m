Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71F4A78524
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:36:27 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so7860840qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=riZU6uwDcvqZujEXIO37jbMsljUcJuS6ZIhr2C/uKk8=;
	b=Df5gpgrEzM45k91V0SvERYUlP4C9yTqDaS4BCkie565NPZLWes0SxuOtNmAwQ6KJgm
	9giJNHokSdBwb+Av+c4YqS7ZuTXu6BrJsnrBRrvb+825NX2d/jcKn+Fw3uUsHbKaCIv0
	e9kcBa3WmuwFsT0gpMEZea7LkOGZQk5y8cUgXM6e/ge2Si7stNtD485+y6fyRWiJ3cd/
	d8pW/T59wlJBqakMQNWHnCth5fcQJaFyOAlYv7h7FCmYO72urHUXMts7E9OqbDUK3tab
	B7V36Dn559Gl2KswsqCOrSvt1bNPVfRA+tIaXZ4gpewrRMPR7yPpbEdlUcZWf1vq/lU5
	eiqA==
X-Gm-Message-State: AHPjjUh6n7kfHgxfSsu4FJrx1xAvvltZL2DNexrCBg77+7ezBYjBvQOg
	BGgPdDY040N4liEg
X-Google-Smtp-Source: AOwi7QCEUYn0qlMAeUfYb/62gJgBA0SozCvDuUK4b7wXjZGv+MB6K4ggYmSFmxYJi+nJY834wJAq2Q==
X-Received: by 10.55.169.81 with SMTP id s78mr23283101qke.34.1505248588307;
	Tue, 12 Sep 2017 13:36:28 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id k2sm8111592qkc.36.2017.09.12.13.36.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 13:36:27 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 17:36:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 17:36:07 -0300
Message-Id: <20170912203608.14327-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912203608.14327-1-otavio@ossystems.com.br>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 2/3] kernel-devicetree.bbclass: Rework to use tasks
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
X-List-Received-Date: Tue, 12 Sep 2017 20:36:27 -0000

This reworks the compile and install in tasks as well as run the build
of the Device Tree files in parallel, if possible.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7:
- Split tasks change from linux-dtb rework
- Run do_compile_devicetree before do_compile_kernelmodules

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/kernel-devicetree.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 72814ca224..8723f24212 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -20,14 +20,19 @@ get_real_dtb_path_in_kernel () {
 	echo "${DTB_PATH}"
 }
 
-do_compile_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		oe_runmake ${DTB}
+do_compile_devicetree() {
+	DTBS=""
+	for dtb in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "${dtb}"`
+		DTBS="$DTBS $dtb"
 	done
+	oe_runmake -C ${B} ${PARALLEL_MAKE} ${DTBS}
 }
+addtask compile_devicetree after do_compile before do_compile_kernelmodules do_install
 
-do_install_append() {
+do_install_devicetree[dirs] = "${B}"
+do_install_devicetree[umask] = "022"
+fakeroot do_install_devicetree() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_EXT=${DTB##*.}
@@ -41,6 +46,7 @@ do_install_append() {
 		done
 	done
 }
+addtask install_devicetree after do_install before do_deploy
 
 do_deploy_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
-- 
2.14.1


