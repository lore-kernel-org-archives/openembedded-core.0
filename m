Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73A4F795CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:16:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s14-v6so1985074wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wnczhCc8fFW97tPXY401FG/YF0TYghbEASFTQXzWUvw=;
	b=sF1K8tkeU7rEac76PdF0TNJoCYrqyVi4klCFojAApsAw6d5XQBNqyp3tCoV+81lGo2
	1nYyTIU9GAG3l+vUqHubroccRd9Tl45PZfHS0JfA6S46WXHHJ4DeCD3XKx5GwdP3Lc+t
	1gAhZQnv0MRZGhPRd4R+Oao9RWQ7k9uTO8yfexOGLy3j9CYP31kJK9JanIo7DMwWWoGI
	XLAK8SkkVPzd7WYrIfZU8zuPEOUyhdalDRfyo5gbfm+0zzya41qP1YJF8XBkjkMqIIcd
	K0X4r8TBMYAu/QKDrrOfYn360+FZsjDJVrsDKMBwYq1Xn21aIF7L2beGOLCzdDA8ngzu
	aZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wnczhCc8fFW97tPXY401FG/YF0TYghbEASFTQXzWUvw=;
	b=IomHNWpJog/uEvKYLopTCyfv32EcqPSz+FvYbD30yhR/3Y/KufQ2kVlwcj2pUzon27
	d5qeOLQjjEaVqoKOva+UI0HlYE6nyGP/FpfrvV6Btso4Ij+X3MjqvsuZe0w7aUsOF6Iz
	afvEbGnY5b/aqH6wPAotj5VVIays+dOcu/zJRXN1cbW2oTGuK3qwuG7CVRDaRXxA3KPS
	wbN3w+JkY6hpG66IFo5GMIaPUTT3X6Po+xH7jqmCqg41I160lVxcsRyqjoxEUjbt01Gi
	z1RHNhPLUeu6lv32Cbz91cHY1cD8ZTdcR8NbURoWHLf/WZtpUQChjOTHT8VpY8lSpkmB
	K7aQ==
X-Gm-Message-State: APzg51D7mJ7au8xAo2EMRzsY8V7CR+NNn3uwM16CaEqkVUHnTHOB8mmi
	apFU504qH8ccP+o4VgGbGoNXe+lXCjg=
X-Google-Smtp-Source: ANB0VdZVal53B52N4askVPejntlNxbG3okhoqM1KlUkwAO0xZFGV9p+doM5izeMC2eopC6wfK5NTNA==
X-Received: by 2002:adf:b7c9:: with SMTP id
	t9-v6mr1881295wre.274.1536232610985; 
	Thu, 06 Sep 2018 04:16:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g2-v6sm7516955wrd.71.2018.09.06.04.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:16:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:16:48 +0100
Message-Id: <20180906111648.22924-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ffmpeg: use nasm instead of yasm
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
X-List-Received-Date: Thu, 06 Sep 2018 11:16:50 -0000

As ffmpeg can use both yasm and nasm let's unify on nasm (last release six
months ago, fifteen RCs since) instead of yasm (last release 2014).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
index 2917a080cd4..b4a4ffd2840 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
@@ -38,7 +38,7 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 # libpostproc was previously packaged from a separate recipe
 PROVIDES = "libav libpostproc"
 
-DEPENDS = "alsa-lib zlib libogg yasm-native"
+DEPENDS = "alsa-lib zlib libogg nasm-native"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


