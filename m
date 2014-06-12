Return-Path: <drew.moseley@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id A2A206FAB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 18:25:26 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id ma3so1008471pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=haeJ154fSEXZ9hdi0HZNMrmJ0RjZXiOpxyXeLyacCqI=;
	b=V1/qkABsO1FS+8owRJEAXty53R+924ZPSDpMFobgW92eVUT95B/D+ktoS56f6LDlzt
	pb2sFEnnDjr/wj0BaUGRM4xGn+zwNI4S3touaEyIz8yZhd6dSKL+OJC1+YArcQdLZkjU
	I0OspZqDG2vbJNVLlQvfR68sz9WKssJ9s5GI/ASJo0NXaaJAicCl6+7sjDr8+cjcTMG+
	weaJ7QtHk4eI0kXe4DQjTranphW8S92fUsr2fY+/F5jSxMTZieQna4IIcTXowqCgJwhx
	hQwhFqfyw+1DSx3SNV1A+vsVmhMf2zOk9Ptr84IEC8u3u/9zK/mJVaeCAwXsAmcPfXJX
	iYtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=sender:from:to:subject:date:message-id;
	bh=haeJ154fSEXZ9hdi0HZNMrmJ0RjZXiOpxyXeLyacCqI=;
	b=P83mimD5cc0wjYyqISHigVUUNB9KLhh4mPMJ9/u+Tv7J3OIo2yHsHayAFblCvZkZNN
	U51LpThvwLfw6gCIMsi9AcoVpZY1Iw1xSOyDsLOUhHVJAu/m3tA9gygISz7jWjyPLIF1
	UEklwxnocT34hqWf/QQK2RLvTXiOuhoysdpBY=
X-Received: by 10.68.219.162 with SMTP id pp2mr14538704pbc.47.1402597526885;
	Thu, 12 Jun 2014 11:25:26 -0700 (PDT)
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34]) by mx.google.com with ESMTPSA id
	zx1sm81613059pbc.60.2014.06.12.11.25.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Jun 2014 11:25:25 -0700 (PDT)
Sender: Drew Moseley <drew.moseley@gmail.com>
From: Drew Moseley <drew@moseleynet.net>
X-Google-Original-From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jun 2014 14:26:13 -0400
Message-Id: <1402597573-32451-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bluez5: Force obex.service in /usr/lib
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
X-List-Received-Date: Thu, 12 Jun 2014 18:25:29 -0000

Upstream bluez installs the obex.service file into /usr/lib
regardless of the multilib settings as does the current systemd
recipe.  Make sure it gets packaged properly.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index fa6f08b..c3dd946 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -56,7 +56,7 @@ FILES_${PN}-dev += "\
 "
 
 FILES_${PN}-obex = "${libdir}/bluez5/bluetooth/obexd \
-                    ${libdir}/systemd/user/obex.service \
+                    ${exec_prefix}/lib/systemd/user/obex.service \
                     ${datadir}/dbus-1/services/org.bluez.obex.service \
                    "
 SYSTEMD_SERVICE_${PN}-obex = "obex.service"
-- 
1.7.9.5


