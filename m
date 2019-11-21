Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9527FA29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A5A329C030D;
	Thu, 21 Nov 2019 14:53:50 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id t3LH0h0_PIBx; Thu, 21 Nov 2019 14:53:49 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 996929C0394;
	Thu, 21 Nov 2019 14:53:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 4c-33-8-xpBn; Thu, 21 Nov 2019 14:53:49 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5FCA89C030D;
	Thu, 21 Nov 2019 14:53:49 -0500 (EST)
Date: Thu, 21 Nov 2019 14:53:48 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC78 (Win)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: cP+APhlom4Gms0fyDObdSuQmmYQCbg==
Cc: Jonas Andersson <jonaskgandersson@gmail.com>,
	paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>, bunk <bunk@stusta.de>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Thu, 21 Nov 2019 19:53:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



Hi Richard,

On Nov 21, 2019, at 7:26 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-11-20 at 10:33 +0100, Jean-Marie LEMETAYER wrote:
>> The current NPM support have several issues:
>>  - The current NPM fetcher downloads the dependency tree but not the other
>>    fetchers. The 'subdir' parameter was used to fix this issue.
>>  - They are multiple issues with package names (uppercase, exotic characters,
>>    scoped packages) even if they are inside the dependencies.
>>  - The lockdown file generation have issues. When a package depends on
>>    multiple version of the same package (all versions have the same checksum).
>> 
>> This patchset refactors the NPM support in Yocto:
>>  - As the NPM algorithm for dependency management is hard to handle, the new
>>    NPM fetcher downloads only the package source (and not the dependencies,
>>    like the other fetchers) (patch submitted in the bitbake-devel list).
> 
> I'm a little confused by this item.
> 
> If the NPM fetcher only downloads a given package's source and it has
> dependencies, where/when are the dependencies downloaded?
> 
> My worry here is that if the fetcher isn't downloading them, DL_DIR
> can't contain all the needed pieces needed to reproduce a build at a
> later date?
> 
> I suspect I'm missing something obvious...

The magic is in the bbclass, in the do_fetch_append() function:
https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/meta/classes/npm.bbclass#L51

Which calls:
https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/bitbake/lib/bb/fetch2/npm.py#L312

Which runs the npm fetcher for each dependencies described in the
shrinkwrap file. This is the same behavior for the do_unpack task.


To be more clear, a recipe like this:

```
SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
S = "${WORKDIR}/npm"
```

Will only fetch/unpack the package source without handling the
dependencies.

But a recipe like this:

```
SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
S = "${WORKDIR}/npm"

NPM_SHRINKWRAP = "${THISDIR}/${BPN}/npm-shrinkwrap.json"
inherit npm
```

Will fetch/unpack the package and all the dependencies which are
described in the shrinkwrap file.


Bonus tips: you can have your base package SRC_URI using another
fetcher than npm (e.g. git) without breaking anything. The behavior
will still be the same.


Best regards,
Jean-Marie

