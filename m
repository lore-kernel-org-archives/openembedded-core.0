Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id EBBCC7FA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id p26so11210089pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VBftmu68V8MOQp78gEO3vcwpLa5OsuyZQtAwH8ypQbM=;
	b=JcGovnQvUDhXB6P4v6xYHrrwYASUCxXB1FL8qzOTpYYddrztPCzRjpYgSoPnCHXNyz
	z6e3gy5eOMNfQJQcmLuoV7g4XzsoGKFJkDEBvSLhQPyodfsR4VAO6t1RFedwbR16CFK/
	XZFxQXBiRnFprGZzbonqXJJvI7nJTXpUVQxcqtfcEWC/lcwuwvM8h9wyw/aLr0YifY0s
	xrfD7tkVPGZcjjDxZlqDVGZ/aARTXtnlFiWslH9YZRT+UBW7q4+iAfOD50EacsnTFSFM
	MO6uVyL0S6zGChSgbVnzLbJrjOw3M+j0V8ifSi6dynsnnHgENK+UlkuQxYGkF+oZ0Qwm
	ytWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VBftmu68V8MOQp78gEO3vcwpLa5OsuyZQtAwH8ypQbM=;
	b=Kac0S3w/ZKrNwWOh/J/pOTR+5NAJv5QEr/VTktdaTOVrxEl5NFwVzBq9smBuDKzsxo
	aCXDPq+kMCjIFVAjUSUL+/1PyIdya3KPsTtDHowADw+cXJ1WEvL7Kn1U0yomMtQI6RW0
	pz96MNDQT9BcY2s0mdwhsChvNkbLn5wdzhk369I+Kuba2FtzRE5T9RvjN7PMHbDWCk2K
	4Gg45Q1Qed7U2/PgnmmK3GEinwMmBW4nuRATOA/ejAFFgijf3Sy3mZpOsi/XOdB94obv
	yaOhO+Zadccx5BgBB3Awc++bVzRIyA8PJllh7cnigVr5izIinrsPUgO88l7HWlDoDtAJ
	Bffg==
X-Gm-Message-State: APjAAAX+z3BsUdSL5AMr3X+u2UVTw6Qg/l1Edtl1g2H192dJHrHoH7c6
	DnNBpltHdWcdUEp8u8KmU9ff/P6e
X-Google-Smtp-Source: APXvYqzwHOletJGeO/XLLqKyTQftgmaS4MXorjkWYbeyNgDP7rDezOEimrzTizz/DLiyF49nnJ2x6g==
X-Received: by 2002:a17:90a:6d64:: with SMTP id
	z91mr562769pjj.44.1573497013518; 
	Mon, 11 Nov 2019 10:30:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:47 -0800
Message-Id: <d0f285bd7d066e752b93e57b7f5468819016586f.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 05/21] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:13 -0000

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. add DISTRO_FEATURE_append = 'usrmerge' in local.conf
2. bitbake mdadm --success
3. remove DISTRO_FEATURE_append = 'usrmerge' from local.conf
4. bitbake mdadm  -- failed when do_package

it is not proper to change source Makefile during do_install by sed,
fix by pass correct config to EXTRA_OEMAKE

[YOCTO #13493]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 639382e..64f519e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -43,13 +43,12 @@ CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
-EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_unitdir}/system \
+                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev"'
 
 DEBUG_OPTIMIZATION_append = " -Wno-error"
 
 do_compile() {
-	# Point to right sbindir
-	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" -e "s;SYSTEMD_DIR=/lib/systemd/system;SYSTEMD_DIR=${systemd_unitdir}/system;" ${S}/Makefile
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
-- 
2.7.4


