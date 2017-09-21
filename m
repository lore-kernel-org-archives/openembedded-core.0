Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1FE7822A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:25:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k20so2969669wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 04:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vbjSzm2WLAgm0HjzpK1lrgN6U7PClCNpMLAo/8N8l2A=;
	b=fKU1W6TtM2FpJp6XdLOBMcxqAA33XnkIJlc5SRVcF7TPpn+ah3KfCJFM5YDB3aS66W
	A/bew6YyL5dqd4nht0CWY4JtMsDW+/CPiGkwJwjR90AWOkH5GCCJuFRcqFE+IdJ2J6ic
	+KFEKJRFqjFvlhBbv1fT0Q2jFyLk7dcen82si66KMLyxOnR24NI5rZjyA7h7RC5QDkBh
	wJmWvxwRrSnTTdgCNxj+KEbqUmm8ntrugMdTFF/BiwzSPofv5bTjzo+rmjwy1SYD8Ht+
	6dD7WFoNDSm/xT57bK9YjD4vRnW5LT7bTa27XlXwE+mGgkAoqyUucArQSSlzgROwVxB3
	nmVw==
X-Gm-Message-State: AHPjjUiSGQslApRAJZc39kOp6LpvfJ3tmTm7A5RKWC7NxMRDnEByP/bW
	hun1G2scDhq3oYBrHIsrX3fIgL2L
X-Google-Smtp-Source: AOwi7QDMSJ6JggLuD2srYFPPK96poLYXhJjKi64am7HqueHJbAEGdHYyvJcFOt4tK4VMyvBJQpTFiA==
X-Received: by 10.223.172.66 with SMTP id v60mr1664690wrc.143.1505993122352;
	Thu, 21 Sep 2017 04:25:22 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id s3sm1808085wrc.24.2017.09.21.04.25.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 04:25:21 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 12:25:18 +0100
Message-Id: <20170921112518.16132-2-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170921112518.16132-1-git@andred.net>
References: <20170921112518.16132-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-extlinux: fix extlinux creation race (take 2)
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
X-List-Received-Date: Thu, 21 Sep 2017 11:25:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Alternative solution to original commit
60c90398580998b2379bb438f0f75b29285135a5 ("u-boot: fix extlinux
creation race")

(Untested)

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index 8447a047ee..d60f8c6ae2 100644
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
+addtask create_extlinux_config before do_install after do_compile
-- 
2.14.1


