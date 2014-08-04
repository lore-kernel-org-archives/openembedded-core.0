Return-Path: <sujith.h@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8FF65CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:00:44 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so7777211wes.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iuxbMrYxVfwyS4v8jncCGnat0aLj+KzROfhBKoWCrzU=;
	b=m7b0PMhZb87CTYbZHoRpF/JghLDESmkoCPy76szH5DluqplYqFclGvDeJffcoIauDY
	paHidAOW7xUNr52wF4N/W+qUSTNnHB4sNfNLt+Mk3c80Vqax2oO1aBph6VUkUUIikDgQ
	H78MjE8oMWyqaQnjWdRViPBkJslGH/bIRH6W6jFgZSaYRInKl9zeKezvExQxOgGF82yE
	ydi1NKI4Rw4Bn3fGNAHNoN1odKD40gKuYwKt4ngM4Wtcp0bTLm/Bbzg+/cvFU21lrBMr
	e7LOrVPZ3pknbuc2LiYxvnsnwSeurGUM0QXOV8HLQnksi/2fBnalrKc84a54CX9fKXuE
	HLOw==
X-Received: by 10.194.184.230 with SMTP id ex6mr31340644wjc.83.1407160842498; 
	Mon, 04 Aug 2014 07:00:42 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	kw1sm22199565wjb.19.2014.08.04.07.00.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 07:00:41 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 19:27:08 +0530
Message-Id: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 14:00:46 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

If hostname is not added to /etc/hosts file then rpcinfo
command fails when hostname is passed as argument. This was
observed when rpcinfo command was tested on freescale target.
Below was the output observed without this change.

root@mx6q:~# rpcinfo -s mx6q
rpcinfo: can't contact rpcbind: RPC: (unknown error code)

Below is the output after this change:
root@mx6q:~# rpcinfo -s mx6q
   program version(s) netid(s)                         service     owner
    100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper  superuser
root@mx6q:~#

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/classes/image.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 82605f2..7a5a5c1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
 	fi
 }
 
+ROOTFS_POSTPROCESS_COMMAND += "add_machine_name_loop_back;"
+
+add_machine_name_loop_back() {
+    if [ -n ${MACHINE} ]; then
+         echo 127.0.1.1 "       "${MACHINE} >> ${IMAGE_ROOTFS}${sysconfdir}/hosts
+    fi
+}
+
 # Enable postinst logging if debug-tweaks is enabled
 postinst_enable_logging () {
 	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
-- 
1.8.4


