Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 96F7D78557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:20 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m11so4163615iob.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UI9lMDu3tuyZBQ227epFhAfTU0yCv+o/OCdl0zXq1ms=;
	b=eFyX5xpjBRnw33meyQph3kHTz9FHP4aeRnfu0DDd9YWSZj+jnSvx/L30qQb8QjvzjV
	3m5QdPwnU09mJRuOgIJM7Sgtn8Lka3c0+BZbikJ+lr86f0zPJV/des1YReZZY1fYJfJZ
	XWN5972Zfo6NWh0n5mUhrqMxz5tuRjcnNreJAXwuS0dnl2x9ZG6oBQTvLBUzeQCH53jn
	vZboGCETckFAhtqQPoYvK7fO8jn2/Nc48YGrjcFcqK1uDdXkLurAt9JJaerUNCGtuSNi
	wqTJw+fOxYwaABrDAebIybDw8vDrCqlv+THLabgH3p6DFdDBodV3DkKvT6pvW88Z6wec
	1cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UI9lMDu3tuyZBQ227epFhAfTU0yCv+o/OCdl0zXq1ms=;
	b=rO7OZU2XyW1OxdDUB0YULa/QDehhzZ4JmwEaunRF+3V9GdMEMR4R/B/5GeOA17itMQ
	wFBgXs7eM+qGz0CrIZvn3Yswmou9Sl0mKEcURApcOrV/P7ogppvLupDEM/8OfFds/m2D
	6X4wUv5i3mnfZDbI2PJJ+ySCzku8nwjYo6hZP2TCXBr0aKlxSdUJuGZkoLeW4Pjo/ijm
	Tosudn5A5a7DR/SXbZ8T9egN6yvIdIeRNC2vXiXE81OdeMJs8EpI5opaSqDSe0vLNbrA
	3SrwdSiAfrZH5S+qpRaOanlaDxUWhqJblSV6XIRwb9ohUOlttwLoMpsBU8V8gb0gtU+P
	JlBQ==
X-Gm-Message-State: APf1xPDsMWKPi8L9O4VFFKvv74nK3wEhWaQRk0bc+j00ypwzOMFBqpYo
	gQUurv7davoqEvccB8sOxVHv1HGw
X-Google-Smtp-Source: AH8x225IIhbE7aFx3s7FA80g00MZHhK1ZUicvavbeQxuJDR8BTp/dIgQWOYqj9D8a1xynF6uqfFmDg==
X-Received: by 10.107.70.25 with SMTP id t25mr4865301ioa.126.1517954601889;
	Tue, 06 Feb 2018 14:03:21 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:21 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:27 -0600
Message-Id: <01debcf29b2de5f0b9515408629f141d34adf22e.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 08/14] icecc-create-env: Archive directory
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:20 -0000

Taring up the toolchain is now done by adding the entire working
directory, instead of listing all the files individually. This is done
because the list of files may contain ".." entries, which tar does not
like and strips out, resulting in bad archives. This should result in an
identical archive to what was previously generated.

In addition, symbolic links are no longer dereferenced when creating the
archive, as they are purposely included to provide alternate names for
files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env              | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 0791bd54b27..426b093d91c 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -256,7 +256,11 @@ if test -z "$silent"; then
 fi
 
 cd $tempdir
-tar -czhf "$mydir/$archive_name" $target_files || {
+# Add everything in the temp directory. Tar doesn't like to be given files with
+# ".." in them, which frequently happens in $target_files, and will strip off
+# the path prefix past the offending "..". This makes the archive generate
+# incorrectly
+tar -czf "$mydir/$archive_name" . || {
     if test -z "$silent"; then
         echo "Couldn't create archive"
     fi
-- 
2.14.3


