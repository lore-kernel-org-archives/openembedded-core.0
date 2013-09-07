Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-08.prod.phx3.secureserver.net
	(p3plsmtpa06-08.prod.phx3.secureserver.net [173.201.192.109])
	by mail.openembedded.org (Postfix) with ESMTP id 85A056BEC8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2013 20:23:43 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-08.prod.phx3.secureserver.net with 
	id NLPj1m00C1mTNtu01LPjeF; Sat, 07 Sep 2013 13:23:44 -0700
Message-ID: <522B8B50.6080508@pabigot.com>
Date: Sat, 07 Sep 2013 15:23:44 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Unexpected behavior from PR server
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
X-List-Received-Date: Sat, 07 Sep 2013 20:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm apparently a little shaky on exactly how the PR service is supposed 
to work.  I noticed an anomaly that adding a patch to SRC_URI for u-boot 
did not result in a new package revision as I expected.  I'm using 
PRSERV_HOST="localhost:0" and have bulidhistory enabled.

I just tried this with a toy recipe named "hello" with a constant PR=r1 
which does nothing but install a file from SRC_URI into ${datadir} with 
this:

PR = "r1"

SRC_URI = " \
     file://file1 \
"

S = "${WORKDIR}"

do_install () {
   install -d ${D}/${datadir}/files
   install file* ${D}/${datadir}/files
}

FILES_${PN} = "${datadir}/files/*"

I started with one file in SRC_URI, and "bitbake hello" produced 
hello-1.0-r1.0.armv7a_vfp_neon.rpm as I expected.

I then added a second file to SRC_URI and re-ran "bitbake hello". The 
recipe stages were re-executed, the new file was fetched and installed, 
and I now have a hello-1.0-r1.0.armv7a_vfp_neon.rpm (same name) with 
different contents.  Build history confirms the differences in the 
package FILELIST but no change to PKGR, as does dumping the rpm contents.

It is true that changing SRC_URI had no effect on the run.* task script 
contents for the package, so it makes sense that the PR server doesn't 
detect that the package is different from the last time it was built if 
signatures from those scripts are the only way recipe changes are 
detected.  But it very much surprises me that changing the sources does 
not result in a PR bump.  In the normal work flow, adding a new patch to 
SRC_URI is certainly something that I would expect to produce a new 
package revision.

Is this how it's supposed to work?

Peter

