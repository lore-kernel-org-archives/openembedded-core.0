Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA2127D540
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 17:16:25 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e80so9926339ote.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=jthQnCbbJ6KYVHywNGv3d85g884mQVp8PH1g2spX1xV5Y8cog3QAwb0vKH2008xeym
	qi1aA5clwXFbHgnTGWmayeUh9sT2ZNhr9s5kO6HfM0Y2iHA2cwCy5eZec3guyIwStbE6
	wBFEtD0qtndTWRSij2PeAeB2cCFXF5FnL2oYesoDKL+lQl9LiW7eifVzJqPQ6xPow6JP
	EXU0Mh17UcbcR6zUz9r3Z8VuuL4Fk65wLqDIdfq0vIATV/3ZBwj2GDj4gCWwrubpNz66
	MigLvMmJtfWEhGqxMVRe9A+1I5xB8Vo7l6Ix7fUDi42x2jB0SfSkQBIACiwevUN1Swyn
	mqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5ixPpoq3AV+/jzp3iJZExiLv/j4+VgXUn74hK7zT1C0=;
	b=CGc+EYfQzOapDlP9UY5u4V8vU6fytfFYowu0KFMTUwOvWahxQKFw0TbfebyUOIq1R5
	osFkVgBhON0FjxU7AEBEtVzt9VRvWhq6TMOzZokH+h+6rPWWmyer2elbiHyqpvunUIDV
	9dE5spjo79nyYTMjLsFBKVq37alsGgSOvimDWzbvZ4/0XjmjlV4dOEOmPjtx/PUOyJMg
	1RhVRnkRXlsZgDLFLClZub/juQ1Ek3V5RH1NSxSgv2wfx8YrLbfXsmCSZmT8ABWAWD28
	3ek7ZCU3XkLSbhihdLFqDKfYb6r09xUZ6kCk1OGa7h/HCC8LujG9g+uHCBog03gPiqiN
	NMHA==
X-Gm-Message-State: APjAAAWCigjAJdxbumwUHnTasixyfh2CV7A4lwAsN7vunpMSt+TTz0n4
	pmszGBxjAVH541Gzr4cH9jir4iZU
X-Google-Smtp-Source: APXvYqxkkkiMdK68dfgHXZn2ADqtxkyqOvzDQxdmEYndA68o9a/cm5GkCH3QnFS3YyH4M8wDhL/moA==
X-Received: by 2002:a9d:2f42:: with SMTP id h60mr16634150otb.280.1554657386848;
	Sun, 07 Apr 2019 10:16:26 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	d70sm14952535oih.18.2019.04.07.10.16.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 10:16:26 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 12:16:00 -0500
Message-Id: <6019950905909dd5e097c4543eebefdfbbbe0e54.1554656203.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554656203.git.just.another.mariano@gmail.com>
References: <cover.1554656203.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] busybox: Use PTEST binary directory
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
X-List-Received-Date: Sun, 07 Apr 2019 17:16:26 -0000
Content-Transfer-Encoding: 8bit

This will generate the symlinks in the ptest binary directory using the
ptest class functionality instead of generating them manually. Because
the ptest class uses update-alternatives to get the metadata for the
symlinks it will respect the use of BUSYBOX_SPLIT_SUID automatically.

[YOCTO #12597]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c9d25ff1ca..174ce5a8c0 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -347,24 +347,12 @@ do_install () {
 	fi
 }
 
+PTEST_BINDIR = "1"
+
 do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
 	cp ${B}/.config      ${D}${PTEST_PATH}/
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
-
-	mkdir ${D}${PTEST_PATH}/bin
-	if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
-		while read link; do
-			ln -s ${base_bindir}/busybox.suid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.suid
-		while read link; do
-			ln -s ${base_bindir}/busybox.nosuid ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links.nosuid
-	else
-		while read link; do
-			ln -s ${base_bindir}/busybox ${D}${PTEST_PATH}/bin/$(basename $link)
-		done <${D}${sysconfdir}/busybox.links
-	fi
 }
 
 inherit update-alternatives
-- 
2.19.2


