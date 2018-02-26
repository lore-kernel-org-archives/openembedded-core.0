Return-Path: <matt@madison.systems>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 376D778748
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:34:06 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id w17so6564858pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gqc5h76PuDfuXVJwXtDe+68Ko8ohpJZvbhfpSATdWxY=;
	b=VZGHopxgGqTqMom57GIN4a/VvbIq8tWEfyDJzhTWFKN2A3hgynwfECpIttgpGbsKyx
	ABpzwfokA+3dwjg6MY20WgM4xbXphuOb8+deKIHJuoZ+PM27lCbNKHwX05YlEBEQcJhD
	t9/ho5afY/YtFxzsM7yoaghx1tJx60BP/2PTwFveSbfI0wj2AwFWPevQSGHCRSC9Pr/G
	0kIq19g94hEdgQhprxMxV3sjeL3thk5wVCEiA+nJVSzcwsuBETZsm3d9N+5H6dgNI2gO
	sBTSHJv7RGBEojj3VfQmUgDZlKAWvwHDLhof/sApV8Yh6Wh9dgIbWTWSCkZl8Ojo9QfZ
	WbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gqc5h76PuDfuXVJwXtDe+68Ko8ohpJZvbhfpSATdWxY=;
	b=B+HpVUVosBcmsrEk72Y1Vu/5TCNDA/L5a8r9M42T6yOEFR0wWQVcrgIuaJ5BgF3Jfa
	GsOPQ2XLUfjSjH9U6jj6GXVFRvKqGEOzwl6UU6KGNsqCtuc7pBZ2prLmjocunLvBmnsF
	OxMp1y4/xXh/RwZF4TidfmGPn++L9nadRdipJ7P06kPOVuOWFjj01WTAkOUCoUB34QlY
	DPmlwuQ2wjig6fjk0gYZPbZ1baiArF8h7fIAOZfH9QNK/odOfkclmdIHvs4ekX5G9w/6
	Ww9GbV/xF37zzTix616sFYRyqBONTQJ0O5Oi0yPaw3JY/56AXf/8Uz08EUidA7ebiWip
	a28w==
X-Gm-Message-State: APf1xPBfMqvyjh4SfG4qe9+q+S637ZJ+QvPjxzVnwebxT+yZj3+Ze/nL
	p96rnes1OQdEQ1j+H7oAzYPDkO0S
X-Google-Smtp-Source: AH8x2262kUmyYZfL9LgLdo/7FJRyK/sxwDRDn+FG4SmrcCzCRgGUYmE7f8NFi+fk0srAICOAi8nnsw==
X-Received: by 10.99.96.18 with SMTP id u18mr9560417pgb.124.1519673647646;
	Mon, 26 Feb 2018 11:34:07 -0800 (PST)
Received: from ip-172-31-34-104.us-west-2.compute.internal
	(ec2-34-218-58-157.us-west-2.compute.amazonaws.com. [34.218.58.157])
	by smtp.gmail.com with ESMTPSA id 84sm8542736pge.23.2018.02.26.11.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Feb 2018 11:34:06 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 19:33:13 +0000
Message-Id: <1519673596-4750-6-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519673596-4750-1-git-send-email-matt@madison.systems>
References: <1519673596-4750-1-git-send-email-matt@madison.systems>
Subject: [PATCH 5/8] go.bbclass: don't stage test data with sources
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
X-List-Received-Date: Mon, 26 Feb 2018 19:34:07 -0000

Any directory in a Go package's source tree called
'testdata' contains test data, and isn't necessary
for building.

Some packages include ELF files and other binaries
as test data, and staging them in the sysroot and
-dev package leads to unnecessary QA warnings.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 1f6a21c..0e24bd9 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -107,7 +107,7 @@ do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-- 
2.7.4


