Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD1FD7DE8F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 23:46:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so1185921wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 16:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jkl42tlcTAl6TZ80Xcc6Bl7UAKya5DR7D3eMsDBaMRw=;
	b=qZppuBZR5ZVr9NQD+HWwqPU1g1rmIrUo4cLFWD4ed1eRN7QEtZYMhXNK4srP/Wpl6B
	woBgH4B+9StZd/7lZl7EupPT5u49bDXL6Do/1kn8Jv6FZp0fDLW45B8JnDNywtAN8PHu
	aveOZawUv6TNpC5QpspzxbUlpluMn05YQitWDs0odsOC4HR+Bg7LLT8Mml52QCn/rT3t
	3Cx6bddpAihef2kOElG+hKE60ZtzZsOVUm427xC+MqyZfYq7jxMG2c/uQgpT1V0bRStA
	g7+s8gKxzQj5XXX7S7DvdCQdZPCJHADlEJ2xbhUsHdfE0dYhvggm5o1GWW4drSY63Cvd
	1AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jkl42tlcTAl6TZ80Xcc6Bl7UAKya5DR7D3eMsDBaMRw=;
	b=AUUasLlLh+MwPIvZaKhd6pPhFnGkdsBVlWFvuu15t+7CztStkW63sEmyvbdET96eNP
	kpcj1Ih1sKrynW1zrGnE0+G8k25qIRqWpe1/EYEtCSz/w3ktXMdBkeI1LfJwsDw8EaQ7
	rM056W6h5GIZnj1xF3KY8AthwJnPfdNzkxNRipmCD3UNygPeT4vSq8U7c+0b4ZzgIDgZ
	Nuc9sxHpoAF/aIWxWAm/f/6jUD5pijgh+ULsMGDj5i2zkwJG/5c4jeVbIps1G+Ic/Qgk
	S68ICrcQ4TPJaZx9iwWTdIAGYxfWNAHUHNxiiMyekt1x2YJYh2Vi8XsDnKhIY4pMA+Jt
	ZzfQ==
X-Gm-Message-State: APjAAAXF3zAXzjaig3ZlrGglo/sskIJbZRNRVBxhi6Z594Pg6dHeqchk
	ZGNbUgsxa8Y65r2/B66HrjrKnv0qzW4=
X-Google-Smtp-Source: APXvYqy9nEpcJgysHu2fhxOK9hvPllb2OcJXerwSnWBTdNzdmSxl5zMBw//lJa9Q1pnOdsTzOUtruw==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr17674329wmj.133.1562629612480;
	Mon, 08 Jul 2019 16:46:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s18sm1024573wra.47.2019.07.08.16.46.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 16:46:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 00:46:50 +0100
Message-Id: <20190708234650.15687-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] buildhistory: filter out the unexpected prefix for native/cross sysroots
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
X-List-Received-Date: Mon, 08 Jul 2019 23:46:52 -0000
Content-Transfer-Encoding: 8bit

For various technical reasons, native and cross builds have a prefix that
includes the full path to the sysroot.  As these are stripped away before the
files are used in the sysroot, we should also filter them out of the
buildhistory report.  This both removes noise when sharing a buildhistory
repository between different build directories, and improves the accuracy of the
reports.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 5bf27268107..f986f7c7945 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -65,9 +65,20 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+#
+# Write out the contents of the sysroot
+#
 buildhistory_emit_sysroot() {
 	mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
-	buildhistory_list_files_no_owners ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
+	case ${CLASSOVERRIDE} in
+	class-native|class-cross|class-crosssdk)
+		BASE=${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}
+		;;
+	*)
+		BASE=${SYSROOT_DESTDIR}
+		;;
+	esac
+	buildhistory_list_files_no_owners $BASE ${BUILDHISTORY_DIR_PACKAGE}/sysroot
 }
 
 #
-- 
2.20.1


