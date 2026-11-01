Received: from cetc.com.cn (cetc.com.cn [220.181.39.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9764.1793506197453266818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 21:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cetc.com.cn, ip: 220.181.39.39, mailfrom: chenqi_hycx@cetc.com.cn)
Received: from mail.cetc.com.cn (unknown [123.125.172.206])
	by mtasvr (Coremail) with SMTP id _____wC3EtYgu+ZqYMwAAA--.4292S3;
	Sun, 01 Nov 2026 12:08:01 +0800 (CST)
Received: from chenqi-Redmi.. (unknown [123.125.172.206])
	by front01 (Coremail) with SMTP id C6CowAB3umrMuuZqX7EpAA--.34446S2;
	Sun, 01 Nov 2026 12:06:36 +0800 (CST)
From: chenqi_hycx@cetc.com.cn
To: openembedded-core@lists.openembedded.org
Cc: chen_q07@163.com
Subject: [PATCH] sudo: fix build with OpenSSL 4
Date: Sun,  1 Nov 2026 12:09:43 +0800
Message-ID: <20261101040943.2246656-1-chenqi_hycx@cetc.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C6CowAB3umrMuuZqX7EpAA--.34446S2
X-CM-SenderInfo: xfkh015lbk5un06fv33fof0zgofq/1tbiAQYSCmrl8FEDbQAAsf
X-CM-DELIVERINFO: =?B?M4jzyqc9tbm9bwt5VqgwP2Pu2dSP9LtrOQxHOAXUJl/eWtrOBydmTZkAAV6p44o2Ir
	PoODccrEFRh21h5V2HAX9q96cYNC3vgRQDqJHs6jTrAindA6rZnxb/mtKC0dK3HDdnSr3B
	VgFTWeiv015JOtHPoqIB0aunWXhd4kKpajwBogfNjKf64K14BCE+JKubJryMjA==
X-Coremail-Antispam: 1Uk129KBj93XoWxGw1DtF15JrW8Xr4DGr15trc_yoW5KF18pF
	4rGa4Ygrs7Ga17Ga9rC3WjqF15uF1xua4UJrWSg3y29rZ8Za45WrWrKr4jgayagr1rtw40
	qFsYq3s8Kw4UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3gc02F40EFcxC0VAKzVAqx4xG6I80ewCY02Avz4vE14v_GrDv73VFW2AG
	mfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYT7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2
	IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l
	84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwAKzVCY07xG64k0F24lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxUcYhFDUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 04:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249148
Content-Type: text/plain; charset="utf-8"

From: Chen Qi <chenqi_hycx@cetc.com.cn>

OpenSSL 4 made ASN1_STRING opaque, so hostcheck.c no longer builds when
it reads ->length directly.

hostcheck.c is only compiled when OpenSSL is found by configure, and
without selinux in DISTRO_FEATURES that never happens for sudo: it only
pulls in OpenSSL indirectly through

  audit -> python3 -> openssl

which selinux pulls into the sysroot. Disabling selinux removes that
chain, HAVE_OPENSSL stays undefined, the whole file is #if'd out, and the
error goes unnoticed.

Use ASN1_STRING_length() instead of accessing the length member. This is
the upstream fix, not yet part of any release.

Assisted-by: Codewhale:deepseek-v4-flash
Signed-off-by: Chen Qi <chenqi_hycx@cetc.com.cn>
---
 ...-use-accessor-for-ASN1_STRING-length.patch | 37 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch

diff --git a/meta/recipes-extended/sudo/files/0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch b/meta/recipes-extended/sudo/files/0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch
new file mode 100644
index 0000000000..5fd98acae0
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch
@@ -0,0 +1,37 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpenSSL 4 makes ASN1_STRING opaque, so hostcheck.c can no longer read
+->length directly. Use the ASN1_STRING_length() accessor instead.
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e]
+Signed-off-by: Chen Qi <chenqi_hycx@cetc.com.cn>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if (ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 489c0db09d..2b01684ee5 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -5,6 +5,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
 		   file://CVE-2026-35535.patch \
+		   file://0001-lib-iolog-use-accessor-for-ASN1_STRING-length.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.43.0

