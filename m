Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2cQG-0004Vi-OE
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:49:56 +0100
Received: by ghbz2 with SMTP id z2so1527219ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.161.201 as permitted sender) client-ip=10.236.161.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.161.201 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.161.201])
	by 10.236.161.201 with SMTP id w49mr32434072yhk.76.1330494088266
	(num_hops = 1); Tue, 28 Feb 2012 21:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=GHWfOg9w5hwMmhsKlcoxJzHMpfhQ2FOFJyLq6DsjseE=;
	b=gaYeoMMRpzrn7ySeO0OwJxjLEugJnEubxn+Gw7ziKg+1D2IW7zWWcnjbF9keLuimW8
	dOxXQBPc6VnIW1CFjcwOjM0otfle/+NjLL/vNWT0FznFtYWF/zfJOpiLuC4ePtqwWEtM
	0vt4IE348joUWVIUsZaFsm7Cz0CYDTRGYIo0U=
Received: by 10.236.161.201 with SMTP id w49mr24616994yhk.76.1330494088231;
	Tue, 28 Feb 2012 21:41:28 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b6sm32799257anc.3.2012.02.28.21.41.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 21:41:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 05:41:16 +0000
Message-Id: <15cc019c1794bdc7151850ded06ddee579d69952.1330494042.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] image.bbclass: do not create image manifest link if IMAGE_LINK_NAME is empty
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
X-List-Received-Date: Wed, 29 Feb 2012 05:49:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4db55ff..ec75cc1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -322,8 +322,10 @@ make_zimage_symlink_relative () {
 write_image_manifest () {
 	rootfs_${IMAGE_PKGTYPE}_write_manifest
 
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
-        ln -s ${IMAGE_NAME}.rootfs.manifest ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
+	if [ -n "${IMAGE_LINK_NAME}" ]; then
+		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
+		ln -s ${IMAGE_NAME}.rootfs.manifest ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.manifest
+	fi
 }
 
 # Make login manager(s) enable automatic login.
-- 
1.7.2.5



