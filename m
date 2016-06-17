Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 915C4700FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:13:37 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a66so98620043wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 05:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sHoz7yDGOnZKAyk0bkC9n6bHMurXeFytQd0WTlqdMkY=;
	b=niw6aaY4t2WzUV/N8iW3O+Mxd/DBFXBGeLf4tfS1khQqfysNZ5nJoAlUm9+0gdiQ4b
	pKlqF/2xRe68KrJ/DZ8GkiN9QnbUrW82TBzKGLOC6SGUqYH4aAit7HH93h1fZYZOBvLK
	eSS2vB1qJVJk+8nfKoUJQgp0+Ytr9acYsV9xi6+vfDDDJJ41zimBqNtMW1frADeWvfnY
	NQ1LaTkyZFgpPVVy9s1vdWlkZzuGbbu2yWEx4iH1QkISeUpaKz7n4tPftcUiN8pYvR8U
	MPhGTKHQxowsK24ERuu1aGItHromrJz/F3OeY6msXn/g2eM+T111F4r8bKQFoleVsKnU
	gqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sHoz7yDGOnZKAyk0bkC9n6bHMurXeFytQd0WTlqdMkY=;
	b=h8Y4UCYdOFdgrl7sXLn8+Jl/PfkQ2ckHkdwJXiGZShY/nxSMyWzfc0w2jaV1twD/vT
	/WtqjUQSEY/JQbFqJwubMV0vgzcZHzK+Z2+H6cCdvUqFpRZErdr4OOHP1rQb3dfy90+j
	PUFbbzlGoR9rr/N7AkIv9GgO3GLwFFDK1/rORcINh2RfcjFn5v8u/6x1uyFC1leL+JI5
	wtASeU7ASs/8fMNKAdBRq3LNzBKt3zsoCG1CwI1G6d4wYBGlZcrPkPu2PSpHs7VjU3B3
	f28KIOOh2/K5ye74H4xgJ0uLnQWH0Pviifq4RCWTVJyDG0PcihhiJca7mseekSBIS1Gz
	id9Q==
X-Gm-Message-State: ALyK8tIgqjy4vbHTQMXaIhnhQVek15g3aSP93ukfthJtOarPnyGqSqLcYAntGfj/Vya9I3md
X-Received: by 10.28.21.140 with SMTP id 134mr11260178wmv.50.1466165617443;
	Fri, 17 Jun 2016 05:13:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b77sm5162848wme.0.2016.06.17.05.13.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 05:13:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:13:33 +0100
Message-Id: <1466165614-9635-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] xcb-proto: use python3 instead of python2
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
X-List-Received-Date: Fri, 17 Jun 2016 12:13:38 -0000

We previously patched configure to stop looking around for a Python to use, and
to use the Python binary and install paths that we specify.  Now that we depend
on Python 3 its possible that bitbake is being built on a machine without Python
2 installed, so hardcode the python3 interpreter instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
index f808e19..09b6088 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/no-python-native.patch
@@ -20,7 +20,7 @@ index d140bfe..c7b68da 100644
 -AM_PATH_PYTHON([2.5])
 +pythondir="${libdir}/xcb-proto"
 +AC_SUBST(pythondir)
-+PYTHON="python"
++PYTHON="python3"
 +AC_SUBST(PYTHON)
 
  xcbincludedir='${datadir}/xcb'
-- 
2.8.0.rc3


