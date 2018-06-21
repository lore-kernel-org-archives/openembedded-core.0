Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 46C3F78555
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:21 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y5-v6so2115645pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kzG9BrTDZYAxH8WSwlqNguMIzcvKPdk8Ag0qkMtcU3Q=;
	b=POAaUzGWqZVIwCQe9gk6t9yyj8F83f/d71RWQ9VMiKVXzevYcPCXipnMZd/xmc5neI
	fw1DChYvFw6ghjfluReNIr8qQQYx0ZQTjtZddo0EQqU3QRlq1TDxoNOsJl2+ejG7WgLT
	ch3YZ1VUZIRx8Y3sMRbnqsxb/MpBfYHhWaVw6gFxsRzWR7cxRf7LibjluEgdjZi3Bxij
	Jk6Tc8es47RI5ngLdgd2+P6+RU+GqfsqjJSf1gFUjfNeWwHempbG6kRsNd6NS9vWEamx
	8gmamyMw4I+iHLs9CU8bHHAY2/qs/H5T75nIOxcTW2bpXUIN9WbGCmivi8TvgoyxQAYT
	7o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kzG9BrTDZYAxH8WSwlqNguMIzcvKPdk8Ag0qkMtcU3Q=;
	b=gHfCgHw1zmHBV9nLZZL19XmZKPFqwfd5rWQRppvneeKYF+eyaDX2aGupQUAU9sPPya
	hPDjE+O+07ij9Ka5ODtCzXrxgkmAtN3s1BLKCvteZ4w0xl55/zxbeXRKG7HrsjjakIrs
	BgKzjD3LH86SjJLCHXsC0OxxVdliQLn5xWyR7Xx+6Q6Q/+JUtjHRaOBtAtQ5D3TeIWEZ
	DKq6eoAMA3arRUJ5eHi+osj7eCA8TOvdwi1dLP+GCOmmwJniIxIg3xH3k5eP8w51eKUT
	ke6baJq2y4F4MDT0pO3GMCXyM0Pc00k9bWH5iB+csPJW9ee++HBgVrbAs94FaSvAng8W
	nm+Q==
X-Gm-Message-State: APt69E3oW/Qx0Pj5YEeMmsZq/qwih0DQzHD3lm9Xz4Odcn+teNDeqZdD
	KZzNCCb0HMozldSEdYQG0AzCgVoU
X-Google-Smtp-Source: ADUXVKIck/QouN+rUrYlTuk5JlzKlz9DqJGO2ENm/XvaGIenXFAwqNgpeCyVup9x7171xDVNMYxtuA==
X-Received: by 2002:a62:190d:: with SMTP id
	13-v6mr28964105pfz.103.1529615302141; 
	Thu, 21 Jun 2018 14:08:22 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	n85-v6sm9836546pfa.146.2018.06.21.14.08.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:06 +0500
Message-Id: <abb55c262e6dab31c0e77bf800e83cdba155fc13.1529604975.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604975.git.chris_larson@mentor.com>
References: <cover.1529604975.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] rng-tools: start earlier in the boot process
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Entropy is needed earlier in the boot process in some cases, for example
connman can require it, and rgd doesn't require much, so move it earlier
in the boot process, 03 for sysvinit, and before sysinit for systemd.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 +++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index b94ad50209c..cb8102442d6 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -1,5 +1,8 @@
 [Unit]
 Description=Hardware RNG Entropy Gatherer Daemon
+DefaultDependencies=no
+After=systemd-udev-settle.service
+Before=sysinit.target
 
 [Service]
 ExecStart=@SBINDIR@/rngd -f -r /dev/urandom
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 24d545dc3fa..6765667a59b 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -43,6 +43,6 @@ do_install_append() {
 }
 
 INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
+INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
 SYSTEMD_SERVICE_${PN} = "rngd.service"
-- 
2.11.1


