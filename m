Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id CFAC060557
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 17:11:32 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id AHBY1p0030BVjqb01HBYWK; Sat, 01 Nov 2014 10:11:32 -0700
Message-ID: <54551443.2060800@pabigot.com>
Date: Sat, 01 Nov 2014 12:11:31 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>	<20141013162851.58e820e6@e6410-2>	<543C5246.30703@pabigot.com>	<20141013173545.0d2c5de0@e6410-2>
	<54545E7C.2060804@pabigot.com>
In-Reply-To: <54545E7C.2060804@pabigot.com>
Subject: Re: [PATCH 0/3] pseudo+image.bbclass: changes to avoid host contamination
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
X-List-Received-Date: Sat, 01 Nov 2014 17:11:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2014 11:15 PM, Peter A. Bigot wrote:
> On 10/13/2014 05:35 PM, Peter Seebach wrote:
>> On Mon, 13 Oct 2014 17:29:26 -0500
>> "Peter A. Bigot" <pab@pabigot.com> wrote:
>>
>>> Basically, even if "root" is a special case, taking this path means
>>> making assumptions about what the application is doing based on what
>>> system/libc functions it invokes.  Too often when somebody assumes a
>>> general tool will only be used specific ways, somebody else will prove
>>> them wrong.
>> True.
>>
>> For the oe-core case, it seems like it might be reasonable for us to set
>> pseudo up to, by default, get configured with preloaded things which 
>> match
>> the expected configuration of base-passwd. If people then go overriding
>> base-passwd in strange ways, they could break that, but we at least 
>> know what
>> the default configuration would be, and could possibly even make 
>> base-passwd
>> check whether pseudo's configuration matches its answers, and blow up if
>> there's a mismatch there.
>
> I've discovered a few more cases where OE packages get the wrong 
> target username/group for files, at least in RPM packages.
>
> First, revisiting the discussion above I've played with using 
> --without-passwd-fallback and adding base-passwd as an explicit 
> dependency. This won't work: glibc-initial requires base-passwd for 
> group name lookups, and base-passwd includes update-passwd as an 
> executable which requires glibc.
>
> The options seem to be to split base-passwd into separate recipes for 
> the data files and the utility to break the circular dependency, or 
> having pseudo synthesize a fallback passwd/group. Prior to gaining 
> experience I didn't like the second choice, but I like the first even 
> less.  As long as pseudo emits a note saying what it's doing so we can 
> add the DEPENDS=base-passwd where that's not circular (as with 
> tzdata), my vote goes toward pseudo synthesis. I'm hoping somebody 
> disagrees and comes up with a better, third alternative.

I did find an alternative, and the patches to enforce 
--without-passwd-fallback have been posted.

>
> However, I've also discovered another issue, possibly related to: 
> http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053866.html 
>
>
> On my development machine my uid:gid are both 1000 and correspond to 
> pab:pab.  Using poky master with MACHINE=beaglebone building 
> core-image-sato the corresponding user:group is xuser:xuser.
>
> Running the following script:
>
> find tmp/deploy/ -name '*.rpm' \
>   | while read f ; do \
>     rpm -qlvp ${f} 2>/dev/null \
>       | awk '$3~/pab|xuser/ || $4~/pab|xuser/ {print;}' \
>       > /tmp/c$$ ; \
>     if [ -s /tmp/c$$ ] ; then \
>       echo ; \
>       echo $f; \
>       cat /tmp/c$$ ; \
>     fi ; \
>   done
>
> I find the following packages include files that are given group or 
> user xuser, indicating that the files were installed with user:group 
> set to the host value 1000:1000 instead of being remapped to 0:0 by 
> pseudo, but when packaging pseudo does "correctly" interpret the 
> uid:gid using the target passwd/group files:
>
> tmp/deploy/rpm/cortexa8hf_vfp_neon/attr-ptest-2.4.47-r0.0.cortexa8hf_vfp_neon.rpm 
>
> tmp/deploy/rpm/cortexa8hf_vfp_neon/acl-ptest-2.2.52-r0.0.cortexa8hf_vfp_neon.rpm 
>
> tmp/deploy/rpm/cortexa8hf_vfp_neon/systemd-216+git0+5d0ae62c66-r0.0.cortexa8hf_vfp_neon.rpm 
>
> tmp/deploy/rpm/cortexa8hf_vfp_neon/perl-ptest-5.20.0-r1.0.cortexa8hf_vfp_neon.rpm 
>
>
> For example:
>
> llc[11]$ rpm -qlvp 
> tmp/deploy/rpm/cortexa8hf_vfp_neon/perl-ptest-5.20.0-r1.0.cortexa8hf_vfp_neon.rpm
> -r--r--r--    1 xuser   xuser                   45590 May 26 08:34 
> /usr/lib/perl/ptest/AUTHORS
> -r--r--r--    1 xuser   xuser                    6321 Jan 31  2014 
> /usr/lib/perl/ptest/Artistic
> -r--r--r--    1 xuser   xuser                    3168 Jan 31  2014 
> /usr/lib/perl/ptest/Changes
> -r-xr-xr-x    1 xuser   xuser                  552838 Oct 31 15:34 
> /usr/lib/perl/ptest/Configure

The issue of the underlying gid not being correct are still present.  It 
is non-deterministic, and may or may not be happening with uid as well.  
It does seem to happen most with *-ptest-* recipes and others that 
install files probably whole-directory-at-a-time.

> Further, this one even manages to get the user:group names from the host:
>
> llc[12]$ rpm -qlvp 
> tmp/deploy/rpm/cortexa8hf_vfp_neon/libgcc-s-dev-4.9.1-r0.0.cortexa8hf_vfp_neon.rpm 
> | grep pab
> lrwxrwxrwx    1 pab     pab                        22 Oct 31 15:17 
> /usr/lib/arm-poky-linux -> arm-poky-linux-gnueabi

This problem was fixed by eliminating host fallback.

Peter

> My tentative conclusion is that these new behaviors aren't related to 
> the pseudo falling back to host /etc files, but probably instead by 
> files getting installed (and in one case somehow packaged) without 
> using pseudo.  I have no idea why that's happening, but it does appear 
> something's not working right.
>
> Peter
>


