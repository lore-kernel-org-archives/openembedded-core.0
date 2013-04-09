Received: from mail-we0-f177.google.com ([74.125.82.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPb5w-0004j1-4W
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:08:33 +0200
Received: by mail-we0-f177.google.com with SMTP id o45so5445377wer.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 08:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=T3pFugQ4GJqhbG0KTXOwwqZ9q9swCK9kaJ4tqSlE7oM=;
	b=P9u2K/uDPFMWg77ZeSq5r9e+tfokIhUGVdZNdr1rNtyFBGHo9nHF1OOCaV0VP0757v
	FDo3v2IOuiB2NllcLSv3YYTfUXWZUQ0xyU9WlDg90M67fjiQosjPhrXjoT6oQYsxsTdk
	zwdKRJNlfRqETPvK++G5s2aRmm0g+70QXBp+1sjDtkZIaRdQirleKZENKYDbCWAv7ETF
	ZCn3HKAxo/usd0eZpbWtl+DF0Yn0egLaXUwmdSYbq/ub6R8u37nnTCD5GSUej26lmpPe
	2WDwUMPTzwyRF7y/KAKPLKSF9X/NZnshyLXiHHYvB0g/9jD14TqiZxKdT8hDgEmD8oSM
	SNUg==
X-Received: by 10.180.82.68 with SMTP id g4mr20523944wiy.26.1365522667743;
	Tue, 09 Apr 2013 08:51:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bo1sm29719582wib.0.2013.04.09.08.51.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 08:51:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 16:48:21 +0100
Message-Id: <1365522501-7439-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnvXsqiDaIHle7dNTGycLeVxXDwd5FJ6mgAcuJqlrSgpWwCxydUwsbWQ3a6J1aOm+FU/sFF
Subject: [PATCH] systemd.bbclass: restart service in postinst, not start
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
X-List-Received-Date: Tue, 09 Apr 2013 16:08:39 -0000

When upgrading packages it's possible that the service is already running
because opkg doesn't actually execute the prerm hooks on upgrades, which is
where the service should be stopped.

Handle this case by restarting in postinst instead of starting.  If the service
isn't already running then this doesn't make a difference, but if it is running
then the service will be restarted.

[ YOCTO #4213 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 69eeb9e..8084251 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -31,7 +31,7 @@ if type systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl start ${SYSTEMD_SERVICE}
+		systemctl restart ${SYSTEMD_SERVICE}
 	fi
 fi
 }
-- 
1.7.10.4



