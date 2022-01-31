Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03328C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 13:54:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.32211.1643637251862098694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E21012FC
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE1CE3F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemtap: backport buffer size tuning patches
Date: Mon, 31 Jan 2022 13:54:07 +0000
Message-Id: <20220131135408.2857460-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131135408.2857460-1-ross.burton@arm.com>
References: <20220131135408.2857460-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 13:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161126

Backport a nunber of patches from upstream to tune the buffer size on
machines with a "small amount" of memory, which appears to mean less
than 4GB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ault-stap-s-buffer-size-on-small-RAM.patch | 84 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR28804-=
tune-default-stap-s-buffer-size-on-small-RAM.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-de=
fault-stap-s-buffer-size-on-small-RAM.patch b/meta/recipes-kernel/systemt=
ap/systemtap/0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.pa=
tch
new file mode 100644
index 00000000000..931310db53e
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-default-s=
tap-s-buffer-size-on-small-RAM.patch
@@ -0,0 +1,84 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+PR28804: tune default stap -s ## buffer size on small RAM machines
+
+Insert a forgotten division by num_online_cpu() to adjust downward the
+calculated bufsize.  Tweak normal defaults back to 128 * 2 * 64K
+(16MB) per CPU, as the stap man page indicates.  This may need further
+tweaking when balancing against staprun consumption performance, but
+at least we have the docs lined up with the code at the moment.
+
+PR28804: tune default stap -s ## buffer size on small RAM machines
+
+Use si_meminfo to limit default buffer size.  Note in the man page
+that the "-s ##" parameter is per-CPU.
+
+diff --git a/man/stap.1.in b/man/stap.1.in
+index 55dbc2c93..285a27b34 100644
+--- a/man/stap.1.in
++++ b/man/stap.1.in
+@@ -239,8 +239,8 @@ and average amount of time spent in each probe-point=
. Also shows
+ the derivation for each probe-point.
+ .TP
+ .BI \-s " NUM"
+-Use NUM megabyte buffers for kernel-to-user data transfer.  On a
+-multiprocessor in bulk mode, this is a per-processor amount.
++Use NUM megabyte buffers for kernel-to-user data transfer per processor=
.
++The default is 16MB, or less on smaller memory machines.
+ .TP
+ .BI \-I " DIR"
+ Add the given directory to the tapset search directory.  See the
+diff --git a/runtime/transport/transport.c b/runtime/transport/transport=
.c
+index 18ecccea2..44afff814 100644
+--- a/runtime/transport/transport.c
++++ b/runtime/transport/transport.c
+@@ -72,8 +72,11 @@ static inline void _stp_unlock_inode(struct inode *in=
ode);
+ #include "procfs.c"
+ #include "control.c"
+=20
+-static unsigned _stp_nsubbufs =3D 256;
+-static unsigned _stp_subbuf_size =3D 8 * STP_BUFFER_SIZE; /* 64K */
++/* set default buffer parameters.  User may override these via stap -s =
#, and
++   the runtime may auto-shrink it on low memory machines too. */
++/* NB: Note default in man/stap.1.in */
++static unsigned _stp_nsubbufs =3D 128;
++static unsigned _stp_subbuf_size =3D 2 * STP_BUFFER_SIZE; /* 2 * 64K */
+=20
+ /* module parameters */
+ static int _stp_bufsize;
+@@ -602,17 +605,30 @@ static int _stp_transport_init(void)
+         _stp_need_kallsyms_stext =3D 0;
+ #endif
+=20
+-	if (_stp_bufsize) {
+-		unsigned size =3D _stp_bufsize * 1024 * 1024;
++        if (_stp_bufsize =3D=3D 0) { // option not specified?
++		struct sysinfo si;
++                long _stp_bufsize_avail;
++                si_meminfo(&si);
++                _stp_bufsize_avail =3D (long)((si.freeram + si.bufferra=
m) / 4 / num_online_cpus())
++                        << PAGE_SHIFT; // limit to quarter of free ram =
total
++                if ((_stp_nsubbufs * _stp_subbuf_size * num_online_cpus=
()) > _stp_bufsize_avail) {
++                        _stp_bufsize =3D max_t (int, 1, _stp_bufsize_av=
ail / 1024 / 1024);
++                        dbug_trans(1, "Shrinking default _stp_bufsize t=
o %d MB/cpu due to low free memory\n", _stp_bufsize);
++                }
++        }     =20
++       =20
++	if (_stp_bufsize) { // overridden by user or by si_meminfo heuristic?
++		long size =3D _stp_bufsize * 1024 * 1024;
+ 		_stp_subbuf_size =3D 65536;
++                // bump up subbuf size from 64K to 1M to keep _stp_nsub=
bufs not too large
+ 		while (size / _stp_subbuf_size > 64 &&
+ 		       _stp_subbuf_size < 1024 * 1024) {
+ 			_stp_subbuf_size <<=3D 1;
+ 		}
+ 		_stp_nsubbufs =3D size / _stp_subbuf_size;
+-		dbug_trans(1, "Using %d subbufs of size %d\n", _stp_nsubbufs, _stp_su=
bbuf_size);
+ 	}
+-
++        dbug_trans(1, "Using %d subbufs of size %d\n", _stp_nsubbufs, _=
stp_subbuf_size);
++       =20
+ 	ret =3D _stp_transport_fs_init(THIS_MODULE->name);
+ 	if (ret)
+ 		goto err0;
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index 36c934c2fa7..a7c8bbc589a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,6 +8,7 @@ SRC_URI =3D "git://sourceware.org/git/systemtap.git;branc=
h=3Dmaster \
            file://0001-Install-python-modules-to-correct-library-dir.pat=
ch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
            file://0001-PR28778-gcc-warning-tweak-for-sprintf-precision-p=
ara.patch \
+           file://0001-PR28804-tune-default-stap-s-buffer-size-on-small-=
RAM.patch \
            "
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips)=
.*-linux'
--=20
2.25.1


