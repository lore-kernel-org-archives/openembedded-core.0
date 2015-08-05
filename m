Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 003A26E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 06:45:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t756jhTi022811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Aug 2015 23:45:48 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 4 Aug 2015 23:45:47 -0700
Message-ID: <55C1B11A.7060606@windriver.com>
Date: Wed, 5 Aug 2015 14:45:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: About multilib packages rpm pkg name
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
X-List-Received-Date: Wed, 05 Aug 2015 06:45:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

For the multilib package like lib32-bash, its rpm package name
is bash-4.3.30-r0.lib32_x86.rpm, but for ipk and deb, its name is
lib32-bash.ipk and lib32-bash.deb, there is a side effect for
the naming of rpm, for example, if packagegroup-xx rdepends on bash,
the lib32-packagegroup-xx should rdepend on lib32-bash, but
the its rpm pkg knows nothing about lib32-bash, so it still rdepends
on bash, this causes 32bit toolchain libs not installed when export
multilib sdk, for example:

Configured multilib:
MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal -cpopulate_sdk

When PACKAGE_CLASSES = "package_rpm",  the lib32-libgcc,
lib32-libgcc-dev or other lib32-xx packages are not installed,
so that the 32bit toolchain doesn't work in SDK, this is because
lib32-packagegroup-core-standalone-sdk-target can't pull in the
lib32-xx correctly.

When PACKAGE_CLASSES = "package_ipk", it works well.

Does anyone why we don't use the name like lib32-bash.rpm, please ?
Can we use lib32-bash, please ?

-- 
Thanks

Robert

