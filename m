Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TOzAj-0003db-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 01:06:37 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so7741152pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 15:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=RcDmgiqzcadghUJoOtLiOZe6xu5Ac3M03eibj8brr7Q=;
	b=EnDB7DPMt8GGETW0b2Qf+Rw0CsjUWbYqE/E9EYx9EOA5qB/fTJQO1e6SG8vBS/Yk6u
	NNgZrzq/KgteVtibun/th1LA8ZLl65Oe/PEW9gVjcN3xutI1omG9yJBZd0ndCzffD/64
	03WJbAoVSQ1J0dLHLbEfMtU+proR60A95ecnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RcDmgiqzcadghUJoOtLiOZe6xu5Ac3M03eibj8brr7Q=;
	b=gi2sD342yVs+iQdJe9XkkZkZWxToymmvVPyNcu30vnFxbX2hZvRN5QzjiVQFqFO8Ge
	y9fRaRDJMzraTjvTRm2E05wBL7bo85oEg8t24hXLt3+bGX4ydom7+Uji5ERDwjqlH47E
	CjWtm+kRdbF0+EUttYdSqyYM2JzFJqNcvMWHlXYK1XSH11gyV7EDCRRv7bsuwHEq5+rw
	/l1UhfTGU7ceyCmU0kdNwX0pVro242m7J17a7DVud2ilB9k8kEopsRU5gjwWIK0wVSG9
	wCQ2DNjaKA8QYSANZSbSdHNV/ZcvxdIkgM3XuM+daleNA55Ha1ZtmAR+vyP25ZWGoUD1
	PCFA==
Received: by 10.68.218.226 with SMTP id pj2mr71456994pbc.33.1350600796610;
	Thu, 18 Oct 2012 15:53:16 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id kr4sm145366pbc.76.2012.10.18.15.53.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:53:15 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 15:52:57 -0700
Message-Id: <1350600777-2327-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnLPAUL2N+FeS4KezzjrGBXSd9GoynuFM2rexASHRWUG+YKz3Gfm0/gLR5zYEY2Pj+AcSdm
Subject: [PATCH v2] sstate: add manifest info for shared file matches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 23:06:38 -0000

Present the manifest file that contains the matches for
files being installed to a location that already contains
that file. This will help to determine which is the correct
recipe to fix when this occurs.

[YOCTO #3191]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sstate.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d2a120b..7c00381 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -120,6 +120,7 @@ def sstate_add(ss, source, dest, d):
 
 def sstate_install(ss, d):
     import oe.path
+    import subprocess
 
     sharedfiles = []
     shareddirs = []
@@ -164,8 +165,12 @@ def sstate_install(ss, d):
                     break
             if realmatch:
                 match.append(f)
+                sstate_search_cmd = "grep -rl %s %s | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
+                search_output = subprocess.check_output(sstate_search_cmd, stderr=subprocess.STDOUT, shell=True)
+                if search_output != None:
+                    match.append("Matched in %s" % search_output.rstrip())
     if match:
-        bb.warn("The recipe %s is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % (d.getVar("PN", True), "\n   ".join(match)))
+        bb.warn("The recipe %s is trying to install files into a shared area when those files already exist. Those files and their manifest location are:\n   %s\nPlease verify which package should provide the above files." % (d.getVar('PN', True), "\n   ".join(match)))
 
     # Write out the manifest
     f = open(manifest, "w")
-- 
1.7.9.5



