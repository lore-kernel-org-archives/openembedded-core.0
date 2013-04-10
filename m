Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPphZ-0004vO-LI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 09:44:19 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so68734ead.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 00:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=aS1GtS/4/Vo+QdpkyLbmuExHKRO7zeZXhCVnNjr0kPY=;
	b=ncAzfo+TEUyWLQLzaOtkDhlzI79J/5jBXEpfK1q4bS1wN90z8dnE4aMQH1uHDJ0uTy
	MVasBHu1rlHecZnegImEkDnh36MkOHC7r/frL9fINrrD7KpiJQvdA4cGQIlCdgAB3gXH
	uAZL7cpE65dgWxSo1OPMYRcclk6g1DWmjl2FKdSf51GrLcb+N2IUdwsNC+XRNO96eMjT
	wg2OOzHxsHm1qX7J1BD6aH6U1+MWc5TP6X7sJVq33n/e2yUUnb7UcCs9A5DbAWhFR420
	NRY0JW+GesEahK96rQZbNVz1VpVhBxFFqxd6v4hBfhM+KCD0boQBKDjFLFoU7yh6xtX/
	WJ/w==
X-Received: by 10.15.98.141 with SMTP id bj13mr2618934eeb.29.1365578816417;
	Wed, 10 Apr 2013 00:26:56 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id u44sm42023633eel.7.2013.04.10.00.26.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 00:26:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 09:26:46 +0200
Message-Id: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkkGr9/4c0MchJnD8kmTgi6HNbpmULwz7dkx1mQMovKmjyxYsHz3EqYNQDV1fAPtoy2UDQB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 07:44:30 -0000

This allows a clean seperation between all image outputs and making it possible to have convinience symlinks to make it ready to deploy. And while it isn't a valid reason, it must be mentioned: BSP layers which do use convenience symlinks already don't step on files owned by others anymore.

I assumed this was the default behaviour in OE-classic, but as it turns out every DISTRO set it to deploy/images/$MACHINE on its own.

Code inspections shows that the all references to the image deploy dir in classes and scripts in OE-core do the right thing and parse the DEPLOY_DIR_IMAGE variable.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cd5d61e..0540766 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -379,7 +379,7 @@ DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
-DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images"
+DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
-- 
1.8.1.4



