Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 34F3271AD9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 12:52:30 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161023125228621_0484
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 12:52:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=42914 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1byIGF-0007C3-65 for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2016 08:52:23 -0400
Date: Sun, 23 Oct 2016 08:51:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610230847370.32524@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: "run-postinsts" added twice to PACKAGE_INSTALL
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
X-List-Received-Date: Sun, 23 Oct 2016 12:52:32 -0000
Content-Type: text/plain; charset=US-ASCII


  minor observation ... messing with toolchains, and i noticed (via
"bb"):

$ bb show -r core-image-minimal PACKAGE_INSTALL
Parsing recipes..done.
# PACKAGE_INSTALL=${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}
${FEATURE_INSTALL}
export PACKAGE_INSTALL="packagegroup-core-boot run-postinsts
run-postinsts "

  wait a minute ... why is "run-postinsts" listed twice? (no harm, of
course, just superfluous.)

  so ...

$ bb show -r core-image-minimal IMAGE_INSTALL
Parsing recipes..done.
# IMAGE_INSTALL=packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
${CORE_IMAGE_EXTRA_INSTALL}
IMAGE_INSTALL="packagegroup-core-boot run-postinsts "


$ bb show -r core-image-minimal ROOTFS_BOOTSTRAP_INSTALL
Parsing recipes..done.
# ROOTFS_BOOTSTRAP_INSTALL=${@bb.utils.contains("IMAGE_FEATURES",
"package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}
ROOTFS_BOOTSTRAP_INSTALL="run-postinsts"

  so it's being added both as part of IMAGE_INSTALL and as part of
ROOTFS_BOOTSTRAP_INSTALL. someone else is free to decide whether
that's worth caring about.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


