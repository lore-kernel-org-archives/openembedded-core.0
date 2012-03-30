Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDZdT-000243-CG
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 13:04:51 +0200
Received: by wibhj13 with SMTP id hj13so426221wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 03:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uVxJyJ8uUNiKrD2w1yHtylu1opAhoqeJv9aGuMMDK1w=;
	b=mcl/neHFmvXl9H6hFwJaSmtTj14cn80NvZm/3pPEbrf6QUDCkdzGc9aA2k+IoE38G0
	eSj5PTmIrYravUbhhQp3t/9ufNKV6606b9175TkfFRgV4sPdl7+VGqLiJLK9P6i7DTqt
	SMYDpinD1sFnZxJPFOGfWTk/Eb/1b4dyfIfuXrq6RI9q8lUsOwH433+Xs8/Ei92gXvi/
	4IHQiWJJAXiU485U67dGXoiRwoauAUuzAL1SSHO33I8t3CoO1xL+yawUMcsEe6MEmmkb
	JRw9n3ObVUXZlNz/OPMgDxTT7k8Cm2Y2BnM3d10MqY8GwSoSEQ721O3ph3BPreFLWjXv
	tjKw==
Received: by 10.180.105.69 with SMTP id gk5mr6202668wib.3.1333104947122;
	Fri, 30 Mar 2012 03:55:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm5385792wix.8.2012.03.30.03.55.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 03:55:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 12:55:39 +0200
Message-Id: <1333104939-25404-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
References: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] rootfs_ipk: don't echo opkg-cl output to log.do_rootfs
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
X-List-Received-Date: Fri, 30 Mar 2012 11:04:51 -0000

* log_check can find some files with ERR or Fail substring e.g. in "Source: " field

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_ipk.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 13bd4bf..cbc63f0 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -127,10 +127,12 @@ list_installed_packages() {
 }
 
 get_package_filename() {
+	set +x
 	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
 	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
 	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
 	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
+	set -x
 
 	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
 	if [ "$fullname" = "" ] ; then
-- 
1.7.8.5



