Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 621E577D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:47:00 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k67so132688789wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MasIiATivWIqG3kKbkpLM41tp2UIAUp3uz4dQk1ekqw=;
	b=ijtPaH1zBpawXvQedl+Z6ZIHUUvOPaoBEUta9gz8un8Gqq7pxir+fblTm3ypP3WmpG
	TXV6liWFo9TN6HFE5slHJJrBt93e0zwkSRGHEse48nRKzdBCtN+ynxWr4BBrY5KNU961
	Uba5C16SHs3gc/rdGcJo3fvGaukvkmS/sC/xnU6L9xoJK9wemIRTNITvCnRT2TzT8w2u
	miObi+2C1aCB0IVOnQ00LP4534+eMwovu1EysxP1itDujoQdD94INb9Z+nm5lUdNGNgB
	YWElzdpnVXDbYChYaBvjbSxZ38l5LKGQEdRgNnF/sW1xkCvfod2MsicnTzxH0dPEGpxq
	qvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MasIiATivWIqG3kKbkpLM41tp2UIAUp3uz4dQk1ekqw=;
	b=nBR0VYSOjaIK4vZ5avfxCnoCkLZqBsAHkQPxyQOjDgUA7kH9//8cS9f8ZbqNsGaPWQ
	Rfafc9pFFex464Mwyg2/bXJVw+4XuHI8rNDKTpKjzoLw512EV1Xww12ZxkA5/LunhLSI
	aRTaIm0euYSvUpssZnuOUrej3RQnYI0+Nb1ccWpNiMgY/qhfca0eBg6EcWvzI10vAkdd
	V5exO38xtyeHXqs8uc5reWHZ4dfdCNbXtyon3SuEuwqgF/EymwF97p6yLqVUqKNIPIaf
	88UUE99td+YriZS34UdbKBIkjd5oX3yF6JeOUVbqGBdmGSu4kYEvfaTPpDL2j87vVlFf
	dv2w==
X-Gm-Message-State: AIVw110hYd8CkoHKfaiamNtqMYeFbcWVA9GLUz6AxZ4wbATkFNDQe5ww
	4LlRm1hUFCwj2I4CiqI=
X-Received: by 10.28.7.211 with SMTP id 202mr7312463wmh.113.1499683621790;
	Mon, 10 Jul 2017 03:47:01 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	55sm17242568wrt.36.2017.07.10.03.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Jul 2017 03:47:01 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 12:45:33 +0200
Message-Id: <20170710104533.15467-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] initscripts: start bootmisc.sh at 36 instead of 55
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
X-List-Received-Date: Mon, 10 Jul 2017 10:47:02 -0000

bootmisc.sh is responsible for setting the system date to a sane
default. Currently, it is the last script to be run from the rcS
runlevel.

Problem is that the files created before appear to have been created
on 1/1/1970. Most notably, /var/log/dmesg created in dmesg.sh cannot be
properly rotated with logrotate which does not consider it a valid date
and stops processing.

There is no blocker on moving this script right before populating
volatiles because it just requires the local and virtual filesystems to
be mounted to work.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2e4f7e4669..a65f1b24a5 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -134,7 +134,7 @@ do_install () {
 	update-rc.d -r ${D} mountall.sh start 03 S .
 	update-rc.d -r ${D} hostname.sh start 39 S .
 	update-rc.d -r ${D} mountnfs.sh start 15 2 3 4 5 .
-	update-rc.d -r ${D} bootmisc.sh start 55 S .
+	update-rc.d -r ${D} bootmisc.sh start 36 S .
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
 	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
-- 
2.13.2


