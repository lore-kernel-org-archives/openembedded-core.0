Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 11D2B7198A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 22:15:23 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id j53so4633001uaa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 15:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=SyLsdXlI5wPfUTxuDtAEjVFI9p0lTt21iL1xBmeK0bA=;
	b=BzCwc43fGLwjFIAbv0dXWdymaxrvdhmJpVSL2WJHl+ZcLBd73RCjr9qaJLpvBSnGxC
	WDMp2T/UwGiL2fYI/M97bkNAELFCTrzsPHqSUrcJ6+UxjfCUh9petPpdWQauvHOiY2dp
	u3PiIh61s3adNzECqkGVEGhtvwDl8QbK55diQUx+1cWD/ZR0WGhJPj262rtLg9M04hus
	brVKRb16500oqIpLgq/wU+nyTnCYKUt8HW+7DQ4rVM+CE00Aq+NbsnaV35bixiAA/hbT
	V49AE3lchFaCSGL2tIfjQ3k3zrjE5vkmYTGfkZ30O0SJqYZAdyzgpD7kZebEV+xhR9xK
	S+hA==
X-Gm-Message-State: AKS2vOygndScoqmS+zMFGZGgY72yf8CfOSd5zduQvf9ar/iKUMRdO12o
	tLLZyulxsTJIN+8G
X-Received: by 10.176.92.198 with SMTP id z6mr22115502uaf.27.1497996924452;
	Tue, 20 Jun 2017 15:15:24 -0700 (PDT)
Received: from localhost.localdomain ([189.35.69.200])
	by smtp.gmail.com with ESMTPSA id
	q75sm5148892vke.15.2017.06.20.15.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Jun 2017 15:15:23 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 20 Jun 2017 19:15:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jun 2017 19:15:12 -0300
Message-Id: <20170620221512.21860-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.1
Organization: O.S. Systems Software LTDA.
Cc: marex@denx.de, trini@konsulko.com,
	Otavio Salvador <otavio@ossystems.com.br>, brad.mouring@ni.com
Subject: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 22:15:24 -0000

If a fw_env.config file is found in workdir, this is preferred over
the U-Boot example.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
index c2e8f0fb84..0682f9274b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
@@ -19,7 +19,14 @@ do_install () {
 	install -d ${D}${sysconfdir}
 	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
 	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+
+	# If a specific file is added in a .bbappend, this is used instead
+	# of the generic one
+	if [ -e ${WORKDIR}/fw_env.config ]; then
+		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+	else
+		install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config.example
+	fi
 }
 
 do_install_class-cross () {
-- 
2.13.1


