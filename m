Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yFx-0004hI-Rq
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:33:02 +0100
Received: by mail-yw0-f47.google.com with SMTP id j56so2304758yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:24:28 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.176.163 as permitted sender) client-ip=10.236.176.163; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.176.163 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.176.163])
	by 10.236.176.163 with SMTP id b23mr28024940yhm.122.1331054668048
	(num_hops = 1); Tue, 06 Mar 2012 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=49g9B6qf9sUC736Abr6PvucprnaJ9+6sZYvqeLCm/KI=;
	b=QLl9g004YRoUuIeNVhkoY1MA7W1eLPfLs04eM4JBBN91TFDhAc87uaNM5ZaSdRhAwl
	Z64L0kjH4/FZ0Vrv26W3va7jLZ8oEk2uMiDuWCU51wraIo+CxBdMZHWUnbmyeM7cbTd0
	LdJOIRk5mDdTdqA8ZoUSjzt4g2LIxBP0CRQMJ8tZCVgqmYW4FsMur8urY4cY/eggNC7q
	rA0mqPeFWs9Po+VGBAY0v5JJuQTs3CH/qXdLVwRM4kZEma4PVIw9a8Nt0f3gW0Gqct2M
	11RcLZt1nVhRaJrnTDFWQGY+OKaSsYqHe3IZ3PGqkNEfIjZ9WExWczBibHT6G97JqAeY
	4Jqg==
Received: by 10.236.176.163 with SMTP id b23mr22303137yhm.122.1331054667962;
	Tue, 06 Mar 2012 09:24:27 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm50620004yhj.7.2012.03.06.09.24.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:24:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:24:13 +0000
Message-Id: <21093c188e263e6cda4439f98171caa962b3f75f.1331054558.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
Subject: [PATCH v2 3/5] rootfs_rpm.bbclass: rename postinst trigger script
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
X-List-Received-Date: Tue, 06 Mar 2012 17:33:02 -0000

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_rpm.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 48133f0..9039b21 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -112,7 +112,7 @@ EOF
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
 	# Stop $i getting expanded below...
 	i=\$i
-	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure << EOF
+	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
 #!/bin/sh
 for i in /etc/rpm-postinsts/*; do
 	echo "Running postinst $i..."
@@ -122,9 +122,9 @@ for i in /etc/rpm-postinsts/*; do
 		echo "ERROR: postinst $i failed."
 	fi
 done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 EOF
-	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
-- 
1.7.2.5



