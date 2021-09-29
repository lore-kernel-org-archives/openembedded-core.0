X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <720e9092-19d6-c045-b080-d568e533dd3f@pr.hu>
Date: Wed, 29 Sep 2021 19:29:59 +0200
MIME-Version: 1.0
Subject: Re: RFC [v2]: Make kernel upgrades via dnf work like on Red Hat
References: <20210929053353.600644-1-zboszor@pr.hu>
 <CADkTA4MZJJtyGjSwL80g9RNxg7xjwdj8Q1k0Od+gsWG4ee9F=w@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <CADkTA4MZJJtyGjSwL80g9RNxg7xjwdj8Q1k0Od+gsWG4ee9F=w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

On 2021. 09. 29. 18:06, Bruce Ashfield wrote:
> On Wed, Sep 29, 2021 at 1:34 AM Zoltán Böszörményi <zboszor@pr.hu> wrote:
>>
>> I have observed two issues when upgrading to kernel versions
>> successively.
>>
>> One is that when installonly_limit is reached in dnf, only the
>> main kernel package was removed. Patch 1 fixes this by adding
>> extra RDEPENDS to the kernel subpackages on the main kernel package.
>> This circular dependency helps dnf to remove all subpackages.
>>
>> dnf.conf settings "installonlypkgs", "installonly_limit" and
>> others are documented at https://dnf.readthedocs.io/en/latest/conf_ref.html
>>
>> The second issue is that when the oldest kernel version is
>> removed by dnf, the /boot/bzImage symlink is also gone.
>>
>> Fix this by using update-alternatives instead of hardcoded ln -s
>> and rm -f. This is configurable via a new variable.
> 
> I'll comment on patch 2/2 directly, but I have a few things here as well.
> 
>>
>> This is only an RFC at this point, because
>> 1) The first fix is only applied in the KERNEL_SPLIT_MODULES=0 case,
>>     it may need its own knob or applied unconditionally.
> 
> What is the outcome of the circular dependency you mention in patch
> 1/1 ? Does DNF warn, or something else ? What do the other package
> managers do when the circular dependency is detected ?

No warning, it's just that the dnf transaction looks like this:

# dnf --disablerepo="*" install kernel-*
Dependencies resolved.
================================================================================
  Package                     Architecture    Version        Repository     Size
================================================================================
Installing:
  kernel                      intel_corei7_64 5.14.8-r0.0    @commandline  6.4 k
  kernel-5.14.8               intel_corei7_64 5.14.8-r0.0    @commandline   48 k
  kernel-image-5.14.8         intel_corei7_64 5.14.8-r0.0    @commandline  6.6 k
  kernel-image-bzimage-5.14.8 intel_corei7_64 5.14.8-r0.0    @commandline  9.1 M
  kernel-modules-5.14.8       intel_corei7_64 5.14.8-r0.0    @commandline   53 M
Removing:
  kernel                      intel_corei7_64 5.14.5-r0.0    @@commandline  88
Transaction Summary
================================================================================
Install  5 Packages
Remove   1 Packages
Total size: 75 M
Is this ok [y/N]:

instead of:

# dnf --disablerepo="*" install kernel-*
Dependencies resolved.
================================================================================
  Package                     Architecture    Version        Repository     Size
================================================================================
Installing:
  kernel                      intel_corei7_64 5.14.8-r0.0    @commandline  6.4 k
  kernel-5.14.8               intel_corei7_64 5.14.8-r0.0    @commandline   48 k
  kernel-image-5.14.8         intel_corei7_64 5.14.8-r0.0    @commandline  6.6 k
  kernel-image-bzimage-5.14.8 intel_corei7_64 5.14.8-r0.0    @commandline  9.1 M
  kernel-modules-5.14.8       intel_corei7_64 5.14.8-r0.0    @commandline   53 M
Removing:
  kernel                      intel_corei7_64 5.14.5-r0.0    @@commandline  88
Removing dependent packages:
  kernel-5.14.5               intel_corei7_64 5.14.5-r0.0    @@commandline 222 k
  kernel-image-5.14.5         intel_corei7_64 5.14.5-r0.0    @@commandline   0
  kernel-image-bzimage-5.14.5 intel_corei7_64 5.14.5-r0.0    @@commandline 9.2 M
  kernel-modules-5.14.5       intel_corei7_64 5.14.5-r0.0    @@commandline  52 M
Transaction Summary
================================================================================
Install  5 Packages
Remove   5 Packages
Total size: 75 M
Is this ok [y/N]:

Since the dependency matches the exact version via ${EXTENDPKGV},
I would expect other package managers to do what dnf is doing.

At least, IIRC, opkg built with libsolv does.

> But yes, I agree that we really don't want any more conditional code
> in the kernel packaging, since it isn't going to get tested. So
> whatever we do needs to work on all package managers and with or
> without kernel module splitting.
> 
>>
>> 2) There's an extra issue I found while implementing the second patch:
>>     instead of using KERNEL_VERSION, I had to resort to using PV
>>     because the former is dynamically set via a python function
>>     and it changes its value at some point between build phases.
>>     AFAIK, there are kernel recipes out there using only the major
>>     version with two numbers in PV instead of the full version triplet.
>>     I can live with this as my kernel recipe uses the version triplet.
>>
>> 3) The new knob name for patch #2 is KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES.
>>     It is admittedly too chatty, it can be renamed if someone suggests
>>     a better name.
> 
> I'll ponder this as well, but nothing is immediately coming to mind.
> 
> Bruce
> 
>>
>> Please advise how to fix and make it final so these fixes can be
>> accepted into openembedded-core.
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>>
> 
> 

