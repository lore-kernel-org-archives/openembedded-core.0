Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id C492471A05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 18:58:58 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 190so2527671itm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Dc+L1ilLW1DTkkM9+3ttahq61LA/Em4q7vqPT7yB1SY=;
	b=MZROqe9R7XhR5KhIHT2mmv9t7rUnqUW8Pgy0LsJsSMu+8cJVv5TVpE53wCQSHTYSuG
	29aTLBD/EGC9X+QZUp3xhiN3t2YphhInjtc7bwMuK02Ok6rVIj4+RHHa0d9WGyuhRmdK
	Y+yZ2jkheBLAr4tz05tNQDwJC+isma+en+GLmMOomkx5J84QDGZTIyPQZk7qCq0NrMZJ
	kpoQXQ/fL55ULfIhfTgc/4D7gPB88/FDaImXeeXhAr7quVG2qNVQ9x69nKRK6FTItQ+u
	iItlyvXbpACqHpSDg87U8v2AuAO/ebFDu0b2YcHx0n7Nrpm8rgQ4FL6gm92m+zPyDmeS
	1hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Dc+L1ilLW1DTkkM9+3ttahq61LA/Em4q7vqPT7yB1SY=;
	b=tFsgcUyBoP+nH/r0bBmlAIdVykFNgzIT3jxPy6owszxT3nCiPRIG467YcbCfx3svoU
	lSQdaPebXdC7+1XmsFDLq8zP6k10rmqNCGzmi60/PNdim1DSe4kSvNlNkDhfnuCeUjy1
	LRHH1c5XFGAfcCyHFlQ1eMsA68kzxzbpZqle10rO6Q6pI7wgkUW9Kir4fe/pE5u4d9oJ
	UuJBFr+Uw8uV7yj48RBhtN70yvSEAtQ8D9CBZwjJQxrGwT1S0gQGZGVzTQ2kPLOXOUf8
	mWClAc7LAyhxLvcWtWtztA7WwQiygGvJynaujIjxGIQ4ZIUbwChQ+0f94f2RPaZKl+b0
	Dpzg==
X-Gm-Message-State: AFeK/H28B+XZvTpDAAPVRivlN8HmkbrpbfEg8d7mBOZ7hAWOdb8biO/iBqc3PWZUNAi8Vg==
X-Received: by 10.36.153.134 with SMTP id a128mr4429976ite.90.1490122739297;
	Tue, 21 Mar 2017 11:58:59 -0700 (PDT)
Received: from linux-uys3.suse (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b132sm10373604iob.6.2017.03.21.11.58.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 11:58:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 14:58:48 -0400
Message-Id: <20170321185848.18733-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Tue, 21 Mar 2017 18:58:59 -0000

This commit effectively reverts 56fe5300ab5 (except doing a revert at this
point is not clean).

The Linux kernel contains a configuration option called CONFIG_LOCALVERSION
which, if enabled, will change the boot log and "uname -a" from, for example,
"4.10.2-yocto-standard" to "4.10.2-yocto-standard-00368-g827a1164b155".

According to the log message for 56fe5300ab5, the Linux kernel's
scripts/setlocalversion script was leaving or appending a '+' to the end of
directory names (e.g. /lib/modules/2.6.37+). This conversation can be seen at:

	http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html

The solution was to touch an empty .scmversion file, which causes the kernel's
CONFIG_LOCAVERSION logic to be entirely circumvented. This seems like a very
big hammer to use in order to fix a trailing '+'. If users were enabling this
kernel option, it wasn't having any effect. Also, by default,
CONFIG_LOCALVERSION is disabled in linux-yocto kernels.

Commit 56fe5300ab5 was many years ago, and my current testing with
CONFIG_LOCALVERSION enabled and 56fe5300ab5 reverted doesn't appear to cause
trailing '+' characters to be appended to filenames in /lib/modules anymore.
It appears as though the problem has been fixed somewhere else along the way.
In which case, enable this functionality so setting this kernel option gives
users the expected result.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/kernel.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1e0646a437..c44978808b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,12 +451,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
 do_configure[prefuncs] += "check_oldest_kernel"
 
 kernel_do_configure() {
-	# fixes extra + in /lib/modules/2.6.37+
-	# $ scripts/setlocalversion . => +
-	# $ make kernelversion => 2.6.37
-	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
-
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
 	fi
-- 
2.12.0.rc1.48.g076c053


