Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UKNJy-0002Qy-AF
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 07:25:27 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2Q68LEf027416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 23:08:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 23:08:22 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Mar 2013 14:08:19 +0800
Message-ID: <9fef0b6956131f49f87c927619c9c0d0e6d189ce.1364266108.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364266108.git.Qi.Chen@windriver.com>
References: <cover.1364266108.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] init-install.sh: remove unnecessary udev rules file to avoid error messages
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
X-List-Received-Date: Tue, 26 Mar 2013 06:25:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

/etc/udev/scripts/mount.sh is removed by init-install.sh, but the udev
rules file which specifies the invocation of this script is not removed,
thus causing the error message '/etc/udev/scripts/mount.sh: No such file
or directory' shown at a live install.

The /etc/udev/rules/automount.rules no longer works once the mount.sh script
is removed. So we remove it to avoid the error message.

[YOCTO #3924]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/files/init-install.sh            |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 2c4486a..d2a0db3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -57,6 +57,7 @@ echo "Installing image on /dev/${device}"
 #
 # The udev automounter can cause pain here, kill it
 #
+rm -f /etc/udev/rules.d/automount.rules
 rm -f /etc/udev/scripts/mount*
 
 #
-- 
1.7.9.5



