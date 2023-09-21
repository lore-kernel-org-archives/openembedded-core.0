Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37F6E706E8
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11205.1695284420445752096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=po4cuUVe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76288fee9c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38L7LPxB022854
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 01:20:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=erUYIHJA+GVTL9uiRU
	ngcZZuU0WRGX8tpt/p5j8QAXw=; b=po4cuUVeQfXYCGg4ScZqfsKnsgSo7U0+QU
	xwYMD8fF/JDCJh3nNmDTvJ887MLzPqsJTB/aKuVNUdeRZGIxj9D2xwhCDOV72nRx
	9kCSup1AJj2VdEOHrQWZM3MJgmm8RcmBcorJxG2sTeCI26yiN1KyFFAOsgVTU3yy
	MIRRHOypy8ZiLEGR11JQ4XjQf05VvbCer/6zq40x7Ur1rWnVmthc633jMBJsLkQi
	Y+whI5q8ew0BUWVbc8UqmtO+oRdKpZATCPmuLEHof8Kh5rvezzhykCi05Rm01MYM
	kpy7Mw8w2Re9aqJcwjdpgFNdY2sqn9jABK0jjQMXM5MS6LBqiASg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t5bvfv3yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 01:20:19 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 01:20:18 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] shadow: Fix CVE-2023-4641
Date: Thu, 21 Sep 2023 08:20:00 +0000
Message-ID: <20230921082000.3196181-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: gqUL_jWalYxcxirRr5dMCH8eZsay_snk
X-Proofpoint-ORIG-GUID: gqUL_jWalYxcxirRr5dMCH8eZsay_snk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309210072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38L7LPxB022854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187979

From: Soumya Sambu <soumya.sambu@windriver.com>

shadow-utils: possible password leak during passwd(1) change

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../shadow/files/CVE-2023-4641-0001.patch     |  36 +++++
 .../shadow/files/CVE-2023-4641-0002.patch     | 147 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0001=
