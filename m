Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US78Q-0002DM-EK
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 16:45:58 +0200
Received: by mail-wi0-f176.google.com with SMTP id hm14so2682674wib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 07:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=SmZndVyqj+30XZxi7vcSHr609RT/vFfdmHQK+eQJvXU=;
	b=ifZn6rrhQ2O373lZDYbN48YM/p/pl5jEY/vPt2muv2YT2pNdCKm4WCFNaDf6SXxytd
	16pvdt6OhkCTotcmlIHIvHhZHdQRAhbNCFH/RDwPfKpmx2AnTRIEC5zPGvQ85BvyP3fF
	vut4nkXnjbu2AfVWZUs0K7qIaYq5NZJRXVS8G8Wz7/hnXePpbx7Pt0Icb44nMtgT84C7
	mv8sl+nClhoO2ZKtszYciyYk+JMtN+p08MO7a/P7ul857r7uiLpBf3er3CrOtjn7EJCu
	myAW/tbD67++ppR5BpELHq4q1vfonUrstKx9rEvl4zsPXwCS9LlBJfQcafKVHOMSWOSY
	eWBw==
X-Received: by 10.180.206.205 with SMTP id lq13mr4304715wic.21.1366122476026; 
	Tue, 16 Apr 2013 07:27:56 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id du2sm19826934wib.0.2013.04.16.07.27.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 07:27:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 15:25:03 +0100
Message-Id: <1366122304-32216-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmqeeyrxtgbWHkHO92Vd5jIuCzQNvYnZhSXbNpLSBeMF8yWxmB0fV5pJHDR8tseF9Xcjl7a
Subject: [PATCH 1/2] avahi: don't call DBus init script directly
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
X-List-Received-Date: Tue, 16 Apr 2013 14:46:06 -0000

After installing Avahi we need DBus to reload it's configuration.  In a
pure-systemd image there isn't a DBus init script to reload, so cut out the
middleman and just sent SIGHUP to all running dbus-daemon processes instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index d8d9a9d..c302f87 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -136,11 +136,7 @@ do_install() {
 
 pkg_postinst_avahi-daemon () {
 if [ -z "$D" ]; then
-	DBUSPID=`pidof dbus-daemon`
-
-	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 force-reload
-	fi
+	killall -q -HUP dbus-daemon || true
 fi
 }
 
-- 
1.7.10.4



