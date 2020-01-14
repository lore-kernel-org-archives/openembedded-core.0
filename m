Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 441DA7FC3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a5so13910084wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lLlj9UDJYrnHvcSAud8eA/d674AH7sCuMtBTeIgKVdc=;
	b=SD20Ut664xuc5caH8dE2M1rOhI3lZUfGM8cOepUONaFEQGIOYCNzMdOYI7wScIk0An
	jlAuNzXaLMTIg8n5HWkxZJkVqE3hD3cz48RIoNDVOrQ6pKNaRyRn2xLciwD5CAdHPkT6
	B1yoyOw868mT6CsASuuH6mhX4xw1iIp9CN+cso1rvOeJhboZAI9KyuwcLpdcL3RVNXmO
	leaLff/vq6XFgMpawqWEe8olc/yGio/qAdzf++rebtMsbzjguqPhtzJ/JUGPOo000rel
	WQZs15TJmUMI7yVbSG06XXvunDL8Pq+HSVb/TmjLwEC2sMxZmhB8XPpF3j3ovk+pv8He
	59ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lLlj9UDJYrnHvcSAud8eA/d674AH7sCuMtBTeIgKVdc=;
	b=CguHLcVdmGQwEUxFDqkpCfJaYYlNiRZtD6rZGscNbwedcahi/QRtHMb5dtW+d2Cimk
	mhxWKNBBl84aIQQt455rzDNalf6Hcfdr+fn6AHhHyPm8aOkciBBs80qqjGuDVLsoUQSN
	vKrhHK3X0jasPCR1s2953AmL39wyFjBjVKxLLipa939YoFZHZ73syNddRfqkGf+v/FUH
	B06YHSttrgEHWoU72/NOB3q1Obg0duPv+L/FTXC0y1/S/kXgy/qm3Wpj10Y5Xc8qBvS3
	4I0UbXnbcWJH5K/mjJIXuqCkRRfh7flXoNyDLk6B9q6ywbriOU7kr/VbS5MjwjhpYGV5
	4N7g==
X-Gm-Message-State: APjAAAW3W1SIgewn4L7Dj/I+s10WjQFUGOlG4vEOU1Jux0lBRxJ07Jkx
	XOBtqMsLHjZ1rS4KYXiuUy0x+/uz
X-Google-Smtp-Source: APXvYqwGYyK3SSEi4K830VcP0yDXp8mGrbLlt74sGjH7lm3j/k75buDiRGl5T5uASJpH/GNzOd4YaA==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr25900017wmh.99.1579010428791; 
	Tue, 14 Jan 2020 06:00:28 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:04 +0100
Message-Id: <20200114140007.36622-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/20] perl: fix failing ptests
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...correctly-exclude-unbuilt-extensions.patch | 27 +++++++++++++++++++
 .../perl/files/perl-configpm-switch.patch     |  4 +--
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  1 +
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch

diff --git a/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch b/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
new file mode 100644
index 00000000000..0f3a2c63274
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
@@ -0,0 +1,27 @@
+From b0d53cfd785f64002128ac5eecc4aed0663d9c30 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Jan 2020 17:26:55 +0100
+Subject: [PATCH] tests: adjust to correctly exclude unbuilt extensions
+
+Issue is reported here:
+https://github.com/arsv/perl-cross/issues/85
+
+Upstream-Status: Inappropriate [issue caused by perl-cross]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ t/TEST | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/TEST b/t/TEST
+index a9c844f..8d3505f 100755
+--- a/t/TEST
++++ b/t/TEST
+@@ -419,7 +419,7 @@ sub _tests_from_manifest {
+ 	while (<MANI>) {
+ 	    if (m!^((?:cpan|dist|ext)/(\S+)/+(?:[^/\s]+\.t|test\.pl)|lib/\S+?(?:\.t|test\.pl))\s!) {
+ 		my $t = $1;
+-		my $extension = $2;
++		my $extension = $1."/".$2;
+ 
+ 		# XXX Generates way too many error lines currently.  Skip for
+ 		# v5.22
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3c2cecb8c18..80ce4a6de76 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7f313cac31c55cbe62a4d0cdfa8321cc05a8eb3a Mon Sep 17 00:00:00 2001
+From 5120acaa2be5787d9657f6b91bc8ee3c2d664fbe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/configpm b/configpm
-index 09c4a3b..6a0a680 100755
+index c8de8bf..204613c 100755
 --- a/configpm
 +++ b/configpm
 @@ -687,7 +687,7 @@ sub FETCH {
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 03e7f206f91..90a9fad68b8 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
+           file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.17.1


