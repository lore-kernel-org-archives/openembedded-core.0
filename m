Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsguL-00052Z-At
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 21:35:57 +0100
Received: by mail-yx0-f175.google.com with SMTP id r5so750117yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dF6b93AqgbPV+4E3P8Qvto4WdZng/IXDltzABTaKrXc=;
	b=Q7kXvUqHPe4fWVWtQI3sj2AlWyqEPDzIyP+y7mi1aw6m4F8yGMvgxX6gRAP+d4sKrh
	kniDIkF8FB4QtutJqxLddcHneBTAOl1ViT7q+lA/sUIwQAHPhejZyQViUDgTRY+J31Tt
	xqOqRqSNUE/ozlJyDW26zEg8KZ1ppD4xw83oY=
Received: by 10.236.200.164 with SMTP id z24mr15205yhn.52.1328128084123;
	Wed, 01 Feb 2012 12:28:04 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm120200yhk.15.2012.02.01.12.28.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 12:28:03 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 20:27:45 +0000
Message-Id: <cc36eb9f3e699b9c4478e4de0939e50eb317446f.1328127940.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] rootfs_ipk.bbclass: fix detection of script runtime requirement
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
X-List-Received-Date: Wed, 01 Feb 2012 20:35:57 -0000

The code has been broken by 2feba313c991170747381c7cf821a45c2cd04632
that changed the way this detection has being done.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_ipk.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 48fb2fb..0881089 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -74,9 +74,15 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	${OPKG_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTINSTALL_COMMAND}
-	
+
+	if grep -q Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
+		runtime_script_required=1
+	else
+		runtime_script_required=0
+	fi
+
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
+		if [ $runtime_script_required -eq 1 ]; then
 			echo "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
-- 
1.7.2.5



