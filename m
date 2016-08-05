Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EADD6700F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:17:17 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f65so35377499wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SkZQzMLoPpsSwsuKhWFu4eOtBN6usy4mSwxLEQbqBw4=;
	b=JPJKnOlv4fTPJDfG/dtdMnGDuUpl9ACE4UkAeCTjKDijrQrMobn3XjWQZjd1lLRWWM
	7rwxJ3h5H5eafl7gKsOxfDbbsMUrRh3PFeSlUj4aeKDgV6wjlw93FtIM0+QffWFNq7pV
	8BIpx61nwaVkf6Foc4YK7GtJpzgx4OgCX+4VJrzLuqFaOesrnW2lqZpJWCu4kAvVXe/h
	1k8oay0wpX3t7LQuDedpAy0RDmatHhsn+Yon+6LHbspwyLaFxGCMeYaoZ8zOLLgwIoYU
	1uRXiPSulsKUMTD+DCVE58VgWaNQyrH4BCxCiNE/q8mIUmZvHe+nxaoo7VqdHQbKt1eV
	pnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SkZQzMLoPpsSwsuKhWFu4eOtBN6usy4mSwxLEQbqBw4=;
	b=I+nZNxhxjttAIBXwsttSHEO42YsWGBFFQUmefCPc8gwR9UZWQcpov908qjBo5OncK1
	K+LaKsYKPw5KY09W+PWec8OZNYs4wnYgk+7ALbwlyqamjeMeHJPotu7Iwx2SM+GcEDFR
	x2bIkeFyyRMlfAQce+hSlfhK/GO6Ow53jyWTLQ8BeZ4495DXSQBLcrmd3HOK1ISFnZ1h
	iktb2nuqY9H7H+D9rU2qG70qVLJ/MNplia1gb0x9x3Iy76Gd/Z+bUlhxq5Ng38YJ8O/1
	JzwFLk6281Fvv8BzC+DvI5Tbl9ppHQFuV6r07OiicVVgciSWyXFc9SSxieA5dPGur+d1
	d6kQ==
X-Gm-Message-State: AEkoouulpueVyoUCQpBe47sPY8wEfa0R5EcJ6VIYev0fbW4/f0U2TGffWeJXNYMrNy4f4rv8
X-Received: by 10.28.20.77 with SMTP id 74mr4249927wmu.1.1470410237222;
	Fri, 05 Aug 2016 08:17:17 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm18285249wjc.28.2016.08.05.08.17.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:17:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:17:10 +0100
Message-Id: <1470410231-21681-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
References: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] autotools.bbclass: remove intltool.m4 from ${S}
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
X-List-Received-Date: Fri, 05 Aug 2016 15:17:21 -0000

We need to ensure that builds use our intltool.m4 as there is a bug in
upstream's macros when the host doesn't have XML::Parser installed.

So generalise the m4 pruning logic that we already have from gettext and add
intltool.m4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 22359d3..076899c 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -238,6 +238,9 @@ autotools_do_configure() {
 	# for a package whose autotools are old, on an x86_64 machine, which the old
 	# config.sub does not support.  Work around this by installing them manually
 	# regardless.
+
+	PRUNE_M4=""
+
 	for ac in `find ${S} -ignore_readdir_race -name configure.in -o -name configure.ac`; do
 		rm -f `dirname $ac`/configure
 	done
@@ -287,18 +290,22 @@ autotools_do_configure() {
 					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
 				fi
 			fi
-			for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
-				find ${S} -ignore_readdir_race -name $i -delete
-			done
+			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
 		fi
 		mkdir -p m4
 		if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
 			if ! echo "${DEPENDS}" | grep -q intltool-native; then
 				bbwarn "Missing DEPENDS on intltool-native"
 			fi
+			PRUNE_M4="$PRUNE_M4 intltool.m4"
 			bbnote Executing intltoolize --copy --force --automake
 			intltoolize --copy --force --automake
 		fi
+
+		for i in $PRUNE_M4; do
+			find ${S} -ignore_readdir_race -name $i -delete
+		done
+
 		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
 		cd $olddir
-- 
2.8.1


