Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R4d5D-0003R7-Ad
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 20:24:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8GIIxkO022083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Sep 2011 11:18:59 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 16 Sep 2011 11:18:58 -0700
Message-ID: <4E739312.3020808@windriver.com>
Date: Fri, 16 Sep 2011 13:18:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1316165543.25993.59.camel@ted> <4E736242.2090106@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D84DF2E8@shsmsx501.ccr.corp.intel.com>
	<4E736ABF.9030305@windriver.com>
In-Reply-To: <4E736ABF.9030305@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Multilib status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 18:24:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just an FYI.  I'm working through a bunch of issues.  I found out that the RPM
dependency resolution was completely broken, due to a small bug in the
package_rpm.bbclass..  Packages were not being given the proper provide
information, so RPM was attempting best match -- and failing as noted in the
previous discussion..

Unfortunately this has opened up a small can of worms which I'm trying to deal
with.  The simplistic fix for the bug is:

--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -840,7 +840,7 @@ python do_package_rpm () {
        os.chmod(outdepends, 0755)

        # Poky / RPM Provides
-       outprovides = workdir + "/" + srcname + ".requires"
+       outprovides = workdir + "/" + srcname + ".provides"

        try:
                from __builtin__ import file

Unfortunately this has exposed a large set of problems that I didn't realize we
had....

Will do a more formal pull request as soon as I get things working again.

--Mark

On 9/16/11 10:26 AM, Mark Hatle wrote:
> On 9/16/11 10:21 AM, Xu, Dongxiao wrote:
>>> >> -----Original Message-----
>>> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>>> >> Sent: Friday, September 16, 2011 10:51 PM
>>> >> To: Richard Purdie
>>> >> Cc: Xu, Dongxiao; openembedded-core
>>> >> Subject: Re: Multilib status
>>> >>
>>> >> On 9/16/11 4:32 AM, Richard Purdie wrote:
>>>> >>> Hi Mark/Dongxaio,
>>>> >>>
>>>> >>> We really need to get the remainder of the multilib bugs wrapped up. I
>>>> >>> think there is some confusion about the exact approach to take to fix
>>>> >>> some of them so I'm hoping to try and summarise the problems here so
>>>> >>> we can work out some resolutions.
>>> >>
>>> >> Let me explain where I am quickly.  I just spent two days working on
>>> >> reproducing the issue(s).  So far I've not reproduced the direct failures but a
>>> >> series of others.  I finally figured out part of the reason I wasn't seeing this.  I
>>> >> had a typo in my configuration:
>>> >>
>>> >> DEFAULTTUNE-virtclass-mulitlib-lib32 = "x86"
>>> >>
>>> >> This resulted in two sets of binaries normal and lib32 that were more or less
>>> >> identical in the RPM case.  We -really- need a sanity check that stupid typos
>>> >> like that don't cause problems.
>>> >>
>>> >> ---
>>> >>
>>> >> So now that I finally have a built with that done... see below.
>>> >>
>>>> >>> Problem A
>>>> >>> =========
>>>> >>>
>>>> >>> We can have multiple forms of "machine specific" packages now, one for
>>>> >>> each multilib e.g.:
>>>> >>>
>>>> >>> task-core-x11-base-1.0-r34.qemux86_64.rpm ("normal")
>>>> >>> task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib64")
>>>> >>> task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib32")
>>>> >>>
>>>> >>> (lets assume the first uses /lib/, the second /lib64/ and the thrid
>>>> >>> /lib32/, an artificial example I realise)
>>>> >>>
>>>> >>> I know one proposal was to map:
>>>> >>>
>>>> >>> task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm to
>>>> >>> task-core-x11-base-1.0-r34.lib32_qemux86.rpm but this isn't correct
>>>> >>> since the library directories are different. In this specific case it
>>>> >>> might not matter but in general it would. What is also important is
>>>> >>> that the different versions imply different dependencies. The lib64
>>>> >>> bit version would pull in and select lib64 bit libs. Its these
>>>> >>> dependencies which are a key reason these are not "all" arch packages.
>>>> >>>
>>>> >>> The end result is therefore we likely want:
>>>> >>>
>>>> >>> task-core-x11-base-1.0-r34.qemux86_64.rpm
>>>> >>> task-core-x11-base-1.0-r34.lib64_qemux86_64.rpm
>>>> >>> task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm
>>>> >>>
>>>> >>> and I believe there are some patches Dongxiao has created which do this.
>>> >>
>>> >> Yes, I'm currently testing his new MACHINE_virtclass-multilib-... patch.  So far
>>> >> it seems to be working.. assuming this is the approach we go with, we'll want to
>>> >> add some type of sanity check so that it's not possible to collide between the
>>> >> different multilib configurations.  (Alternatively we could, for each multilib,
>>> >> specify a default machine virtclass in the format you list above.
>>> >>
>>> >> An alternative I was thinking of over night would be to avoid the RPM
>>> >> remapping on the "machine" packages.. but I'm not sure if that is really a good
>>> >> idea.
>>> >> However, it would could simplify the configuration aspects.
>> > 
>> > There are two implementations towards the above result:
>> > 1) automatically setting MLPREFIX before MACHINE_ARCH.
>> > 2) user manually sets MACHINE_virtclass-multilib-lib32="lib32-qemux86-64" in local.conf.
>> > 
>> > Which one do you prefer?
> Right now I'm thinking the best approach is:
> 
> *) Allow the user to set MACHINE_virtclass-multilib-...="...."
> 
> *) If the user has NOT set it, fall back and use the setting of lib..-machine as
> in 2
> 
> This way for people who have specific requirements for external compatibility or
> just desire more control they can do it.  But for everyone else it will still
> work properly.
> 
> FYI, I'm currently working in the rootfs_rpm stuff, the system is currently
> ignoring the alternative (multilib) machine packages.  I'm hoping this will be
> fairly simple to resolve.
> 
>>> >>
>>>> >>> Problem B
>>>> >>> =========
>>>> >>>
>>>> >>> If we install task-core-x11-base-1.0-r34.qemux86_64.rpm which depends
>>>> >>> on "connman", how does the system figure out to associate this to mean
>>>> >>> we want the "x86_64" architecture packages installed?
>>>> >>>
>>>> >>> As far as I can tell there are two proposals around:
>>>> >>>
>>>> >>> 1) Set the architecture in the package provides and depends (a bit
>>>> >>> ugly)
>>>> >>>
>>>> >>> 2) Configure libzypp to understand that qemux86_64 does really map to
>>>> >>> x86_64 architecture and imply x86_64 dependencies.
>>>> >>>
>>>> >>> Solving problem A above is the first step towards resolving this
>>>> >>> either way but we don't seem to have a resolution on this second part.
>>> >>
>>> >> Agreed.
>>> >>
>>>> >>> For reference, we really do want these task packages to have an
>>>> >>> associated architecture so the user can easily build up blocks of the
>>>> >>> system using a given ABI.
>>> >>
>>> >> This is going to be somewhat of a problem I suspect, simply because that is not
>>> >> the way RPM is/was designed.  We can adjust the rootfs install time, but this
>>> >> won't address field upgrade/installs.
>>> >>
>>> >> RPM (and Red Hat Linux/Fedora systems) appear to be designed that any
>>> >> package that reasonably meets the run-time dependencies can be used.
>>> >> There is a concept of a "best" machine based on the resolver hierarchy, but ELF
>>> >> size may or may not be a factor in that decision.
>>> >>
>>> >> Doing this is quite powerful, but it also has a conscious decision set behind it.  If
>>> >> "bash" is required by a script, it really doesn't matter if it's ELF32,
>>> >> ELF64 or something else, as long as something provides bash.
>> > 
>> > If user sets MULTILIB_IMAGE_INSTALL="lib32-task-core-boot" with a qemux86-64 image, it means that he wants to install all elements required by task-core-boot by lib32 version. If the dependency is selected *randomly*, users would not have multiple libraries in his system.
> This is a special use case, yes one that I think we need to resolve, but it's
> not the typical case.
> 
> The typical case will be someone wants the 64-bit (or 32-bit) version of a
> select package for compatibility.  And they only want the dependencies for that
> package to be loaded.  Anything satisfying the dependency will do.
> 
> My recommendation right now is, lets get that working ASAP.  Once that does,
> refocus the efforts on getting the multilib "tasks" to do something reasonable.
> (i.e. select a group of packages)
> 
> If we try to solve both at once, I don't think we're going to come up with a
> reasonable solution at this time.
> 
> --Mark
> 
>> > Thanks,
>> > Dongxiao
>>> >>
>>>> >>> What I really need now is an idea of which patches you both agree on
>>>> >>> that we need to merge (I think we have some for problem A) and a
>>>> >>> resolution on problem B along with some patches so we can close this
>>>> >>> set of issues out.
>>>> >>>
>>>> >>> If there are further issues can you reply to this email either with
>>>> >>> the details or a pointer to the specific additional problems.
>>> >>
>>> >> Now that I have my stupid typo out of the way, I expect to have further
>>> >> information in a few hours as to the regularly dependency resolution failure
>>> >> Dongxiao was reporting.  (Library dependencies -are- ELF specific, so those
>>> >> have to work properly!)
>>> >>
>>> >> --Mark
>>> >>
>>>> >>> Cheers,
>>>> >>>
>>>> >>> Richard
>>>> >>>
>>>> >>>
>> > 
> 


