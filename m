Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5326B3C7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Sep 2013 08:40:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r888riBt006011; Sun, 8 Sep 2013 09:53:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GCJvKu7cyIVa; Sun,  8 Sep 2013 09:53:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r888re6W006003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 8 Sep 2013 09:53:42 +0100
Message-ID: <1378629609.3484.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sun, 08 Sep 2013 09:40:09 +0100
In-Reply-To: <522B8B50.6080508@pabigot.com>
References: <522B8B50.6080508@pabigot.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Unexpected behavior from PR server
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
X-List-Received-Date: Sun, 08 Sep 2013 08:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-09-07 at 15:23 -0500, Peter A. Bigot wrote:
> I'm apparently a little shaky on exactly how the PR service is supposed 
> to work.  I noticed an anomaly that adding a patch to SRC_URI for u-boot 
> did not result in a new package revision as I expected.  I'm using 
> PRSERV_HOST="localhost:0" and have bulidhistory enabled.
> 
> I just tried this with a toy recipe named "hello" with a constant PR=r1 
> which does nothing but install a file from SRC_URI into ${datadir} with 
> this:
> 
> PR = "r1"
> 
> SRC_URI = " \
>      file://file1 \
> "
> 
> S = "${WORKDIR}"
> 
> do_install () {
>    install -d ${D}/${datadir}/files
>    install file* ${D}/${datadir}/files
> }
> 
> FILES_${PN} = "${datadir}/files/*"
> 
> I started with one file in SRC_URI, and "bitbake hello" produced 
> hello-1.0-r1.0.armv7a_vfp_neon.rpm as I expected.
> 
> I then added a second file to SRC_URI and re-ran "bitbake hello". The 
> recipe stages were re-executed, the new file was fetched and installed, 
> and I now have a hello-1.0-r1.0.armv7a_vfp_neon.rpm (same name) with 
> different contents.  Build history confirms the differences in the 
> package FILELIST but no change to PKGR, as does dumping the rpm contents.
> 
> It is true that changing SRC_URI had no effect on the run.* task script 
> contents for the package, so it makes sense that the PR server doesn't 
> detect that the package is different from the last time it was built if 
> signatures from those scripts are the only way recipe changes are 
> detected.  But it very much surprises me that changing the sources does 
> not result in a PR bump.  In the normal work flow, adding a new patch to 
> SRC_URI is certainly something that I would expect to produce a new 
> package revision.
> 
> Is this how it's supposed to work?

It appears that something is broken :/

I'll see if I can figure out exactly what but it seems to be something
in the PR server itself.

Cheers,

Richard



> Peter
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



