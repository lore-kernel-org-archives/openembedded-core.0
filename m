Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TqnSo-0001x2-6u
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 17:16:18 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:50490 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TqnEF-0002Pk-LZ for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 11:01:11 -0500
Date: Thu, 3 Jan 2013 11:01:07 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301031058470.11708@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] package.bbclass: Skip testing "packages" a second time.
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
X-List-Received-Date: Thu, 03 Jan 2013 16:16:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Since the "packages" variable is already tested a few lines above in
the same routine:

    if len(packages) < 1:
        bb.debug(1, "No packages to build, skipping do_package")
        return

there is no point testing it again, and the error message doesn't even
refer to "packages", anyway.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1ac6551..e609260 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1885,7 +1885,7 @@ python do_package () {
     dvar = d.getVar('PKGD', True)
     pn = d.getVar('PN', True)

-    if not workdir or not outdir or not dest or not dvar or not pn or not packages:
+    if not workdir or not outdir or not dest or not dvar or not pn:
         bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
         return


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


