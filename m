Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id EACA47238A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 14:40:28 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so1598992wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5Wx7yGqkkyT49D+B5h85/TbIJBcJIzJJZRi+Fwkx39c=;
	b=UGafUvfgOwyiKPLYmZemH/5Y669uhnGc48h//MyYoeGsQmjdQVjd5bys66nc1QXjyG
	nnTGrHHechneTTPij1wiMvcVMTFSK57z9K7+B/pH5Vs1DaXLdr5CfNFYkOsm4/n2UrcB
	UwpqiBtFSZGMULOUcnC9jntiNssp0dw3hwI7NzqZTrN0PV86mo7SZ702oTzNx5LVIhRI
	55HR507tzFVl6k34uLtyQpFWffYhQCJ7xpvPNBH+XTcOpeZfLBeL4sBfH/b6xy53vmkZ
	DD1lpppH8czV6YcHYGn8PzGMDHldFE24wX0PLi+hvTN9pd+wf8LEO6qMkVy4WPGylr+P
	o0Jg==
X-Received: by 10.194.237.101 with SMTP id vb5mr24834079wjc.30.1417790428657; 
	Fri, 05 Dec 2014 06:40:28 -0800 (PST)
Received: from mailhost.eurogiciel.fr (130.167.26.109.rev.sfr.net.
	[109.26.167.130]) by mx.google.com with ESMTPSA id
	cq4sm45164097wjc.35.2014.12.05.06.40.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 06:40:28 -0800 (PST)
From: Baptiste DURAND <baptiste.durand@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 15:40:16 +0100
Message-Id: <1417790416-12114-1-git-send-email-baptiste.durand@gmail.com>
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
X-List-Received-Date: Fri, 05 Dec 2014 14:40:38 -0000

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


