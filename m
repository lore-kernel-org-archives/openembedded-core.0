Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 701F2610CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 15:01:24 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so1069785qcy.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZdXEif7LY7lZ1maXreJxSKaDbMUzsC1l019KEnsI6JA=;
	b=cFVfTEA+1hg/A9K8Wk+S8dBs8gk2IqYN10dyVTue0E4R0Nc1h0pi+UVsWfFsVZxVHU
	eC1VgEVgtdoEvvRIfjmBR3QC6FWBHTzomax1Mcgvjzd1Jyg1WVaJjv9teInVVtRMdYJx
	Mg7VWDC6ywIgLnOsf/8bvcP4j4/TZ9NNAfKMoaxZTzVSZkkuVc7Mkgh9rS/jJtYNLyqH
	S/6mn//5Xb0kLSuyyI/dt/xYLHdzXvKlflGL9/uBTh9Ub/PqCLaBej97DucR9TasY0X4
	9Igsr5F5I3Ne0UWhszsThilNiMYFByITMcvD3lF1UKpg3rxewciqu9kLMBkkRY3dnffH
	JneQ==
MIME-Version: 1.0
X-Received: by 10.224.56.5 with SMTP id w5mr56800986qag.60.1398265284984; Wed,
	23 Apr 2014 08:01:24 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Wed, 23 Apr 2014 08:01:24 -0700 (PDT)
Date: Wed, 23 Apr 2014 09:01:24 -0600
Message-ID: <CACS+7ZQ2J9JDPHJWo+HA7XDU33OjGmSdzsRmGNMaRDnLTGACeQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd: fix systemd-user pam configuration
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
X-List-Received-Date: Wed, 23 Apr 2014 15:01:28 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Use common-auth and common-session files instead of system-auth.
system-auth is a Fedora-ism that oe-core doesn't have. This fixes
an issue where the systemd user session manager fails to start.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../systemd/systemd/systemd-pam-fix-systemd-user.patch     | 14 ++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb                   |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644
meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
b/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
new file mode 100644
index 0000000..58614e8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-systemd-user.patch
@@ -0,0 +1,14 @@
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

