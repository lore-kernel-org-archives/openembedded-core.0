Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.22091.1622304398552632024
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iKHlRce9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v12so6251637wrq.6
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A6Xt/l1yoqTF44qFxxgaoQkor4giWSbP1vlf3Xf3RHk=;
        b=iKHlRce9RFMhE0SRlP7AZJdET0Avifc+AZiKd003uVFEDEbp5uTURFoAyHpXII7mTU
         NPqppYvyIt45X+t0lIP1zqV+9q9xN4FnNDuuySZZWvTZUW20w2aBHXNMB5SSl9aEC/aL
         S1NY95zqLglcprtD/4GVue49LWSCOimH6zYfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A6Xt/l1yoqTF44qFxxgaoQkor4giWSbP1vlf3Xf3RHk=;
        b=jA/dPs4pSTpu6dcvEQonTWgIYhhRcVg5Or7iRYu9oBJt/X7iKue2Pai+W/BrPs+W0/
         FMmgpcpSXmTpDNKiM7AWSAWyMEhJsOXlX9U/XPGhvTzLE9WA7jQMhHGlMFIRQCs/IX6S
         5qkebofrwCS24gWpWHIzme3jjf/NfMKvdAjuYUgrweFe2VoThzRCIUfJ4ARZllIpQ7bt
         3QW4tjlHFnU9u9RbR9qMgRD6ZbCO/i0iidpU76EXvzXIq8MeljUkNxyX5boAuK1kcY8i
         MNqdrxJ2oaG7r/Vc+xahy9gIHnJFu8a7Roj+7ALcdSfaN/4WF1gB1g/EaXqeYycgA7Rw
         QoMg==
X-Gm-Message-State: AOAM5316NEFZ8CVTtgJsHpA3r1WoSIDB6JPDvWIWsl/VN7zjeF/jeUCM
	uApNdCvBqTNLZk0xCBFJjbeOR99hQxvVyQ==
X-Google-Smtp-Source: ABdhPJyArmYIUqVy9abX1CKGlWSU8Vcp4o6fVVi5MGKwJF2NazNMzSSkQ9tpmqxD4gdWmVd3HM7Blg==
X-Received: by 2002:a5d:5404:: with SMTP id g4mr14489494wrv.286.1622304397052;
        Sat, 29 May 2021 09:06:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 10/10] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
Date: Sat, 29 May 2021 17:06:32 +0100
Message-Id: <20210529160632.2796977-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
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
 .../distro/include/cve-extra-exclusions.inc   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
new file mode 100644
index 00000000000..561386b7069
--- /dev/null
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -0,0 +1,45 @@
+# This file contains a list of CVE's where resolution has proven to be impractical
+# or there is no reasonable action the Yocto Project can take to resolve the issue.
+# It contains all the information we are aware of about an issue and analysis about
+# why we believe it can't be fixed/handled. Additional information is welcome through
+# patches to the file.
+#
+# Include this file in your local.conf or distro.conf to exclude these CVE's
+# from the cve-check results or add to the bitbake command with:
+#     -R conf/distro/include/cve-extra-exclusions.inc
+#
+# The file is not included by default since users should review this data to ensure
+# it matches their expectations and usage of the project.
+#
+# We may also include "in-flight" information about current/ongoing CVE work with
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
-- 
2.30.2

