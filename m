Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id C78D679403
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:20 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q11-v6so3107410oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=wd93GyMp9MtnDhgb/eFpkIQIXdTMOjKA8qud/NClFiXKq1bCfqm0L0rOLtCoG1RzpJ
	8wgH5jOffbMcKZykzVYqMvfpdfCQFfdlXMeyvN49bHKSAJKny1hP+fvSd7w5KTfZ3DwS
	Ux6RUghlbtaC0+SvmxklJ6gF3hMBbafFlOOwc0A9ajkE6k2R8JHm9eBeByVq2IBH7Joy
	Elc0jCYb3ImuUO1jKqdNlax1BsCSLnF8MEDo5SozWI4TZATQ77IWmhK9oEGYe7dEE/zE
	ePebMSgUmEA534szB5WMF4VEm0pmRnez4Zyp2O1T3VvQ81yk3d1SbioZ1g3tgIhC9ALc
	l0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=STLrWFgmncilxufD/SjDJG4yvJq+juLbd9UHzeibStX8GASac+/bACsrJEF2026X2y
	D/lpgKYNyw/lMRJb9NDIO1qcKtSMgWJ70TzucdpsmGl8PP9Qeflo11Vb5Yl2oaksH46x
	48HjzBvRInPN7rt/h3xmkWq9gQFGoEN5tJgtqv8X2VNluV+ienV9qJMYAtEGJfVMjV3I
	RJtIG7VtvO6mJ1IDfCIdhk1QusVPNCStAknolHdDd0Oa9DPHDzdedCaFj95UIP8hTF2O
	+Ub3L0mFOfshr8P22+xTi0u6gtXmviejyhryjKDqoV1gNPHS7Ukhmx0bK7y0m88NeqpZ
	aCeg==
X-Gm-Message-State: APzg51D1u4P6/3dfywJ7S87Vt7ixCTl+HeHDLj5xpN5Vr5yt1FUgPCEX
	5i2yf0Ipwh5nmfJJ8ZiKGhFQZFR1ddw=
X-Google-Smtp-Source: ANB0VdYdlfNKyiBabdiHVa9YLFaA/q9CosCpwj0hZSFkfuCLjUsGtLBWinrQs0kByAzbo1IoNT9Hmw==
X-Received: by 2002:aca:de08:: with SMTP id
	v8-v6mr4272254oig.124.1534944981621; 
	Wed, 22 Aug 2018 06:36:21 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:21 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:14 +0530
Message-Id: <1534944940-21566-8-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 08/34] util-linux: CVE-2018-7738
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:21 -0000

bash-completion: (umount) use findmnt, escape a space in paths

 # mount /dev/sdc1 /mnt/test/foo\ bar
 # umount <tab>

has to return "/mnt/test/foo\ bar".

Changes:

 * don't use mount | awk output, we have findmnt
 * force compgen use \n as entries separator

Affects util-linux < 2.32-rc1

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../util-linux/util-linux/CVE-2018-7738.patch      | 49 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.30.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch b/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch
new file mode 100644
index 0000000..7322b9c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch
@@ -0,0 +1,49 @@
+From 75f03badd7ed9f1dd951863d75e756883d3acc55 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 16 Nov 2017 16:27:32 +0100
+Subject: [PATCH] bash-completion: (umount) use findmnt, escape a space in
+ paths
+
+ # mount /dev/sdc1 /mnt/test/foo\ bar
+ # umount <tab>
+
+has to return "/mnt/test/foo\ bar".
+
+Changes:
+
+ * don't use mount | awk output, we have findmnt
+ * force compgen use \n as entries separator
+
+Addresses: https://github.com/karelzak/util-linux/issues/539
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2018-7738
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/75f03badd7ed9f1dd951863d75e756883d3acc55]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ bash-completion/umount | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/bash-completion/umount b/bash-completion/umount
+index d76cb9fff..98c90d61a 100644
+--- a/bash-completion/umount
++++ b/bash-completion/umount
+@@ -40,9 +40,10 @@ _umount_module()
+ 			return 0
+ 			;;
+ 	esac
+-	local DEVS_MPOINTS
+-	DEVS_MPOINTS="$(mount | awk '{print $1, $3}')"
+-	COMPREPLY=( $(compgen -W "$DEVS_MPOINTS" -- $cur) )
+-	return 0
++
++	local oldifs=$IFS
++	IFS=$'\n'
++	COMPREPLY=( $( compgen -W '$(findmnt -lno TARGET | sed "s/\([[:blank:]]\)/\\\\\1/g")' -- "$cur" ) )
++	IFS=$oldifs
+ }
+ complete -F _umount_module umount
+-- 
+2.13.3
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.30.bb b/meta/recipes-core/util-linux/util-linux_2.30.bb
index 6b309b5..a6d23d8 100644
--- a/meta/recipes-core/util-linux/util-linux_2.30.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.30.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://CVE-2018-7738.patch \
 "
 SRC_URI[md5sum] = "eaa3429150268027908a1b8ae6ee9a62"
 SRC_URI[sha256sum] = "c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d"
-- 
2.7.4


