Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id DC4B77740A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:15:58 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fy10so49694525pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FITugTPA5ARzkCoPGv2VaR2pzVr+m9/7pUv0hnEwhu0=;
	b=ZYXVJHvkZbxe93Jfo4NYpjGOl7iDy0K9GvUdBWRlbAeX8rfEDYfWmOP4f7UdeMff0A
	B+7Gmv0LU0cJyD4Rc/ogytC1/oFsHNnGHaPcIhAQNu/1HCjmewzI4ZtpsXlLnqohjMpp
	Jmpkfb4ZnAkj9u6q6Q88qPt3paUTz8osTjfC482BwyBuddybwOw9vmIxiDJq6DfrrICI
	p1GcMg7NsZJTGx0Ed3ANbXdwvAO/IVtT2o4SOHqYd9FA6gXfZ3UceAIJopZU2nl1nGpJ
	jku5PdExn8CvtFEYSLqLm0HYXGoXwfDOmhNxMTIIfnuEGOmkrF6xQr7sML/bc+TIzEKu
	zDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FITugTPA5ARzkCoPGv2VaR2pzVr+m9/7pUv0hnEwhu0=;
	b=bfOxGgbBQG9nY6HGwlS4Uximl/KuQjpGckgsXur1vD6wNcjbTaGRepNzyRPFJCtacE
	4aCmHAIPH+RHB7B/L1M3mNi/n0r1008Akqg3x6ww01HGfIPtUkT3ydOef1wQv1+4WhMW
	548ET/XMN3KPsvBoHAqcD0GcIR13zVTbMLS2K4ZKO8cvW5pTdb3/h1ogh+PDxwIZYkr1
	kMwdQ9koy/KKXosBniInXUuPHA8Pfu0V3vz5AZIF9IYOYWA4dj97noA/TjnAIbzvcT+n
	1/H1VLUuB9nUk3S0Ber98AaQVYeY+BKcV+FAZnMM+m57e3ksqeUPHCUCx3HldPw9HvNx
	gHIQ==
X-Gm-Message-State: AD7BkJJK2S32rtoC1DiKYKv+rd+s70osmTfNqeYuUTrpPQ164dzVDmUdorX5oM1yM6JS8w==
X-Received: by 10.66.62.132 with SMTP id y4mr1154542par.55.1456485359518;
	Fri, 26 Feb 2016 03:15:59 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	b63sm18700600pfj.25.2016.02.26.03.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 03:15:58 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 22:16:10 +1100
Message-Id: <1456485370-1338-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH v2] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 11:15:59 -0000

If avdevice is enabled, libxv is used if it is detected by configure
for the XV outdev. However, we can't depend on libxv for avdevice when
DISTRO_FEATURES doesn't contain x11 as this will result in an error.

Fix this by adding a libxv dependency only when the avdevice
PACKAGECONFIG is enabled and DISTRO_FEATURES contains x11. XV outdev
is only one of many that are supported by avdevice so it is still
useful to enable avdevice even if libxv is not available.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 3f0cbf8..e7b20fa 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -26,11 +26,12 @@ ARM_INSTRUCTION_SET = "arm"
 PROVIDES = "libav libpostproc"
 
 DEPENDS = "alsa-lib zlib libogg yasm-native"
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv', '', d), '', d)}"
 
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
+PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
-- 
2.7.1


