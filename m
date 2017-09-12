Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC2EB78480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:46:14 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g128so7229166qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 06:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=b/vaReQCz7Kqc/46trjYXCs5AP9fQSRqUVZLJBUuWWE=;
	b=uFfFhNtA5OaAEt50fP9SGbuc5j66GIIslFy7c9rImG95kNFtJfr5PkQ95sJuboxXaz
	TA4DpdLp6IKydNYY82D/JIu0vLixcxKV0VMUEmaWgGfQbz9d5TnlBydoaxAwxI5XWnyx
	hlmmVjtMWw1FZZD7Y/pXSkirl6K54g49sq/UkU7iASJB14O8gP5NRuR0f1J/cEQ8nFDY
	YNSwxlQOfes4s1M3X6WXz0TiVnp+pxMbXzi8/3coINTB8vHeC7zy1HVX75/rV7ggbxiV
	sW098LKnPnhKtvpX7kaa+656LimEqGL3uhlr8RQQKiylN+7v1BXRxpSMOiTl2NWirsJL
	hfFw==
X-Gm-Message-State: AHPjjUj15jUTdBZ76vMv1ZhSLoh4z19eu9jF1Nw53q4xV1tWFXpyAXo+
	w8q1X6nnsgh6NCiI
X-Google-Smtp-Source: AOwi7QCHsB/0NJk41ifPHBkTCbIIiiyHxn3Tv0giALeY02OjJZiZ1O+AUujfhZ9lE+WCxD8ZXI8qwA==
X-Received: by 10.55.23.205 with SMTP id 74mr14009012qkx.134.1505223975704;
	Tue, 12 Sep 2017 06:46:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id u1sm7989513qtu.96.2017.09.12.06.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 06:46:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 10:46:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 10:45:50 -0300
Message-Id: <20170912134551.12678-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912134551.12678-1-otavio@ossystems.com.br>
References: <20170912134551.12678-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 12 Sep 2017 13:46:15 -0000

This reworks the compile and install in tasks as well as run the build
of the Device Tree files in parallel, if possible.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


