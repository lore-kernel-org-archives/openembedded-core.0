Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 07DC3606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 16:55:16 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a8-v6so3052452wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=U5QMBmYf2WGdxmy/p+N47bqHrLx5JHDd4nNrcawvoLc=;
	b=rCBweCcZMbvktrSPW5vBYeGuwQuGIWNpfySDrXt0xsCDfTWVdvC02WbbfxQ9+Qin3z
	OiP9PYB3sB0UbU/z2tj7CgsZprDDuOZmlzJXijAdqfbXvsH8oU9usxzQ0dJb5x8zNKmw
	9PFO1UlS4PIxPlO3Fhje+nTXkAgeVWSI3sQ6ZIbtg/ZzGvUPeZmxRM/xW4giyNOfWq9I
	iURjPh9cfy3Jx8rDKJNpvMmaeDoDeXgV53jm5Zvh0Boa94ZLwQjuNruQcad6tqpI0KY1
	M4ZNv0wnaBChMyMJm8NfB/YOXMcf7R18EmytSQLxj8b3YBg6680iE5ytI2idqvp5tB2j
	rgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U5QMBmYf2WGdxmy/p+N47bqHrLx5JHDd4nNrcawvoLc=;
	b=bPDnLWbWZSRXfwWaqy0SUJ5UfUmDj5KdT8hX7Woud56AIEmmmAh6IfIhuc1VHJnr6h
	77d1VLInFPT22N1dHathXR4K/bH2l9h9Ce+Ikqu+x5u2iVO87jECYCEQwe9SmXPVfLbY
	lejmTSXs9LHUlqku/kEDFTuK++Z2yqCwkLksRK46yEdTi0jkd6AsF4bphn69rACwlxyQ
	RY53oJCIQjX4txIvo6LZ5CXT6ovsq0kDLCt95Qpfa/vcefFtoh6QKsVD10k5Jd0PX0JM
	UMrVy851DCB9eh4nDo6gUi8F6yjO+cLmv8OXQL9hLG6swSkpayLACeKgDQgtPttf1bQP
	/2eg==
X-Gm-Message-State: ALKqPwdub2mbMuKgm6ODVKHOOkeEUlbClcffzpaN/8BV3lua6e/vKvFi
	Y19IvKs9XkNrotWoG8iaxvKpHSnG
X-Google-Smtp-Source: AB8JxZpqSM9opUDzFGmaWqyTiB8Lk3Tayt9b8BHEozDc5ZLOLgt341S3Xq4A5OcifxbbW0pL9o8z4Q==
X-Received: by 2002:a1c:2d06:: with SMTP id
	t6-v6mr1059112wmt.155.1526489717247; 
	Wed, 16 May 2018 09:55:17 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	w40-v6sm4968478wrc.69.2018.05.16.09.55.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 09:55:15 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2018 10:54:58 -0600
Message-Id: <20180516165458.17849-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
Subject: [PATCH] libnss-mdns: fix postinst and postrm
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
X-List-Received-Date: Wed, 16 May 2018 16:55:17 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Don't blindly add mdns_minimal, instead check for existing
mdns_minimal instances. Fixes continuously appending mdns settings
to nssswitch.conf when upgrading.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../libnss-mdns/libnss-mdns_0.10.bb               | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 8d2feec7698..5be5e4fa323 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -28,13 +28,16 @@ DEBIANNAME_${PN} = "libnss-mdns"
 RDEPENDS_${PN} = "avahi-daemon"
 
 pkg_postinst_${PN} () {
-	sed -e '/^hosts:/s/\s*\<mdns\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns\5/' \
-		-i $D${sysconfdir}/nsswitch.conf
+	sed '
+		/^hosts:/ !b
+		/\<mdns\(4\|6\)\?\(_minimal\)\?\>/ b
+		s/\([[:blank:]]\+\)dns\>/\1mdns4_minimal [NOTFOUND=return] dns/g
+		' -i $D${sysconfdir}/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
-	sed -e '/^hosts:/s/\s*\<mdns\>//' \
-		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
-		-i $D${sysconfdir}/nsswitch.conf
+	sed '
+		/^hosts:/ !b
+		s/[[:blank:]]\+mdns\(4\|6\)\?\(_minimal\( \[NOTFOUND=return\]\)\?\)\?//g
+		' -i $D${sysconfdir}/nsswitch.conf
 }
-- 
2.18.0-dev


