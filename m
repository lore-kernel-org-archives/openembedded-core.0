Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 455C865D68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:08:40 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i8so1447537qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 12:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cpNAtKFji+HgLufMfOOrkAbxkIcL77yfpMf4lMUnFEU=;
	b=s5sSBSTcYMBEGGlFKt1AYhHo5Is2v9WQ7RA2YP/MQkr2ki22dxS4anqGf+6GhbjWT/
	rkJmzQrv8SP16J2y+eMt3Q4zxokQl5q0fJAu9tIkr5hv78dWe1pFuAg5sIEzcGPGbruc
	iRAau7ERneNKXHw845Zt5T8kvS87KYn+1FTvaXRe566KdYSyB9B8arCJrU97gaF3uln9
	NN0df0EdMWhk97sGACS0tl4LDCwOQDn08u6L34p4yMY0lg0k+lqjBx4+kNQ/phUbkvD8
	waA3up5hUcRfxjsMo02PTZAtPeGm48SufoH2aiycJ9Jkm2yaENwjasPCYPbQLD3N8pA/
	IGrw==
MIME-Version: 1.0
X-Received: by 10.224.51.5 with SMTP id b5mr51733488qag.42.1398280120922; Wed,
	23 Apr 2014 12:08:40 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Wed, 23 Apr 2014 12:08:40 -0700 (PDT)
In-Reply-To: <CACS+7ZQ2J9JDPHJWo+HA7XDU33OjGmSdzsRmGNMaRDnLTGACeQ@mail.gmail.com>
References: <CACS+7ZQ2J9JDPHJWo+HA7XDU33OjGmSdzsRmGNMaRDnLTGACeQ@mail.gmail.com>
Date: Wed, 23 Apr 2014 13:08:40 -0600
Message-ID: <CACS+7ZQ0=-3Mi9Nc1w12ZAcCdr9cAubXe1xDDRA8tfE2fBR=eA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemd: fix systemd-user pam configuration
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
X-List-Received-Date: Wed, 23 Apr 2014 19:08:41 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Use common-auth and common-session files instead of system-auth.
system-auth is a convention that oe-core doesn't follow. This
fixes an issue where the systemd user session manager fails to
start.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../systemd/systemd-pam-fix-systemd-user.patch     | 37 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644
meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
b/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
new file mode 100644
index 0000000..9aa024b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
@@ -0,0 +1,37 @@
+From a46c9c81f7b03037338cdeed5f491f16e0252328 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Thu, 13 Mar 2014 10:16:27 -0600
+Subject: [PATCH] Use common-auth and common-session for logind
+
+Use common-auth and common-session files in systemd-user's pam
+configuration instead of system-auth.  system-auth is used in
+RedHat, Fedora, Arch, and others. OpenEmbedded, Debian, and OpenSUSE
+use common-auth, common-session, and common-account.
+
+Upstream tracks the system-auth method because it seems to be more
+popular and is easier for them.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+---
+ src/login/systemd-user | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/login/systemd-user b/src/login/systemd-user
+index 7b57dbf..c0fc793 100644
+--- a/src/login/systemd-user
++++ b/src/login/systemd-user
+@@ -2,7 +2,7 @@
+
+ # Used by systemd when launching systemd user instances.
+
+-account include system-auth
+-session include system-auth
++account include common-account
++session include common-session
+ auth required pam_deny.so
+ password required pam_deny.so
+--
+1.9.0
+
diff --git a/meta/recipes-core/systemd/systemd_211.bb
b/meta/recipes-core/systemd/systemd_211.bb
index 44b1965..df632ab 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -27,6 +27,7 @@ SRC_URI =
"git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://systemd-pam-fix-execvpe.patch \
            file://systemd-pam-fix-fallocate.patch \
            file://systemd-pam-fix-mkostemp.patch \
+           file://systemd-pam-fix-systemd-user.patch \
            file://optional_secure_getenv.patch \
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
-- 
1.9.0

