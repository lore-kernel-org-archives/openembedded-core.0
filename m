Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ2MB-0004lO-4z
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:55:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LEpbvd023447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 07:51:37 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 07:51:36 -0700
Message-ID: <4E00AFF8.5020004@windriver.com>
Date: Tue, 21 Jun 2011 09:51:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1308658461.20015.24.camel@rex> <4E00AB8C.2070103@gmail.com>
In-Reply-To: <4E00AB8C.2070103@gmail.com>
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
X-List-Received-Date: Tue, 21 Jun 2011 14:55:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/21/11 9:32 AM, Khem Raj wrote:
> On 06/21/2011 05:14 AM, Richard Purdie wrote:
>> We've been experimenting with multilib and I now feel it right to
>> discuss the changes a bit further now there is something to discuss :).
>> The work so far on this is available on the branch:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/ml
>>
>> There have been a few issues and some lessons to learn. I've also have
>> to make some implementation decisions based on the issues we were
>> running into. To summarise them:
>>
>> a) bitbake has issues if you try and delete variables from the data
>> store. Patches two and three on the branch fix the issues I was seeing.
>> More details are in the commits.
>>
>> b) I found the recent additional event in bitbake wasn't in the right
>> place to optimally support multilib so I had to move the expandKeys()
>> call. Since the only known user is the native/nativesdk classes in
>> OE-Core, this should be ok to do at this point. Again, the commit has
>> the specific details.
>>
>> c) When adding parameter support to BBCLASSEXTEND I added some variables
>> so the class can figure out which class is being processed and what the
>> parameter is. Related to this is the issue that bbclass event handlers
>> once added always get called, even if the class isn't inherited in a
>> subsequent recipe file!
>>
>> d) I switched to using<multilib>- as the prefix for multilib recipes.
>> This was because using the ":" character didn't work out as it gets
>> placed into paths in too many places if you add it to PN.
>>
>> e) I've made the assumption that if a name in PACKAGES uses PN, its at
>> the start.
>>
>> f) The use of := in cross.bbclass makes life hard for multilib. There is
>> a special section of multilib.bbclass devoted to handling those
>> variables. Initially I approached this as two separate multilib classes
>> but these are merged together now.
>>
>> g) I set the TARGET_VENDOR to the horrendously ugly string
>> "-pokymllib32". The reason is that any "-" characters in there breaks
>> config.sub at present and other separators cause other issues. I suspect
>> we can fix that going forward but for now it works albeit looking
>> horrible.
> 
> 
> generally _ works well with triplets but I guess we have overrides so 
> thats ruled out.
> 
>>
>> h) I had to introduce MLPREFIX for use in certain places, thankfully all
>> in places "normal" recipes shouldn't need to use it.
>>
>>
>> Summary is that you can now add:
>>
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32 multilib:lib64"
> 
> I think MULTILIB = "lib32 lib64" would be nicer
> 
>>
>> to your local.conf and then "bitbake zlib lib64-zlib lib32-zlib" and it
>> will build all three configurations.
> 
> will it also build binaries for both libs as well ? or just libraries

Goal is to build the whole recipe for whatever multilibs are defined.

The packaging system(s) can then choose to install whatever is required for the
runtime dependencies.  (RPM can do some additional conflict avoidance, but this
has to work for opkg and deb packages as well.)

--Mark

> 
> Packaging of the components I've
>> looked at is ok so far with the files in the correct directories and
>> whilst I've not tried building an image from these, I'm optimistic :).
>>
>> Since various Yocto people are scheduled to work on pieces of this, I've
>> split the subsequent work into the following tasks for development
>> purposes:
>>
>> 1) Change libdir to "lib64" for qemux86-64 and see what breaks.
>>
>> 2) Extend MULTILIB class extension to recipes required to build:
>>       a) minimal image
>>       b) LSB image?
>>       c) Sato image?
>>       d) world [stretch goal for 1.1]
>>
>>     This task also could include a better way of specifying which
>>     recipes to extend.
>>
>> 3) Add support to RPM packaging backend to turn modified package names
>>     into true rpm multilib packages.
>>
>> 4) Add support to standard opkg backend to allow parallel install of
>>     multilib variant packages (likely to be hacky at first but also
>>     include a proposal for better native opkg support of this)
>>
>> 5) Add support to bitbake to pass BBEXTEND parameters from options like
>>     bitbake -b where filenames are specified on the commandline
>>
>> 6) Create some "standard" multilib configurations (x86 32+64 bit)
>>
>> 7) Overhaul architecture, ABI, optimisation configuration files with a
>>     view to better structure (and ease specifying multilib
>>     configurations).
>>
>> 8) Reconsolidate multilib + multilibcross class differences [already
>>     done by RP now]
>>
>> 9) Directly support multlibs within the toolchain itself [post 1.1]
>>
>> 10) Investigate better TARGET_VENDOR handling for config.sub. Currently
>>     we can only have ARCH-VENDOR-linux where VENDOR cannot contain "-"
>>     but it might be possible to relax that constraint.
>>
>> I'm quite pleased with the way this code "feels" now and it isn't
>> working out too invasive into the rest of the system. I therefore think
>> we have a solid base to start building the above tasks upon.
>>
>> There are other cleanup issues it does highlight such as the convoluted
>> mess of MULIMACH_ARCH variables, BASE_PACKAGE_ARCH, PACKAGE_ARCH and so
>> forth but I'll save that for a separate discussion.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



