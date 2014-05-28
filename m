Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70C9A6FAE9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 00:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S04SOr010334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 17:04:28 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 27 May 2014 17:04:28 -0700
Message-ID: <5385280B.80203@windriver.com>
Date: Tue, 27 May 2014 19:04:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5384DAE6.1030407@linux.intel.com>
	<CFAA456E.93E2C%dvhart@linux.intel.com>
In-Reply-To: <CFAA456E.93E2C%dvhart@linux.intel.com>
Subject: Re: Creating a machine specific recipe for config file
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
X-List-Received-Date: Wed, 28 May 2014 00:04:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/14, 3:39 PM, Darren Hart wrote:
> On 5/27/14, 11:35, "Saul Wold" <sgw@linux.intel.com> wrote:
>
>>
>> Folks,
>>
>> We have had an open enhancement in the form of bugzilla #4011
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).
>>
>> I am currently working on this and want to get some feedback regarding
>> the design, the below list of config files would move to one recipe in
>> recipes-bsp, which will reduce the number of .bbappends that a BSP
>> writer might need to create in order to customize the configuration of
>> the BSP.
>>
>> Overall, my proposal is to move all the BSP related config files into
>> one recipe directory tree. Create a recipe that can have a package or
>> packages that are RRECOMMENDS on.
>>
>> We have 2 choices on the packaging side:
>>
>> 1) 1 Package to rule them all (conffiles)
>>    - RPROVIDES PN-conf
>>    - conffile.bbclass
>>        RRECOMMENDS = "${PN}-conf"
>>        # Can be overriden in recipe
>>        CONFFILES_conffiles ?= "${PN}.conf"
>>    - Will provide files not needed on final image, small
>>      amount of extra space used.
>>
>> 2) 1 package / conf file (${PN}-conf)
>>    - exactly what's needed will be installed
>>    - no needs for additional RPROVIDES
>>    - More packaging overhead, package data might be bigger than actual
>> contents!
>
> The status quo would suggest that Option 2 is more consistent with what
> people expect of the build system. However, if we were to do this, one
> might question why we should bother at all and not just leave it in the
> hands of MACHINE-specific overrides for the packages we're configuring, as
> is done today with alsa-state/asound.conf (for example).
>
> What was your idea here - to replace the MACHINE-specific config for these
> packages - or to augment it with an optional mega-config package?

The reason to get away from MACHINE-specific config changes to the regular 
package is from a re-use standpoint.

If BSP_A and BSP_B both need different configurations of the FOO recipe, the 
"right" way today is for two machine specific versions of the FOO recipe/package 
to be generated.

foo-ver-rel.BSP_A.rpm
foo-ver-rel.BSP_B.rpm

This eliminates a lot of potential re-use, and if it's a large package could add 
a lot of unnecessary space (and build time) to the system.

Instead what we want is:

foo-ver-rel.armv7.rpm
foo-conf-ver-rel.armv7.rpm
foo-conf-ver-rel.BSP_A.rpm
foo-conf-ver-rel.BSP_B.rpm

So the package management system will select the best package to meet the 
requirement automatically.  You get to re-use the one foo package on all 
compatible system.  And then you can choose from a default (not-configured), or 
a BSP configuration.  Much quicker to package, install and takes (potentially) 
less space.  (On a trivial hello-world example, it'll actually take more space, 
but get outside the trivial and it will be helpful.)

> I think it would help to provide a bit of background/motivation regarding
> what exactly we're trying to accomplish with this. That would help me form
> an opinion on 1 vs 2 anyway.

So when talking with Saul I suggested that we do either #1 or #2.. and the base 
recipe (not configure) had a require or recommend of the configure file.

The more I think about this, the more I think multiple small configuration 
files/packages makes sense.. due to various system configuration possibilities 
-- but using appropriate RPROVIDES we shouldn't prevent the system from allowing 
a single monolitic configuration for a BSP.

--Mark



