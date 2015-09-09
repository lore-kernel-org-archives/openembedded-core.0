Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD11765DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 12:44:38 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so155776215wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 05:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VbnIph5CXiX6bQDMXVLYRQV6/vDAMjeLD6YFktXF1RQ=;
	b=M00yXSGfs61C2pjmPUldtueWCKk+XPxkiFivMI7r8mQO2HyEgXfT6sVDfXuv6fV0Ek
	m8WMUUfwrEDeL+2Jv6zry+SmMs1XaMvTFqYFccxnsmx7Sbdg5yKCaPLXJ8rDMl399VzO
	0wBDhIagbBxhgbm3wOoaj/kD6V30sSR13DgwC37e0/Ft/MbFXAAYEgsScIcl4wGkWMv6
	mhSkHjJluB/SNY7Pt4zH8xbdLGTclB0XKMCjNPPzBlLjVe1rNoHaniHFUzTnSepJcYxQ
	jdQ/GaMq3gLEaEJUWq5ukHFV3VApCksC8OWohI6V8/Kqp48fj/3lEIU6ajdR3DljFOXb
	uTjw==
X-Gm-Message-State: ALoCoQkZ9aLFFiGFI039WV9eev1oeuugrsPH8tGOEZBbmehBas/OQLTuzMqnAPDE1/vC1H3A7vZw
X-Received: by 10.180.21.137 with SMTP id v9mr54035902wie.8.1441802678403;
	Wed, 09 Sep 2015 05:44:38 -0700 (PDT)
Received: from Blackadder.home
	(host81-153-67-238.range81-153.btcentralplus.com. [81.153.67.238])
	by smtp.gmail.com with ESMTPSA id
	bu19sm10083075wjb.45.2015.09.09.05.44.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 05:44:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 13:44:35 +0100
Message-Id: <1441802675-25381-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.3.2 (Apple Git-55)
Subject: [PATCH] sstate: only fetch remote signatures if verification is enabled
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
X-List-Received-Date: Wed, 09 Sep 2015 12:44:39 -0000

Only fetch remote signatures if verification has been enabled, as otherwise the
fetcher throws errors that sstate.bbclass can't ignore.

[ YOCTO #8265 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 77313bc..50729bf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -615,9 +615,12 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
-    for srcuri in ['file://{0}'.format(sstatefetch),
-                   'file://{0}.siginfo'.format(sstatefetch),
-                   'file://{0}.sig'.format(sstatefetch)]:
+    uris = ['file://{0}'.format(sstatefetch),
+            'file://{0}.siginfo'.format(sstatefetch)]
+    if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
+        uris += ['file://{0}.sig'.format(sstatefetch)]
+
+    for srcuri in uris:
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-- 
2.3.2 (Apple Git-55)


