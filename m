Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5ve-0004uy-Bz
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:37:54 +0200
Received: by yxj20 with SMTP id 20so1151205yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=TIky/940Ap4A71JWxI3ptvhELVeU/gipvSgMovYgzys=;
	b=CO7CbblJ02TRfMnw+gLg4VKr1xtmjBJBirLTJ73pXP9nddUgBbJxwOH9Rg3c+S2mIf
	D2xqWvZ9jFHndt8zPp/ArHntiGouCActKRNw1u6rGrYZuEucP7wgy/Y2vvATx/s0ziRG
	TPN6oXTvo0A7a/KeeQACA1lyKRg0WCJj6KvcI=
Received: by 10.150.139.9 with SMTP id m9mr162434ybd.104.1319167915963;
	Thu, 20 Oct 2011 20:31:55 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m3sm32008971ang.0.2011.10.20.20.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:31:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:31:41 +0000
Message-Id: <d0e2424c7510f09a6733c16199e86c158cbfbb7c.1319167843.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 03:37:54 -0000

To allow use and manipulation of users and groups at rootfs building
time, the '/etc/passwd' and '/etc/group' needs to be available as soon
as possible.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 137512d..9f81ba3 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r3"
+PR = "r4"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -37,7 +37,7 @@ do_install () {
 	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
 }
 
-pkg_postinst_${PN} () {
+pkg_preinst_${PN} () {
 	set -e
 
 	if [ ! -e $D${sysconfdir}/passwd ] ; then
-- 
1.7.2.5



