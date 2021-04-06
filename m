Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.11625.1617714518198049330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 06:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=QF4JkFEP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7D65320B5680;
	Tue,  6 Apr 2021 06:08:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7D65320B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617714517;
	bh=impXSJt6Ggs0Rh9m0DiAHMGjO9F4/353cga4CTtPSro=;
	h=From:To:Cc:Subject:Date:From;
	b=QF4JkFEPl36h/V3bNKAKZkgbRf2/Hrksh18ohST2lGpqwj32SWhtTV7yJpAb2TYYS
	 7Q6WKdzBhIdI4c4yASHBSBEsJpSjNQj0RELFFHaKpfhkVb1eIwqswZehH3nmhVKeY6
	 GH4OVzoCWmvt/jZtOtp01hhIUO7miOlrF47LrccI=
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com,
	raj.khem@gmail.com
Subject: [dunfell][PATCH 1/2] goarch: map target os to windows for mingw* TARGET_OS
Date: Tue,  6 Apr 2021 06:07:57 -0700
Message-Id: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

mingw32/mingw64 is not a supported value for GOOS, so map from 'mingw*' to
'windows' to enable building for windows targets.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1099b95..ecd3044 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -114,6 +114,8 @@ def go_map_mips(a, f, d):
 def go_map_os(o, d):
     if o.startswith('linux'):
         return 'linux'
+    elif o.startswith('mingw'):
+        return 'windows'
     return o
 
 
-- 
1.8.3.1

