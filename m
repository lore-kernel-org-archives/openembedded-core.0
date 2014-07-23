Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8076F707D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 00:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6N0Bfjd005987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 17:11:41 -0700 (PDT)
Received: from msp-dhcp53.wrs.com (172.25.34.53) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 17:11:40 -0700
Message-ID: <53CEFDBC.9050007@windriver.com>
Date: Tue, 22 Jul 2014 19:11:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Multilib SDK, compiler issues
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
X-List-Received-Date: Wed, 23 Jul 2014 00:11:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

When you generate a multilib SDK, i.e. adding this to conf/local.conf:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

And then build an SDK using 'bitbake meta-toolchain', you end up with and SDK 
that is only partially functional.

Using a small test program
/tmp/t.c:

int main()
{
         return 0;
}

source ./environment-setup-core2-64-poky-linux
$CC /tmp/t.c -o /tmp/t

This works as expected.

However, if you change to the multilib:

source environment-setup-x86-pokymllib32-linux

You get a page of errors trying to link.  The key thing is that a number of 
necessary libraries and linker object files were not installed.  This is fairly 
easy to fix, using the manual settings added to the local.conf file:

TOOLCHAIN_DEPENDS          = "packagegroup-core-standalone-sdk-target 
packagegroup-core-standalone-sdk-target-dbg"
TOOLCHAIN_MULTILIB_DEPENDS = "${@' '.join([variant + '-' + pkg for variant in 
(d.getVar("MULTILIB_VARIANTS", True) or "").split() for pkg in 
(d.getVar("TOOLCHAIN_DEPENDS", True) or "").split()])}"
TOOLCHAIN_TARGET_TASK      = "${TOOLCHAIN_DEPENDS} ${TOOLCHAIN_MULTILIB_DEPENDS}"

(perhaps that or something similar needs to go into meta-toolchain?)

But that doesn't resolve the problem.. the toolchain itself is not configured 
properly.

Once you've done that you still can't link the alternative library toolchain. 
The search-dirs are configured incorrectly:

$ $CC --print-search-dirs

install: 
/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/
programs: 
=/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../libexec/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../libexec/i586-pokymllib32-linux/gcc/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/../../../../../i586-pokymllib32-linux/bin/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/../../../../../i586-pokymllib32-linux/bin/
libraries: 
=/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/../../../../../i586-pokymllib32-linux/lib/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/i586-pokymllib32-linux/../../lib/i586-pokymllib32-linux/gcc/i586-pokymllib32-linux/4.9.0/../../../../../i586-pokymllib32-linux/lib/:/usr/local/sdk/sysroots/core2-64-poky-linux/lib64/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/core2-64-poky-linux/lib64/:/usr/local/sdk/sysroots/core2-64-poky-linux/usr/lib64/i586-pokymllib32-linux/4.9.0/:/usr/local/sdk/sysroots/core2-64-poky-linux/usr/lib64/

It's looking in the /lib64 and /usr/lib64 directories of the sysroot for some 
reason.  The most I've tracked it down to at this point is that for some reason 
the value 'target_base_libdir' is being set to '/lib64' within the 
cross-canadian.bbclass -- but I can't figure out why that is occurring. 
'bitbake -e' shows that it should be '/lib', so I suspect there is an issue with 
overrides or something and multilib configurations.

Any help would be appreciated.. I'm stumped on this.

--Mark

