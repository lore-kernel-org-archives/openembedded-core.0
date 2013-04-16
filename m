Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US78z-0002Ge-JR
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 16:46:05 +0200
Received: by mail-wi0-f172.google.com with SMTP id hq17so1934002wib.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 07:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=iP43cpupQQGRbkj8H0qqV6JC7HK9Tz3n+qa7Nv7zG1g=;
	b=RZ9O/dibnNhhkcHmYL4Eb5w0XHUlDnOR9J4m9hwesE9Xw39dGsRmHH0792W57gYkhu
	yg78LV3f/SCmwr979GfS7qUCa3IFKeOH47pWSmd3QECbuIB9YoR1XwGAI8+qxmv+lnrg
	vPBs3dPQJAQSPGIfE6JMJblwbsneCl25BrLl9ircw9qSYYrlUrIHtX8IV3WQKev6Af96
	tyjPY5kbwt+tpI0cOOepTYbIU8L7Gzxqf9du1a2qJQ2ll/9EPwPQ9xtHzFGECOoS3sOO
	jbrCfPderUexmHQZ/yZQ5SntwOu+EVW0/R0Ch11zmWq+SaV+tuvSbILXYTNcNctJj1rs
	9qSw==
X-Received: by 10.194.177.200 with SMTP id cs8mr4429784wjc.22.1366122511494;
	Tue, 16 Apr 2013 07:28:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id du2sm19826934wib.0.2013.04.16.07.28.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 07:28:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 15:25:04 +0100
Message-Id: <1366122304-32216-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366122304-32216-1-git-send-email-ross.burton@intel.com>
References: <1366122304-32216-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmG+wcTUZOhfalz9BL5w82SsQMzo0gs9AvrygQ9hmu9bJ13KMzSlbg509sQlHKjAA5mShIT
Subject: [PATCH 2/2] wpa-supplicant: don't call DBus init script directly
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
X-List-Received-Date: Tue, 16 Apr 2013 14:46:08 -0000

After installing Avahi we need DBus to reload it's configuration.  In a
pure-systemd image there isn't a DBus init script to reload, so cut out the
middleman and just sent SIGHUP to all running dbus-daemon processes instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index dd85057..e5f7881 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -84,9 +84,5 @@ pkg_postinst_wpa-supplicant () {
 		exit 0
 	fi
 
-	DBUSPID=`pidof dbus-daemon`
-
-	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 reload || true
-	fi
+	killall -q -HUP dbus-daemon || true
 }
-- 
1.7.10.4



