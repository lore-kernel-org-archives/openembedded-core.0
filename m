Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B74AB6AFFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r649NE5n014244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2013 02:23:14 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 4 Jul 2013 02:23:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 17:23:11 +0800
Message-ID: <682bcd0939697c34ce9bc7b2fe8f7d734f280490.1372929722.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1372929722.git.jackie.huang@windriver.com>
References: <cover.1372929722.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] initscripts: overwrite default hostname.sh
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
X-List-Received-Date: Thu, 04 Jul 2013 09:23:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

/etc/init.d/hostname.sh does not have a graceful fallback if the
/etc/hostname file doesn't exist. Other systems such as Ubuntu and RH
will either leave the hostname in place, if a proper hostname is
already set, otherwise it will set the hostname to 'localhost' when
the /etc/hostname files doesn't exist.

As you can see we have to add some additional handling to provide this
behavior when the system's hostname command doesn't take the '-b'
option.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../initscripts/initscripts-1.0/hostname.sh        |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
index fb58c9c..78fb91c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
@@ -7,8 +7,16 @@
 # Default-Stop:
 # Short-Description: Set hostname based on /etc/hostname
 ### END INIT INFO
+HOSTNAME=$(/bin/hostname)
 
-if test -f /etc/hostname
-then
+hostname -b -F /etc/hostname 2> /dev/null
+if [ $? -eq 0 ]; then
+	exit
+fi
+
+# Busybox hostname doesn't support -b so we need implement it on our own
+if [ -f /etc/hostname ];then
 	hostname -F /etc/hostname
+elif [ -z "$HOSTNAME" -o "$HOSTNAME" = "(none)" -o ! -z "`echo $HOSTNAME | sed -n '/^[0-9]*\.[0-9].*/p'`" ] ; then
+	hostname localhost
 fi
-- 
1.7.4.1


