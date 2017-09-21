Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29EDE77FF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:29:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r136so4946906wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 04:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qQaI8PsL8yUQms77tqg6/nfX66xRlKtXrgCB9QTmI8s=;
	b=stTJuFgRFQi7oIapb1MuZWZbGhUJZ7XDWFxm6FXz8XHvPcj0KC9CWSvdRUflc8LO+7
	1eXZCRDdWZpTDQYBqq85CtUEjtfpUfD+dXKMTydOzYh6Tit2g14HOVm6jiFAA1LxghK3
	JXHdxJdc8L522+/3oUranYznPxGiNpedkrCVACFPn+S5GJ1xtXfIvsd3HDcUEQOYsuMk
	sUGpwVrlOD+50Bt9FqUviWzHzW8+uTRT9w4piIv+vGorzGCMsKgNUyZsZPWHz9CfJqpV
	G8WwbfIj3Qo3FVwMRgvo4d0kIteu8/ziwTemCJHzyLc3lvJ9f+1JHNLXOEJw85U8LE/C
	vDqA==
X-Gm-Message-State: AHPjjUg+7ZXX+wzJ2t7MDauFnRSfq1jSRIhIRhkyAlc+urrfUEJxHgW2
	2nT8FS3kO5JnqeERGaROpGJvZ1ZK
X-Google-Smtp-Source: AOwi7QCgbpWeU/vDJgWy8SEzMCM+TiLimqql+UA1GhU+VtlgUFbnDET9Iht+zmMNSRgCXcQz10FkBQ==
X-Received: by 10.28.143.138 with SMTP id r132mr719153wmd.18.1505993394553;
	Thu, 21 Sep 2017 04:29:54 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id j15sm846391wre.87.2017.09.21.04.29.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 04:29:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 12:29:52 +0100
Message-Id: <20170921112952.17395-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170921112518.16132-2-git@andred.net>
References: <20170921112518.16132-2-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] uboot-extlinux: fix extlinux creation race (take 2)
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
X-List-Received-Date: Thu, 21 Sep 2017 11:29:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Alternative solution to original commit
60c90398580998b2379bb438f0f75b29285135a5 ("u-boot: fix extlinux
creation race")

(Untested)

Signed-off-by: André Draszik <adraszik@tycoint.com>

---
v2: also execute before do_deploy
---
 meta/classes/uboot-extlinux-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index 8447a047ee..61dff14b7c 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -68,7 +68,7 @@ UBOOT_EXTLINUX_MENU_DESCRIPTION_linux ??= "${DISTRO_NAME}"
 
 UBOOT_EXTLINUX_CONFIG = "${B}/extlinux.conf"
 
-python create_extlinux_config() {
+python do_create_extlinux_config() {
     if d.getVar("UBOOT_EXTLINUX") != "1":
       return
 
@@ -149,4 +149,4 @@ python create_extlinux_config() {
         bb.fatal('Unable to open %s' % (cfile))
 }
 
-do_install[prefuncs] += "create_extlinux_config"
+addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.14.1


