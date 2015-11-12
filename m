Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 37D75771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:34 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79684728pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dnZgdF/DBH5f04/FZdQc1YLArB2VgohW3XBWnHMeA78=;
	b=eKIucn6LySwmYr/8wHnocKrIoSdYeuf+OMFaZg0r1vfx7v3M/czu2rlaFw4YyD1uTD
	PWQJNjBNHOVMcjqkcQpFLp7lifbGsPyRDoZiI9RvqTmHXHTakIHJKxFZJz+CBdz1/cmf
	8cN3dDqr834Ebjgkujrg+GhGTe92o1TfQW5Fov/ejJwV+DZFKXrKadJMRTWXopmb189s
	WVDFLBHKW552rXV8htUu/tih3CpKMxCtmuWFDl4TDTEICDT29B/3xUX7D5/5LnT5Q5fT
	iZMgSJOlSncqKx4Ht6heym+a//Whw8mjYIn3CpHEKx4+07xVKZkfiv35UysPyQvkqaWZ
	p+2Q==
X-Received: by 10.68.91.228 with SMTP id ch4mr26879267pbb.41.1447371575119;
	Thu, 12 Nov 2015 15:39:35 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:33 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:12 -0700
Message-Id: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 01/11] recipetool.append: don't choke on a trailing ; in a url
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Apparently bb.fetch.URI can't handle this at the moment.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/append.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 7fe4115..867d55a 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -343,6 +343,8 @@ def appendsrc(args, files, rd, extralines=None):
     simplified = {}
     src_uri = rd.getVar('SRC_URI', True).split()
     for uri in src_uri:
+        if uri.endswith(';'):
+            uri = uri[:-1]
         simple_uri = bb.fetch.URI(uri)
         simple_uri.params = {}
         simplified[str(simple_uri)] = uri
-- 
2.2.1