.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0002=
.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch =
b/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
new file mode 100644
index 0000000000..2d3c462f4d
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
@@ -0,0 +1,36 @@
+From 58b6e97a9eef866e9e479fb781aaaf59fb11ef36 Mon Sep 17 00:00:00 2001
+From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
+Date: Mon Apr 25 12:17:40 2022 +0200
+Subject: [PATCH 1/2] passwd: erase password copy on all error branches
+
+CVE: CVE-2023-4641
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit=
/58b6e97a9eef866e9e479fb781aaaf59fb11ef36]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/passwd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/passwd.c b/src/passwd.c
+index 80531ec..8c6f81a 100644
+--- a/src/passwd.c
++++ b/src/passwd.c
+@@ -289,6 +289,7 @@ static int new_password (const struct passwd *pw)
+		cp =3D getpass (_("New password: "));
+		if (NULL =3D=3D cp) {
+			memzero (orig, sizeof orig);
++			memzero (pass, sizeof pass);
+			return -1;
+		}
+		if (warned && (strcmp (pass, cp) !=3D 0)) {
+@@ -316,6 +317,7 @@ static int new_password (const struct passwd *pw)
+		cp =3D getpass (_("Re-enter new password: "));
+		if (NULL =3D=3D cp) {
+			memzero (orig, sizeof orig);
++			memzero (pass, sizeof pass);
+			return -1;
+		}
+		if (strcmp (cp, pass) !=3D 0) {
+--
+2.40.0
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch =
b/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch
new file mode 100644
index 0000000000..a37379d7a0
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch
@@ -0,0 +1,147 @@
+From 65c88a43a23c2391dcc90c0abda3e839e9c57904 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Sat, 10 Jun 2023 16:20:05 +0200
+Subject: [PATCH 2/2] gpasswd(1): Fix password leak
+
+How to trigger this password leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When gpasswd(1) asks for the new password, it asks twice (as is usual
+for confirming the new password).  Each of those 2 password prompts
+uses agetpass() to get the password.  If the second agetpass() fails,
+the first password, which has been copied into the 'static' buffer
+'pass' via STRFCPY(), wasn't being zeroed.
+
+agetpass() is defined in <./libmisc/agetpass.c> (around line 91), and
+can fail for any of the following reasons:
+
+-  malloc(3) or readpassphrase(3) failure.
+
+   These are going to be difficult to trigger.  Maybe getting the system
+   to the limits of memory utilization at that exact point, so that the
+   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
+   About readpassphrase(3), ENFILE and EINTR seem the only plausible
+   ones, and EINTR probably requires privilege or being the same user;
+   but I wouldn't discard ENFILE so easily, if a process starts opening
+   files.
+
+-  The password is longer than PASS_MAX.
+
+   The is plausible with physical access.  However, at that point, a
+   keylogger will be a much simpler attack.
+
+And, the attacker must be able to know when the second password is being
+introduced, which is not going to be easy.
+
+How to read the password after the leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Provoking the leak yourself at the right point by entering a very long
+password is easy, and inspecting the process stack at that point should
+be doable.  Try to find some consistent patterns.
+
+Then, search for those patterns in free memory, right after the victim
+leaks their password.
+
+Once you get the leak, a program should read all the free memory
+searching for patterns that gpasswd(1) leaves nearby the leaked
+password.
+
+On 6/10/23 03:14, Seth Arnold wrote:
+> An attacker process wouldn't be able to use malloc(3) for this task.
+> There's a handful of tools available for userspace to allocate memory:
+>
+> -  brk / sbrk
+> -  mmap MAP_ANONYMOUS
+> -  mmap /dev/zero
+> -  mmap some other file
+> -  shm_open
+> -  shmget
+>
+> Most of these return only pages of zeros to a process.  Using mmap of =
an
+> existing file, you can get some of the contents of the file demand-loa=
ded
+> into the memory space on the first use.
+>
+> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
+> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
+>
+> malloc(3) doesn't zero memory, to our collective frustration, but all =
the
+> garbage in the allocations is from previous allocations in the current
+> process.  It isn't leftover from other processes.
+>
+> The avenues available for reading the memory:
+> -  /dev/mem and /dev/kmem (requires root, not available with Secure Bo=
ot)
+> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
+> -  ptrace (requires ptrace privileges, mediated by YAMA)
+> -  causing memory to be swapped to disk, and then inspecting the swap
+>
+> These all require a certain amount of privileges.
+
+How to fix it?
+~~~~~~~~~~~~~~
+
+memzero(), which internally calls explicit_bzero(3), or whatever
+alternative the system provides with a slightly different name, will
+make sure that the buffer is zeroed in memory, and optimizations are not
+allowed to impede this zeroing.
+
+This is not really 100% effective, since compilers may place copies of
+the string somewhere hidden in the stack.  Those copies won't get zeroed
+by explicit_bzero(3).  However, that's arguably a compiler bug, since
+compilers should make everything possible to avoid optimizing strings
+that are later passed to explicit_bzero(3).  But we all know that
+sometimes it's impossible to have perfect knowledge in the compiler, so
+this is plausible.  Nevertheless, there's nothing we can do against such
+issues, except minimizing the time such passwords are stored in plain
+text.
+
+Security concerns
+~~~~~~~~~~~~~~~~~
+
+We believe this isn't easy to exploit.  Nevertheless, and since the fix
+is trivial, this fix should probably be applied soon, and backported to
+all supported distributions, to prevent someone else having more
+imagination than us to find a way.
+
+Affected versions
+~~~~~~~~~~~~~~~~~
+
+All.  Bug introduced in shadow 19990709.  That's the second commit in
+the git history.
+
+Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, sh=
adow (19990709)")
+Reported-by: Alejandro Colomar <alx@kernel.org>
+Cc: Serge Hallyn <serge@hallyn.com>
+Cc: Iker Pedrosa <ipedrosa@redhat.com>
+Cc: Seth Arnold <seth.arnold@canonical.com>
+Cc: Christian Brauner <christian@brauner.io>
+Cc: Balint Reczey <rbalint@debian.org>
+Cc: Sam James <sam@gentoo.org>
+Cc: David Runge <dvzrv@archlinux.org>
+Cc: Andreas Jaeger <aj@suse.de>
+Cc: <~hallyn/shadow@lists.sr.ht>
+Signed-off-by: Alejandro Colomar <alx@kernel.org>
+
+CVE: CVE-2023-4641
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit=
/65c88a43a23c2391dcc90c0abda3e839e9c57904]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/gpasswd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index c7c9477..00ca569 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
+		strzero (cp);
+		cp =3D getpass (_("Re-enter new password: "));
+		if (NULL =3D=3D cp) {
++			memzero (pass, sizeof pass);
+			exit (1);
+		}
+
+--
+2.40.0
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
index 3c1dd2f98e..57b5002e8b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,8 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/v${PV}/${BP}
            file://useradd \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+	   file://CVE-2023-4641-0001.patch \
+	   file://CVE-2023-4641-0002.patch \
            "
=20
 SRC_URI:append:class-target =3D " \
--=20
2.40.0


