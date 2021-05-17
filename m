Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.16626.1621242978957951991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e6B23ZAc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d11so5555766wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QypV7df9duCXXpUzn1qmeBLCKEWFJuHUTLLYMLtcGPw=;
        b=e6B23ZAcsOei5CseDFReu8SM9ls8xkv+jcUYD15jlKCx98+dDqmII3ghSbGlchHuOX
         SpNNZ4jyO8g+y0/V3XjKhJXG5PRy6EbTd9dnwXCVqQboPCNSjWbimV1Jx+CmLO3gK8NG
         td73LYVKZk3IwRFr2iGS4XDr6fyk23YBkeWtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QypV7df9duCXXpUzn1qmeBLCKEWFJuHUTLLYMLtcGPw=;
        b=qexG7g7xJulnZFzfjqphCxWlEC5LlSDyRtI7GHoaA2ECqqgK6eg0yt3NbaE+oycq04
         Pv5fQeLoTI42i0b7MBjbHHIxQPJx6SoTDAM/7Fj+TjfxlKp6brajaL0aXtpykoS9aL15
         HwmdaV0JpqaP+jpnRa91xK8NcV6HHKZ+dZZiVVMCPcyVuhImH7qdLQBWiAt2OUkxyktK
         p8Lqgx+vBG7IJoTsJKk9K4LZwnyezpNli60v9d4Vb8VdfiyqV+B/NUkkSE+wmMUd6PoA
         owvsLUaZm6VRQBR7zDOCxi+dM1xafcP+FHNcJuHMeLT6fn2j3NGfOf2Pz9CxljlMkXox
         tCoQ==
X-Gm-Message-State: AOAM531jz600fxoc0v+UoHPd0N6eKkJJlgw6G/Atbed9j5YJ8sS9fASj
	ntDUBXmbMFQf/SAj2fWUB4NJp/tPUNwuOA==
X-Google-Smtp-Source: ABdhPJxLzMEvHWreL9hLpSNij7evlwaQ3PFwnsGn0o4h885LKLk8A5dPwSJV84gnDG0aAmXXOSP96Q==
X-Received: by 2002:adf:d843:: with SMTP id k3mr12222436wrl.138.1621242977351;
        Mon, 17 May 2021 02:16:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f15sm11781wrs.47.2021.05.17.02.16.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 02:16:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
Date: Mon, 17 May 2021 10:16:16 +0100
Message-Id: <20210517091616.2414045-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 .../distro/include/cve-extra-exclusions.inc   | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
new file mode 100644
index 00000000000..2d774f3706c
--- /dev/null
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -0,0 +1,91 @@
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
+# bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215
+# Fix not in upstream release yet as of 2021/5/12
+
+
+
-- 
2.30.2

