Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1809.1592272351905682871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 18:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05G1pSdK012169
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Jun 2020 18:51:59 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 18:51:23 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <peter.kjellerstedt@axis.com>
Subject: [PATCH 1/2 V2] iptables: fix invalid symbolic link for ip6tables-apply
Date: Tue, 16 Jun 2020 09:51:05 +0800
Message-ID: <20200616015106.11022-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05G1pSdK012169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The iptables-apply is not installed which makes ip6tables-apply as an
invalid symbolic link:

$ ls -l /usr/sbin/ip6tables-apply
lrwxrwxrwx 1 root root 14 Jun 11 08:27 /usr/sbin/ip6tables-apply -> iptab=
les-apply
$ ls -l /usr/sbin/iptables-apply
ls: cannot access '/usr/sbin/iptables-apply': No such file or directory

Backport a patch to fix the issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...iptables-apply-not-getting-installed.patch | 45 +++++++++++++++++++
 .../iptables/iptables_1.8.5.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-build-re=
solve-iptables-apply-not-getting-installed.patch

diff --git a/meta/recipes-extended/iptables/iptables/0001-build-resolve-i=
ptables-apply-not-getting-installed.patch b/meta/recipes-extended/iptable=
s/iptables/0001-build-resolve-iptables-apply-not-getting-installed.patch
new file mode 100644
index 0000000000..51ed66ed24
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0001-build-resolve-iptables=
-apply-not-getting-installed.patch
@@ -0,0 +1,45 @@
+From d4ed0c741fc789bb09d977d74d30875fdd50d08b Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@inai.de>
+Date: Wed, 3 Jun 2020 15:38:48 +0200
+Subject: [PATCH] build: resolve iptables-apply not getting installed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+ip6tables-apply gets installed but iptables-apply does not.
+That is wrong.
+
+=C2=BB make install DESTDIR=3D$PWD/r
+=C2=BB find r -name "*app*"
+r/usr/local/sbin/ip6tables-apply
+r/usr/local/share/man/man8/iptables-apply.8
+r/usr/local/share/man/man8/ip6tables-apply.8
+
+Fixes: v1.8.5~87
+Signed-off-by: Jan Engelhardt <jengelh@inai.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+Upstream-Status: Backport
+[https://git.netfilter.org/iptables/commit/?id=3Dd4ed0c741fc789bb09d977d=
74d30875fdd50d08b]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ iptables/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/Makefile.am b/iptables/Makefile.am
+index dc66b3cc..2024dbf5 100644
+--- a/iptables/Makefile.am
++++ b/iptables/Makefile.am
+@@ -56,7 +56,7 @@ man_MANS         =3D iptables.8 iptables-restore.8 ipt=
ables-save.8 \
+                    ip6tables-save.8 iptables-extensions.8 \
+                    iptables-apply.8 ip6tables-apply.8
+=20
+-sbin_SCRIPT      =3D iptables-apply
++sbin_SCRIPTS     =3D iptables-apply
+=20
+ if ENABLE_NFTABLES
+ man_MANS	+=3D xtables-nft.8 xtables-translate.8 xtables-legacy.8 \
+--=20
+2.17.1
+
diff --git a/meta/recipes-extended/iptables/iptables_1.8.5.bb b/meta/reci=
pes-extended/iptables/iptables_1.8.5.bb
index fa1e5c229d..8664a9751a 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.5.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.5.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
 SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-${PV}=
.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetli=
nk.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetli=
nk-enabled.patch \
+           file://0001-build-resolve-iptables-apply-not-getting-installe=
d.patch \
            file://iptables.service \
            file://iptables.rules \
            file://ip6tables.service \
--=20
2.17.1

