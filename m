Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 31D787ED15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:45:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p74so21636178wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9lbR4I4+UUHgZVeaqH+baS/K1cDsjqlxsC88Fr0UKIs=;
	b=Qq2TiALmuMzLsf1q10Hzn7V7PMl/IrQOS/PKllKzE352RY+mjd0KFuj3SRwl+A2Jfw
	wVgG1579H6ZR/m6jlTmR5ePTbN1rhkcWStA0jK0KrErOR8JihId+TrHOZ0ImKg3ZkV5Q
	rLqYaqTurpcq6P0ZIw1/9/jyRNo2HKEo2OhKO+s3wQU0eRazPiBw1KqJS7q+1YZyYrK0
	qSvlcQrKv8aZ3iE5QHN0WnKIT8nHIioryL2c0zyF7SJgklF62xuFlqMFTuIvw5DMa6GW
	GJVMiWzf2i/b4J+XjO4/PxT3Swql2LUEZEAeSgR3hvQAEOpW01ao0ybBYmLgs2JJ6VaA
	N2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9lbR4I4+UUHgZVeaqH+baS/K1cDsjqlxsC88Fr0UKIs=;
	b=bJo0H5Me2WiyJRpZNATMiJXPYRGed/Bf9GzuZOGSgVgLXisgb41cRcTKPHSNGm5xJD
	5Ub+qOXDEQpmM2FYDuLh4SoFPx6cWk6dgiyf6S5Dgl9QOKWwZZlS5xYUIfBmCQVNcTiu
	+ZDC5Pyzekej28i6ZkqWE5gxSzJYbqgYAk2VOa1m8svA6bXDloMPwyxscXCRvbmfwGGS
	xsMNVtDhaB3a3meI3ymTd12S51kArqRL/maSEWZlOzL5tRJa5lLZzAFn2AUQKZhkY4ub
	vUc/np8l8ypf2WhUUE9kSBOV6zky1Yg9LmJJaoDT0da0V9T7NAFwZDW2LjJMg8BOkvTG
	OW8Q==
X-Gm-Message-State: APjAAAUCqJDBeque60gmTve2zJXx9RJRU5WiPkVNlwHYhXNmTiS8bWM+
	1M5emZzIO1THFQSCDeMC7Bz6aVcaCD0=
X-Google-Smtp-Source: APXvYqyYVzFFkwXUi27aEoz6QPV/h37Ze0M/sEZe7LPsHlifoVCXjL2/DBCtAZt28NlhTlPMGJdTZQ==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr35564177wmb.39.1563360348744; 
	Wed, 17 Jul 2019 03:45:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o11sm22822097wmh.37.2019.07.17.03.45.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 03:45:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 11:45:38 +0100
Message-Id: <20190717104538.20990-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717104538.20990-1-ross.burton@intel.com>
References: <20190717104538.20990-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] cve-update-db-native: use SQL placeholders instead of format strings
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
X-List-Received-Date: Wed, 17 Jul 2019 10:45:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e16c41a72fd..72d1f48835b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -62,7 +62,7 @@ python do_populate_cve_db() {
             break
 
         # Compare with current db last modified date
-        c.execute("select DATE from META where YEAR = '%d'" % year)
+        c.execute("select DATE from META where YEAR = ?", (year,))
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-- 
2.20.1


