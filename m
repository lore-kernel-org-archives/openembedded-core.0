Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrVAk-0005q0-OK
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:24:14 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 07:12:53 -0700
Received: by weyt11 with SMTP id t11so901401wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0Y35k/1HL2qW9GTyAsUXMpii/WMN0Sc4g4rCC6Kv5zo=;
	b=KbwZ1t3cBq0kf937BeMEzIiDN+JUWewovjQBeN2ytrX4gaQDKX9wDHoCcb/Muk9D+e
	uDIK7aMt+6lKOHjRqcUx4BpwLHbXiuGf8W4cswhDJIrbfTS9nIu0mhAkud0+q9x5Yn9n
	Wv3l/rTK8gblos9wSSqEtCmPiODWCeKfyrOyJ7MjO+ejXAiUv2+UGouG/VuUkN2/w15s
	cmb1tDd8TyzeluDmQg3tBu2+XRpfKkAUmeAj0GhXJB8tMk7RgEytgL9+VtJ9/PUy00Gc
	Zwvt7gGKu964lbRhlD95TOlCy1ZFDF+KFGyETYdkO++gGKwKUmqEs2Reu+p/ZS8Jlxgv
	kcNA==
Received: by 10.216.123.135 with SMTP id v7mr742505weh.47.1342620770880;
	Wed, 18 Jul 2012 07:12:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm32763984wiw.9.2012.07.18.07.12.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 07:12:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 15:12:30 +0100
Message-Id: <1342620750-2552-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342620750-2552-1-git-send-email-ross.burton@intel.com>
References: <1342620750-2552-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmK8b5hWrnvUZpGOuOx0vfv6cBbApwcbV+P4Ix9JmMrkuhWOsW50bbYl/+kJR5KIJNqRxqP
Subject: [PATCH] sanity: display the parsed PATH/BBPATH when complaining about CWD elements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 14:24:15 -0000

Many people don't understand the nuances of PATH/BBPATH, so help them by clarifying
the warning and displaying the parsed list element-by-element.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 765958e..52226f1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -390,7 +390,8 @@ def check_sanity(sanity_data):
 
     paths = sanity_data.getVar('PATH', True).split(":")
     if "." in paths or "" in paths:
-        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
+        messages = messages + "PATH contains '.' or '' (empty element), which will break the build, please remove this.\n"
+        messages = messages + "Parsed PATH is " + str(paths) + "\n"
 
     bbpaths = sanity_data.getVar('BBPATH', True).split(":")
     if "." in bbpaths or "" in bbpaths:
@@ -402,6 +403,7 @@ def check_sanity(sanity_data):
                 "Please check your layer.conf files and other BBPATH "        \
                 "settings to remove the current working directory "           \
                 "references.");
+        bb.warn("Parsed BBPATH is" + str(bbpaths));
 
     if sanity_data.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
-- 
1.7.10



