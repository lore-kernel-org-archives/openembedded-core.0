Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1210B7FBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 15:49:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so12680825wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 07:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jnWfv0GtXZjpsWzqoZBc56X3bAfdQLrOzbeE8Vt1bhA=;
	b=dVW2R3QXLGKZaw0R1o2kKBcS73evY/N9yTFGZcIEBihJiPBORXKdCcugJ0gzenfQJv
	aVeBxuvxA0whaqrXE0oRZqEcZL6c9vnjkRZ0f5eUEvXkDvQfoefaSQ0VFDJr/ALDTL15
	4CvUj7LA28cDFveIgDpBCYqU7FL1tn0UX4Ov+/dfmiTys1kXGWRqQX8lnzgiutwjBPs6
	C/CrIkfLrp384l0DUIFlfeNm7jw53Ro4G5Bu6IkV7TwasGoYIZ3tmVcU+C5WZHrtcRPi
	xPKzoi5lQgKho+OqQdSF1uxdLNFV3o3f0T9ylOW8rUuN1GrnS66VSseBSRaga6ZpIsmx
	lK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jnWfv0GtXZjpsWzqoZBc56X3bAfdQLrOzbeE8Vt1bhA=;
	b=lVsx9/reR0tO9qtJUcBZGyxauanPfz/P/88ZiH8hsr1/wlwNcUzYPkWuXrcbpnXmrH
	H93aYgYUtio/BVu/Lzv4S4fbG0ZuJB6ioG12uCrzaWU+B1OgtSHbB1l485VmXXLt8hz+
	Gnzdsdjib/84zmgm7pEw7ZavxxTajW1I6U/DkNOEUhNBj5IjY9zqxB7qDPxUyEC+1O7x
	ULaJMrjkEskNkQBJ1XlEeUKK8GcvvUJ6zvH1g5HHPXRP8GPtd1H92ObnHtEYeP/n0SVQ
	xB2o4dfd3eQ7cRq2gBJskScCtM4cy+yRTKTcdzx0NyO/1YxeR1jAub26Y6EI/DcZhxow
	m0eg==
X-Gm-Message-State: APjAAAVsIseN/ffp+sSEN06J5KW/4FzLUy88VSAZmucfvU9Nmwn9Z1Cr
	VGq1My+36fY/c4elBGQSFK8o7nfY
X-Google-Smtp-Source: APXvYqyrPuRGynzaVJoHqBZ8bMheXFcVr1OuQVsfpEjW+ieaBA90gWyzRIEQDmyGQww3TeqEf9OITw==
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr25685155wrw.319.1579016985483; 
	Tue, 14 Jan 2020 07:49:45 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f17sm19240311wmc.8.2020.01.14.07.49.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 07:49:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 16:49:36 +0100
Message-Id: <20200114154937.78532-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] gstreamer1.0: decouple check and tests options
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
X-List-Received-Date: Tue, 14 Jan 2020 15:49:45 -0000

Some plugins such as gstreamer1.0-plugins-base refuse to build if
check is not enabled (which was the case when ptests were disabled).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index dc3e8ffafde..c6fbd398d91 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -26,11 +26,13 @@ SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
 SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+                   check \
                    tools"
 
 PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
 PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
-PACKAGECONFIG[tests] = "-Dcheck=enabled -Dtests=enabled -Dinstalled-tests=true,-Dcheck=disabled -Dtests=disabled -Dinstalled-tests=false"
+PACKAGECONFIG[check] = "-Dcheck=enabled,-Dcheck=disabled"
+PACKAGECONFIG[tests] = "-Dtests=enabled -Dinstalled-tests=true,-Dtests=disabled -Dinstalled-tests=false"
 PACKAGECONFIG[valgrind] = "-Dvalgrind=enabled,-Dvalgrind=disabled,valgrind,"
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
-- 
2.17.1


