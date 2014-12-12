Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7FC71F23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:30:45 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so9712152wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Wx7yGqkkyT49D+B5h85/TbIJBcJIzJJZRi+Fwkx39c=;
	b=ZK7eV6G9rdxG9LmRxhnMChGCf91P/i87o8E+cy0gFiNyXFbHAgAMf6KT93Pi10swId
	36//O39xbE/dElKzGj4xnsGJwispvamVY05gcIjb7qwbYxOT+ZeXR0cwS707z+UFA1kC
	fpCNk5YXbFEz0jbsGmvXpiscs10eJ1JhncyE9PGUSfDrq338rf18xVcICaPcNHye6KVP
	B68jX9WvMB1K3Uzxg8mdSH7VM8H2LYjrabwxUoCPUvXggdkyQg4WWVWjXfQNcOMMRXP3
	DJvCavLWlCDJd+5Pil8kjsw4JyV4ZXEXHt5AbU08TwfbVQJMPu7ryY/L/SeAjSncXLGP
	mBJQ==
X-Received: by 10.194.8.34 with SMTP id o2mr29635799wja.129.1418405445862;
	Fri, 12 Dec 2014 09:30:45 -0800 (PST)
Received: from mailhost.eurogiciel.fr (130.167.26.109.rev.sfr.net.
	[109.26.167.130])
	by mx.google.com with ESMTPSA id a14sm2714676wib.22.2014.12.12.09.30.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 09:30:45 -0800 (PST)
From: Baptiste DURAND <baptiste.durand@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Dec 2014 18:28:27 +0100
Message-Id: <1418405307-10221-1-git-send-email-baptiste.durand@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] shadow: disable nscd feature when glibc is not built with spawn posix functions
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
X-List-Received-Date: Fri, 12 Dec 2014 17:30:50 -0000

shadow package  configure step fails with this log output :
| checking location of faillog/lastlog/wtmp... (cached) /var/log
| checking location of the passwd program... (cached) /usr/bin
| checking for posix_spawn... no
| configure: error: posix_spawn is needed for nscd support
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 14c7281..bb3a927 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -60,6 +60,7 @@ NSCDOPT = ""
 NSCDOPT_class-native = "--without-nscd"
 NSCDOPT_class-nativesdk = "--without-nscd"
 NSCDOPT_libc-uclibc = " --without-nscd"
+NSCDOPT_libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES', 'libc-spawn', '--with-nscd', '--without-nscd', d)}"
           
 PAM_PLUGINS = "libpam-runtime \
                pam-plugin-faildelay \
-- 
1.8.1.4


