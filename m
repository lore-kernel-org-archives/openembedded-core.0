Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3004BE9371C
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:40:44 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.web10.26761.1696538435286964874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 13:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=WIo7sAG7;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qoV97-0003c7-LP
	for openembedded-core@lists.openembedded.org; Thu, 05 Oct 2023 20:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=A2dPYRkMz1RvBlQCOW/3OQ/d4FyIVjmKulL5N7d5cvo=; b=WI
	o7sAG7dDid54aNeFj2l3YAOyp6OJ0GytYmZjYzrFdUl6cBItlq7OVC8uUQ5IOOwVc9oCXzzuKeDEZ
	+gqDbRPcZGgL5w0fy4Di4DOflsFo+cxUXN03WMpKiicd+XkeW0aZuU3AM2uckSeLEcI1NhelXPBR9
	6/N3kiYkFlcpmLfd1SKjuQRK0LUVdAZKneuPspg85HFzrl1HJOwDs+FDnUfImxFQ1rGidc+RS6Kdu
	Wgf67n57C2jX6Zq3dPSFRgNhBxLHvmihX8QubTaKymx08FDINb5pZZCRP0FdfJrMefB7rLlQaogk4
	wDUXNN8+4da/z+qkp749jS6uAvmX2Chg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qoV96-00A4sL-0R;
	Thu, 05 Oct 2023 21:40:32 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH v2] glibc: Fix CVE-2023-4911 "Looney Tunables"
Date: Thu,  5 Oct 2023 21:40:30 +0100
Message-Id: <20231005204030.2409459-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 20:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188738

From: Mike Crowe <mac@mcrowe.com>

Take the patch from the source for Debian's glibc 2.31-13+deb11u7
package, the changelog for which starts with:

 glibc (2.31-13+deb11u7) bullseye-security; urgency=medium

   * debian/patches/any/local-CVE-2023-4911.patch: Fix a buffer overflow in the
     dynamic loader's processing of the GLIBC_TUNABLES environment variable
     (CVE-2023-4911).

This addresses the "Looney Tunables" vulnerability described at
https://www.qualys.com/2023/10/03/cve-2023-4911/looney-tunables-local-privilege-escalation-glibc-ld-so.txt

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../glibc/glibc/CVE-2023-4911.patch           | 63 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-4911.patch

Hopefully sent by a route that doesn't corrupt the whitespace this time.

diff --git a/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
new file mode 100644
index 0000000000..4d3146509a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2023-4911.patch
@@ -0,0 +1,63 @@
+From d2b77337f734fcacdfc8e0ddec14cf31a746c7be Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@redhat.com>
+Date: Mon, 11 Sep 2023 18:53:15 -0400
+Subject: [PATCH v2] tunables: Terminate immediately if end of input is reached
+
+The string parsing routine may end up writing beyond bounds of tunestr
+if the input tunable string is malformed, of the form name=name=val.
+This gets processed twice, first as name=name=val and next as name=val,
+resulting in tunestr being name=name=val:name=val, thus overflowing
+tunestr.
+
+Terminate the parsing loop at the first instance itself so that tunestr
+does not overflow.
+---
+Changes from v1:
+
+- Also null-terminate tunestr before exiting.
+
+ elf/dl-tunables.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2023-4911
+
+diff --git a/elf/dl-tunables.c b/elf/dl-tunables.c
+index 8e7ee9df10..76cf8b9da3 100644
+--- a/elf/dl-tunables.c
++++ b/elf/dl-tunables.c
+@@ -187,11 +187,7 @@ parse_tunables (char *tunestr, char *valstring)
+       /* If we reach the end of the string before getting a valid name-value
+ 	 pair, bail out.  */
+       if (p[len] == '\0')
+-	{
+-	  if (__libc_enable_secure)
+-	    tunestr[off] = '\0';
+-	  return;
+-	}
++	break;
+ 
+       /* We did not find a valid name-value pair before encountering the
+ 	 colon.  */
+@@ -251,9 +247,16 @@ parse_tunables (char *tunestr, char *valstring)
+ 	    }
+ 	}
+ 
+-      if (p[len] != '\0')
+-	p += len + 1;
++      /* We reached the end while processing the tunable string.  */
++      if (p[len] == '\0')
++	break;
++
++      p += len + 1;
+     }
++
++  /* Terminate tunestr before we leave.  */
++  if (__libc_enable_secure)
++    tunestr[off] = '\0';
+ }
+ #endif
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 8d216f6ed1..1862586749 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -80,6 +80,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
            file://0037-Avoid-deadlock-between-pthread_create-and-ctors.patch \
            file://CVE-2023-0687.patch \
+           file://CVE-2023-4911.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.2


