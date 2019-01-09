Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA2227BE39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 20:31:13 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u89-v6so7675242lje.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 12:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IVxq4nPepr1V3LUmFTw7FRN7asFlHNUuBZu4Y3xE0HY=;
	b=Z11TGml6yqXEbFN1z075cFa6E4QN98x97MjhW1sojxJkGyMt8Desav16C+rSHfr1D6
	OkckKP0QPQT84nHtU3N93Eh14NpwDPPTmK7ksrgXUMZ1ZZe8nRJ6ZdR7+oZdvn108mSU
	FEOX0pm3EBlWlx36C64VM6tXut30qrVTxu+TTMFZYktWf/4zVMpW0nlyL3MIFpw5IkdR
	AUmVdy6WVMQ1n5AKoSxZdK0jjI0YyUM8eMZe7CnUCrmFuyhXl3+dvCEdy/3ipcnph0hz
	GRmA6wekroz2TJZ8zA4R69b3b0vfdZWZDRVuVR5TYOyaaMq1mPM/tM9B6P1MTkkCfZp0
	q3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IVxq4nPepr1V3LUmFTw7FRN7asFlHNUuBZu4Y3xE0HY=;
	b=hRvsh2ABnVr2xBZzrifNVm/UykcphQsZ0XjmZJHIuxvyGBy8acw/UOTDbaf+LGPB3M
	eO7NjoATzK7YnaZokChZR+H2NX0YETR+lRkE6OXKCRCTmZfJx3cSTSPHe1hjJ6ReQDos
	zJMi6C0J4mAneys4XRPurMOUattIBh2H22NuI1ajhXpzoVnpm7T87SM89L/il6vadM/8
	gJqIn10Us4SddxAm4dpZxv5TVAnjUBjTLjYol9UgbgUNWtTUzWflG0x7GlcwfXqVlQmU
	q4kxsL0U2UoXZt20WKJaDObYSRL3sTwisUgdihHxUtFzG6OTUx5oPLlxcdzR3LSzXGA/
	yvgA==
X-Gm-Message-State: AJcUukdETwRAg6RWedrqDle0AeT+oluOjulUmvtsDmiQZTqLP/bSYbhv
	8Vl9/j0va1CDGFTQzgxUVD37qNnEz0g=
X-Google-Smtp-Source: ALg8bN7VpqAbxFfaGg5SiiS2sA+jWkTDnBBuzOkapvLCieDNn3pk55N86KnXNdPLYm0v3gTWclUIiw==
X-Received: by 2002:a2e:9f56:: with SMTP id
	v22-v6mr4215331ljk.114.1547065873950; 
	Wed, 09 Jan 2019 12:31:13 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	q3sm13887132lff.42.2019.01.09.12.31.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jan 2019 12:31:13 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 21:30:51 +0100
Message-Id: <20190109203051.12258-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190109203051.12258-1-jacob.kroon@gmail.com>
References: <20190109203051.12258-1-jacob.kroon@gmail.com>
Subject: [PATCH v2 2/2] buildhistory: support generating sha256 checksums of regular files
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
X-List-Received-Date: Wed, 09 Jan 2019 20:31:14 -0000

Introduce 'sha256' in BUILDHISTORY_FEATURES and enable it by default
when doing reproducible builds.

When enabled this will additionally create:

  files-in-package-sha256.txt
  files-in-image-sha256.txt
  files-in-sdk-sha256.txt

containing the sha256 checksums of regular files.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/buildhistory.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Changes in v2:
 * Switch to sha256
 * Let find only build the arguments and execute sha256sum once
 * Use single quotes in inline python code

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 33eb1b00f6..84f85da0bd 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,7 +7,8 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
-BUILDHISTORY_FEATURES ?= "image package sdk"
+BUILDHISTORY_FEATURES ?= "image package sdk \
+  ${@ 'sha256' if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ''}"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
@@ -526,7 +527,12 @@ buildhistory_list_files() {
 		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
 	else
 		eval $find_cmd
-	fi | sort -k5 | sed 's/ * -> $//' > $2 )
+	fi | sort -k5 | sed 's/ * -> $//' > $2
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'sha256', '1', '0', d)}" = "1" ] ; then
+		sha256filename=$(echo $2 | sed 's/\.txt$/-sha256.txt/')
+		find -type f -exec sha256sum {} + | sort -k2 > $sha256filename
+		[ -s $sha256filename ] || rm $sha256filename # remove result if empty
+	fi )
 }
 
 buildhistory_list_pkg_files() {
-- 
2.11.0


