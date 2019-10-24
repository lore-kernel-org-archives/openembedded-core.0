Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id B6F947F8BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B7E1E9C041A;
	Thu, 24 Oct 2019 11:13:29 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id QsP-F5hCHJ0k; Thu, 24 Oct 2019 11:13:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DC2369C041E;
	Thu, 24 Oct 2019 11:13:28 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 8AkoOwaeugKM; Thu, 24 Oct 2019 11:13:28 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B3C119C041A;
	Thu, 24 Oct 2019 11:13:28 -0400 (EDT)
Date: Thu, 24 Oct 2019 11:13:28 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <706856841.532586.1571930008700.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC77 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: 1j6akuwZnghhsfHwbNAYexPLjBRG/A==
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
X-List-Received-Date: Thu, 24 Oct 2019 15:13:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Stefan,

On Oct 24, 2019, at 2:01 PM, Stefan Herbrechtsmeier stefan@herbrechtsmeier.net wrote:
> Am 22.10.19 um 13:22 schrieb Richard Purdie:
>> On Tue, 2019-10-22 at 11:03 +0200, Jean-Marie LEMETAYER wrote:
>>> The current NPM support have several issues:
>>>   - The current NPM fetcher downloads the dependency tree but not the other
>>>     fetchers. The 'subdir' parameter was used to fix this issue.
>>>   - They are multiple issues with package names (uppercase, exotic characters,
>>>     scoped packages) even if they are inside the dependencies.
>>>   - The lockdown file generation have issues. When a package depends on
>>>     multiple version of the same package (all versions have the same checksum).
>>>
>>> This patchset refactors the NPM support in Yocto:
>>>   - As the NPM algorithm for dependency management is hard to handle, the new
>>>     NPM fetcher downloads only the package source (and not the dependencies,
>>>     like the other fetchers) (patch submitted in the bitbake-devel list).
> 
> What make the new fetcher different from the simple wget fetcher?

The fetcher asks the registry for the tarball url and its integrity. Then it uses wget to download the tarball and then check the integrity given by the registry. Finally it unpacks the tarball according to the tarball format (the root directory is called 'package' which must be renamed).

>>>   - The NPM class handles the dependencies using NPM (and not manually).
> 
> Is this really an improvement? NPM will do the cross compile during
> fetch, loads additionally archives (not packages) from the internet and
> doesn't reuse dependencies.

In the next version of this patchset the dependencies are cached in a npm_cache directory stored in the DL_DIR during the do_fetch_append task (using 'npm cache --cache=${DL_DIR}/npm_cache'). The 'npm install' doesn't require any internet accesses because it is run with '--offline' option.

>>>   - The NPM recipe creation is simplified to avoid issues.
> 
> We create new not obvious issues. How you would handle prebuild binaries?

I have no case of using prebuild binaries. After checking some informations it seems that it is handled the same way as node-gyp (by using scripts in the package.json). A patchset to support that is welcome. 

>>>   - The lockdown file is no more used as it is no longer relevant compared to the
>>>     latest shrinkwrap file format.
>>>
>>> This patchset may remove some features (lockdown file, license management for
>>> dependencies)
> 
> You really remove the license management of the dependencies? I think a
> main feature of OE is the license management.

The previous npm support was creating subpackages to handle the license management of the dependencies. This is a good idea but it fails with package with exotic names. A work will be needed to cleanly remake it.

>> but fixes the majority of the NPM issues. All of these issues
>>> from the bugzilla.yoctoproject.org are resolved by this patchset:
>>> #10237, #10760, #11028, #11728, #11902, #12534
>> 
>> One key requirement which many of our users have from the fetcher is
>> that its deterministic and allows for "offline" builds.
> 
> I think this is impossible with npm because every dependency could run a
> script and download additional files (ex. prebuild).

I have no case of using prebuild binaries. Can you give me an example of a package using prebuild? Do you know about the '--offline' and the '--ignore-scripts' options? A patchset to support that is welcome.

>> What this means is that should I have a populated DL_DIR, the build
>> should not need to touch the network. Also, only do_fetch tasks would
>> make network accesses.
> 
> @Richard: What is your opinion about the per recipe dependency?
> Typically OE use one recipe per project. The NPM based solution handle a
> project and all dependencies via one recipe.
> 
> @Jean-Marie: Do you know PNPM? They use a different node_modules layout
> which allows the reuse of dependencies.

Thanks for the link. What is the value in our scope ?

Regards,
Jean-Marie

