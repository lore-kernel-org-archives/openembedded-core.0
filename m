Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 578B860111
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 12:18:44 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b14so77644192wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yS69JuDUlALpkTLZsSaGfOeduAuAsdiIQQlK68kQFE0=;
	b=uu04a+OsE365OjxnQQyYFhZmyIRJ+RV5bZHIRV5Me9cGpdhW5ZFEvSuHmPJz05VvEH
	1Qd0wKZP8j+DtqOdq9/CvzOR+WMn9so9vbaXCnxVJjWgqgeSCeDkpnXNx6DuUUSF7zNN
	Mf/y6Oe15kMrZB29ZGjFxtZ0QoBupTRqKrKLyKlWA1pY9da2jgadP2tWnlw61rusOfU4
	0gExXZURpi9PP0jQQhscTptB/YaDY6Ri9YbHPbHawN+RAe3cYbuE9VE0QbBocRi/cf9F
	+4NpdtBSY+qSH7rH7QTMiWxS7/zYHNTzpRBWj9ajTOYPom5aBqOARfzoIePyta/2aFjM
	OSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yS69JuDUlALpkTLZsSaGfOeduAuAsdiIQQlK68kQFE0=;
	b=Mzjh0XNIQuPveyemdv4YyuTJOCFBgbRCX0qbPEKE7WL+T8bY3Qu6mimDX9Hm80a9Wn
	NAG+TxxzQtuoNaabXDyiGFg0n0nqkj4RW9ti2AIZIFaxlpD8i3j1s/ujUoHq0uHNHepg
	lV5wZcjGI8erfT5uQm0qU+uBGCChNHavDF4/rpk9gwHi361Bm3sYQrw9UGLtpVtCsrbn
	y/OA5DL2+1u97v1rjrHkWaqFTUlAzuLnuz/4y843v/NivrpqbYY6WhZ40veIetcd20HR
	/FgdEMtyoNRyytPEnkg4AnMI5JO2vNEanmjIyCzaHUMpLkdYcsbNX9NmWNKJ2Lv+T72m
	lDDw==
X-Gm-Message-State: ALoCoQnv7UZeoVSB8y3A9xWYg5bgrUjLuEcMUir0Ja5FateIqbMx0H3dLeRxToZrT8QwG3sO5J4EIv+DCTGhgY0KkJlvzpZryg==
X-Received: by 10.194.78.175 with SMTP id c15mr42549552wjx.16.1453378724712;
	Thu, 21 Jan 2016 04:18:44 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m143sm2700963wma.17.2016.01.21.04.18.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 04:18:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 12:18:41 +0000
Message-Id: <1453378721-27571-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] sstate: display the sysroot name when cleaning for clarity
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
X-List-Received-Date: Thu, 21 Jan 2016 12:18:48 -0000

When cleaning old builds from the sysroots, also print the sysroot architecture.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 40b51fe..295e033 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -960,7 +960,7 @@ python sstate_eventhandler2() {
                         seen.append(stamp)
 
         if toremove:
-            bb.note("There are %d recipes to be removed from the sysroot, removing..." % (len(toremove)))
+            bb.note("There are %d recipes to be removed from sysroot %s, removing..." % (len(toremove), a))
 
         for r in toremove:
             (stamp, manifest, workdir) = r.split()
-- 
2.6.4


