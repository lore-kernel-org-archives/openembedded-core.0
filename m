Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
 by mx.groups.io with SMTP id smtpd.web11.1131.1585698979208260194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 16:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=O7t4b1J5;
 spf=pass (domain: flex--paulburton.bounces.google.com, ip: 209.85.214.202, mailfrom: 3otidxgokaf0k5pg6pmojibjjbg9.7jh@flex--paulburton.bounces.google.com)
Received: by mail-pl1-f202.google.com with SMTP id 2so16983642plb.20
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 16:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=mPVsxrT0eMqRmQfH3owVW4lSJtt8v+wb3OqM9hZfT1k=;
        b=O7t4b1J51aLw9oqUvbDbeu/zK3746oq6cCauJPA1V4UvA5NbUsZpJhm4/cwieBnj+M
         LrJAJSqVyOTitA8Ln0ImanCtDM/2Nf2CbDXfIYJFwLqndVSMaQkAmSGAhUbb7oI+IcLJ
         O1hBBUW9gKD1v8pMnXDnZr6IUK1NzIGTBKQzaqaCcC80ZI2gX8S9O0LErAQBTaBMgBFY
         /s5bvS9IUYMLUe50WgBfUoXoJac3SSWXauzXve9LOi0pqfy9ZHrQ9pekBbgbpI+pNIx1
         ZYE41ykLuFe7l7PoLZWORSjpZl1wuldAXR/hlKMoMat2Gzs+z8K/K4BNssvuCDGsb6NR
         wxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=mPVsxrT0eMqRmQfH3owVW4lSJtt8v+wb3OqM9hZfT1k=;
        b=atRd0ajeSEObCV5itSMACWERdKJ0zpkas0VnAgic3UqD4LlZiZ+aHcrAEgtc0GgNM3
         apvmt8PVTgqkkeP+g6ub//AdhNEnFoM5M+kFHKYsJpNJO37Ueyopi4X+Biy/EbV1rBEJ
         o4UX7TPO0xTQ36uwYf/KCXeMaSZscJG/2oMp5JeT6SCQCYtDXHSreVrbMJUx9odV+l7b
         QzM9hnCUTYtU8i6uPg8my8Dj4+l0cKj8BZN/B+rXT73KacIZQDwE+5APD/j4PpykrmGK
         BqGET/iKdjxD5Fhk1jyDPdPrRp6hCj52HjOnSZ0JD8kNYgDK8B+a1dqQ2D7Omayb7bs8
         iP6Q==
X-Gm-Message-State: AGi0PuYf5MpzwKe7IND6oUapWHN2MWFOcVaH6E69lVxzcnLL9xhoLRp5
	mvbuR4jHMf4EnA8ECNFRJ9AQoHViql1T+rIyOPW9dwD/L0ytvnkBAeenNJSk4zjcYHvVMWA6z+Z
	VTM6PpuDjfEPhd9XYS6WslvqptxdxNK8+tBhfABbT5C0FBx3Yn44Mn7ntV7bjDpCvNIBcAmIykk
	+vmF7FVc6P01tOWhtgFW1Q
X-Google-Smtp-Source: APiQypJzbmKLVEyAMClQoSDArV4jWwqZRa4qUsStVYfkV4CIkuoXee2qvVfa+B1A6WE7e540CYwb8hfqPraaGHOu
X-Received: by 2002:a17:90a:de0e:: with SMTP id m14mr1551338pjv.54.1585698978298;
 Tue, 31 Mar 2020 16:56:18 -0700 (PDT)
Date: Tue, 31 Mar 2020 16:56:07 -0700
Message-Id: <20200331235607.93023-1-paulburton@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH] kernel.bbclass: Stop creating empty .scmversion files
From: paulburton@google.com
To: openembedded-core@lists.openembedded.org
Cc: Paul Burton <paulburton@google.com>
Content-Type: text/plain; charset="UTF-8"

The kernel_do_configure() function creates empty .scmversion files
within both the source & build directories. The presence of these files
causes the scm_version function within the kernel's
scripts/setlocalversion to always output the empty string, breaking the
kernel's CONFIG_LOCALVERSION_AUTO=y functionality which appends that
string to the kernel version. Rather than appending the git commit hash
or another SCM revision to the kernel version, the empty string is
appended causing CONFIG_LOCALVERSION_AUTO to do nothing.

This behavior was introduced for the build directory by commit
c73e50a91e02 ("kernel.bbclass: fix extra + in kernelrelease") and
extended to the source directory by commit cafb94f57123
("kernel.bbclass: touch .scmversion also in ${S}"). The motive isn't
entirely clear since these commits contain no meaningful descriptions
and the former links to a mailing list archive that is no longer online,
but the '+' character referenced would be appended if the kernel were
built from a dirty working tree. This in itself is useful information;
hiding that fact can only serve to muddy a user's understanding of what
kernel they're actually running. I have verified that building a kernel
from a clean working tree does not result in a spurious '+' character.

Remove the creation of the empty .scmversion files in order to restore
the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
of kernels built from non-tagged source & configured with
CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
actually running.

Signed-off-by: Paul Burton <paulburton@google.com>
---
 meta/classes/kernel.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..46e24a19e2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -521,12 +521,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
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

