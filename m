Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJtE2-0005hN-Lz
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 23:44:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q94LVsjS026450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Oct 2012 14:31:54 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 4 Oct 2012 14:31:53 -0700
Message-ID: <506E0049.1060208@windriver.com>
Date: Thu, 4 Oct 2012 16:31:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <506DCF4A.5020101@windriver.com>
	<CAMKF1srKsHp+Zb_eKa-BA53qbJALHvgqtXkHUdiF-fsvJp6vGQ@mail.gmail.com>
	<506DF8FB.1090606@windriver.com>
	<1349385377.8072.9.camel@x121e.pbcl.net>
In-Reply-To: <1349385377.8072.9.camel@x121e.pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Secondary Toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 21:44:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/12 4:16 PM, Phil Blundell wrote:
> On Thu, 2012-10-04 at 16:00 -0500, Mark Hatle wrote:
>> This is only one runtime.  You have multiple compilers all capable of producing
>> software compatible with the same ABI.  The default (oe) compiler is used,
>> unless otherwise configured.  The alternative(s) are used for optimization of
>> various items.  I mentioned ICC, because it's one that I know today people are
>> using and it is capable of replacing gcc in many applications.
>
> If that's the case then it doesn't seem like it ought to be necessary to
> override most of the variables you mentioned.  Tools like ar, ranlib and
> strip are generic to a binary format and should work fine with the
> output from any compiler.  Also, if you're linking with GNU libc then
> the chances are that you need to use one of the GNU linkers (be that
> ld.bfd or gold) since I suspect most third party link editors will not
> work very well.  And, if you have assembly source on hand, it's probably
> going to be written in GAS dialect so selecting an alternative assembler
> as ${AS} is unlikely to gain much.

I realize not everything will be overridden, and I even expect in many cases 
only the CC and CXX will be defined.

I'm aware of at least one third party compiler that uses a different dialect 
then GAS.  And in that case the compiler and assembly would be overwritten.. 
(mind you anything that uses gas syntax would of course be incompatible and blow 
up, which begs the question -- do you really want to use AS then?)

But I figure if we cover all of the cases then we should be good no matter what.

> So, it kind of seems like the only variables you're likely to need to
> change are CC, CXX and the corresponding FLAGS.  I guess you might also
> want to override F77 in theory though I'm not sure there are many people
> using Fortran in an embedded environment.

I'm aware of one company that -was- using Fortran, I don't know if they still 
are.  (And they were not using the GNU F77....)

> Your proposed "toolchain-icc" override sounds like a reasonable enough
> way to accomplish that, anyway.  The only problem it doesn't seem to
> solve is the use-case of "everything that supports icc, I want to build
> with icc; everything that doesn't support icc, I want to build with
> gcc".  But I'm not sure this really matters much.

There needs to be a way to set the TOOLCHAIN 'type' on a blacklist or whitelist 
basis.  I.e. in a whitelist, you simply set it to 'gnu' (or whatever), which is 
more or less what I'd expect the default behavior to be.  Then for every recipe 
you are aware of that works -- you'd overriver the TOOLCHAIN-pn_package w/ 'alt'.

Alternatively you could do it as a blacklist.. set TOOLCHAIN = 'alt' and then 
blacklist items by setting the items to 'gnu' (or whatever).

Both have advantages.. personally I'd suggest the former rather then later 
approach, it's easier to support and then you can focus porting efforts on the 
packages that you believe you need the most optimizations in.

--Mark

> p.
>
>



