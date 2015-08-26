Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5A076734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 20:41:50 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so55965457wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 13:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FZn/z0efDLXKMTsE6bQy3taC1I+wK1OhB+BKjsG3Z7k=;
	b=fC3Gho2uHzmqEGlPzzkr6MFXHWsrplBMZRxChpb6RHkru4K8NPuCwqSSxzcraEEXTO
	DZQyY8Feir/YpbBU++0sG/9631a2LFjSGimmzEPTGbHE/QWmzBXkr0TykMRcJ21O8JZS
	y9KM7x+GNUfEp/ztdOwgMaPh1YoxxYO5nO7VHKiOJdJdPLBsKScXXirG6nHQuLz7XtWF
	423SxyDWDeOU43wq0nfKC9djhFDgxVq0qH6iNXvTOWhf5ndlW2gjC/ueTf5vHcOmYJ+0
	/VtHpnfyZJ74cHNdxg+EGJ3MromXh/0UdH72/wjj7M4QBDpLoaKSvr2LfnTrq7uaJEzd
	nfAw==
X-Gm-Message-State: ALoCoQkhQ6lXu+jq1ivihrgerNXaJ9sizRVG41ECnXWBYMzAk1MLO7xYDoEv+96Oc6PuSnvtNtC2
X-Received: by 10.180.219.101 with SMTP id pn5mr14312522wic.89.1440621709932; 
	Wed, 26 Aug 2015 13:41:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v8sm5560547wjr.15.2015.08.26.13.41.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 13:41:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 21:35:20 +0100
Message-Id: <1440621320-22747-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] byacc: fix compilation on Ubuntu 14.04
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
X-List-Received-Date: Wed, 26 Aug 2015 20:41:53 -0000

Ubuntu defaults to passing _FORTIFY_SOURCE=2 which breaks byacc as it doesn't
pass enough arguments to open():

inlined from 'open_tmpfile' at byacc-20150711/main.c:588:5:
/usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:24: error: call to '__open_missing_mode' declared with attribute error:
open with O_CREAT in second argument needs 3 arguments

Add a mode of 0666 to fix this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/byacc/byacc.inc              |  4 +++-
 meta/recipes-extended/byacc/byacc/byacc-open.patch | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/byacc/byacc/byacc-open.patch

diff --git a/meta/recipes-extended/byacc/byacc.inc b/meta/recipes-extended/byacc/byacc.inc
index fae9e25..f9f8d6b 100644
--- a/meta/recipes-extended/byacc/byacc.inc
+++ b/meta/recipes-extended/byacc/byacc.inc
@@ -5,7 +5,9 @@ programming language."
 SECTION = "devel"
 LICENSE = "PD"
 
-SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz"
+SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz \
+           file://byacc-open.patch"
+
 EXTRA_OECONF += "--program-transform-name='s,^,b,'"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/byacc/byacc/byacc-open.patch b/meta/recipes-extended/byacc/byacc/byacc-open.patch
new file mode 100644
index 0000000..9160543
--- /dev/null
+++ b/meta/recipes-extended/byacc/byacc/byacc-open.patch
@@ -0,0 +1,13 @@
+diff --git a/main.c b/main.c
+index 620ce3f..82071a4 100644
+--- a/main.c
++++ b/main.c
+@@ -526,7 +526,7 @@ my_mkstemp(char *temp)
+     }
+     if ((name = tempnam(dname, fname)) != 0)
+     {
+-	fd = open(name, O_CREAT | O_EXCL | O_RDWR);
++      fd = open(name, O_CREAT | O_EXCL | O_RDWR, 0666);
+ 	strcpy(temp, name);
+     }
+     else
-- 
2.1.4


