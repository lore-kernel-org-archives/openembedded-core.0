Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE8D79E9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:51 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y4so1636848pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=657+sfQb4Em9gXpr+ypgS4sY54pvn6czvCFLKlF/kMg=;
	b=ZaxmzFt0A9Kz5IEEvStfad0Na8g/84vctQi76l8quw61ImPcIdVvIXMvF7C4ZdEvHL
	CbCCfxln/cfm7EzHVfXRYqNHxJri7Fr/c4aRlNMfkcPuPqK3QgHsXvMIw3uPMbDDNSjO
	Gp9IKeDZ/LWEcTbZ8tkCZ35jZEKbOhq3Ytczm1lXvQxj6I2D8ZsVWnkXEEjlUgvqjLWq
	XLGImBmZ8rAMCYqnKgbJvQTTI5NfhII7onsek0OAEBssznLAxZn2S2rfQltvPK8PDnee
	M8zqb7LoupHTD8Puq5S2EbzwvIX/5H4HO3ltO8+0pQGHsKBZK8W2TGgheDRULMGd1gIx
	wWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=657+sfQb4Em9gXpr+ypgS4sY54pvn6czvCFLKlF/kMg=;
	b=SuZ0bt9ej6Lji8fSdf95B359wbQ8G9lMKMWm9JUB5WWMVFiVaUmhrNzGSTWvrRAqum
	0hlQgeh1Zp1SO4nzgYeStza0qQMOZcwyb/0epMnoFr4nRTnVXsW/JPb6nZtcCC//RA+4
	Xsh2/OBRJfF3SW/txR9EC6ePXzgCd4QcebYTuCU8L8+MYWt9QaojpBgyljK90q4G2ZHi
	ZWalyWBxTxy5jWNASGXpimvwEI/3QbAeDcAgRJD4Jl1gZ12GMRNaeoSC8vr6laaOZBlr
	MDNbWa6nFVdKqvYoyeA/zGdzpqd2xou6XWayds1mxgpcS60WpnQJybaCDzbl5lDOSkyx
	0gkA==
X-Gm-Message-State: AA+aEWYu077b6KvD0LCEgwk/LczMMnEAGJxkUjrYAQCixQhHopr1KgSj
	Amb9P41ZQsdsbVYP3f+YsQ8Tgad5
X-Google-Smtp-Source: AFSGD/XqTEoE700uy3daHzvS/AXU+yLSCPzjDbXwOe4kn2g6GqN36gkYtRPYVOIr2qiTdYhqvbJ/yg==
X-Received: by 2002:a65:50c1:: with SMTP id s1mr405195pgp.350.1544737192151;
	Thu, 13 Dec 2018 13:39:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:51 -0800
Message-Id: <39e5798b8267431b3dd174108f94ee72a4a75ed5.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 43/45] default-versions.inc: Make PREFERRED_VERSION_openssl* overwritable
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:51 -0000

From: Stefan Lendl <ste.lendl@gmail.com>

defaultsetup.conf and therefore default-versions.inc is sourced pretty late in bitbake.conf.
default-versions.inc overwrites previous assignments of PREFERRED_VERSION_openssl.
Assigning it with ?= allows other .conf files to assign correctly.
in particular assignment in conf/local.conf and machine config is used instead of default.

(From OE-Core rev: c9786adf81434e2d58247f55cf80fdd3131121e7)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-versions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 8680738..3d88e8f 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,6 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl = "1.0.%"
-PREFERRED_VERSION_openssl-native = "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
+PREFERRED_VERSION_openssl ?= "1.0.%"
+PREFERRED_VERSION_openssl-native ?= "1.0.%"
+PREFERRED_VERSION_nativesdk-openssl ?= "1.0.%"
-- 
2.7.4


