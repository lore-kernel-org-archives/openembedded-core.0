Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id CF20A601A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 17:21:33 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m85so44253451wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Znj/SExElS17JoFWzq0V0679nNkzRgnjFnNXeYstEK8=;
	b=dDXbTdf3hQpIr0DK4RlvbPQYWHq2TtmmJEgNwwmsA4DWpg1UnCoGxVpQ5gRFDtnGj6
	u1ixO4koGpPV/bWz30Bx1ADBnsngQ7D3Yfi7DVnmvxTPv8OmSlfjWw5a6O+vYrytCVZa
	IFzSEi6JXuE9165/zyE2T80ukAywWklUGUev7Itag5fS8XLswsW5M7AOj0gboqzGbuk5
	RNMZ1oKMLSIiafdcxDuv1UKJ4g9IkwDHDEYK1CYVY7hKZxbS9RYO2S1ZGEPiW9o9JnLt
	sy3K1PrsZMgibfCVIUe23CWJKaDi6HkbbO9GahSUSW7xc1cbVL92NQUvfJgzZ/r1yMdY
	D3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Znj/SExElS17JoFWzq0V0679nNkzRgnjFnNXeYstEK8=;
	b=KfOdzT5AorNo6eKcAZk3hoeuAX4DQw6k+uAG0mPYkJ7XcudhIk+5oXrNKcswmX+Txm
	NGosUOJyyEQ+i3lIHFa85IVzsR/hVJEb3AFD7XFBgrerOL31dCcMQ4v4P4ZxrltG0DTU
	PxvU5fpzH1VqtgIAHLVf4KsXPaGMlcrsjM3Opjj3yK1wCsFofwukaun/PjvGT8U1A/sk
	FjrXgDeKS/O3zCkZjHoSLap2RqZiAshdutitnLV8hbpkhcx3V+qNr/PBjg6ug9Wi7i3N
	UiYlklHsvM3w8xWvMcpt7lhKNpYFwCJXS6lc8iAU0lcmtv/FFnzTzdFJFZWTKd2Xr00Y
	jASA==
X-Gm-Message-State: AIVw112H1QAIdObzpOiEabva/TXGlGho8IQjA7a7vFJJI97mlfzhOMih
	B9XIqo3A31d7VwCWifM=
X-Received: by 10.28.144.7 with SMTP id s7mr7778136wmd.111.1501348894130;
	Sat, 29 Jul 2017 10:21:34 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l1sm6767394wmb.18.2017.07.29.10.21.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 10:21:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 18:21:29 +0100
Message-Id: <20170729172130.12842-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] wget: fix FusionForge workaround
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
X-List-Received-Date: Sat, 29 Jul 2017 17:21:34 -0000

My previous assertion about FusionForge appears to have been wrong, or
FusionForge has changed behaviour, or both.

FusionForge now mandates that downloads have the Accept header set, despite that
header being optional, and returns a 406 Not Acceptable error if it isn't set.
As we were pretending that 406 was actually 405 (Moved) and tried to handle it as a
redirect this results in an infinite loop until Python kills the recursion.

Delete the handling of 406 as 405, and pass Accept: */* in the headers.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/fetch2/wget.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 8ee9769d39b..7c49c2b1282 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -283,11 +283,6 @@ class Wget(FetchMethod):
             """
             http_error_403 = http_error_405
 
-            """
-            Some servers (e.g. FusionForge) returns 406 Not Acceptable when they
-            actually mean 405 Method Not Allowed.
-            """
-            http_error_406 = http_error_405
 
         class FixedHTTPRedirectHandler(urllib.request.HTTPRedirectHandler):
             """
@@ -316,7 +311,9 @@ class Wget(FetchMethod):
             uri = ud.url.split(";")[0]
             r = urllib.request.Request(uri)
             r.get_method = lambda: "HEAD"
-
+            # Some servers (FusionForge, as used on Alioth) require that the
+            # optional Accept header is set.
+            r.add_header("Accept", "*/*")
             def add_basic_auth(login_str, request):
                 '''Adds Basic auth to http request, pass in login:password as string'''
                 import base64
-- 
2.11.0


