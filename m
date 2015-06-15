Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8C5759AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 08:20:50 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so45264618igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 01:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zj7XOfaMWRkSSkARdsNauZfaqryiAe2MrIwNyv9tTG0=;
	b=ewDeOYd1uF/ChnzJyYwHsbDD1ATlHt9GDKPfI0TzPSPGhdnFAvX0yRRj4olNORAIXH
	jFlbjpB1LEw9PKuDvSGaAy5DQMrqEORLreLgPR5sR7dXNpxF0yEWkOJqETece0upOHtg
	B4gVkJyL5+dAvBF+PbGIWcYnfC2i0zc+gLCr5W8uS4gyP7MlmiJKXQVUWe74ZrH/oarf
	6wUvOid/oB4gZi2ofq074i7ggJPnNoqNAk7LWwHJ/X2UszpLQ/FiIo2OdEYnrl4CeKBM
	MfrC25C38akuHFqaoU0awf56cz7Zn7q7x+uDS+qtV2XcD4wdMfQeJ3qFrSL0cyUsOTRR
	KXXw==
X-Gm-Message-State: ALoCoQnii9G/0/FjAU7ooq1lXANXlnusVLJcsj3gyokyNLODFz8OrRSKXAiffnjrC4VCoFWUt68L
X-Received: by 10.50.143.38 with SMTP id sb6mr18962902igb.44.1434356451947;
	Mon, 15 Jun 2015 01:20:51 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CA13.dip0.t-ipconnect.de.
	[93.232.202.19])
	by mx.google.com with ESMTPSA id b74sm7162914ioe.6.2015.06.15.01.20.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Jun 2015 01:20:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 10:20:49 +0200
Message-Id: <1434356449-14595-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] logging.bbclass: avoid bashism in bbdebug()
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
X-List-Received-Date: Mon, 15 Jun 2015 08:20:51 -0000

Checking the bbdebug() debug level parameter with a regular
test expression only works in bash. Using tr to filter out
digits and then checking whether anything is left achieves
the same result and is more portable.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/logging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/logging.bbclass b/
index 78d65bd..f6648b2 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -62,7 +62,8 @@ bbdebug() {
 	
 	# Strip off the debug level and ensure it is an integer
 	DBGLVL=$1; shift
-	if ! [[ "$DBGLVL" =~ ^[0-9]+ ]]; then
+	NONDIGITS=$(echo "$DBGLVL" | tr -d [:digit:])
+	if [ "$NONDIGITS" ]; then
 		bbfatal "$USAGE"
 	fi
 
-- 
2.1.4


