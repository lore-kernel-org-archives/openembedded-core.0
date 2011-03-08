Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pwqhz-0003ag-2b
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 07:47:51 +0100
Received: by pwj9 with SMTP id 9so857941pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 22:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=S/QogCvkJHAOWNTwW1vVVbmvitKgbw0VacA1EjRzkkM=;
	b=kHtTmiunqnV4IN5GZdav07JH5/hNkASlpYC3WKvtE6+rxHrvnBTi0TZu0FROtubPd6
	8HMwk21NS1+KhkoosyFl2FBNcJHuX3ET1iWRJnoZJgO/AI+sTPNDA+gSIox8tzTFUjv9
	GG7dPCRIxGevf37/r3majK3iTftuQGC1+ddBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vgJMn83AGzTdRZ/0/zzdJmMwVC0EC3ve+fisUeeRd9O9Ncwt7byh8uMMs4M58f3n11
	vRYvNWCv8qykoiV4YWRdJRcrMrzbZbbjMTv3+eDIVy4kogBuJ1WXMdTAs4irsLZw9jFq
	i8cLpWzolIBUVPKPxP1rygptAjv7XVWNR+y+k=
Received: by 10.142.154.12 with SMTP id b12mr4142759wfe.160.1299566776295;
	Mon, 07 Mar 2011 22:46:16 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm565028wfh.6.2011.03.07.22.46.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2011 22:46:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2011 22:46:08 -0800
Message-Id: <1299566768-10234-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv3 3/4] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Tue, 08 Mar 2011 06:47:51 -0000

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



