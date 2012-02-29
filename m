Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2cQJ-0004VV-HH
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:49:59 +0100
Received: by mail-yx0-f175.google.com with SMTP id m3so1050693yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:41:33 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.165.34 as permitted sender) client-ip=10.236.165.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.165.34 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.165.34])
	by 10.236.165.34 with SMTP id d22mr1123117yhl.86.1330494093493
	(num_hops = 1); Tue, 28 Feb 2012 21:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bTGYrhY0sfJ3n0njjX+tTbsv4PRov/P+N41vPcXOYX0=;
	b=FGl1344WDqQPHhIESKN/EfTZwn4pz4yOv6ob74blZbwIyko32yoUXtXRfKBsQ1mYvF
	aNAGaxQypVMJupE1n/86mAAH0ODkGvZElNSsCqZweWLkqfpNISj2zuBy5Qnak4F7BHsV
	a7OJc/yt3NO2bUl7otMknekJ3L+le+a4/y1MI=
Received: by 10.236.165.34 with SMTP id d22mr871854yhl.86.1330494093451;
	Tue, 28 Feb 2012 21:41:33 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b6sm32799257anc.3.2012.02.28.21.41.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 21:41:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 05:41:18 +0000
Message-Id: <b353fcc6ba6e02e72ca02daa4d6da4048c3fac91.1330494042.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] image_types.bbclass: fix bzip2 and xz compression commands
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
X-List-Received-Date: Wed, 29 Feb 2012 05:49:59 -0000

We need to use -f (force) or the command fails in the image file
already exists.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f9ed49f..0c25a92 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -188,8 +188,8 @@ IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lz
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
-COMPRESS_CMD_bz2 = "bzip2 -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.2.5



