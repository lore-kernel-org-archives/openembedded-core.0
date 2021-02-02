Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: oeJXWaOCWbrcBtUK/udPlzZcM22Y2lfClIw3hdgRlqF85SFJkdfJIQcNDKbS2HqOJLeG4C2ZPG
 S0TP7I5UddaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876904"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:29 -0800
IronPort-SDR: qqEgCcDP6NJHgVud8WxRhB7XjxQATsQQ5kTAFlhwuxiuDeU+TjZn6MPvqOLe0J7zGpBNmYmO2d
 rhhOioI7Kneg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360947"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/25] buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES variable
Date: Tue,  2 Feb 2021 13:33:56 +0800
Message-Id: <83ee03a6f05ff60459dbcc4fcfb78f95bb0b4848.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Bergin <peter@berginkonsult.se>

An exception is fired when a BuildStarted event is sent to buildhistory bbclass
and the variable BUILDHISTORY_FEATURES is not set.

    ERROR: Execution of event handler 'buildhistory_eventhandler' failed
    Traceback (most recent call last):
      File "<...>/meta/classes/buildhistory.bbclass", line 862, in buildhistory_eventhandler(e=<bb.event.BuildStarted object at 0x7f94c3810250>):
         python buildhistory_eventhandler() {
        >    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
                 reset = e.data.getVar("BUILDHISTORY_RESET")
    AttributeError: 'NoneType' object has no attribute 'strip'

This can happen in a multiconfig build where the default configuration use the
buildhistory class but not the configuration in mc. It should be a rare case that
this happens and it was found in a missconfigured build.

(From OE-Core rev: a74e30a4de02c8efd3e7102ba7a4fe06df53cc34)

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55ead1be58679c3bcb7d1c141672b999d53e90ef)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7d5e3eb8fd..3a6780da34 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -855,7 +855,7 @@ END
 }
 
 python buildhistory_eventhandler() {
-    if e.data.getVar('BUILDHISTORY_FEATURES').strip():
+    if (e.data.getVar('BUILDHISTORY_FEATURES') or "").strip():
         reset = e.data.getVar("BUILDHISTORY_RESET")
         olddir = e.data.getVar("BUILDHISTORY_OLD_DIR")
         if isinstance(e, bb.event.BuildStarted):
-- 
2.29.2

