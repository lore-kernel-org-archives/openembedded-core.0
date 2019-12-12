Return-Path: <sky.captin@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB247FBDB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 22:31:00 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i23so467491lfo.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xmacIU4jJrO3qgSJb31qzC/CglIRpkYjQRjXRWsy7n4=;
	b=Z26mzGdWAYPt4Q80+Fmk+CJCHZK3LFrrlzOERgfZXxxhWKHq19YfvvoIhUlKBhw18U
	FhLXgQ7VviR+IQFCKftB0xbX0Ox8l6CfnjqOzYMazRnN7JuLm1SIfbG942LURmIEz77K
	QZjqxo3tROl+4YphafYdaAkptuJzERoJm7fBwF9GiYNg/0iaxUXANQn4JlLbVKFMxzuc
	witL6faYktk03/3aOVpEAwF1UvyUq1am+JtIUp+ucYjPQ3EFBTF3jYCk2udAsiYNf1d6
	HX3fYP1ovN+keuVCBEnIzD7Eg/M5H8eshYFTZHSwPJ96+1nNG/2cP7mSmMUUuwf/kLHb
	1KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xmacIU4jJrO3qgSJb31qzC/CglIRpkYjQRjXRWsy7n4=;
	b=QgdtfWbAuYOQ72UXzYeeScy7TDqGRXdlra2ual07s9MnCQXDy2PoqMEehrVBjVtusV
	sPHIxQPCwvgcH3azabEy+ED0LYNfTtJxyHo7iw0Fp3DJhnzhy7NHf507VpcIDTmbMINw
	CC4/vhR3IutGGBJRt3sy3e+FV24CtXs+1r6ENke04aHb3zgHfmkVwo45h7m0afuOHqik
	3ZkQ/3DQgrULUiP1rM8dImCsawHyjdBnVlI6EYuInq+Hpj7PbK9TEhJzEO10iNOYH5ki
	3yDg2mawAgS9AytUtsTJiwLaODViN+1sNaOdkJDDFevRDOgik9hmWYU2Ym/n5kAoQP4v
	PkMQ==
X-Gm-Message-State: APjAAAU7RHOQe4wsSlNOo1C7CIunrU5/y19u/znrGs/FZie4lxZI37QV
	voZ+WF9tUXYaIYndDhtf4kbXWYEhNGSANQ==
X-Google-Smtp-Source: APXvYqziN5K4iP0sa72vnsSYvLqu3PCv84xclX9UheC95hPLLQ9tPLEj84IFrbLwozz4tndOVGQrGg==
X-Received: by 2002:a19:f619:: with SMTP id x25mr6936812lfe.146.1576189860469; 
	Thu, 12 Dec 2019 14:31:00 -0800 (PST)
Received: from localhost.localdomain ([105.184.177.217])
	by smtp.gmail.com with ESMTPSA id
	q186sm3805957ljq.30.2019.12.12.14.30.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 14:30:59 -0800 (PST)
From: Slavic Brutalik <sky.captin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 00:30:54 +0200
Message-Id: <d5ed7276846ebb178ed9e8b2d2b5955a368f2b4f.1576185886.git.no@good.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576185886.git.no@good.com>
References: <cover.1576185886.git.no@good.com>
MIME-Version: 1.0
Cc: Slavic Brutalik <no@good.com>
Subject: [PATCH 1/1] systemd_preset_all: scanned targets that are aliases no longer fail sanity checks
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
X-List-Received-Date: Thu, 12 Dec 2019 22:31:00 -0000
Content-Transfer-Encoding: 8bit

From: Slavic Brutalik <no@good.com>

YOCO #13685: The script scans for services, parses them and makes sure those targets are still there. The exists file check fails if the target is an alias, such as default.target.

Signed-off-by: Werner Grift <sky.captin@gmail.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index ebac863739..990de1ab39 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -172,7 +172,7 @@ class SystemdUnit():
     def _path_for_unit(self, unit):
         for location in locations:
             path = self.root / location / "system" / unit
-            if path.exists():
+            if path.exists() or path.is_symlink():
                 return path
 
         raise SystemdUnitNotFoundError(self.root, unit)
-- 
2.20.1


