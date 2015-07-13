Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C25DB75ED4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:08:54 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so43999567wgm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PwhNfaEjchg0QfLNjZsclSAoA/RdGyMuCL3JvT0R6Ag=;
	b=PspY+bw6qfS++IjhORxEvvFBqr+PySBt3NM36yZ+NocUbFUpgMNPzPcN5hJBaFoGlJ
	NPG/j18NDJOxjUHfvFut5Ql6uCAfJUZFJhAiajglE+ze5bCC3ikmmSPR2nwzBpaahE6Y
	jSf+ZJAa+EST396l/UPNL8bGNpKnMA91MkG96L04u+QsfG320MIsiSuU8sx8cWq0qsCz
	SspHbcy78YKCIqASVwAfr6zVmYpAPTFzcwU8oXB5kyCY+H2vhPRJH5xYaP8h/c0OnVkc
	bA2jPCvmw9i/jD2dcIWmWC0Jun+El6yUVl2nyKcjNk+fYquipuvxIyQX+zyB2+borhsg
	JAJA==
X-Gm-Message-State: ALoCoQnbReNHo7qNbqF8BdgD8njqGYWOZuDDW+Gs0RqMXPrvsnXtxCXuyLBrALx2UvfGbL/Wo8lN
X-Received: by 10.194.83.196 with SMTP id s4mr34596682wjy.43.1436796534141;
	Mon, 13 Jul 2015 07:08:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.08.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:08:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:02:59 +0100
Message-Id: <972e207e1369b37a7144efef223622304a77d3df.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 1/7] build: don't automatically mkdir/chdir B
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
X-List-Received-Date: Mon, 13 Jul 2015 14:08:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/build.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
index cce01fe..7cefee7 100644
--- a/bitbake/lib/bb/build.py
+++ b/bitbake/lib/bb/build.py
@@ -183,7 +183,9 @@ def exec_func(func, d, dirs = None):
         adir = dirs[-1]
     else:
         adir = d.getVar('B', True)
-        bb.utils.mkdirhier(adir)
+        bb.note("NOT creating implicit %s (for %s)" % (adir, func))
+        #bb.utils.mkdirhier(adir)
+        adir = None
 
     ispython = flags.get('python')
 
-- 
2.1.4


