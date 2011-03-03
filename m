Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv2Qe-0007vN-1V
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 07:54:28 +0100
Received: by mail-yi0-f47.google.com with SMTP id 13so267860yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 22:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=S/QogCvkJHAOWNTwW1vVVbmvitKgbw0VacA1EjRzkkM=;
	b=Bmd6w8+A08oO6dX3Wt0wn7wTMxVwlr55HVIwjZ3WIe0LfdYov/kBx4fWKMEajjpcJo
	JpAUNJYh+EGA1q90g4UsmHyxppVWOjZH0YQ5j530FEACwynqJLyUaSIMX0OsKmpLe5q2
	KEAV+lEpeHnifLDTmxzfRXwH4ZMTRdZzOgtmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Q3UmDMd5EGMCYrLGJ9OXk7zYPSXqdP5Rmc+tyrKzr9Iln1LOCpNa+5zp72RlYlXQ1G
	wB/41V5R0Z1Nf777nLF4H/gXzVOTKG+3930leTT3puArzF8pLKVB69xTSPF7/wORBntN
	jxwQ3+TxpcsWhQELRx0c1H47/LHRXIDbEoChU=
Received: by 10.150.50.11 with SMTP id x11mr1327976ybx.304.1299135182087;
	Wed, 02 Mar 2011 22:53:02 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g27sm595767yhc.8.2011.03.02.22.53.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 22:53:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:52:45 -0800
Message-Id: <1299135167-18330-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCHv3 4/6] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 06:54:28 -0000

* Now qemu can handle lower values we can chnage this sanity test
  to check of values if less than 65536

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sanity.bbclass |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 13940f8..aae5028 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -170,10 +170,12 @@ def check_sanity(e):
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-                f = file("/proc/sys/vm/mmap_min_addr", "r")
-                if (f.read().strip() != "0"):
-                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
-                f.close()
+                f = open("/proc/sys/vm/mmap_min_addr", "r")
+                try:
+                    if (int(f.read().strip()) < 65536):
+                        messages = messages + "/proc/sys/vm/mmap_min_addr is not >= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n"
+                finally:
+                    f.close()
         except:
             pass
 
-- 
1.7.4.1



