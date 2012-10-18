Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TOvva-0003mK-UX
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 21:38:47 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so7626595pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=Jmk/S+SMVsB1wwHqZ/17OkLWYEUEBjNZjSHtzwqduD0=;
	b=VGR5SBxFnfb7sV0QFxIAd9h0xdHQPDgalpatTJe5fEIf74tiJpeWvkc5pmEmkIyL31
	scM0qboEHF0HK42peQDXYXvTa8ysuoasm3TVAzKDhiqN0C+hyQ/9IVwq9l2tvItcee7x
	+CJWK4G3DYK08Lk0eWBuOj7TZoUMukTvWX2cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Jmk/S+SMVsB1wwHqZ/17OkLWYEUEBjNZjSHtzwqduD0=;
	b=PqJq1takb1vE7S8XAM+Rrd9DediTQubqRkREve2QynSoLbOUj9ZAAo9sAlixavu+a+
	sKhm9Kcef2vJAiiGsu/RBpuoI3Ps3rHU8cL6LxR7eD5Y2J1clxIcWiUYE0yBsXOHHJdo
	G6gev/nlkAvwRN5bXujjBt3FIPbri475euXEUK88pItzd5GSUNdEEkQVz0OIL8OmuNZZ
	LctXfWNy3PKCQsuRSr6BOhYZKPXonNKfThjYJokzaUW77AJvpD3UUNrEFHK2Bt22GPN6
	GFE8tn87mb69OljMReRZYXiK1bqGjYRrIU9xUF8mAIX2ap0DO2X2zEKyIe8d2EOOp4my
	EeDg==
Received: by 10.66.72.36 with SMTP id a4mr23209427pav.16.1350588326401;
	Thu, 18 Oct 2012 12:25:26 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id mt15sm5026427pbc.49.2012.10.18.12.25.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:25:22 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 12:25:05 -0700
Message-Id: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmVl/uClY8Fki5WAe+1bS8dja7XrAKvdcegERmDIB1lHpc7EkoHowUaJPsXpe5Lu2m08ZmG
Subject: [PATCH] sstate: add manifest info for shared file matches
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
X-List-Received-Date: Thu, 18 Oct 2012 19:38:47 -0000

Present the manifest file that contains the matches for
files being installed to a location that already contains
that file. This will help to determine which is the correct
recipe to fix when this occurs.

[YOCTO #3191]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sstate.bbclass |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d2a120b..140dd59 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -27,7 +27,7 @@ SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGI
 # Also avoid python issues until we fix the python recipe
 SSTATE_DUPWHITELIST += "${STAGING_LIBDIR}/python2.7/config/Makefile ${STAGING_LIBDIR}/libpython2.7 ${STAGING_INCDIR}/python2.7/pyconfig.h"
 # Avoid docbook/sgml catalog warnings for now
-SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
+#SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
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



