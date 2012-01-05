Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitGE-00087E-Cf
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:46:03 +0100
Received: by mail-gy0-f175.google.com with SMTP id r17so368633ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=pyaIZDMrkf8pn39F0oj7J8RfZvqtssL6RtZSNSNERM8=;
	b=DUDvH+uQr5XlyvEr80Icj6cjqSjGneCgt3OjFbk9ha39VzJ0TjRhOcyx+ZbZfM9Dxu
	v/Kp58XBDdbu55zQza038cDu+FneRvBVZRddWAfF1STf+CR0ehMuJno6t9VpS19E1LgJ
	woGeq5FiuMMcVchTB3FWVF+SqfDdLav70ZQNc=
Received: by 10.236.181.168 with SMTP id l28mr3731283yhm.53.1325792321095;
	Thu, 05 Jan 2012 11:38:41 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:58 +0000
Message-Id: <34562928a48ff23e9ab8b0262cdb136ee807044c.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 08/10] udev: ensure /dev/pts and /dev/shm does exists
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
X-List-Received-Date: Thu, 05 Jan 2012 19:46:05 -0000

---
 meta/recipes-core/udev/udev/init |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index bfbac0d..6a4464c 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -30,9 +30,10 @@ echo "Starting udev"
 # mount the tmpfs on /dev, if not already done
 LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
 	mount -n -o mode=0755 -t tmpfs none "/dev"
-	mkdir -m 0755 /dev/pts
-	mkdir -m 1777 /dev/shm
 }
+[ -e /dev/pts ] || mkdir -m 0755 /dev/pts
+[ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+
 
 if [ -e /etc/dev.tar ]; then
 	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-- 
1.7.2.5



