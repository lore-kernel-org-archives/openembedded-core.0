Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.8461.1589383494981100105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 08:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04DFOp1k025420
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 10:24:53 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][ 2/2] sstate.bbclass: When siginfo or sig files are missing, stop fetcher errors
Date: Wed, 13 May 2020 10:24:51 -0500
Message-Id: <20200513152451.162042-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513152451.162042-1-mark.hatle@kernel.crashing.org>
References: <20200513152451.162042-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

Prior to fetching, the system checks if the sstate file is present
either locally or on the mirror.  If it is, then it goes to the fetch
stage.  Up to three files can be fetched, sstate, sstate.siginfo and
sstate.sig (if signature validation is enabled).

The previous pstaging_fetch function would iterate over these, and if
a download error occurred would spew forth a great amount of fetcher
failure messages as well as stop fetching the next item in the set.

This was resolved by adding a fetcher.checkstatus() call prior to
the download.  If the file isn't present, then the exception will
be triggered, and no fetcher failure messages will reach the user.

The exception handler is then modified to be a pass so that it will
loop and pull the rest of the files that that are requested.

Additionally, a check for the existance of the .sig file was added
to the sstate_installpkg to avoid an error trying to load the .sig
if it wasn't downloaded.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c0329cd5d1..3528908727 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -333,6 +333,9 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
 
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
+        if not os.path.isfile(sstatepkg + '.sig'):
+            bb.warn("Not signature file for sstate package %s, skipping acceleration..." % sstatepkg)
+            return False
         signer = get_signer(d, 'local')
         if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
@@ -703,10 +706,11 @@ def pstaging_fetch(sstatefetch, d):
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            fetcher.checkstatus()
             fetcher.download()
 
         except bb.fetch2.BBFetchException:
-            break
+            pass
 
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
-- 
2.17.1

