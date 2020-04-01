Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
 by mx.groups.io with SMTP id smtpd.web12.5663.1585770094536791588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 12:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Bq6NxHPj;
 spf=pass (domain: flex--paulburton.bounces.google.com, ip: 209.85.214.201, mailfrom: 3be6exgokafgf0kb1khjed6ee6b4.2ec@flex--paulburton.bounces.google.com)
Received: by mail-pl1-f201.google.com with SMTP id z9so612994pln.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Sw9G1vuvesGW8pdVs6wCQCDvRcG1cRLG2oo80BUCirw=;
        b=Bq6NxHPj+m96h7wj+bZnHGq48ed4Yf1UdhoNcP1cagN0O93dl/vNpPjnavad8tkIL2
         MKmOu/9NfTBB5XTUVjWPW4SjrF7B6wIGuwyMR1Yw1kUaOhF6EFuJs0CPGDSYzpBi5kbh
         Y2N1eBzyUsslD4tHmDw3BC36jqzSvkcbrnA3wz+Mv0ymj5G5qlrawPFVeOtbw9zZFhQJ
         FtFF5sw9/VFY9LxzmwBzGWuoUaX+VMVWIm95ti1sZRkPX5smgxvei4yB4ndvRB/rAee3
         lztTk+TEvvWJuezEFx11BeE3laC/HI73FwjIKqhtRgfWAOgRWFhnaxrnzXKZZPUX52ip
         1VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Sw9G1vuvesGW8pdVs6wCQCDvRcG1cRLG2oo80BUCirw=;
        b=Dkyuu9FBbV2tZU6bmTdih9TRgGpx2jxn3AWyCuGQnKZXjzd7vy/8aKFOYz6Z2KfiYA
         XUqPdhgs/Ij7iYNZuuvnsa4qKTti4d9SAHsnj845Yc9/LBdLjUoP8lFprZOBIVy9UijC
         V5c+vy2ipab5qHeqpd0iSuSincNXeexruITP0SFFSoBfcbc9ZB67iofQ8q3lD5jj3/UE
         DT5/P1ZHfve88U4MjszMe/Lq1nJoejK8ycggBdY+fU3Op94qRnGxTqwhLxqPRh7hPydM
         Q1k5/gGGmkqyV0KSEkQ6L0thfOesEHyGJTgsOhK8dL4cAoPq8Uh0XDo0Hzo7GLFHNRPb
         VUPg==
X-Gm-Message-State: AGi0PuZHcoGLetoRI33wtfwOPVsWujov/XaHO2la2vgK1AGpJxV/R7i1
	r1JUCuZqtJK1BgZtOMgJ9ZV0D6Mxw84E0bStC7+Q0UG29J8bP/OEk0XGPCd1Yq3zpAepxIOhVYd
	phMEog1kdk2Zv2nJZJZ5Zt2K+pZSpq+IMjLwuByujog96Cd5ltUVQ6ktd3iT6ULMFRpsrXxcyNw
	d+uXjEUXZvHlfB+ane44RI
X-Google-Smtp-Source: APiQypLF7XdKYR9BXFec2pZIhfzTGXKHp0GNII7PDTMeqAp4NsjTk3P3K5KMDWMRTm3cMIAaUGCQMHsNhaLWztgo
X-Received: by 2002:a17:90a:240e:: with SMTP id h14mr6691078pje.5.1585770093602;
 Wed, 01 Apr 2020 12:41:33 -0700 (PDT)
Date: Wed,  1 Apr 2020 12:41:02 -0700
In-Reply-To: <20200331235607.93023-1-paulburton@google.com>
Message-Id: <20200401194102.161130-1-paulburton@google.com>
Mime-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v2] kernel.bbclass: Stop creating empty .scmversion files
From: "Paul Burton" <paulburton@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Burton <paulburton@google.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The kernel_do_configure() task creates empty .scmversion files within
both the source & build directories. The presence of these files causes
the scm_version function within the kernel's scripts/setlocalversion to
always output the empty string, breaking the kernel's
CONFIG_LOCALVERSION_AUTO=y functionality which appends that string to
the kernel version. Rather than appending the git commit hash or another
SCM revision to the kernel version, the empty string is appended causing
CONFIG_LOCALVERSION_AUTO to do nothing.

Remove the creation of the empty .scmversion files in order to restore
the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
of kernels built from non-tagged source & configured with
CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
actually running.

The .scmversion behavior was introduced for the build directory by
commit 56fe5300ab5a ("kernel.bbclass: fix extra + in kernelrelease") and
extended to the source directory by commit e3bf54731973
("kernel.bbclass: touch .scmversion also in ${S}"). The '+' character
referenced would be appended if the kernel believed it were being built
from a dirty working tree. If that is genuinely the case then this in
itself is useful information; hiding that fact can only serve to muddy a
user's understanding of what kernel they're actually running.

One case that Martin suggests may have been the original motivation for
these commits is building a kernel whose source is not coming from git,
but is a subdirectory of a larger git working tree. In that case git
will ascend through the parent directories of the kernel source until it
finds the .git directory of that larger repository & report version
information that is nonsensical with regards to the kernel. As such,
prevent this from happening by setting the GIT_CEILING_DIRECTORIES
environment variable such that git will not ascend outside of the kernel
source directory and therefore won't pick up on version information that
doesn't relate to the kernel.

Signed-off-by: Paul Burton <paulburton@google.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/kernel.bbclass | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..bf0b14285e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -171,6 +171,17 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
 
+# The kernel's scripts/setlocalversion invokes git to determine whether we're
+# building from source that isn't clean or isn't tagged, and append that
+# information to the kernel version if CONFIG_LOCALVERSION_AUTO is enabled. If
+# we're building kernel source that isn't directly from git, but is a
+# subdirectory of a larger git repository, then we need to ensure the kernel's
+# script doesn't pick up on the state of that larger git repository to prevent
+# it reporting incorrect version information. We do that by ensuring git won't
+# ascend above the kernel source directory whilst searching for a .git
+# directory.
+export GIT_CEILING_DIRECTORIES = "${@os.path.dirname('${S}')}"
+
 #
 # configuration
 #
@@ -521,12 +532,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
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
2.26.0.rc2.310.g2932bb562d-goog

