Return-Path: <David.Nystrom@enea.com>
X-Greylist: delayed 327 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 11:45:10 UTC
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 97CA365F28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 11:45:10 +0000 (UTC)
Received: from [172.16.141.119] (172.16.141.119) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Mon, 5 May 2014
	13:39:41 +0200
Message-ID: <5367787C.1080503@enea.com>
Date: Mon, 5 May 2014 13:39:40 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1398963761.12731.1.camel@ted>
In-Reply-To: <1398963761.12731.1.camel@ted>
X-Originating-IP: [172.16.141.119]
Subject: Re: My thoughts on the future of OE?
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
X-List-Received-Date: Mon, 05 May 2014 11:45:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-01 19:02, Richard Purdie wrote:
> I was asked what I thought were things that needed discussion at OEDAM.
> Sadly I won't be there but I thought it might help to write down my
> thoughts in a few areas.
>
> Developer Workflow
> ------------------
>
> Firstly, I think the big piece we need to address as a project is
> "developer workflow" as this is where people are struggling using it.

Good initiative.

> Unfortunately "developer workflow" means different things to different
> people? Which one do I mean then? I actually mean all of them. As some
> examples:

Whilst OE supplies a superior interface towards distribution engineers, 
and one-man-army developers who usually work top-down on the entire 
software stack, its currently supplies a suboptimal user experience for 
bigger teams, where each team tend to care only about their app, and its 
dependencies.

IMHO, the biggest issue is maintainable interfaces between different 
participants within the larger projects.
The package repository should be able to facilitate a good user facing 
interface for Application developers and kernel developers.

I fear that an item in a locked sstate might not be a small enough 
cross-section for reporting bugs against. How do I trace a buggy package 
installed on my target rootfs, back to an item in the locked sstate?

> -----------------------------------------------------------------------
>
> * A kernel developer wanting to rebuild a kernel
>    [on/off target, with the ADT/SDK or a recipe]
> * A kernel developer wanting to build a kernel module
>    [on/off target, with the ADT/SDK or a recipe]
> * An application developer wanting to build a single App
>    [on/off target, with the ADT/SDK or a recipe]
> * An application developer wanting to (re)build a library, linking an
>    App to it
>    [on/off target, with the ADT/SDK or a recipe]
> * A user wanting to rebuild an image with a package added
>    [on and off target - feeds or a build]
> * A user wanting to rebuild an image with more advanced changes

An example of a low-overhead scenario for a bigger project:

** Distribution Engineers
* Works in the bitbake/OE environment and against the upstream Yocto 
community.
* Makes sure the distribution package repository is kept up to date..
* Syncs releses, upgrades and bugfixes with the upstream community.
* Recieves patches and configuration from Developers and integrate them 
into the distribution, either by SRCREV:s or patches.

** Kernel Developers
* Uses on SDK/ADT tarball provided by the SI.
* Upstreams patches to Upstream.
* Backports patches, sends new SCM revisions, and kernel configuration 
shards to the SI.
* Creates the rootfs image by method X[1] from the package repository.
* Expands the rootfs image by method X[1] from the package repository.
* Bugreports on other ADs or KDs packages using the package versions.

** Application Developers
* Uses on SDK/ADT tarball provided by the SI.
* Determines application dependencies/configuration and notifies SI of 
requirements.
* Maintains the applications recipe.
* Creates the rootfs image by method X[1] from the package repository.
* Expands the rootfs image by method X[1] from the package repository.
* Upstreams recipes, patches or SCM revisions to the SI for his 
application/s for distribution.
* Bugreports on other ADs or KDs packages using the package versions.


Ref:[1]
The current options are:

1. Static core-image-best-guess with package-management delivered by DE.
--
Works OK with static storage. This is a pain with volatile storage 
though, or read-only rootfs:s.
And it is bloaty with bigger repos, and limited storage size.
Different teams images will differ over time.

2. BUILD_IMAGES_FROM_FEEDS
--
Works only for ipk. Still requires bitbake/OE env for rather lightweight 
use-case.

Possible Future for [1]:
Step 1:
Let AD/KD create rootfs images from the package repository with a 
lightweight tool in the SDK tarball. Dependencies needed by postinstall 
hooks needs to be available in the nativesdk sysroot.
This would also allow customization of the SDK targets sysroot, and SDK 
nativesdk sysroots on a per-package level.
i.e. If I'm cross compiling and missing libcurl from the target sysroot, 
I should be able to expand it easily with the distributions version of 
libcurl.





