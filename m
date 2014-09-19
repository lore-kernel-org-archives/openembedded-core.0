Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E20087144D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 08:10:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8J8AbTi025672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 01:10:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 01:10:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Sep 2014 16:11:08 +0800
Message-ID: <d3c30a19101eacd3c339a31578f9bcae81cc08fe.1411114143.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411114143.git.Qi.Chen@windriver.com>
References: <cover.1411114143.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] systemd: enable syslog.socket by default
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
X-List-Received-Date: Fri, 19 Sep 2014 08:10:37 -0000
Content-Type: text/plain

The syslog daemon behaviour in our systemd system should be like the following
1. If ForwardToSyslog is disabled, no daemon should be started.
2. If ForwardToSyslog is enabled, daemon should be started via socket
   activation. This is very important for OE based system. Because unlike
   other distros, OE allows serveral syslog packages installed into one
   image, using ALTERNATIVE mechanism to manage them. If the syslog
   service is started regardless of socket activation, things crash.
   For example, if there's 'WantedBy=multi-user.target' in the '[Install]'
   section of busybox-syslog.service file, then this service would be started
   anyway, even if syslog.service doesn't point to it. In this case,
   /sbin/syslogd in busybox-syslog.service might be from other syslog packages
   like sysklogd or rsyslog.

This patch is series of patches to implement the above behaviour. The
syslog.socket needs to be enabled by default so that other syslog service
could correctly be activated via socket activation at runtime.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 331da99..e3a0760 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -148,6 +148,8 @@ do_install() {
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	# Enable syslog.socket by default, this is specific to our system
+	ln -sf ../syslog.socket ${D}${systemd_unitdir}/system/sockets.target.wants/syslog.socket
 }
 
 do_install_ptest () {
-- 
1.9.1


