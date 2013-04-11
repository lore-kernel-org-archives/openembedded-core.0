Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UQGOE-0006Pj-CS
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 14:14:09 +0200
Received: by mail-la0-f47.google.com with SMTP id eh20so338687lab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 04:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=YdTp2l+Zh9lVV94fp1WOvbgjNj7STpMDTuQyEgcdAp4=;
	b=O3gdqNOcztjLVQKVyM+6z20Q8ysKvAGGbtmeutXlypW43crM4VWYbHKbK8ExglvrCe
	TOumbvUDrJQfXImlmlJZ9BYcVU+820dRgH6QG+ExvFbvpDvVP85aE+3/MrbfH5HeJ//+
	JgIazU7xBjsxOjTh7U/mRispfrAyGLaKxI2bXWb6KzknkaxF10Df+h/0AHQTIiwRXico
	WRaMzi9VrYaL5eHVKfcoZw462m3GKFZQvYRVhF0GlyPTjsjCggcDb1r8azntAfAr9H6U
	SjEtKRKGOI7Ne6UZOykxVM54q7KrPzAeykoK0u9LgZtMH/ws77/DKAB/GFdrKkyCp08M
	edjw==
X-Received: by 10.112.145.8 with SMTP id sq8mr3172044lbb.55.1365681402991;
	Thu, 11 Apr 2013 04:56:42 -0700 (PDT)
Received: from erik-mbook.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPS id mq7sm1507806lab.1.2013.04.11.04.56.34
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 04:56:41 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 13:56:03 +0200
Message-Id: <1365681363-29778-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnoIhTacXC5gZSRV4ACIQ/V4KH29qvG2sCfKX6ppBcz7QIaVlcG8Hem58L7JCRVc7MSbvfH
Subject: [PATCH] systemd: Fix path to systemd-analyze so it end up in the right package.
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
X-List-Received-Date: Thu, 11 Apr 2013 12:14:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the upgrade to version 199 the location for systemd-analyze has change
this caused the systemd-analyze package to be empty and the binary was
shipped with the systemd package instead.

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 354e557..3ee1283 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -122,7 +122,7 @@ PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
-FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
-- 
1.7.10.4



