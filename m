Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-04.prod.phx3.secureserver.net
	(p3plsmtpa12-04.prod.phx3.secureserver.net [68.178.252.233])
	by mail.openembedded.org (Postfix) with ESMTP id B640A610F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 09:31:10 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa12-04.prod.phx3.secureserver.net with 
	id axX81o00K1mTNtu01xX9VL; Tue, 05 Aug 2014 02:31:09 -0700
Message-ID: <53E0A45C.4070507@pabigot.com>
Date: Tue, 05 Aug 2014 04:31:08 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <53DF9F25.1060404@pabigot.com> <20140804223948.GC11951@haswell>
In-Reply-To: <20140804223948.GC11951@haswell>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: blocking pie in recipes that build shared object files
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
X-List-Received-Date: Tue, 05 Aug 2014 09:31:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2014 05:39 PM, Khem Raj wrote:
> On 14-08-04 09:56:37, Peter A. Bigot wrote:
>> I've now hit two recipes in meta-openembedded that fail on armv7-a because
>> SECURITY_CFLAGS has -pie as an option that leaks into a link command
>> building a shared object file.  This produces:
>>
>> |
>> /prj/oe/omap/build-beaglebone-master/tmp/sysroots/beaglebone/usr/lib/Scrt1.o:
>> In function `_start':
>> | /prj/oe/omap/build-beaglebone-master/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/eglibc/2.19-r0/eglibc-2.19/libc/csu/../ports/sysdeps/arm/start.S:128:
>> undefined reference to `main'
>> | collect2: error: ld returned 1 exit status
>> | error: command 'arm-poky-linux-gnueabi-gcc' failed with exit status 1
>>
>> In openembedded-core meta/conf/distro/include/security_flags.inc provides a
>> bunch of package-specific overrides to use SECURITY_NO_PIE_CFLAGS for this
>> sort of package.
>>
>> It's not clear to me how that should be accomplished for recipes that are
>> not part of openembedded-core.  For
>> http://patches.openembedded.org/patch/77165/ for python-smbus in meta-python
>> I chose to override it in the bb file.
>>
>> What is the best-practices solution to this problem?
> may be add SECURITY_CFLAGS_pn-blah = "${SECURITY_NO_PIE_CFLAGS}"
> to layer.conf of given layer where recipe resides

Could do that.  Is there precedent?

Looking into this more, the reason I'm hitting this is I'm using 
DISTRO=poky-lsb, which gives me oe-core's 
conf/distro/include/security_flags.inc automatically.

Now that I know more I'm uncomfortable about putting a distro-specific 
workaround in each recipe patch I submit, and more uncomfortable about 
creating new precedent by putting distro-specific workarounds in 
layer.conf files. Updates to python-smbus in meta-python and rrdtool in 
meta-oe are affected by this, plus the 42 package exceptions already 
listed in security_flags.inc.

I'm going to stop using poky-lsb for now to hide the problem, but for 
the future we need guidance on how to make recipes/layers compatible 
with distros that want to enable security_flags.inc.

Peter

