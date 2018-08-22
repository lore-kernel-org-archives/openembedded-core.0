Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6EC792ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:37 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id y207-v6so2439130oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=kOg+pEHgjZPp+7RtafbUyGpWAOgHMXpSLp99xi+RIbqBVKmsRtKCe7JzT11BuJlm8E
	5Vb7r1Y7iwyuD3Ahv8oFbQ7iBEg9Z0Q11fhXbx0sIUT9NFXo5PlOnRyrqqGrQ9x2MTYt
	miY0WkdbqSOIoEJ0P3iekq8etygzJma32O2Z75misqKLbaKU+dUEzZVjhTqU2lvJr8wj
	00kwIb95zQ/WVqOeVhF6YKZvqLeC3L015r8HJR6MYr94hwL8pivl+glPZeKdumrds1Cf
	d2ZvAExjdLrVKYQwVaYpkzYjO7j67Iz+fnFTfUJ+T8fkl3M4fJW67S0TnLTq7QMk76X4
	ADuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=FTV6t+fJhuyblwgqR/rYxc4fFeXfgVWrWYU3ssouzh5FRv8r9elRnXLs7jVXczRaXU
	rE+5w9at1o4no/+5UCT37zXIOjdeRCrELmX9bgSs9mEDNje66gt9A+/xuobSmTrl4Mpg
	b+toD3f7Wmo0SocsPR98W627bBXaW/XYzC+R7nolG9orAfW+f74bXcD6Bdov0Ur8nPq3
	ZlzxJ2AUJcJFadt0Hve+oFe+1/q7qD3IMScxk7RsM6M1z7C/2ElhjdmkWyUqGyCO1q2n
	s1J2cRJe7MjHGg2h+d12k9CPP2iyfSSBzYozUyOX1UPA/GUZYtSHH8FXPkkta71Xul1G
	jPKg==
X-Gm-Message-State: APzg51AcK8Rk118qDjzzg7OofZyo9N+Cqfo6Ph/YugPtmbajz6yWvA2d
	frNcjzW9/LF6ZcYmCKSP1WUmg1rQcWM=
X-Google-Smtp-Source: ANB0Vda4WfINHTE50AwH4RN2mvkRtjOB0byCBptKYG9Z2TulgQb+lTttG4ljNNLevqRauRHm4EB7WQ==
X-Received: by 2002:aca:f244:: with SMTP id
	q65-v6mr3596546oih.268.1534936718378; 
	Wed, 22 Aug 2018 04:18:38 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:38 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:46 +0530
Message-Id: <1534936692-11736-8-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 08/34] util-linux: CVE-2018-7738
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:38 -0000

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


