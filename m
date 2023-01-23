Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CC5C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:10:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41900.1674479398995425125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10D3FC14;
	Mon, 23 Jan 2023 05:10:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01053F64C;
	Mon, 23 Jan 2023 05:09:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ppp: backport fix for CVE-2022-4603
Date: Mon, 23 Jan 2023 13:09:55 +0000
Message-Id: <20230123130955.3796096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176303

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch b/meta=
/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
new file mode 100644
index 00000000000..773d6ddfda2
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a75fb7b198eed50d769c80c36629f38346882cbf Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Thu, 4 Aug 2022 12:23:08 +1000
+Subject: [PATCH] pppdump: Avoid out-of-range access to packet buffer
+
+This fixes a potential vulnerability where data is written to spkt.buf
+and rpkt.buf without a check on the array index.  To fix this, we
+check the array index (pkt->cnt) before storing the byte or
+incrementing the count.  This also means we no longer have a potential
+signed integer overflow on the increment of pkt->cnt.
+
+Fortunately, pppdump is not used in the normal process of setting up a
+PPP connection, is not installed setuid-root, and is not invoked
+automatically in any scenario that I am aware of.
+
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+---
+ pppdump/pppdump.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index 2b815fc9..b85a8627 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -297,6 +297,10 @@ dumpppp(f)
+ 			    printf("%s aborted packet:\n     ", dir);
+ 			    q =3D "    ";
+ 			}
++			if (pkt->cnt >=3D sizeof(pkt->buf)) {
++			    printf("%s over-long packet truncated:\n     ", dir);
++			    q =3D "    ";
++			}
+ 			nb =3D pkt->cnt;
+ 			p =3D pkt->buf;
+ 			pkt->cnt =3D 0;
+@@ -400,7 +404,8 @@ dumpppp(f)
+ 			c ^=3D 0x20;
+ 			pkt->esc =3D 0;
+ 		    }
+-		    pkt->buf[pkt->cnt++] =3D c;
++		    if (pkt->cnt < sizeof(pkt->buf))
++			pkt->buf[pkt->cnt++] =3D c;
+ 		    break;
+ 		}
+ 	    }
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.4.9.bb
index 700ece61dce..7e3ae43b58e 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${BP=
}.tar.gz \
            file://provider \
            file://ppp@.service \
            file://0001-ppp-fix-build-against-5.15-headers.patch \
+           file://CVE-2022-4603.patch \
            "
=20
 SRC_URI[sha256sum] =3D "f938b35eccde533ea800b15a7445b2f1137da7f88e32a168=
98d02dee8adc058d"
--=20
2.34.1


