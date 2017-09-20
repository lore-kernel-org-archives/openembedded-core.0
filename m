Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14C0E78112
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:42:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e64so1901379wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WEty17Ltdu3+ncuFmUH2CIUUHd3h3mla+N7m66eL7sQ=;
	b=rhQAcrgNpfjSnenK7rrPtKCK7mNXB3VceUJbMElwk9fmdr3D7eDeE/YdqqRB/oLysc
	pnXGXChJUd6KCoDW1r+zvooagfZjjzeKfaqCrNIG64yuFuL5N7QI+DatP6yM4xF7d14C
	gUuop+Sbap8BtRL3xC+iBj8Fl80u8nqPb2n5YU6aSx6uUvsH9dgH/oi6KU6C9XQTl3dU
	SFvoVaSWkhIKet5CB7XOySE15EwgyPnVQLPnkgYGlA5+o4k1M4fbLXJV5A6XfSNVDY0r
	EHfF+1Xd6x2Q5ev0zH87JK2pzIsU8hGCAboWso+qeqy44UEU6TqXOWX5zoAAYCgp0R22
	kBcg==
X-Gm-Message-State: AHPjjUigiurXJGJbtmsP0REsG97UQniBeQfaFdQERS3XWSrUeaRPOx8W
	tyZv192X7IHi/gV1WSvaIoFag1fP
X-Google-Smtp-Source: AOwi7QDsZYrplP8QTpLnhgfHrk+gfH+GmbBcoj4Oy+qXNMo/stSee7/kAuLO7wF3xo8U5PJn8JJeog==
X-Received: by 10.28.131.13 with SMTP id f13mr3709765wmd.157.1505900523556;
	Wed, 20 Sep 2017 02:42:03 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k52sm1467558wrf.62.2017.09.20.02.42.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 02:42:02 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:41:57 +0100
Message-Id: <20170920094157.11340-5-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920094157.11340-1-git@andred.net>
References: <20170920094157.11340-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 5/5] kernel-fitimage: support MIPS (compressed)
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
X-List-Received-Date: Wed, 20 Sep 2017 09:42:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

On MIPS, the compressed kernel image target is vmlinuz.bin

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-fitimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5583b4472e..179185b6b2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,7 +7,9 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "x86":
+        if d.getVar("UBOOT_ARCH") == "mips":
+            replacementtype = "vmlinuz.bin"
+        elif d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.14.1


