Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C46D9702D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:18 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so2508369wib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1XSAhsFg/Jb9Cj9VWT9hzfQaif+qZ197lJpmLJK6bFA=;
	b=ASQoCVbMA5tW4I4uP/aN/UUxXjmyu4TEGiL0rM17dGbiwN4/KO07FZyPdbWQAD2SYi
	bckG4j196qhUrKQNiIdJlFjJROCLRbyBVbIZgwryr9JzUJq4iOUSTar5Ny8QLVn47aaq
	cgwydGSs9D0ecFlh4nQw6gaPhYcdLNs/hBOOT0m42qmyRgtNa//aOM/l2TSzlyW/1s/p
	njDwjl42KEoNPsIRLLd+vMNJs+DGDbtVkL3v5M1lGuguh/GEJNOI3C4PDGiJUH5fTWgo
	X6yzUCaKXj4bdKJW1/iwWmWKrxJu8utqPKQMDv1Pv1we4wcMfeuQ96YjU7SD2y0IvZuy
	bwkA==
X-Gm-Message-State: ALoCoQllJK+ZWILJfYfxMBE4NYpCvOJhK+HMZb7YoObLlcbJ+FCiv3K6IArBk6XZnI9/paJfemr1
X-Received: by 10.195.11.234 with SMTP id el10mr34620431wjd.95.1410177559745; 
	Mon, 08 Sep 2014 04:59:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:39 +0100
Message-Id: <c1a4a58225d2ccebbbef85eced6db3c14226116a.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 21/27] bluez5: Allow method calls over dbus for bluetooth daemon
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:20 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

This patch changes the dbus policy settings in order to allow
calling methods over dbus. bluez5 and pulseaudio rely on this
mechanism to configure media end points. Previously bluetoothd
was failing to configure the media end points with error
org.freedesktop.DBus.Error.AccessDenied, due to which bluetooth
headset and smartphone were unable to connect in A2DP mode.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
index e21e72e..26845bb 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
@@ -11,6 +11,7 @@
     <allow own="org.bluez"/>
     <allow send_destination="org.bluez"/>
     <allow send_interface="org.bluez.Agent1"/>
+    <allow send_type="method_call"/>
   </policy>
 
 </busconfig>
-- 
1.7.10.4


