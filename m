Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75C016A443
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 14:46:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4NEkYUp014075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 07:46:34 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 23 May 2013 07:46:32 -0700
Message-ID: <519E2BC8.2090905@windriver.com>
Date: Thu, 23 May 2013 09:46:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CA452391058F6D4E9715FB2C29D9312A01570F29@039-SN2MPN1-021.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A01570F29@039-SN2MPN1-021.039d.mgd.msft.net>
Subject: Re: Query for multilib support in Yocto
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
X-List-Received-Date: Thu, 23 May 2013 14:46:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/13 3:46 AM, Luo Zhenhua-B19537 wrote:
> Hi all,
>
> I am trying the multilib feature of Yocto, and I want to make sure if below scenarios are supported, who can help to clarify? Thanks in advance.
>
> For standalone toolchain built by "bitbake meta-toolchain"
> 1. Can the same gcc binary build both 32b and 64b applications or two different gcc binaries(one is for 32b, the other is for 64b) are required?

As far as I know, you can create a multilib SDK, but you will need multilib gcc 
binaries.  We don't yet have singular gcc with multilib cflag options available. 
  (At Wind River we use a prebuilt binary toolchain that does allow this single 
binary/multilib target behavior.  Other then that we are using the standard SDK 
support and it is working for us.)

> For gcc with multilib support running on target board
> 1. Can the same gcc binary build both 32b and 64b applications or two different gcc binaries(one is for 32b, the other is for 64b) are required?

As far as I'm aware the same issue above holds true here.  You still need 
multiple compiler binaries, one for each multilib.  (Khem Raj would know if this 
is still true however.)

It was discussed a while back that we really want to follow the single binary, 
multilib target model -- but I don't know where that is from a development 
perspective.

> 2. Can both 32b and 64b application be executed in the same rootfs image with multilib support?

Yes.  As long as the multilib support is configured properly (i.e. different 
baselib for each tune) it works properly today.  I've been building 1.4 (and 
master) recently for x86/x86_64 systems with multilib support and as far as I 
can tell it is working correctly.

On Power there have been some issues reported in the past with the prelinker and 
PPC64 binaries.  But other then that, it should be working fine.

> BTW, may I know how the default value of LIBRARY_PATH is set? I experienced following error when I use gcc(32bit rootfs with multilib support) to do 64b build, I find the linker search libraries in /usr/lib and /lib instead of /usr/lib64 and /lib64.
>
> root@p5020ds:~# gcc -m64 my_test.c -o my_test
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powerpc-poky-linux/4.7.2/libgcc.a when searching for -lgcc
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when searching for -lgcc
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: cannot find -lgcc
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible /lib/../lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible //lib/libgcc_s.so.1 when searching for libgcc_s.so.1
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: cannot find libgcc_s.so.1
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../powerpc-poky-linux/4.7.2/libgcc.a when searching for libgcc.a
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: skipping incompatible /usr/lib/powerpc-poky-linux/4.7.2/libgcc.a when searching for libgcc.a
> /usr/lib/gcc/powerpc-poky-linux/4.7.2/../../../../powerpc-poky-linux/bin/ld: cannot find libgcc.a

Ya, this is running the 'wrong' toolchain.  From the errors it appears to me 
that it's the 32-bit gcc, attempting to compile for 64-bit.  There is a command 
that will tell you what architectures gcc was built to support, but 
unfortunately I don't remember it offhand.

At one point we had installed the full canonical name of the gcc binary, so 
"powerpc-poky-linux-gcc" would be 32-bit, and "powerpc64-poky-linux-gcc" would 
be the 64-bit version.  I don't know if that is still true however.

--Mark

> collect2: error: ld returned 1 exit status
> root@p5020ds:~# cat my_test.c
> int main()
> {
>      int a=0;
>
>      return a;
> }
>
>
> Best Regards,
>
> Zhenhua
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


