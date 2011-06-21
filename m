Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZ25O-0004Kf-Rm
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:39:13 +0200
Received: by pzk36 with SMTP id 36so4921472pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=288WBfqLfPK+vf0B2glXZNc3L5E+LQ46ceuOCnwvVnE=;
	b=S5hiYDIEU1vlE1phs1zj5OXvvG5AK/cKs+dNQDlHTSF+lJeISkhWhKSBftIO3Tzgm+
	2t2P/JwfIHRxl+az9dFsr4vVjI+IgZsKwopJKKpxO1BdnA0BWZV3y7vTZEV9C+OQ1H7D
	0Xeb5WLvjGdh4K6t37WetwSPd1vaWjQ5Fn43Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=T7SQvLB3nt6r/xzdrJxhPg/17E7HfczIffKKTC6q9KCEtIgswCsrdYHhsSJ91MynKG
	Vwb66erzPqJSq0H5/EVBSs3IE/EAz4y02tU7zRGvVGArWmdgM5aN34n51kRYimW+IyTS
	dNtU4XpXPZYnd5ZHGdioReUeWKf9ihdvpBxKo=
Received: by 10.142.178.15 with SMTP id a15mr1059945wff.326.1308666766645;
	Tue, 21 Jun 2011 07:32:46 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t15sm7153256wfh.4.2011.06.21.07.32.45
	(version=SSLv3 cipher=OTHER); Tue, 21 Jun 2011 07:32:45 -0700 (PDT)
Message-ID: <4E00AB8C.2070103@gmail.com>
Date: Tue, 21 Jun 2011 07:32:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308658461.20015.24.camel@rex>
In-Reply-To: <1308658461.20015.24.camel@rex>
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 14:39:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2011 05:14 AM, Richard Purdie wrote:
> We've been experimenting with multilib and I now feel it right to
> discuss the changes a bit further now there is something to discuss :).
> The work so far on this is available on the branch:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/ml
>
> There have been a few issues and some lessons to learn. I've also have
> to make some implementation decisions based on the issues we were
> running into. To summarise them:
>
> a) bitbake has issues if you try and delete variables from the data
> store. Patches two and three on the branch fix the issues I was seeing.
> More details are in the commits.
>
> b) I found the recent additional event in bitbake wasn't in the right
> place to optimally support multilib so I had to move the expandKeys()
> call. Since the only known user is the native/nativesdk classes in
> OE-Core, this should be ok to do at this point. Again, the commit has
> the specific details.
>
> c) When adding parameter support to BBCLASSEXTEND I added some variables
> so the class can figure out which class is being processed and what the
> parameter is. Related to this is the issue that bbclass event handlers
> once added always get called, even if the class isn't inherited in a
> subsequent recipe file!
>
> d) I switched to using<multilib>- as the prefix for multilib recipes.
> This was because using the ":" character didn't work out as it gets
> placed into paths in too many places if you add it to PN.
>
> e) I've made the assumption that if a name in PACKAGES uses PN, its at
> the start.
>
> f) The use of := in cross.bbclass makes life hard for multilib. There is
> a special section of multilib.bbclass devoted to handling those
> variables. Initially I approached this as two separate multilib classes
> but these are merged together now.
>
> g) I set the TARGET_VENDOR to the horrendously ugly string
> "-pokymllib32". The reason is that any "-" characters in there breaks
> config.sub at present and other separators cause other issues. I suspect
> we can fix that going forward but for now it works albeit looking
> horrible.


generally _ works well with triplets but I guess we have overrides so 
thats ruled out.

>
> h) I had to introduce MLPREFIX for use in certain places, thankfully all
> in places "normal" recipes shouldn't need to use it.
>
>
> Summary is that you can now add:
>
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32 multilib:lib64"

I think MULTILIB = "lib32 lib64" would be nicer

>
> to your local.conf and then "bitbake zlib lib64-zlib lib32-zlib" and it
> will build all three configurations.

will it also build binaries for both libs as well ? or just libraries


Packaging of the components I've
> looked at is ok so far with the files in the correct directories and
> whilst I've not tried building an image from these, I'm optimistic :).
>
> Since various Yocto people are scheduled to work on pieces of this, I've
> split the subsequent work into the following tasks for development
> purposes:
>
> 1) Change libdir to "lib64" for qemux86-64 and see what breaks.
>
> 2) Extend MULTILIB class extension to recipes required to build:
>       a) minimal image
>       b) LSB image?
>       c) Sato image?
>       d) world [stretch goal for 1.1]
>
>     This task also could include a better way of specifying which
>     recipes to extend.
>
> 3) Add support to RPM packaging backend to turn modified package names
>     into true rpm multilib packages.
>
> 4) Add support to standard opkg backend to allow parallel install of
>     multilib variant packages (likely to be hacky at first but also
>     include a proposal for better native opkg support of this)
>
> 5) Add support to bitbake to pass BBEXTEND parameters from options like
>     bitbake -b where filenames are specified on the commandline
>
> 6) Create some "standard" multilib configurations (x86 32+64 bit)
>
> 7) Overhaul architecture, ABI, optimisation configuration files with a
>     view to better structure (and ease specifying multilib
>     configurations).
>
> 8) Reconsolidate multilib + multilibcross class differences [already
>     done by RP now]
>
> 9) Directly support multlibs within the toolchain itself [post 1.1]
>
> 10) Investigate better TARGET_VENDOR handling for config.sub. Currently
>     we can only have ARCH-VENDOR-linux where VENDOR cannot contain "-"
>     but it might be possible to relax that constraint.
>
> I'm quite pleased with the way this code "feels" now and it isn't
> working out too invasive into the rest of the system. I therefore think
> we have a solid base to start building the above tasks upon.
>
> There are other cleanup issues it does highlight such as the convoluted
> mess of MULIMACH_ARCH variables, BASE_PACKAGE_ARCH, PACKAGE_ARCH and so
> forth but I'll save that for a separate discussion.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



