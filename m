Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7326FA57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 01:40:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s531eSuM010283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jun 2014 18:40:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 2 Jun 2014 18:40:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jun 2014 09:41:18 +0800
Message-ID: <cover.1401419076.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrades
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
X-List-Received-Date: Tue, 03 Jun 2014 01:40:30 -0000
Content-Type: text/plain

This patchset upgrades three packages, gawk, grep and shadow.

There's a remaining problem here.
After upgrading the shadow package, the 'pwconv' and 'grpconv' commands cannot
run successfully in pkg_postinst.
I tried to run them in the devshell environment, they succeeded.
I digged into the codes but still had no idea.
Hope somebody could help me out here.

Best Regards,
Chen Qi

The following changes since commit 3fa9508521d27e17bfe1a0aeb15d7fc2377218cd:

  Update tzcode to 2014c (2014-05-29 10:32:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades

Chen Qi (3):
  gawk: upgrade from 4.0.2 to 4.1.1
  grep: upgrade 2.18 to 2.19
  shadow: upgrade from 4.1.4.3 to 4.2.1

 .../gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest      |    0
 .../gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb}          |    6 +-
 .../grep/{grep_2.18.bb => grep_2.19.bb}            |    4 +-
 .../shadow/files/add_root_cmd_groupmems.patch      |   75 --
 .../shadow/files/add_root_cmd_options.patch        | 1384 --------------------
 .../allow-for-setting-password-in-clear-text.patch |  215 ++-
 ...fix-unexpected-open-failure-in-chroot-env.patch |   46 +
 .../shadow/files/fix-etc-gshadow-reading.patch     |   36 -
 ...installation-failure-with-subids-disabled.patch |   28 +
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |   31 -
 .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |   36 -
 .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |   31 -
 .../shadow/files/shadow.automake-1.11.patch        |  106 --
 .../files/shadow_fix_for_automake-1.12.patch       |   23 -
 .../files/slackware_fix_for_glib-2.17_crypt.patch  |   63 -
 meta/recipes-extended/shadow/files/useradd.patch   |   17 -
 ...-compilation-failure-with-subids-disabled.patch |   33 +
 ...uretty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} |    0
 ...-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} |    0
 meta/recipes-extended/shadow/shadow.inc            |   33 +-
 .../shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb}  |    0
 21 files changed, 227 insertions(+), 1940 deletions(-)
 rename meta/recipes-extended/gawk/{gawk-4.0.2 => gawk-4.1.1}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.0.2.bb => gawk_4.1.1.bb} (84%)
 rename meta/recipes-extended/grep/{grep_2.18.bb => grep_2.19.bb} (86%)
 delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
 delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
 create mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
 delete mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
 create mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
 delete mode 100644 meta/recipes-extended/shadow/files/useradd.patch
 create mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
 rename meta/recipes-extended/shadow/{shadow-securetty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb} (100%)

-- 
1.7.9.5


