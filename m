Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1D7A75D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 19:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9RJ41wM013174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Oct 2015 12:04:01 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 12:04:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
References: <cover.1445954460.git.liezhi.yang@windriver.com>
	<6aacdcc20175b509fa9adca8a7bfa861e443ee09.1445954460.git.liezhi.yang@windriver.com>
	<CAJTo0La8YZQafC-8SKdBt_4K5N8TsHU6bq3oeykJ6-j6pc6isw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <562FCAA0.3020109@windriver.com>
Date: Tue, 27 Oct 2015 14:04:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La8YZQafC-8SKdBt_4K5N8TsHU6bq3oeykJ6-j6pc6isw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-smartpm-native: prefer same arch when install
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
X-List-Received-Date: Tue, 27 Oct 2015 19:04:09 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 10/27/15 1:45 PM, Burton, Ross wrote:
> 
> On 27 October 2015 at 14:05, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     We had made smart install multilib RDEPENDS correctly from
>     package_manager.py, but it couldn't handle RRECOMMANDS, this patch fix
>     the issue from python-smartpm-native, and make it work well.
> 
>     The logic is: when pkg_A rdepends/rrecommands pkg_B, then let pkg_B use
>     pkg_A's arch when possible.
> 
> 
> I added this patch and rebuilt core-image-sato, then ran buildhistory-diff:
> 
> Changes to images/intel_corei7_64/glibc/core-image-sato
> (installed-package-names.txt):
>   lib32-ncurses-terminfo-base was added
>   lib32-libjpeg9 was added
>   lib32-glibc-gconv-iso8859-1 was added
>   lib32-shared-mime-info was added
>   lib32-libxml2 was added
>   lib32-wpa-supplicant-cli was added
>   lib32-libgdk-pixbuf-2.0-loader-png was added
>   lib32-wpa-supplicant-passphrase was added
>   lib32-pango-module-basic-fc was added
>   lib32-bash was added
>   lib32-libgdk-pixbuf-2.0-loader-jpeg was added
>   lib32-libgdk-pixbuf-2.0-loader-gif was added
>   lib32-libgdk-pixbuf-2.0-loader-xpm was added
>   lib32-glibc-gconv was added
> 
> Some of those are good (gdk-pixbuf and pango), some bad (bash,
> wpa-supplicant-cli), some probably bugs in packages that should be allarch
> (termino, shared-mime-info).

bash, wpa-supplicant-cli is a good example of why this is an issue.  RPM luckily
says, well we've got two versions of bash, lets resolve this by following the
ELF resolution rule.  So while two packages may exist in the manifest, you won't
get any conflicts and space is likely not duplicated.

But you can't automatically say "give me any bash, but give me arch specific
versions of everything else".  The default in RPM is if I ask for 'bash', give
me any version of bash.. if I ask for 'bash.i586' I was -the- i586 version.

This is why the fix for this is either adjust the behavior (as Robert has done)
to suck in more dependencies and consider the ELF resolver to be adequate -- or
to add some kind of a hint to the recipe mechanisms that select dependencies
must be of the same arch type.  One we handle in the resolver, and one we could
handle when we generate the packages themselves.

I'm not sure there is an obvious solution, I prefer the later with a variant of
the former myself.  (Variant being if all things are equal we weight
dependencies to match the arch.. but if something is already in with that
provide we use it..)  Then the hint would cause the produced packages to be able
to say they need explicit versions of the plugins.

> I'm undecided what we do about this.  Fixing the dependency chains is good, but
> we're definitely pulling in more than expected.

I agree, I have a feeling what I wrote about is the right answer... but I don't
have any code to prove it.. and I'm not sure that we should be making that big
of a change right now.

Robert's patch SHOULD resolve the problem at the expense of a slightly larger
resolution manifest, which may be acceptable.

--Mark

> Ross
> 
> 


