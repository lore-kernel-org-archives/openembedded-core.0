Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23FE8719B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 23:56:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so46341073wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uMpVSGHyy+XuuxOeaMKhLImYcM/1Fp13rZiKp0LhSWg=;
	b=ozPOASPM6IY+wz70QWvBOJwUSolhM3Y6ogg0Zjxo8Xo0/2VqAYSurVoQKh8NkjzGy3
	LO2xAMWj7Vs81D3bKAwUQ3h0ihIwc+11Y5ufrklKUDALYPfTIfxo/3gF4jWcB9gjV8wL
	UltIGtuZrCytyvDuhBXcekiXtN5D5cYkQiE+kYwjFE4Ga0Rz3zV6widHUUQlQs7KgfC0
	9+3lKgZDjivFAykxhAjAicTjPjClS5UCjij9rpN2iY3xQD3KF+yL8PqmFFFQH9W3vMY1
	iJWXGE6C8S5BejvcPmKEvXMn+ZN6f0btuQujXOx7JlMj7UG+cdz691X6TYf2oIPZ5gZC
	tl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uMpVSGHyy+XuuxOeaMKhLImYcM/1Fp13rZiKp0LhSWg=;
	b=DA0MrQ330HTpxPkxkXIK3s/aRIwfY4bWwjKLj5+23iDlGHMSx31fELxr3kvURfk9EE
	rEhxTix/OXDoewI98zDVpM92tM+PhnPpS3fPzT7ncu49OZaNOWdQQR7estG40yXO0RJm
	uIqh+XMWSZhUgwgg1Ty5XQx74dYIYlNxdCW+rmou+CoZLmCvOZWdcLrRCmmo4+YiMYcw
	iHi+uDqhwsSl7CwUn5zlNcp5Cu529TtlOrNHnXTKXHUHa68xLsviXcsT5FTzYoNSjcL1
	RoSOUO5tdSC8jpNZaPPRoKi+ub/w9qf6sVTKz08HiqAP24HVzjqE3qSk++yZiTtO1/10
	Q//Q==
X-Gm-Message-State: AIkVDXKTT87ffwlvvoxa6AsltuhNtFNHNTd25Bw9Nrh5scTOfjlZvq3kAdlHGewKeMV6tw==
X-Received: by 10.223.136.152 with SMTP id f24mr34627930wrf.187.1485388571430; 
	Wed, 25 Jan 2017 15:56:11 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host49-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.49])
	by smtp.gmail.com with ESMTPSA id
	b15sm27195431wra.4.2017.01.25.15.56.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 15:56:10 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 00:56:08 +0100
Message-Id: <1485388568-7918-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel.bbclass: Make symbol to vmlinuz.bin in boot directory
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
X-List-Received-Date: Wed, 25 Jan 2017 23:56:11 -0000

The changes committed with 6e58f54be103814b6b8a85b236510633c49e6832 did only
consider the vmlinuz ELF kernel but some devices do reqire a raw vmlinuz.bin
(as for example gcw0 in meta-handheld booted by ubiboot).
Expand the above mentioned patch to consider this case.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f462b2f..97cba92 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -528,6 +528,9 @@ do_kernel_link_images() {
 	if [ -f ../../../vmlinuz ]; then
 		ln -sf ../../../vmlinuz
 	fi
+	if [ -f ../../../vmlinuz.bin ]; then
+		ln -sf ../../../vmlinuz.bin
+	fi
 }
 
 do_strip() {
-- 
2.7.4


