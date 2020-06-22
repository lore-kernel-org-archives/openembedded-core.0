Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.382.1592848832692300196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XV03R64l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id v13so13807190otp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X/T7BSAK7oIiaAadSUVVAI+gWsrbrgw4I7kM4IIdYBw=;
        b=XV03R64lLlqFV7hSG3Q2XWvE0lKffgIPe8ba535sVw0SGft0HM5N5HxLnyDAnV3HcG
         WlLQnK+ouGnSZpKFp+g5rP7apOxohwqD+ZUywH0onMiidLvNYzVNDrmiSQOiaGJp21jn
         TRj/e2o/cKZk+xi98BDHsdS3UbSYWEN9egHVnq4y4vqGOLq0nwjl1b9SDdHTWLZcVP4J
         5XgbywUXhu7G7O8iYBBcuovkr5Uj/3BmyiZ1YV6StFqKTIFho09UTvfg5LkWp8AR+8Ve
         IB2s/1NPOEsGiMQhKxJwn8GJN2L2hnbpwemIDX32R2ZS9e4BGRKs4PWrq9Ybfk45Qyko
         K66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X/T7BSAK7oIiaAadSUVVAI+gWsrbrgw4I7kM4IIdYBw=;
        b=i0qDTSpYOcFOwFn0D23vs9KHhpKVRxdr05Aw0C/+UR1eQ+pqJ6UsNzkrc+zn/+FZu4
         dJ77c/bXXgw4J4NuJ7MJxMjnnrSKW9SrF23M8Fq5PwpowlZZ3iHJsWrec6x1x7Z8Xh2o
         4v0vQcT96gPyPpxOoCtbneX6jjRlm8tDRM2vtDlHfte1z264rWvPIcp18VcUml+qAJEh
         WgyvggFSiE88ouSN07tP67ICb+8+l4JY4bFkgM+vr4k2SKqC1QoXQwK8qKu3XXbBqpFm
         gSKaLT/esvFxKMVs54132byV3Tc+F1lYSIKa5ydzf3NImoORFwhiteK4h5uEGQH40U2u
         h2DA==
X-Gm-Message-State: AOAM531S66C16naG0wBZpyz04wB0dyjQE3HncfTfs1rf72bosvlOIM9A
	LFwz1m9a5+lxnddwBcRuZLIh3tTiPiqt9A==
X-Google-Smtp-Source: ABdhPJwGKYo6eX1oCyDOR/7M6hHyhzixp3G4HIiJHSAq/iKZvMzoKAsfQZMG/DPK0+ILmLDbH7vgVw==
X-Received: by 2002:a05:6830:18db:: with SMTP id v27mr15308985ote.75.1592848831593;
        Mon, 22 Jun 2020 11:00:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/33] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Date: Mon, 22 Jun 2020 07:58:08 -1000
Message-Id: <ceffd920c7bdae29cd1a606f1c20d1b2d3666f5b.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Peter Kjellerstedt <pkj@axis.com>

Rewrite relocatable_native_pcfiles() so that it can handle that any of
the checked pkgconfig directories are empty without causing an
exception.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9c5df6dc1c13e9b05ff1b47ad84ad339f6779a4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/relocatable.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 582812c1cf..af04be5cca 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
     rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
 }
 
-relocatable_native_pcfiles () {
-	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
-		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/pkgconfig")}
-		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
-	fi
-	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
-		rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "/pkgconfig")}
-		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
-	fi
+relocatable_native_pcfiles() {
+	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
+		files_template=${SYSROOT_DESTDIR}$dir/*.pc
+		# Expand to any files matching $files_template
+		files=$(echo $files_template)
+		# $files_template and $files will differ if any files were found
+		if [ "$files_template" != "$files" ]; then
+			rel=$(realpath -m --relative-to=$dir ${base_prefix})
+			sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
+		fi
+	done
 }
-- 
2.17.1

