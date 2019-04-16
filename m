Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13BB46C45B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 09:49:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3G9nkw9005562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 02:49:46 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 16 Apr 2019 02:49:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Apr 2019 17:49:43 +0800
Message-ID: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: change default locale from C.UTF-8 to C
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
X-List-Received-Date: Tue, 16 Apr 2019 09:49:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

current default locale is set to C.UTF-8, but glibc not support
locale C.UTF-8. so set to the default locale C.

[snip]
        if not meson.is_cross_build()
                choose_default_locale_sh = find_program('tools/choose-default-locale.sh')
                default_locale = run_command(choose_default_locale_sh).stdout().strip()
        else
                default_locale = 'C.UTF-8'
        endif

if default locale set to C.UTF-8, it will cause libpcre ptest fail:

  re> //8+L
** Failed to set locale ""

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index e61e07e..9efd06f 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -193,6 +193,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Dsysvrcnd-path=${sysconfdir} \
+                  -Ddefault-locale=C \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.7.4


