Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6q-0003uE-BW
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:56:04 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2486051pad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nLp6KGYk6ZmUViRPaInicB+75lHKm9dZu8DUnEUmzoM=;
	b=XcxPwgCgX70qwm2bTWWaK2s2/JfqZTcGY1LIZ0Bc6Em3nHflqF9wptSWStDQOmhqtb
	io5HXfyZXW+HJt3AZH5UuGRzw7rHxJvRY3kO1fmi/E1Nhj7QKeiZ+3dLfmSXXg41yvbl
	+jEaVK+f6IkWBkfKW12NZyzKeTuruIY0KXmCuKuy3h4F4BeTdeW0C/Tt+NNu/W3UsD6v
	pMcahQltEeDgkRXQzymAPdu7vR/pD8lb0VBvovH2Zaz18UdTQDjDavIJb/MqlFaxtOdC
	in2OxlndUF5bhdcvKxTAFEQIhx1DCuc6pXFKg/yNyiog7+B0xEBmX9guDdlKShDcslkl
	4ZOw==
Received: by 10.68.217.4 with SMTP id ou4mr19803012pbc.88.1355528486901;
	Fri, 14 Dec 2012 15:41:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id na7sm3668508pbc.48.2012.12.14.15.41.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:48 +0100
Message-Id: <d503f2e963cffbb534a2ee4e7f8255d46f65789e.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/10] iptables: include /usr/share/xtables/pf.os in PN if it's build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 23:56:04 -0000

* when libnfnetlink is available (provided by
  meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
  it's autodetected and utils subdirectory with pf.os is used.
* unfortunately there isn't configure switch to explicitly disable
  libnfnetlink and it's also in different layer so we cannot add it to
  DEPENDS
* it's undeterminitic, but pf.os is the only difference AFAIK, so not
  worth patching configure switch
* fixes:
  iptables-1.4.15: iptables: Files/directories were installed but not
  shipped
    /usr/share/xtables
    /usr/share/xtables/pf.os

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/iptables/iptables_1.4.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.15.bb b/meta/recipes-extended/iptables/iptables_1.4.15.bb
index a6297f3..d556c77 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.15.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.15.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
 
-PR = "r0"
+PR = "r1"
 
 RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-ip-tables \
@@ -18,7 +18,7 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-nf-conntrack-ipv4 \
                      kernel-module-nf-nat \
                      kernel-module-ipt-masquerade"
-FILES_${PN} =+ "${libdir}/xtables/"
+FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
 FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
-- 
1.8.0.2



