Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id E3DBC60291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:56:27 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160421135626207_0486;
	Thu, 21 Apr 2016 13:56:26 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=46235 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atF7B-0001SM-V4; Thu, 21 Apr 2016 09:57:54 -0400
Date: Thu, 21 Apr 2016 09:56:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1461244406.31320.117.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1604210951380.11134@localhost.localdomain>
References: <alpine.LFD.2.20.1604210639150.4110@localhost.localdomain>
	<1461244406.31320.117.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about order of processing SRC_URI items
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
X-List-Received-Date: Thu, 21 Apr 2016 13:56:30 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Apr 2016, Richard Purdie wrote:

> In general we should try and use += if possible as its simpler and
> easier to understand what it does.

  regarding "_append +=", there are only two files left in oe-core
that i will let someone else deal with if they want. first:

meta/recipes-extended/images/core-image-kernel-dev.bb:

  IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"

and there's this weirdness in meta/lib/oeqa/selftest/layerappend.py:

... snip ...
addtask build
"""
    append = """
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://appendtest.txt"

sysroot_stage_all_append() {
        install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
}

"""

    append2 = """
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append += "file://appendtest.txt"



  not quite sure what's going on there with those two variations of
assignment to SRC_URI, so i'm just going to leave it alone.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


