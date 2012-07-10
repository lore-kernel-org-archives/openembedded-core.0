Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Soc5Q-0004gb-Jd
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:10:48 +0200
Received: by mail-qa0-f47.google.com with SMTP id g1so2527330qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=5Sj7EXKjJhF9GIU7uaxBQL/x6FjmruK6uk7kCIZ212s=;
	b=gJrPOLTtTBLx7rKjgDyRUI5fgRa5uxt7gsCIOpGfpiuWhat93ybXt7UHiDKF/JTnak
	Gl6uTt9drobmYmaRhUl58fWd25MqHEVTTs6syj5F3TkbUPLx4OqxflsCv0X2UQ8YW3Vw
	C8du0RuDoxykXvPmQZMNy4+yHSfKOU5b4iHJbfNUn8gS1Nxtwc9Tchi6wS0z1X6ZVwU5
	0eOkIFcTSCvPIfCRwVVw5VxgY/wD74mxeQPm+Ro9IUWd/vaeXPbq3uJCtqrWW6tdXpb7
	3LsipfW9BqoExoE1aGdmsbb2a3RRmqdrrJCpKBkZwX7++2IR1SamY4qCQCwRAwXvLVzS
	BCEw==
Received: by 10.224.35.3 with SMTP id n3mr14982943qad.93.1341932380019;
	Tue, 10 Jul 2012 07:59:40 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n2sm65763443qap.10.2012.07.10.07.59.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 07:59:39 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 17:59:22 +0300
Message-Id: <d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
In-Reply-To: <cover.1341932186.git.andrei@gherzan.ro>
References: <cover.1341932186.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl5XzU9MsurM9J4c/DRIT11Epr+dnLWSu40hwit8LMTUc3nTBmEhrvnyeqjBoflj7Ebbp1e
Subject: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:10:48 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/busybox/busybox.inc |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 82137a3..17ff442 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -180,9 +180,13 @@ do_install () {
 	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
-	fi
+	case "${MACHINE_FEATURES}" in
+	*rtc*)
+		if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
+			install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+		fi
+		;;
+	esac
 	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
-- 
1.7.9.5



