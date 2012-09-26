Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TH17l-0006sV-Qr
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 01:34:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8QNLikZ027411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 16:21:44 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 16:21:45 -0700
Message-ID: <50638E08.8060009@windriver.com>
Date: Wed, 26 Sep 2012 18:21:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC - multilib SDK patches
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
X-List-Received-Date: Wed, 26 Sep 2012 23:34:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I created a patch set to enable multilib userspace in an SDK.  I've pushed the 
patches to:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=mhatle/multilib

(they are based on oe-core)

I'd like some comments on them and see if they are reasonable or not.  With the 
patches I was able to configure my local.conf with:

MACHINE = "qemux86-64"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

IMAGE_INSTALL_append = ' lib32-eglibc'

TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-sdk-host"
TOOLCHAIN_HOST_TASK += "packagegroup-cross-canadian-${@' 
packagegroup-cross-canadian-'.join(all_multilib_tune_values(d, 
'TRANSLATED_TARGET_ARCH').split())}"

---

Then built an SDK using:

bitbake core-image-minimal -c populate_sdk

---

Note, the top patch is a nasty hack to perl.  I don't have any idea as to what 
is going wrong, but nativesdk-perl has decided to install into the wrong place 
on my machine.  I was wondering if other people are seeing the same problem or not.

Any comments would be appreciated.

--Mark


