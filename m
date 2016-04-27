Return-Path: <matt@madison.systems>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B00E76E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:32:18 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id bt5so18732191pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cJZb0xxr2+SKEnphzGXCaj4hJjrX3arMk1sLYCRdyG0=;
	b=S8vaiPZLADA6FBiTceEHkB6Ks2Lv6Xx8QQjHJnOpfs1rct2kKvEL6LNYYHxxdKbfJb
	qsNp10Z/MD+G/rLAeMNZRAREA+biO0xe9J4o4Fdxq1wgh8T5XTTtOlVUnRxR5AuaUDKU
	dmYUTyfoAnYt8dJdi3/JCPOe+J8WT/xKhQciIX2rTaIGGhtNPbUWdLOdQeGnK0DDR2hw
	wWGDqgH3LIRYDXNxTHyctImjNzaoNoMC9Wd2RobGaS/j6nWnTutLCmqoRR9lgEE3holl
	ZebE/DBFoZ7i+uZyG4u4LxShH4ewO3bXLC9C5dAdRGEA7UnXHabf+FTaMwMAecfSlL8V
	ecpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cJZb0xxr2+SKEnphzGXCaj4hJjrX3arMk1sLYCRdyG0=;
	b=FWdhYH3NHWy9lhFvP4WowgUQ+ldFPb/uiWvnGPYTlZXKLq9H5uqiinCRpHjqbKmln+
	aTNr+zXEgATkrhsPMoWiEG05r7HA2oNY8ZXIJEN52N+S7t86veilfXsddXBwZdlYS/t6
	KAfj3NPGWewlz9L98zBdOLTwKFl7HYzai9aGGywESJkNsatupl3gwE8UoV8OOMUwdw98
	7oPic5ZzcvJ7n6tTdwymMfMoq+zfiWvV5MRxE/Jv2F1FjQrfHbRr7cE/JleY0mqvqB3j
	vwyfzS4KkG+4m1CXju0/kI/aCE5PjZUG9vHcRfglaeOMJWYVSWWsdlNtyOKAr85p1gp0
	INyQ==
X-Gm-Message-State: AOPr4FVjSv/suvtUJr9R+B/NekSKn7Zwzz0ujv72fgmvxaYEx/Abi5I2YLniw8AkT+4pPA==
X-Received: by 10.66.189.65 with SMTP id gg1mr11423196pac.148.1461760339248;
	Wed, 27 Apr 2016 05:32:19 -0700 (PDT)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	c190sm6295285pfb.33.2016.04.27.05.32.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 05:32:18 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 05:32:03 -0700
Message-Id: <1461760323-27285-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1461760323-27285-1-git-send-email-matt@madison.systems>
References: <1461760323-27285-1-git-send-email-matt@madison.systems>
Subject: [PATCH 1/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 12:32:19 -0000

Expanding it causes the do_image_x function to include values of
variables that may contain date/time stamps, rather than references
to the variable names, leading to spurious taskhash mismatch errors.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8bfd241..d695d30 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -380,7 +380,7 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('TMPDIR')
 
-        image_cmd = localdata.getVar("IMAGE_CMD", True)
+        image_cmd = localdata.getVar("IMAGE_CMD", False)
         vardeps.add('IMAGE_CMD_' + realt)
         if image_cmd:
             cmds.append("\t" + image_cmd)
-- 
2.7.4


