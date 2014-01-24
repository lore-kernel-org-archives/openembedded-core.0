Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 59ECD6E938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:30 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so4143437ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=iLCfCyUDHBwLD6Z1jhbWV6amEAqoSyNJFxP/yLV1mDw=;
	b=X81O1TKMXZC1+N1ii6nRhCkXcE2IjY02a/BA5Y8uhtAx8JgyMh4po/IetAqyruPhHt
	VTvdz2Lq0ryfzQTQztHhG+5Ts6aHd4UKxTK2AktWUKLYd79MJ/5YA6u5PBep/5qUYH77
	CK2NwmIFrM54QhN7/4HJMCtvuiNL87dnPcQyO+Xax5wPvqDjBOdamgNrXiK9N0U9/fvZ
	QQ4JWOYGPnnSDM5Wnw2hypWKqzIkVACZ9tsuKyYrs++oB/0NdEGajumW8U6iks+v35dm
	v2ZsHU0hN80EWI6Ji6iuoeDW9cV0cBN5AQXmLx6it6tnHlefx9S0JaKu0lapnew9LMl+
	DuQA==
X-Received: by 10.236.147.107 with SMTP id s71mr9978568yhj.45.1390526791435;
	Thu, 23 Jan 2014 17:26:31 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id g26sm42438277yhk.3.2014.01.23.17.26.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 21C2417BF8CFF; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:14 -0200
Message-Id: <1390526775-26036-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v3 10/11] gst-fsl-plugin: Add runtime dependencies for 'beep' plugin
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:30 -0000

Add libfslcodec-aac, libfslcodec-mp3 and libfslcodec-oggvorbis as
runtime dependencies so 'beep' works.

Change-Id: I795bdddfa5d7368712b1565d4fad61f06769cce9
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-multimedia/gstreamer/gst-fsl-plugin.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-multimedia/gstreamer/gst-fsl-plugin.inc b/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
index 8a748a3..f26e690 100644
--- a/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
+++ b/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
@@ -45,7 +45,9 @@ PACKAGECONFIG[wmv9mpdec] +="--enable-wmv9mpdec,--disable-wmv9mpdec,${MSDEPENDS},
 PACKAGECONFIG[wmv78dec] +="--enable-wmv78dec,--disable-wmv78dec,${MSDEPENDS},${MSDEPENDS}"
 
 FILES_${PN} = "${libdir}/gstreamer-0.10/*.so ${datadir}"
-RDEPENDS_${PN} += "gst-plugins-good-id3demux libfslparser"
+# Add codec list that the beep plugin run-time depended
+BEEP_RDEPENDS = "libfslcodec-aac libfslcodec-mp3 libfslcodec-oggvorbis"
+RDEPENDS_${PN} += "gst-plugins-good-id3demux libfslparser ${BEEP_RDEPENDS}"
 
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/pkgconfig/*.pc"
-- 
1.8.5.3


