Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 52CCA60034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 02:37:42 +0000 (UTC)
Received: by pacwe9 with SMTP id we9so27682893pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 19:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zEyrAxh+nw+aJfuPbRyZe4AS3rhwGdoJVY7Acd8JcO0=;
	b=J2xlv2OWppV8vj6vanV4AfAmzsQh+xY6W+BAeqvdf2TjKs66SATbVd0iaAYGIC4iru
	JM+JNXazWgLw7a4XcpsKM1FnmVTsIf2lh3dKxV61uU9cUrIm3A43tFLjPs+IKpitybwg
	YLVtcX5J6eu91LedEW0MyMm4KkyQdsQoSQFkDG0dRP42Mf3njlB9y/lvf+/ujqYKwdlp
	Oq+k9AyKvIKtfBdvLVfQjo9oD8IMZwISrG1ib+DEuCBkf7eU2wTrY0A3IbEa4idkxsMF
	ir46qPQsXt4l3MjRsBmnRwo9WR6rQHn6jR5FMMFG66g2uxD3k9iT4azvxQotHDuivKuR
	zzfg==
X-Received: by 10.66.148.165 with SMTP id tt5mr148858519pab.38.1426646263916; 
	Tue, 17 Mar 2015 19:37:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id o4sm24622795pdh.6.2015.03.17.19.37.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 19:37:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 13:37:21 +1100
Message-Id: <1426646241-19022-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] systemd: set the location of binaries used by service files
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
X-List-Received-Date: Wed, 18 Mar 2015 02:37:44 -0000

Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot or host
system, which won't work on the target.

[YOCTO #7408]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index ff29a3f..e8383c3 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -88,7 +88,11 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 
-CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
+CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
+CACHED_CONFIGUREVARS += "ac_cv_path_QUOTACHECK=${sbindir}/quotacheck"
+CACHED_CONFIGUREVARS += "ac_cv_path_QUOTAON=${sbindir}/quotaon"
+CACHED_CONFIGUREVARS += "ac_cv_path_SULOGIN=${base_sbindir}/sulogin"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
-- 
2.3.1


