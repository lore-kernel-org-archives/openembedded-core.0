Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 75CD072491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 20:15:44 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so116233115wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 13:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6MNyW4DCZhe9274YUYE1gjQtwhQnPPr51iL9dce2LLQ=;
	b=GnQUoGGRKQijgFEaXNF9JWGFt8tLoQxggdnFLpMvS5YqQILZozQtoNf4xg64GZ7lPo
	LsR/jWbOfw8brClMFFyJyQgeVq7UWQVsBU5tEnjChaBrf+0oHjD6i6nEFqH64blLoBg/
	gwSseEhpx8jYg9wQGdvjWsBAzNN0lgTCOeGsimH7PoJZuEzRKW9vA/s32NPWXjW1g6Eq
	f0mV0xFiV5uOk4JLAhtgqaeg4RA1QKd6mZD8SgoOUEsTiN3/hgQDtgTR/g3XdcqQ8bRk
	dbhUwNRqMHxI49e7iMDO8kzt4CkHARPvSK+Swa2VR+AkBoJGQevqYjpvvX36ussezYHx
	APfA==
X-Gm-Message-State: ALoCoQmTBAwes66AbmWI0I/PY8yp5qyNV7M1I8EpauZETVTD+nnmo559C9ZAKVoDf6w5MqwkYjcS
X-Received: by 10.180.78.65 with SMTP id z1mr33058480wiw.14.1430252145065;
	Tue, 28 Apr 2015 13:15:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id o6sm17974271wiz.24.2015.04.28.13.15.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Apr 2015 13:15:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 21:12:02 +0100
Message-Id: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 20:15:49 -0000

This patch appears to have been accidently dropped in the move to 219-stable,
probably because it didn't apply.  Update the patch and re-add it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/0010-Make-root-s-home-directory-configurable.patch | 3 ++-
 meta/recipes-core/systemd/systemd_219.bb                               | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
index 41b9039..b65fe42 100644
--- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
@@ -26,10 +26,11 @@ diff --git a/Makefile.am b/Makefile.am
 index 0fb3f9f..4623963 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
+@@ -199,7 +199,8 @@ AM_CPPFLAGS = \
  	-DKEXEC=\"$(KEXEC)\" \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
+ 	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
 +	-DROOTHOMEDIR=\"$(roothomedir)\" \
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index d1303f7..c196017 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stab
            file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
            file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
+           file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
            file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
-- 
2.1.4


