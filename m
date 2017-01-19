Return-Path: <raltherr@google.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE3771A60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:58:04 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 14so15572256pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 08:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RC8JTO+lkKkNyG0+JOyMdbv01gpcjAQJ9+vHChNQpFA=;
	b=l3UmAgZK9JBpFzJOxch8bTJXXfhHmifYk/b//klkuYvN0Fy5zqfNHukrJrPx2fXniU
	2c2SnRrK/OLnxBkG5vMyuIR0Z/jhteaDCFy0KSUxNX3Rv3BQrCqJ1onMqmb4dxMX2wWP
	dO51QZLZCdOXIDShS8bOdg6f4BuftIW5Okv63Pvr88ibyIAZG+8PYr/VcysE9wYIpCt7
	wMCuZtwKSbVLjpkimCnuNlDrO3Pg2kFsJo4hQYdT2sS6HeunJZpYwQeIT59APlXnJ62i
	5Ye2fUQ9oA3z2P0GWBf7k6GWbvMq6217MsbMXH9tH5RHnjKV4Jx4jDZr74oF6uYO5+aF
	jJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RC8JTO+lkKkNyG0+JOyMdbv01gpcjAQJ9+vHChNQpFA=;
	b=d5BGYfKN0gSn7INoTVm0hGWhavz1xD0Lt5FYxVoY3VN3RSIX/11f1pyNEKKWbIa8Cn
	J+40OgknBYRz/IVnobIbHhRwwFk5xwLa0pE+LryGn3PVtrpGdxGjmHTb8QhgECTCvM2I
	CR9ore4wS9wX4ukYxcrlWjxY9jg16kCycOfNAj4dowRcvVliAwgdFbdLBQ/l+brjiqt9
	PcYLd5dCUbZ6zi2rNZpwx5NF+cJWTybQQOIJsTih+TS9jod2xGCg9zD89V8ZloCRI9Pn
	by4w5mWv7+vkzERWBLBFdH1ITBdiYKcMp6S9/zn++gKjg5w4Fscb4Jv6YqW2N19xbfAq
	/teQ==
X-Gm-Message-State: AIkVDXKsOXEKg59HyD/9weSFdEdWJLU9gVI0ra66CclCSHa4Rns8wcQTfbjdtbHefQaeB3LN
X-Received: by 10.84.215.15 with SMTP id k15mr14518481pli.58.1484845084987;
	Thu, 19 Jan 2017 08:58:04 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
	by smtp.gmail.com with ESMTPSA id
	a8sm10252465pfa.19.2017.01.19.08.58.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jan 2017 08:58:04 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:58:03 -0800
Message-Id: <20170119165803.22583-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
Subject: [PATCH] kernel-fitimage: Let U-Boot select ramdisk load/entry address
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
X-List-Received-Date: Thu, 19 Jan 2017 16:58:04 -0000

If the ramdisk load and entry parameters are omitted in the FIT image
specification, U-Boot will determine if the ramdisk needs to be
relocated and will automatically allocate a location in RAM if so.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2934b3a31a..ee721d1fff 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -187,8 +187,6 @@ fitimage_emit_section_ramdisk() {
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
                         compression = "none";
-                        load = <${UBOOT_RD_LOADADDRESS}>;
-                        entry = <${UBOOT_RD_ENTRYPOINT}>;
                         hash@1 {
                                 algo = "${ramdisk_csum}";
                         };
-- 
2.11.0.483.g087da7b7c-goog


