Return-Path: <jhovold@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id BFE5260671
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:42:56 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id p9so2836230lbv.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=xGmRriPj6SCEiI5Npto5VBxETh6673J8INC6Ou+5BMA=;
	b=lyBoCXmSy8xej2F/8vZ7cYAxqsT+a24tYORBwV8/GNHV2W4amwXiYnLkbk3jO6lQCk
	nuX8qdEhh1XWag4D79bRwCBWxfu2m3pJLQ1+FI/fEkkgyph7GqemiBv3FM645EdFe1/1
	awUrMZSp4tTaSsQeSbRM19AjbW59bxsCZsGKPdD6/PsIsqkHCizkOBzmiX4qGi++GKYO
	JKq2Af/DCot31fhGiq3ier5yJ/V0tFDKFjbf3yhkPzigzoGbQm9Dzk1iIaj8XwWlkQ3S
	MHEbFry31ueWJA2EepQFsYKj3dF8k89q9IMtB6mM6JmOgXqgfPtzbSF0cPisvn3SWsLW
	y0JA==
X-Received: by 10.152.5.129 with SMTP id s1mr5405266las.59.1414165375550;
	Fri, 24 Oct 2014 08:42:55 -0700 (PDT)
Received: from xi.terra (s83-177-171-8.cust.tele2.se. [83.177.171.8])
	by mx.google.com with ESMTPSA id x1sm1973639laa.20.2014.10.24.08.42.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Oct 2014 08:42:54 -0700 (PDT)
Sender: Johan Hovold <jhovold@gmail.com>
Received: from johan by xi.terra with local (Exim 4.84)
	(envelope-from <johan@xi.terra>)
	id 1Xhgy2-0001lo-Ma; Fri, 24 Oct 2014 17:39:54 +0200
From: Johan Hovold <johan@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Oct 2014 17:39:40 +0200
Message-Id: <1414165180-6770-1-git-send-email-johan@kernel.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] udev: fix uevent-helper disable
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
X-List-Received-Date: Fri, 24 Oct 2014 15:43:06 -0000

Make sure that /proc/sys/kernel/hotplug exists before trying to disable
the uevent-helper mechanism.

Since kernel commit 86d56134f1b6 ("kobject: Make support for
uevent_helper optional.") the kernel can be built without uevent-helper
support. In this case /proc/sys/kernel/hotplug does not exist and the
current sysvinit script fails with

	/etc/rcS.d/S04udev: line 132: can't create /proc/sys/kernel/hotplug: nonexistent directory

when trying to disable the uevent-helper mechanism during boot.

Note that a single NULL-character has always been sufficient to disable.

Signed-off-by: Johan Hovold <johan@kernel.org>
---

Patch is against daisy-11.0.1 but should apply fine to master. All
branches affected.

Thanks,
Johan


 meta/recipes-core/udev/udev/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 410a650bd192..63e59d3950c9 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -97,7 +97,7 @@ case "$1" in
     kill_udevd > "/dev/null" 2>&1
 
     # trigger the sorted events
-    echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+    [ -e /proc/sys/kernel/hotplug ] && echo -e '\000' >/proc/sys/kernel/hotplug
     @UDEVD@ -d
 
     udevadm control --env=STARTUP=1
-- 
2.0.4


