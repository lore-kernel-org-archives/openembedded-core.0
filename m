Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45E3D65D59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 09:06:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U96tqe014468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:06:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 02:06:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Oct 2014 17:08:31 +0800
Message-ID: <33a3b945ec946aa6f0fba68afe7242c3cf8c0fc9.1414659743.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414659743.git.Qi.Chen@windriver.com>
References: <cover.1414659743.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpam: add system-auth in case of systemd
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
X-List-Received-Date: Thu, 30 Oct 2014 09:06:59 -0000
Content-Type: text/plain

systemd needs this file to be there because one of its configuration file
in pam.d, systemd-user, requires it. Otherwise, we would have errors like
below.

    systemd: PAM _pam_load_conf_file: unable to open /etc/pam.d/system-auth

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/pam/libpam/pam.d/system-auth | 12 ++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/pam.d/system-auth

diff --git a/meta/recipes-extended/pam/libpam/pam.d/system-auth b/meta/recipes-extended/pam/libpam/pam.d/system-auth
new file mode 100644
index 0000000..ffb08ab
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam.d/system-auth
@@ -0,0 +1,12 @@
+# This file comes from systemd.
+
+auth     sufficient pam_unix.so nullok try_first_pass
+
+account  required   pam_nologin.so
+account  sufficient pam_unix.so
+
+password sufficient pam_unix.so nullok sha512 shadow try_first_pass try_authtok
+
+-session optional   pam_loginuid.so
+-session optional   pam_systemd.so
+session  sufficient pam_unix.so
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index a84e51e..0910b6f 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam.d/common-session \
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://pam.d/system-auth', '', d)} \
            file://libpam-xtests.patch \
            file://destdirfix.patch \
            file://fixsepbuild.patch \
-- 
1.9.1


