Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhaX-0002M8-8t
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:39:17 +0100
Received: by pxi17 with SMTP id 17so911749pxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=b8XFZUZBS1Bgpg/9dRY1Ydmp/7fxW6tjLNDvwRdpIcc=;
	b=rByrh24bfsqwBw5ifyH0X8DKbWMLyUn9Rfc0HiMSiZyTYChmdWp+jV5w1DsJBvMjWT
	jgSPxnd0o8tjZs2dnJd3KfW9J0E/mE9Xk+nCP/m7n6Ed9YIaW9h9HD9Rrr52TePsYQ7n
	SUdLgWWdtF1cDTc3K7R5AZLG9u8uagBB6OboI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iHl55reLDwRBWbYkBhhXETQNZzab0tfY6zLmgtw7aYtVEjZnqTOD61Brc0W+rFIsWn
	G0N39iE/aS5NspJuTTICkWM7awhV+Wx9zTN/1LqSNtaPduBRHA5yG3lwTJ7XYo9epi4T
	NP+cit5w9jnNkIXeOt4nvLWwfUziUs0JuQZh4=
Received: by 10.142.251.7 with SMTP id y7mr6177794wfh.433.1299055069152;
	Wed, 02 Mar 2011 00:37:49 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:25 -0800
Message-Id: <1299055045-8096-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH v2 7/7] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Wed, 02 Mar 2011 08:39:17 -0000

* Now qemu can handle lower values we can chnage this sanity test
  to check of values if less than 65536

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sanity.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 13940f8..4fba852 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -171,8 +171,8 @@ def check_sanity(e):
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
                 f = file("/proc/sys/vm/mmap_min_addr", "r")
-                if (f.read().strip() != "0"):
-                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
+                if (int(f.read().strip()) < 65536):
+                        messages = messages + "/proc/sys/vm/mmap_min_addr is not >= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n"
                 f.close()
         except:
             pass
-- 
1.7.4.1



