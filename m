Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0979E72F56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:44:36 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k6so3763782wre.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Toa1XyNDYov+Ag8XwAlRMx5VVbsVznO23E7p8rhHVZ0=;
	b=qmWrKBxNqaTaSZwS6/pxH/0RppZ4owDvEB+S2kZ2Gxfy/A7DCcrgTM0QBxJqsKeYgp
	UROoavnTnTbFMWfT+KNKK5TYmF0tnQemxssS65dGFuWUeZI2BtmR3ZTbDhNNYH0AonhV
	q2YytaDLrTtzp//jImmtHwbq93awxVdQD5cLkjocyrOeS1RPOfDhdrV4pq2vZkEFMHfr
	hUOTB1+AsCXAsYBXbTjM9wFhxlqv6s5g+AL0RRY4/7qM/HjP0hclDtqqYIPVdRapm4/C
	OS2Bu2Mq1nyTp7qZ4PxTRibr/knJsL89SYSHUthww08fmVS75zkXi9XX87RDfifo2B9k
	cVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Toa1XyNDYov+Ag8XwAlRMx5VVbsVznO23E7p8rhHVZ0=;
	b=Ea58WvZkxI5wWYS9AnJexmLq3Xpd+kODAwBTh6+UsQbenvZSiQ005nTDNm3YSgdyhQ
	4WanoiRVnw6tVF2TjmwixKMI1+m0qx2WtI7YRgoRRp9ncx3+lY8dY8oZ4ejb4VThZ5gU
	g7M//lAI6HBKbGxaY/ZngqShy4eBVMUYvAiLbN2jYrsDMlOH2NFGCWbTsQiKCYbG76Br
	0EBSg8ybTy7W/L3XnKLEExdFHNRP+4RoSlaOwmKn8h1xaLas0ZgBxQ65qD7opeuuxgxE
	Sft1q2QlLNmmMFXYPGDrw8m9+5rdwbxgq8SpGSLbOHYHlNNtcnDL8d2kkKUes8FRXqO8
	JlWQ==
X-Gm-Message-State: AFeK/H3WTKfD+zVyQygAwkr+jaG/6d/NUmTLHyfSd4pqOMc1COe4MuTSHABT2r49TG5mCQ==
X-Received: by 10.223.130.102 with SMTP id 93mr27039035wrb.59.1491407077731;
	Wed, 05 Apr 2017 08:44:37 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a66sm4870913wrc.58.2017.04.05.08.44.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 08:44:37 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 17:43:07 +0200
Message-Id: <20170405154307.8557-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] package.bbclass: add CONFFILES to pkgdata
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
X-List-Received-Date: Wed, 05 Apr 2017 15:44:37 -0000

Emit CONFFILES variable in pkgdata, or else the get_conffiles function
will return 'None' for some packages instead of the expected value. This
is especially true for optional module packages.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1bc4f6a4dc..cc466bd1b2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1380,6 +1380,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'PKG')
         write_if_exists(sf, pkg, 'ALLOW_EMPTY')
         write_if_exists(sf, pkg, 'FILES')
+        write_if_exists(sf, pkg, 'CONFFILES')
         write_if_exists(sf, pkg, 'pkg_postinst')
         write_if_exists(sf, pkg, 'pkg_postrm')
         write_if_exists(sf, pkg, 'pkg_preinst')
-- 
2.12.2


