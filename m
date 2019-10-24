Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8847F9C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 16:18:05 +0000 (UTC)
Received: from [192.168.178.37] (unknown [94.134.94.146])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id C798611A05F0;
	Thu, 24 Oct 2019 18:18:05 +0200 (CEST)
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<706856841.532586.1571930008700.JavaMail.zimbra@savoirfairelinux.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <1871ea34-fe71-7e88-c9a5-066841258511@herbrechtsmeier.net>
Date: Thu, 24 Oct 2019 18:18:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <706856841.532586.1571930008700.JavaMail.zimbra@savoirfairelinux.com>
Cc: paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 16:18:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 24.10.19 um 17:13 schrieb Jean-Marie LEMETAYER:
> Hi Stefan,
> 
> On Oct 24, 2019, at 2:01 PM, Stefan Herbrechtsmeier stefan@herbrechtsmeier.net wrote:
>> Am 22.10.19 um 13:22 schrieb Richard Purdie:
>>> On Tue, 2019-10-22 at 11:03 +0200, Jean-Marie LEMETAYER wrote:
>>>> The current NPM support have several issues:
>>>>    - The current NPM fetcher downloads the dependency tree but not the other
>>>>      fetchers. The 'subdir' parameter was used to fix this issue.
>>>>    - They are multiple issues with package names (uppercase, exotic characters,
>>>>      scoped packages) even if they are inside the dependencies.
>>>>    - The lockdown file generation have issues. When a package depends on
>>>>      multiple version of the same package (all versions have the same checksum).
>>>>
>>>> This patchset refactors the NPM support in Yocto:
>>>>    - As the NPM algorithm for dependency management is hard to handle, the new
>>>>      NPM fetcher downloads only the package source (and not the dependencies,
>>>>      like the other fetchers) (patch submitted in the bitbake-devel list).
>>
>> What make the new fetcher different from the simple wget fetcher?
> 
> The fetcher asks the registry for the tarball url and its integrity. Then it uses wget to download the tarball and then check the integrity given by the registry. Finally it unpacks the tarball according to the tarball format (the root directory is called 'package' which must be renamed).

Does this means you don't add the SRC_URI checksum to the recipe?

> 
>>>>    - The NPM class handles the dependencies using NPM (and not manually).
>>
>> Is this really an improvement? NPM will do the cross compile during
>> fetch, loads additionally archives (not packages) from the internet and
>> doesn't reuse dependencies.
> 
> In the next version of this patchset the dependencies are cached in a npm_cache directory stored in the DL_DIR during the do_fetch_append task (using 'npm cache --cache=${DL_DIR}/npm_cache'). The 'npm install' doesn't require any internet accesses because it is run with '--offline' option.

Does the npm cache works together with a download proxy?

> 
>>>>    - The NPM recipe creation is simplified to avoid issues.
>>
>> We create new not obvious issues. How you would handle prebuild binaries?
> 
> I have no case of using prebuild binaries. After checking some informations it seems that it is handled the same way as node-gyp (by using scripts in the package.json). A patchset to support that is welcome.

The problem is that prebuild is only one example and you detect the 
issue only if you remove the internet connection.


>>>>    - The lockdown file is no more used as it is no longer relevant compared to the
>>>>      latest shrinkwrap file format.
>>>>
>>>> This patchset may remove some features (lockdown file, license management for
>>>> dependencies)
>>
>> You really remove the license management of the dependencies? I think a
>> main feature of OE is the license management.
> 
> The previous npm support was creating subpackages to handle the license management of the dependencies. This is a good idea but it fails with package with exotic names. A work will be needed to cleanly remake it.

The license was independent of the sub packages. You need to parse all 
the package.json and dependency folders.

> 
>>> but fixes the majority of the NPM issues. All of these issues
>>>> from the bugzilla.yoctoproject.org are resolved by this patchset:
>>>> #10237, #10760, #11028, #11728, #11902, #12534
>>>
>>> One key requirement which many of our users have from the fetcher is
>>> that its deterministic and allows for "offline" builds.
>>
>> I think this is impossible with npm because every dependency could run a
>> script and download additional files (ex. prebuild).
> 
> I have no case of using prebuild binaries. Can you give me an example of a package using prebuild?

You could use the pouchdb package as an example and test it with an ARM 
soft float machine.

> Do you know about the '--offline' and the '--ignore-scripts' options? A patchset to support that is welcome.

Can you point me to the '--offline' option.

The '--ignore-scripts' option will disable all scripts and breaks binary 
packages.

> 
>>> What this means is that should I have a populated DL_DIR, the build
>>> should not need to touch the network. Also, only do_fetch tasks would
>>> make network accesses.
>>
>> @Richard: What is your opinion about the per recipe dependency?
>> Typically OE use one recipe per project. The NPM based solution handle a
>> project and all dependencies via one recipe.
>>
>> @Jean-Marie: Do you know PNPM? They use a different node_modules layout
>> which allows the reuse of dependencies.
> 
> Thanks for the link. What is the value in our scope ?

They use a different node_modules layout which avoid duplicates. Maybe 
it more interesting for my prototype.

Regards
   Stefan

