Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SqW1L-0006OZ-5u
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 23:06:27 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:50577 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SqVqR-0002m1-3u; Sun, 15 Jul 2012 16:55:11 -0400
Date: Sun, 15 Jul 2012 16:55:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207151647040.1884@oneiric>
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
Subject: kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git directory
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
X-List-Received-Date: Sun, 15 Jul 2012 21:06:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


In do_kernel_checkout(), replace the creation of ${S}/.git with just
the creation of ${S} since the .git subdirectory is created only a few
lines later using a "mv".  Here's the original code:

  rm -rf ${S}
  mkdir -p ${S}/.git

  echo "WARNING. ${WORKDIR}/git is not a bare clone."
  echo "Ensure that the SRC_URI includes the 'bareclone=1' option."

  # we can fix up the kernel repository, but at the least the meta
  # branch must be present. The machine branch may be created later.
  mv ${WORKDIR}/git/.git ${S}    <-- See?  There it is.

There's no functional change here, it's just less confusing.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  yes, i realize this doesn't change anything, but it's potentially
confusing for the code to explicitly create ${S}/.git, shortly before
it whomps over top of that directory anyway.  i spent a couple minutes
puzzling over the above trying to figure out if there was something
subtle happening i didn't understand.


diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 48c8974..8e010e0 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -106,7 +106,7 @@ do_kernel_checkout() {
 	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
 		# we build out of {S}, so ensure that ${S} is clean and present
 		rm -rf ${S}
-		mkdir -p ${S}/.git
+		mkdir -p ${S}

 		echo "WARNING. ${WORKDIR}/git is not a bare clone."
 		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


