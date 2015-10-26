Return-Path: <mark.hatle@windriver.com>
X-Greylist: delayed 1884 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Oct 2015 15:00:05 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 27189758D2;
	Mon, 26 Oct 2015 15:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9QESesg019217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Oct 2015 07:28:40 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 07:28:39 -0700
To: Yocto Project <yocto@yoctoproject.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <562E3896.6080405@windriver.com>
Date: Mon, 26 Oct 2015 09:28:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Prelink problems -- need help!
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
X-List-Received-Date: Mon, 26 Oct 2015 15:00:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I'm cross posting this in an effort to ask for help for the cross-prelink
project.  (If you are unaware of what the prelinker does, it goes through and
adjusts the relocation addresses to predefined values in an attempt to speed up
executable load times.  For embedded systems, this can be fairly critical in
meeting boot and runtime load performance targets.)

As some people might be aware, the upstream 'prelink' project that was
maintained by Jakub Jelinek at Red Hat appears to have been abandoned.

I've been the maintainer for the Yocto Project's 'prelink-cross' project for a
few years, but my work has been dealing with compilation issues and other things
that have to do with using the prelinker in a cross compilation environment.

This means that unfortunately I'm in a situation where I am having problems
trying to fix the problems in the prelinker itself, but I am not an ELF expert.
 Currently the cross prelinker appears to be broken for pretty much every
architecture and I need help trying to resolve these problems.

Issues I know of right now:

Introduction of RTYPE_CLASS_EXTERN_PROTECTED_DATA appears to be causing failures
on ARM32, x86 and x86_64.

Some possibly unrelated issue is causing various items to relocate incorrectly
(IFUNCs perhaps) on ARMv7 builds.

Power is no longer working properly, most likely due to an optimization in the
way the PPC GOT table(s) are setup.

Power64 hasn't been working properly for a while, possibly due to the switch to
ELFv2.

MIPS and MIPS64 also do not appear to be working, and I've not found a possible
cause.

As you can see, pretty much everything is currently broken and I'm struggling to
find community people with the right skill sets to help me resolve the issues.

The current state of my work in progress is available at:

git://git.yoctoproject.org/prelink-cross

branch cross_prelink_staging

If you think you can help, please let me know.
--Mark

