Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5F476D9AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 03:31:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAF3Vcql003447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 19:31:38 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 14 Nov 2013 19:31:37 -0800
Message-ID: <52859586.5040001@windriver.com>
Date: Fri, 15 Nov 2013 11:31:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] let PACKAGES_DYNAMIC be optional ?
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
X-List-Received-Date: Fri, 15 Nov 2013 03:31:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Currently, the recipe which uses PACKAGES_DYNAMIC usually generates
a lot of packages which costs a lot of time on building the recipe
and do_rootfs, for example, the perl and kernel:

$ ls tmp/deploy/rpm/armv5te/perl-module-* | wc -l
621

$ ls tmp/deploy/rpm/qemux86/kernel-module-* | wc -l
268

Also, the eglibc-locale generates more than 300 packages.

Take perl as an example:

1) We generate 621 perl-module-* packages, but the package *perl-modules*
    requires all of them, so once *perl-modules* is installed, all the other
    perl-module-* will be installed and we can't remove any of them since
    perl-modules rdepends on it, if there is a way to package all of these
    perl-module-* into one package (they are about 10MB), it would save a lot
    of time on do_package* and do_rootfs.

2) The nativesdk.bbclass can't support PACKAGES_DYNAMIC, for example, it can't
    change the perl-module-app-cpan to nativesdk-perl-module-app-cpan since
    there is no perl-module-app-cpan in PACKAGES when nativesdk.bbclass
    changes the variable's name.

Can we add a way to let the PACKAGES_DYNAMIC be optional ? for example,

PACKAGES_DYNAMIC[perl] = "0"

will disable the perl's PACKAGES_DYNAMIC, and will pack the files as other
recipes do, and of course we need to do some work on the recipe.

-- 
Thanks

Robert

