Return-Path: <richard.rojfors@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA21784B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 09:12:57 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 65so8561314lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=WnYYIIewnr25HZpUTtTn9hQlFwxzpPOHHLj9Om3rP2k=;
	b=l0dR3gneVsKQSPA9UwW3PxrmDVTG9Exv7gQhqyD33MpB4sl287AdxXDWZRoxUyBejp
	ziWZ4+AyjEchQoMT3IW/M00Ng5N6gKlKjoxmmdU2DuzyoJK+vIrCb4SDgL7SBGK36BEz
	Zn3VtL7l+kp7y0vxrhurlEG5BfvBpi5zOZ9gaQLNUa4dKbvU+CORtrtOcIqQT41yCOy9
	UfZgBT8QWJQH5E3fRbi2ripGtx6yOopKhnIqjxidzeglJCL0QeSeYzd9oRkRxUYtYvpj
	rPCzCsisq8kx8pvllB+C19mkBGwomVLlkCIa5tfCYdqUg1oSnl5+arCrm9AuqX6N4gKf
	uF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=WnYYIIewnr25HZpUTtTn9hQlFwxzpPOHHLj9Om3rP2k=;
	b=ZNEvXo/aurcV9TZFNlDYUY+H2FHha1Pagf/KDC8BymsyT0a3kWUWL+F7iyN3UXtj/Q
	fysbcjtvjj6kMaDEuObetInJ/sqRFAP7SYl7Ehmh8C3l8IRNQJzAK9Qeqq6u7jEfZOMN
	4uIHYLKxawNaHSbAGDqgF7354NLTP0Ur751gsMjBlsjXGxA8IdJCgUKhm0DlInLQRWwh
	znYm3Fx1bwStBSrYaR+aEWOzSmB2wjT21aUbfVeg5gMAgjkUSSJh0RXufhOI9kShSNAw
	54vLEm2XNY4ZHGvVZHGJOne69PUl+d5rx+Dyhe9A3ERSOuC8pYA5xClPkB3gbAP9w22u
	VHIw==
X-Gm-Message-State: AIVw112OhWxqSTJjUXuHrOtpBJvhn1M5lc15/bcKHUZzReq7p6OVEeXd
	PY1hlUO0nr0HnyWegGw=
X-Received: by 10.25.223.87 with SMTP id q23mr4973113lfj.192.1501405978538;
	Sun, 30 Jul 2017 02:12:58 -0700 (PDT)
Received: from ellan7 ([213.115.5.18]) by smtp.googlemail.com with ESMTPSA id
	2sm5457204lju.0.2017.07.30.02.12.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 30 Jul 2017 02:12:57 -0700 (PDT)
Message-ID: <1501405976.19684.2.camel@gmail.com>
From: Richard =?ISO-8859-1?Q?R=F6jfors?= <richard.rojfors@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 11:12:56 +0200
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
Subject: [PATCH v2] package_manager: Fix support for NO_RECOMMENDATONS
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
X-List-Received-Date: Sun, 30 Jul 2017 09:12:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When support for dnf was introduced the check of the
no NO_RECOMMENDATIONS variable got broken.

This fixes the issue by compairing to the string "1"
rather than the number 1.

Signed-off-by: Richard Röjfors <richard@puffinpack.se>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 72503eb9d3..518cf8dbe3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -585,7 +585,7 @@ class RpmPM(PackageManager):
 
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
+                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
                          (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
                          ["install"] +
                          pkgs)
-- 
2.11.0

