Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 233AC75D4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 20:12:58 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9UKCwUv022784 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:12:58 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015103015125856-1144291 ;
	Fri, 30 Oct 2015 15:12:58 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2015 15:12:56 -0500
Message-Id: <1446235976-7118-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/30/2015 03:12:58 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/30/2015 03:12:58 PM,
	Serialize complete at 10/30/2015 03:12:58 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-30_14:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [Fido] [PATCH] openssh: Backport CVE-2015-5600 fix
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
X-List-Received-Date: Fri, 30 Oct 2015 20:12:59 -0000

only query each keyboard-interactive device once per
authentication request regardless of how many times it is listed

Source:
http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c?f=h#rev1.43
http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c.diff?r2=1.43&r1=1.42&f=u

Bug report:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5600
https://bugzilla.redhat.com/show_bug.cgi?id=1245969

Testing:
Built in Fido and installed to x86_64 test system.
Verified both 'keyboard-interactive' and 'publickey' logon works with
root and a regular user from an openssh 7.1p1-1 client on Arch.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
Reviewed-by: Ken Sharp <ken.sharp@ni.com>
Natinst-ReviewBoard-ID: 115602
Natinst-CAR-ID: 541263

---

This patch only applies to Fido and earlier releases. Bug is already
fixed in Jethro which builds OpenSSH 7.1.
---
 .../openssh/openssh/CVE-2015-5600.patch            | 50 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
new file mode 100644
index 0000000..fa1c85e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-5600.patch
@@ -0,0 +1,50 @@
+From b47bdee5621f95387c9ac5b999fd859ccb1213a9 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sat, 18 Jul 2015 07:57:14 +0000
+Subject: [PATCH] CVE-2015-5600
+
+only query each keyboard-interactive device once per
+ authentication request regardless of how many times it is listed; ok markus@
+
+Source:
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c?f=h#rev1.43
+http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/auth2-chall.c.diff?r2=1.43&r1=1.42&f=u
+
+Upstream-Status: Backport
+---
+ auth2-chall.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/auth2-chall.c b/auth2-chall.c
+index ea4eb6952f8c13928c3fc595007f2d844dde422f..065361d3ec22f4f131308d1b4497afada3c3cb78 100644
+--- a/auth2-chall.c
++++ b/auth2-chall.c
+@@ -83,6 +83,7 @@ struct KbdintAuthctxt
+ 	void *ctxt;
+ 	KbdintDevice *device;
+ 	u_int nreq;
++	u_int devices_done;
+ };
+ 
+ #ifdef USE_PAM
+@@ -169,11 +170,15 @@ kbdint_next_device(Authctxt *authctxt, KbdintAuthctxt *kbdintctxt)
+ 		if (len == 0)
+ 			break;
+ 		for (i = 0; devices[i]; i++) {
+-			if (!auth2_method_allowed(authctxt,
++			if ((kbdintctxt->devices_done & (1 << i)) != 0 ||
++			    !auth2_method_allowed(authctxt,
+ 			    "keyboard-interactive", devices[i]->name))
+ 				continue;
+-			if (strncmp(kbdintctxt->devices, devices[i]->name, len) == 0)
++			if (strncmp(kbdintctxt->devices, devices[i]->name,
++			    len) == 0) {
+ 				kbdintctxt->device = devices[i];
++				kbdintctxt->devices_done |= 1 << i;
++			}
+ 		}
+ 		t = kbdintctxt->devices;
+ 		kbdintctxt->devices = t[len] ? xstrdup(t+len+1) : NULL;
+-- 
+2.6.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
index aa71cc1..9246284 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://CVE-2015-6563.patch  \
            file://CVE-2015-6564.patch \
            file://CVE-2015-6565.patch \
+           file://CVE-2015-5600.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.6.2


