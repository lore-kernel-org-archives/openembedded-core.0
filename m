Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R53Ib-0002Z7-Aw
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:23:49 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3133338fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Cjt1gU+BUDs3OayV/AnNX1baqtcHRHx5CRHSL1oyqDI=;
	b=l1XUGzI4zEuczWs6okoFdvA6GfmfUf3p/JwxJETwgULGzAIuQwZwGzCVtxcHW7kLtw
	qiUG61TBKl6OeIb3RjZEXK/SdFJLyb/7eH+iKxOjhyM5iMjT6rKw3R6LarrH3S/k+nOt
	I/UbWMn+g8/tm/4cven46Mb65PUzfCbpn4Cgw=
Received: by 10.223.45.209 with SMTP id g17mr1930117faf.96.1316297917185;
	Sat, 17 Sep 2011 15:18:37 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l20sm16037887fad.12.2011.09.17.15.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 15:18:36 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 02:18:17 +0400
Message-Id: <1316297897-698-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 5/5] kernel.bbclass: remove unshipped files in do_install
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
X-List-Received-Date: Sat, 17 Sep 2011 22:23:49 -0000

Drop two unsed files (modules.order and modules.builtin) in do_install
to stop the "unshipped files" warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 59d3b89..6b2e603 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -108,6 +108,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
+		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
+		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
 	else
 		bbnote "no modules to install"
 	fi
-- 
1.7.2.5



