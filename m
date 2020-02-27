Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id EA07561879
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:15:41 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id d62so837621oia.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=//MRWI0TfQO0W9FDRAq9cKsRa+6M63hDDREh46Q4xlY=;
	b=jy1SEqrha89cymo/6QnONbNb9DPX8bkReOmh5TjqwPXPlfqEagoC8+vbIoLaYLp0ei
	iQiSzR6lUYdILTGM9faKAYEFON+UJSu5t/3kbnWJamYdiUkV7sfzlL1HMxUTPvwip6/g
	mqY4bk2bzndptkI3d3H9a6U9iVLKJ8tOPpbgucFgU4L5S6MtqI/c5MKeIex9/4xsYSdE
	q3frK0a6XJiPERkgtYXtwCva5RhyXgbDgTFJjby26ZwnEV8yw4NnbKlffblBvdr8bXj+
	bWsqWtkmzQAeG4c5adawFqcj0jflG44wsn/x3XHY9lnvLhEm1MIRagRpbXdH2+IyL7Xs
	0wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=//MRWI0TfQO0W9FDRAq9cKsRa+6M63hDDREh46Q4xlY=;
	b=r+jEVjsStiUwTlt686VfLijlqzCgCfRg9jCjMoQQM2vcRaSeehuvoX/NRCUqA/mBbo
	VCNtYhi47rgiugQiZeFYcAJ2Rfb2y56u0gvC0txHepHAMwZAqkl+WT+y9rS99O8gOw3z
	XJ18ujgCXSr5Ol7auQ9hAMOeznFGpm4p876ItaHz04JZ80h778st4zbMFQhLKBueX2J3
	QlLuCMODqCHF7h7izb6Jzw5DkUhvg4H8NblNezM9SMnR3G5/WdHbKNDwx+oGt2BgDowk
	3qdGy0KVekp1lPwWbdEXLOeShZSU+T1cAP5T7y4ngbuVPSDRCRBcMQahu7Svjxwf6WNL
	D8/g==
X-Gm-Message-State: APjAAAX7k6gAKEAwx9o4UczhAf71YvxSgMqHiiifwJNw+IdR2zdhB/eh
	MAozlrn5AsST/CUrdP6rYIVR6LjI
X-Google-Smtp-Source: APXvYqytj7N0V3pKDd5SJhXAXMHIXZG7LRZSRF9thFSIU9io/lsjKQIR9Qxjm6eak+N4Xo/iYicD5g==
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr921998oij.4.1582841742667;
	Thu, 27 Feb 2020 14:15:42 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	t132sm2447995oie.8.2020.02.27.14.15.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:15:42 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 496E32A05A0; Thu, 27 Feb 2020 14:15:41 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 14:15:35 -0800
Message-Id: <20200227221535.8622-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227221535.8622-1-jpuhlman@mvista.com>
References: <20200227221535.8622-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] lsb-release: fix likely reproducabilty timestamp
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
X-List-Received-Date: Thu, 27 Feb 2020 22:15:42 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Remove timestamp from gzipped manpage.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Remove-timestamp-from-manpage.patch  | 25 +++++++++++++++++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch

diff --git a/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
new file mode 100644
index 0000000000..e7ff00d132
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsb-release/0001-Remove-timestamp-from-manpage.patch
@@ -0,0 +1,25 @@
+From fb0b58be938bab5571ac0bdec3725f6d88b07e9f Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Sat, 22 Feb 2020 19:01:28 +0000
+Subject: [PATCH] Remove timestamp from manpage
+
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 04fdecd..5be8081 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ man: lsb_release.1.gz
+ 
+ lsb_release.1.gz: lsb_release
+ 	@./help2man -N --include ./lsb_release.examples --alt_version_key=program_version ./lsb_release >lsb_release.1
+-	@gzip -9f lsb_release.1
++	@gzip -9fn lsb_release.1
+ 
+ install: all
+ 	install -D -m 644 lsb_release.1.gz ${mandir}/man1/lsb_release.1.gz
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index 52e30267f5..a06cbcf845 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://0001-fix-lsb_release-to-work-with-busybox-head-and-find.patch \
+           file://0001-Remove-timestamp-from-manpage.patch \
            "
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
-- 
2.20.1


