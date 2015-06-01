Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4929075685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 13:29:38 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so61094750igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=pU/ckTdcFN+4AT73mjjjo2JIyy+rN57uyebNpucMnSs=;
	b=0doso11PqGzQvxMgKjvK7pDLVAeQqe05PjuPBheNEV55RrBkHSWaqSr4OMVH/lo8j3
	+QXTym7H8p7oZSBNLGBTT7gTvsXofSenkgZRxQ2VYn5MGPNh9AmDHg4yImFhcGYY1+Kt
	60Giyxe58nAy52vK+o5K5br2XKpYXYKy1tmf1ymrN+DiALUQNfx06hU8LpljXa+2BI7Q
	S6Qb6cG5f7bQzG4C6AC7zzA+E3AG/mTDqVCRKjtVdyhP5BO+AC3cnGj1tfuWACX5Rb5E
	9iH1x3eqJbud4ndcGhDuJWiGfOvBBwFyHCcj0/UJt7trZL7EnUCnAm/Ox7iCpOU6fQDE
	WZog==
X-Received: by 10.107.129.133 with SMTP id l5mr25999786ioi.32.1433165379777;
	Mon, 01 Jun 2015 06:29:39 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by mx.google.com with ESMTPSA id
	h128sm10398465ioh.38.2015.06.01.06.29.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jun 2015 06:29:39 -0700 (PDT)
Message-ID: <556C5E41.3070806@gmail.com>
Date: Mon, 01 Jun 2015 09:29:37 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <55555B65.80600@windriver.com>	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>	<555AE1AB.8070907@windriver.com>
	<5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe>?
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
X-List-Received-Date: Mon, 01 Jun 2015 13:29:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/19/15 04:35, Paul Eggleton wrote:
> On Tuesday 19 May 2015 15:09:31 Robert Yang wrote:
>> Has a uniform backend for configuration sounds like a good idea, here are
>> some rough thoughts that we can do in metadata, please feel free to give
>> your comments:
>>
>> 1) Add a conf file, bbclass or bb which contains the configable var list
>>     for the build, for example, DISTRO, MACHINES, DISTRO_FEATURES,
>>     PACKAGE_CLASSES and so on, we need maintain this file manually, we can
>>     discuss what is configurable in the mailing list, it may cost us a few
>>     time, but it is really good for OOBE, and would make the new user's
>>     life more easier.
>>
>> 2) Other layer can extend the configable var list easily.
> I'd rather we end up with the configuration being defined where the variable is 
> actually used - it's tidier and easier to extend.
>
>> 3) Suppose we call the file config-build (.conf, .bbclass or .bb).
>>
>> 4) The UIs (toaster UI, web HOB, or menuconfig) can invoke the contents in
>>     config-build and display them.
>>
>> 5) The format of config-build can be:
>>     CONFIG_MACHINE[keys] = "machine1, machine2, ..."
>>     # The machines should be got automatically from a function.
>>     CONFIG_MACHINE[doc] = "xxx"
>>     # Re-use the MACHINE[doc] in meta/conf/documentation.conf
>>     [snip]
> MACHINE is such that we don't need to define the valid values for it - we can 
> simply search for conf/machine/*.conf along BBPATH. (This is what Hob does, 
> the mechanism it uses for finding conf files probably still exists.)
>  

Without knowing that others felt the same way, I've been playing around
with something (that is currently very rudimentary) along the same lines:

    https://github.com/twoerner/layer-repos

It was inspired by Otavio's "setup-environment", which Khem and Koen
have also started using for their new project to get Angstrom to use a
repo manifest.

My repo manifest (from above) includes a "setup" script which you can
source (if you want to configure a build) or run directly (if you want
to get lists of MACHINEs, DISTROs, etc).

If sourced, my setup script prompts the user for a machine, an sdk
machine, a distro, and the download directory location. These variables
are then put into conf/auto.conf, leaving a user's conf/local.conf for
true local, user configurations. The prompting occurs using one of
select, dialog, or whiptail.

Other things that could/should be configured include (in addition to
those already discussed):
- choice of compiler (gcc, linaro, external) and version
- choice of kernel (linux-yocto, ltsi, bsp, etc)
- PACKAGE_CLASSES
- EXTRA_IMAGE_FEATURES
- USER_CLASSES

I feel somewhat strongly that the proper way forward is to make repo
manifests (or something like it) an integral part of the build process
(or, at the very least, making layers more integral to the build!). In a
way that's what the whole "meta-poky" (i.e. git clone
http://git.yoctoproject.org/git/poky) is doing, isn't it? We're just
packaging openembedded-core, meta-yocto-bsp, meta-yocto, meta-hob, etc
_manually_ into one repository. Wouldn't it be less work to just switch
to using a repo manifest to pull them together instead of endlessly
applying patches twice? I'm glad to see lots of work going on in areas
like "bitbake-layers" since that sort of thing helps make layers part of
the process, instead of a separate step outside the process.

One thing that hinders progress is the fact that some layers don't play
nicely together. Some BSP layers, for example, assume you wouldn't ever
have more than one BSP layer in your build at a time. The same is true
of distro layers. Why would anyone ever have more than one distro layer
listed in conf/bblayers.conf at a time? Well, if you wanted to give your
users the possibility of choose which distro they want to use, then they
have to be available during the "lets have the user choose what they
want" phase. Then, in order to make things work, a lot of ad-hoc
knowledge needs to be built into the setup script so that it can shuffle
layers around depending on what the user chooses (i.e. remove all BSP
layers except the one the user chooses, remove all distro layers except
the one the user chooses, etc). Maybe the proper way forward is to ask
the user a bunch of questions and then pull layers together based on
their answers? This would require some way of knowing the list of all
possible machines, distros, etc. by somehow only fetching very little
from the Internet.

Is the metadata that drives
http://layers.openembedded.org/layerindex/branch/master/layers/
available someplace (preferably as a git clone)? If it were possible to
grab that metadata, then perhaps a setup script could use this
information to ask the user all the required questions then, once the
user choices were known, it could "bitbake-layers layerindex-fetch" the
required layers and get the build going (or at least be able to then ask
better questions!).

> I think we need to step back a bit and think about how this should be 
> implemented properly. I would urge you to consider that we went through a lot 
> of this stuff already quite some time ago with Hob; not that that ended up as a 
> perfect codebase by any means, but it would be worth learning from it.
>
> As Chris was suggesting I'd rather we look at setting up a type declaration 
> mechanism (possibly at the bitbake level?) and make use of that rather than 
> creating something just for this UI where possible.
>  
>> 6) The result will be saved to a file such as local.conf.extend, and
>>     local.conf will include/require it.
> We went back-and-forth on this in the Hob timeframe; eventually it was 
> realised that what people really wanted is to have the settings applied in 
> local.conf itself rather than some UI-specific conf file. (On the other hand, 
> thinking further ahead, we ought to be thinking about distro customisation and 
> whether it's really appropriate to put every setting in local.conf as opposed 
> to a custom distro config that you select via DISTRO.)

The configuration changes that are required to build, say, Wayland are
DISTRO_FEATURES, so why then don't we have a poky-wayland, poky-fb, or
poky-x11 distros in addition to the poky, poky-lsb, poky-tiny, and
poky-bleeding distros?

