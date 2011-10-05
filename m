Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBZJQ-0001bY-1P
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 23:47:36 +0200
Received: from mail55-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 21:26:55 +0000
Received: from mail55-am1 (localhost.localdomain [127.0.0.1])	by
	mail55-am1-R.bigfish.com (Postfix) with ESMTP id 0F47A1AC8607	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 21:26:55 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(z3e12hzc89bhzz1202h1082kzz8275ch8275bh8275dhz2dh2a8h668h839h93fh)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail55-am1 (localhost.localdomain [127.0.0.1]) by mail55-am1
	(MessageSwitch) id 1317850014872233_5780;
	Wed,  5 Oct 2011 21:26:54 +0000 (UTC)
Received: from AM1EHSMHS010.bigfish.com (unknown [10.3.201.251])	by
	mail55-am1.bigfish.com (Postfix) with ESMTP id D009C898050	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 21:26:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS010.bigfish.com
	(10.3.207.110) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 21:26:52 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 5 Oct 2011 16:26:50 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p95LQnwZ011502	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 16:26:50 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Oct 2011 16:26:49 -0500
Message-ID: <1317850009-7714-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317850009-7714-1-git-send-email-msm@freescale.com>
References: <1317850009-7714-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 21:47:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

__ppc64__ is not defined on powerpc64, rather __powerpc64__ is, this
uses a patch that is already upstream to fix builds for powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 ...PowerPC-checks-for-__NR_perf_counter_open.patch |   35 ++++++++++++++=
++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 +
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-ch=
ecks-for-__NR_perf_counter_open.patch

diff --git a/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-fo=
r-__NR_perf_counter_open.patch b/meta/recipes-kernel/sysprof/files/0001-F=
ix-PowerPC-checks-for-__NR_perf_counter_open.patch
new file mode 100644
index 0000000..041054e
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_=
perf_counter_open.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Backport
+
+From 4708a509aa9d65ae93e9824e42ddbc6e8d42d90c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Michel=3D20D=3DC3=3DA4nzer?=3D <michel@daenzer.net>
+Date: Sat, 27 Aug 2011 20:04:44 +0200
+Subject: [PATCH] Fix PowerPC checks for __NR_perf_counter_open.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+__ppc__ isn't defined here on Debian powerpc. Grepping through the heade=
rs
+installed in /usr/include, there are a few references to __ppc__ and
+__ppc64__, but I suspect they're for other OSs.
+
+Signed-off-by: Michel D=C3=A4nzer <michel@daenzer.net>
+---
+ collector.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/collector.c b/collector.c
+index b28964f..fe16967 100644
+--- a/collector.c
++++ b/collector.c
+@@ -175,7 +175,7 @@ sysprof_perf_counter_open (struct perf_counter_attr =
*attr,
+ #define __NR_perf_counter_open 337
+ #elif defined(__hppa__)
+ #define __NR_perf_counter_open 318
+-#elif defined(__ppc__) || defined(__ppc64__)
++#elif defined(__powerpc__) || defined(__powerpc64__)
+ #define __NR_perf_counter_open 319
+ #elif defined(__s390__)
+ #define __NR_perf_counter_open 331
+--=20
+1.7.6.1
+
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-ke=
rnel/sysprof/sysprof_git.bb
index 10bde04..c553263 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -10,6 +10,7 @@ PV =3D "1.1.8+git${SRCPV}"
=20
 SRC_URI =3D "git://git.gnome.org/sysprof;protocol=3Dgit \
            file://define-NT_GNU_BUILD_ID.patch \
+	   file://0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch \
           "
=20
 SRC_URI_append_arm  =3D " file://rmb-arm.patch"
--=20
1.7.6.1




