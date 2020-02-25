Return-Path: <eugenyshcheglov@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9816061808
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:17:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so14924227wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9N/8USCGLfzymCW9w6CrBWro9usoJqNAvuKGk7v3XMk=;
	b=CD3Rr5OW69VBG5MZX/y9813N2h7qjUP0RvYPTH4ZxFRw1y15TpKwEqrFMrDG0VSvnv
	iZuHt4dbMzslHwNJ0NAU5UFRwHhJbHSn/QSaX79LiVVDMLBPYAsdOA1hPXuEf/3LT+yj
	/KHImPTPjKMu7kajlj+rhwg3yKXs66dZva3XBVFFghod3ZQ9LzynIx19YX2M3guwJ6wL
	q65eR2zwazapenHoczdMFdhLy27fysgm5hSWAJoY0TIUEanyLTNCsIPUqvyXHLFsQt8E
	vWtHD88HCd79d4ptheLKFrbRVTcA5wtoSXzls6ypTsmGs61A0HHxip9+fZ60FhNFdDWb
	2L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9N/8USCGLfzymCW9w6CrBWro9usoJqNAvuKGk7v3XMk=;
	b=YPhVqVHbv6vi0pU7L8nxCy+U1iqsSPSPiinJHgvqFXFGfM2oYH29Nj0/8g1xNUwY6t
	0tSqAWtXjrXfT/QQvIlNMdy9TurIzI0n2OUHBL/kqOnfYhkA0nFDrafaM3pMz2umBSlU
	8b9M+f1BB0pr9PqfWMFLSA/TFRGM9JIGNRC358IaI0+mos1D3RQnXp8vNuuUkH3Iyg2Y
	6iJan8K6fuzssaKkYnWmnSwldcWfsZLIkClFIFnvJRQXflIguw8n2pSS0mkTpmOwPVWX
	eTu4nkPGI2qwnxx00MvJaujm+f5S0JAlmNjLbiMvALBYxJw5EeC2yV48ddRwsRxE1d+0
	rLWA==
X-Gm-Message-State: APjAAAUgS1B0Axp6xagf1nlNeUBKppYSC+LgS63elKW6vlha/YL5K5wl
	irEjZHlMmibzBnZ+K0SqrMDy1029oxk=
X-Google-Smtp-Source: APXvYqzzw+Wdei5C4imVhn68K2AHvbIoITwGPTAgGs9Ap7ixGAk+5C3RkcVBYlXsovt6hXcD/U7cMg==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr15589573wrs.21.1582640259000; 
	Tue, 25 Feb 2020 06:17:39 -0800 (PST)
Received: from holy.kyiv.star.global ([195.20.130.1])
	by smtp.gmail.com with ESMTPSA id x6sm24328188wrr.6.2020.02.25.06.17.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 06:17:38 -0800 (PST)
From: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 16:17:33 +0200
Message-Id: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] utils.bbclass: Avoid recursive symlink in oe_soinstall
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
X-List-Received-Date: Tue, 25 Feb 2020 14:17:38 -0000
Content-Transfer-Encoding: 8bit

This patch fixes an issue when oe_soinstall function creates
non-functional recursive symlinks in case library soname is equal
to library real (file) name.

Signed-off-by: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
---
 meta/classes/utils.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index cd3d05709e..dea824f54f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -25,7 +25,7 @@ oe_soinstall() {
 	libname=`basename $1`
 	case "$libname" in
 	    *.so)
-	        bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
+	        bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3 instead of libfoo.so)"
 	        ;;
 	esac
 	install -m 755 $1 $2/$libname
@@ -33,8 +33,12 @@ oe_soinstall() {
 	if [ -z $sonamelink ]; then
 		bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
 	fi
+	if [ "$sonamelink" == "$libname" ]; then
+		bbwarn "oe_soinstall: $libname soname is equal to real (file) name. Minor version should be added to a real name (e.g. libfoo.so.1.2 instead of libfoo.so.1)"
+	else
+		ln -sf $libname $2/$sonamelink
+	fi
 	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
-	ln -sf $libname $2/$sonamelink
 	ln -sf $libname $2/$solink
 }
 
-- 
2.25.1


