Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.58329.1622557122875978455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x8cKOFyb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id t21so6956352plo.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cb8c+JrwEa67axxcgE3d97kf21Bd0LMtF2WBwlgA65k=;
        b=x8cKOFybGG9eeC3rWD35HXGsOu7+19PhM+aPQEDk6AFAThcY6jhY1qn62XUNoyiMO8
         D/8t/sl1ixcw07OUNR6f3vK06yNE9tYS3D0nLWx1h21lVCK99ipvyWpwSmbBntf4LMft
         Uxpvfvt6fOznzb66uuUPOJ/xTgWpp08wp+sTcE4yEuya3KU2NFNURWMknN9oTU4Uov5t
         T8wkKAFrC5ZSgySNi9g6JSruPRv8ArKt4q//jJjPNFFF33/HhVfa+02t6B46A+nY62wH
         yYJKpoSJIwuXNsbBCH84CKVo49nvc/tHDrth5U8czNWahN0kzsPq1pHx5q3utAjHID8P
         ztlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cb8c+JrwEa67axxcgE3d97kf21Bd0LMtF2WBwlgA65k=;
        b=VRxsDejl62zNdxgdSjEQdGmcGA/YY8DQU7vc4kjXrH2k6samemkA7CY/g9xUEUfJX3
         RfPHOmJjZD/0fTqXNIeALPB9uKwDs9SD4rWE4cv44c7NKxLI90bVXyV+RMYAgSzAuS+D
         Ln4Og/JYb5BjbWxK3BI94gMvij9Ff3VK7gR707Yz9MPO01xeMHgz+j4quhtSyCS8tiAX
         cKPNtQrbUxQwZyM+LCHMhcYnmKrthad9sTkzglj7f/uLUZeL2fPMQ/qYsrSkfzvfXSeH
         VTiPbKNStnkH/dX5u91ECx8WqsQYFzy17W5CXMwz6z/JyyDYVzX8Kp9blQellLzZmnCt
         JJCQ==
X-Gm-Message-State: AOAM533oEX4Qj3593bWPUB/hA2z4qLEP3FtdvuuxHSwsxLrFFFXNY4hB
	NxfKFdRPoyWs1xbyv18g6X6jtDk13yp+v9HF3Fg=
X-Google-Smtp-Source: ABdhPJychtLnANXTeuUmZA7X38PFBEtqjDAgkizR5vGre22g488PWd9lA8rXk9aRyooTzdVefjb8VQ==
X-Received: by 2002:a17:902:bd01:b029:fd:924f:b10d with SMTP id p1-20020a170902bd01b02900fd924fb10dmr25882852pls.74.1622557121754;
        Tue, 01 Jun 2021 07:18:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/26] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
Date: Tue,  1 Jun 2021 04:17:53 -1000
Message-Id: <c93d541a84ce4f9ed52b7aee0a59857957ea0380.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The preferred methods for CVE resolution are:

1. Version upgrades where possible
2. Patches where not possible
3. Database updates where version info is incorrect
4. Exclusion from checking where it is determined that the CVE
   does not apply to our environment

In some cases none of these methods are possible. For example the
CVE may be decades old with no apparent resolution, and with broken
links that make further research impractical. Some CVEs are vauge
with no specific action the project can take too.

This patch creates a mechanism for users to remove this type of
CVE from the cve-check results via an optional include file.

Based on an initial patch from Steve Sakoman <steve@sakoman.com>
but extended heavily by RP.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf282ae03db3f09df42dcd110d7086c2d854642c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
new file mode 100644
index 0000000000..565c8e04cc
--- /dev/null
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -0,0 +1,88 @@
+# This file contains a list of CVE's where resolution has proven to be impractical
+# or there is no reasonable action the Yocto Project can take to resovle the issue.
+# It contains all the information we are aware of about an issue and analysis about
+# why we believe it can't be fixed/handled. Additional information is welcome through
+# patches to the file.
+#
+# Include this file in your local.conf or distro.conf to exclude these CVE's
+# from the cve-check results or add to the bitbake command with:
+#     -R meta/conf/distro/include/cve-extra-exclusions.inc
+#
+# The file is not included by default since users should review this data to ensure
+# it matches their expectations and ussage of the project.
+#
+# Wemay also include "in-flight" information about current/ongoing CVE work with
+# the aim of sharing that work and ensuring we don't duplicate it.
+#
+
+
+# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
+# CVE is more than 20 years old with no resolution evident
+# broken links in CVE database references make resolution impractical
+CVE_CHECK_WHITELIST += "CVE-2000-0006"
+
+# epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
+# The issue here is spoofing of domain names using characters from other character sets.
+# There has been much discussion amongst the epiphany and webkit developers and
+# whilst there are improvements about how domains are handled and displayed to the user
+# there is unlikely ever to be a single fix to webkit or epiphany which addresses this
+# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
+# we can seem to take.
+CVE_CHECK_WHITELIST += "CVE-2005-0238"
+
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
+# Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
+# Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
+# Upstream don't see it as a security issue, ftp servers shouldn't be passing
+# this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
+CVE_CHECK_WHITELIST += "CVE-2010-4756"
+
+# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
+# go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
+# The encoding/xml package in go can potentially be used for security exploits if not used correctly
+# CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
+# exposing this interface in an exploitable way
+CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
+
+
+
+#### CPE update pending ####
+
+# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
+# Appears it was fixed in https://git.savannah.gnu.org/cgit/groff.git/commit/?id=07f95f1674217275ed4612f1dcaa95a88435c6a7
+# so from 1.17 onwards. Reported to the database for update by RP 2021/5/9. Update accepted 2021/5/10.
+#CVE_CHECK_WHITELIST += "CVE-2000-0803"
+
+# grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865
+# Looks like grub-set-bootflag is patched in by Fedora/RHEL:
+# https://src.fedoraproject.org/rpms/grub2/blob/498ea7003b4dd8079fc075fad7e19e0b190d0f97/f/0133-Add-grub-set-bootflag-utility.patch
+# Does not exist in upstream grub2:
+# https://git.savannah.gnu.org/cgit/grub.git/tree/util
+# Reported to the database for update by RP 2021/5/9 Update accepted 2021/5/12
+#CVE_CHECK_WHITELIST += "CVE-2019-14865"
+
+# tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
+# https://bugzilla.redhat.com/show_bug.cgi?id=280961 - issue affects paxutils included in tar
+# http://cvs.savannah.gnu.org/viewvc/paxutils/paxutils/paxlib/names.c?r1=1.2&r2=1.4 was the fix
+# included in tar 1.19 and later
+# CPE update sent, may or may not exclude for us
+#CVE_CHECK_WHITELIST += "CVE-2007-4476"
+
+
+
+#### Upstream still working on ####
+
+# qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255
+# There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html
+# however qemu maintainers are sure the patch is incorrect and should not be applied.
+
+# flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293
+# Upstream bug, still open: https://github.com/westes/flex/issues/414
+# Causes memory exhaustion so potential DoS but no buffer overflow, low priority
+
+# wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879
+# https://mail.gnu.org/archive/html/bug-wget/2021-02/msg00002.html
+# No response upstream as of 2021/5/12
+
+
+
-- 
2.25.1

