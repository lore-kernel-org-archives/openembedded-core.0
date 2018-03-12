Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4942C78449
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 16:39:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id m4so3565978wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=89mMeBt9N0m4gVkH+2S0IqaUWdL9xe3LikxP6+TNshY=;
	b=2ShIEepmcWZhKpi349dH7kF02Wefv2uJj8350bvD2iPaSPGmY1Gi9LYxeQ1C682TMu
	H3K8KyH7flKPn3KWho7bnhWCM5JaZBBRkdP73G9HrXZmyHQr8YWeOGwX6Mku3bY3kUkg
	rFhSHjUd8TfvuSNqlnDIRZN6bnw+Rg6+GZUvl9E/KmFzT27jB0Oej5i4ozn2WwIPfFr3
	dOewLCli5KnQi/RQZ7mdZ6G7dCsIAjVMcq/ouU+GyU6VPCZNKqjYZQaWBhnkduU0+OUx
	MM+A/siu1iVhsrB1Wi00agwLe1QRrwzooP40S1b7l0bI5PBJu8pk+vhfY8wuNBBtSCk0
	MeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=89mMeBt9N0m4gVkH+2S0IqaUWdL9xe3LikxP6+TNshY=;
	b=RQPIKZJEYuAk2aX8VBH8CzKfXKvNhqQkE5YgqrMuBgi2jZe7fCFIGiZlZASLz3vU/o
	KF6/togbH2WjzQTqVsQfoYcR+bq44RC4S3OcIKyGv/1VbcQeVz5u4/4MbC2VUCA2UP3n
	T2uTlE//LFg60BvWM9fOeMLOaBCWAdNe38bhelHY15pmup9H0C5Ofq1udL1WLkdJJGC+
	lZk8xE1eVyXo3SEKqy4JoAv3Po97ThHZE3ySUfS19ggXhY1wkJRTUyrcNraVRGoLFCnS
	rryzTYkgu7Hr/c5Z8bGDxe/sLGN9mwXEAZNgsJvSko1LKY8w5PZPL6mG6JrL/Rds1y60
	siXg==
X-Gm-Message-State: AElRT7EiLyPNLnRbWkOMUEMrBMG7xkoIVP6g7QPzv2uyrg7a9OH3GFHr
	CLzpsTUbbYHdMg0i6R2LkpbayTRe
X-Google-Smtp-Source: AG47ELvPHr/GzD59x+lcBRLFqSrT/ssaUWDCY2R7CcRHQfEfL1I6p1ky22sN13JCBoZtmZrOFOltFw==
X-Received: by 10.223.129.80 with SMTP id 74mr5641383wrm.190.1520872748659;
	Mon, 12 Mar 2018 09:39:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r6sm11064341wrg.63.2018.03.12.09.39.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 09:39:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 16:38:58 +0000
Message-Id: <20180312163858.32353-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312163858.32353-1-ross.burton@intel.com>
References: <20180312163858.32353-1-ross.burton@intel.com>
Subject: [PATCH 2/2] build-recipe-list: build universe instead of world
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
X-List-Received-Date: Mon, 12 Mar 2018 16:39:09 -0000

Building world means recipes that are excluded from world build for whatever
reason get skipped from the manifests, which isn't useful.  Instead building
universe and pass -k so that the expected dependency failures are not fatal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/distro/build-recipe-list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/distro/build-recipe-list.py b/scripts/distro/build-recipe-list.py
index 407debaa76a..3f5f7c2fcc9 100755
--- a/scripts/distro/build-recipe-list.py
+++ b/scripts/distro/build-recipe-list.py
@@ -45,7 +45,7 @@ def generate_recipe_list():
 
     # doing bitbake distrodata
     for machine in machine_list:
-        os.system('MACHINE='+ machine + ' bitbake world -c distrodata')
+        os.system('MACHINE='+ machine + ' bitbake -k universe -c distrodata')
         shutil.copy('tmp/log/distrodata.csv', 'distrodata/' + fnformat % machine)
 
     for machine in machine_list:
-- 
2.11.0


