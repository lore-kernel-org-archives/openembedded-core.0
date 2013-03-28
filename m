Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULDY2-0006HA-1o
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 15:11:52 +0100
Received: by mail-da0-f46.google.com with SMTP id y19so4506406dan.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ie4U8QcJNFV5V0sj1S+raxQPzeLg56W3W4jev32zNf8=;
	b=HrxOCFaF4eAI0PwtQB8u88pRhQqDqLqV/wJAN41BxxoiMODDire0srMZ+QKGWN9tZG
	JT5qA9snrIgOinvUyv45D9r6WqsVT0PN7vNHaWFNKeoFfoosXl3ZD1B9y8LjIKQH1uME
	y8ny6cbzSLhLM+XnYTP1M8eD+0ocpWKdu18oavlPL1yM3I6fVJ/lA+h0L/PN7kX11aGg
	zWtirz1sMIkB3kgE22hKY3gEbfFwhL9+BK4lwse7UjExyzWbqdPSWcRSAqmaO/oEtRyR
	s6YmYcKK1xCxRt6yBnz/yv7XpTBmUiNqkwg9yn6S8/A6JTD8+3pOdVKPUYPi3snic9Ev
	CF4A==
X-Received: by 10.66.121.1 with SMTP id lg1mr36824113pab.167.1364478858839;
	Thu, 28 Mar 2013 06:54:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qe3sm8579691pbb.0.2013.03.28.06.54.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 06:54:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 14:54:09 +0100
Message-Id: <1364478849-3696-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] openssh: don't add update-rc.d to RDEPENDS
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
X-List-Received-Date: Thu, 28 Mar 2013 14:12:00 -0000

* sysvinit/systemd assumes that update-rc.d can be inhibited
* with systemd enabled, sysvinit scripts are missing in packages
  and update-rc.d needs to be put in BAD_RECOMMENDATIONS to prevent
  update-rc.d trying to install them in postinst
* update-rd.c shouldn't be in DEPENDS
---
 meta/recipes-connectivity/openssh/openssh_6.1p1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
index 32c3b2c..0cffd23 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
@@ -96,8 +96,7 @@ FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-DEPENDS_${PN}-sshd += "update-rc.d"
-RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
+RDEPENDS_${PN}-sshd += "${PN}-keygen"
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-- 
1.8.1.5



