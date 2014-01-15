Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id E277D6DA89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 14:11:03 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id g10so4157087wiw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 06:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ylvJ7j0xn3UQKqomoWc4Eq67wKlNOeP3FOEknmyMqtY=;
	b=Ad/+5FnTy+bymUqPc7QLlaqtIVJ+SY0NeF7k7d56K/gjHftngo/bXpSowCfZL1ZzkG
	oQb4VMgECOIojipw1D8wKqU75QCJLHNEL/hY9GltNZ3d7Akj2etqREyhFnPb8g5GahZg
	zEsOBgDZbs40mPMxTslzXWi0yPPx8IGVS2I5Sm/Bk0GFd6m2cuLSCj+th+kOSJnd+jJY
	Hk9dtrcPl+Ve7dE9BQVF6HfQ/exDEByKYi64INz2jFf5IDLniVY328DyEJkeL1iHeCDq
	pw1xdCjb21NjYawvX7cHHKXPlsXA/XqWgsKR/9L7XqYeTHP/4sY783J1dNMBQ6IRVNk1
	bmFg==
X-Gm-Message-State: ALoCoQmKeCxj1JExZym9OMJaaOzaSnW4W6oJelLloDHCyq9BQ5MQK+Vd8nyTjQjhXl05UhypXxiJ
X-Received: by 10.195.13.234 with SMTP id fb10mr2656389wjd.50.1389795058205;
	Wed, 15 Jan 2014 06:10:58 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e5sm3377987wja.15.2014.01.15.06.10.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 06:10:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 14:10:54 +0000
Message-Id: <1389795054-16993-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ltp: fix makefile race
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
X-List-Received-Date: Wed, 15 Jan 2014 14:11:05 -0000

There is a Makefile dependency race causing occasional build failures:

*** No rule to make target `.../work/core2-poky-linux/ltp/20130904-r0/git/testcases/kernel/include/linux_syscall_numbers.h.23161.sh', needed by `linux_syscall_numbers.h'.  Stop.

This is due to a bad dependency wildcard that is matching more than the one file
it should match, so replace it with a concrete filename.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/ltp/ltp/regen-makefile.patch |   22 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb          |    1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/regen-makefile.patch

diff --git a/meta/recipes-extended/ltp/ltp/regen-makefile.patch b/meta/recipes-extended/ltp/ltp/regen-makefile.patch
new file mode 100644
index 0000000..3e114a1
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/regen-makefile.patch
@@ -0,0 +1,22 @@
+Fix the dependencies for linux_syscall_numbers.h where in a parallel build it was
+finding the temporary file linux_syscall_numbers.h.[pid].sh (where sh is an
+architecture name).  Instead don't wildcard *.sh as the only .sh we care about
+here is regen.sh, so hard-code that.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/testcases/kernel/include/Makefile b/testcases/kernel/include/Makefile
+index db21a2a..585eb5e 100644
+--- a/testcases/kernel/include/Makefile
++++ b/testcases/kernel/include/Makefile
+@@ -28,7 +28,7 @@ INSTALL_DIR		:= $(includedir)
+ 
+ MAKE_TARGETS		:= linux_syscall_numbers.h
+ 
+-linux_syscall_numbers.h: $(wildcard $(abs_srcdir)/*.sh $(abs_srcdir)/*.in)
+-	$(SHELL) "$(abs_srcdir)/regen.sh"
++linux_syscall_numbers.h: $(abs_srcdir)/regen.sh $(wildcard $(abs_srcdir)/*.in)
++	$(SHELL) "$<"
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index 4722a38..c346c5c 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -23,6 +23,7 @@ DEPENDS = "attr libaio libcap acl openssl"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
+           file://regen-makefile.patch \
 "
 
 SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
-- 
1.7.10.4


