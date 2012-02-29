Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S2cLG-0004Oo-JY
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:44:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1T5aG8F020352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Feb 2012 21:36:16 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 28 Feb 2012 21:36:16 -0800
Message-ID: <4F4DB94F.7060701@windriver.com>
Date: Tue, 28 Feb 2012 23:36:15 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Steve Sakoman <sakoman@gmail.com>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
	<CAGDS+nmKg-iCjTnNrnM9-qBK8JF0MbJB3HX4=PM-06KPNVs_Gg@mail.gmail.com>
In-Reply-To: <CAGDS+nmKg-iCjTnNrnM9-qBK8JF0MbJB3HX4=PM-06KPNVs_Gg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: psuedo-native strangeness on 64 bit build machine
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
X-List-Received-Date: Wed, 29 Feb 2012 05:44:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/12 11:29 PM, Steve Sakoman wrote:
> On Tue, Feb 28, 2012 at 9:13 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>
>> I'm building pseudo on 64-bit machines right now, no problem.
>>
>> The error you are seeing is pseudo attempting to build both a 64-bit and a
>> 32-bit wrapper.  The 32-bit wrapper is built when the recipe detects support
>> for both 32-bit and 64-bit userspace.  It does this by looking first that
>> your host is 64-bit, and then for /usr/include/gnu/stubs-32.h.  Assuming it
>> finds those, it assumes your system has 32-bit binaries on it.
>
> Thanks for the quick reply.
>
> My 64 bit build machine has the ia32-libs package installed and
> /usr/include/gnu/stubs-32.h exists.  Any idea why the initial clean
> build succeeds, but the rebuild triggered by the pull fails?
>
>> To avoid a 32-bit build of pseudo, on a 64-bit machine.  You need to set
>> NO32LIBS = "1".  This instructs pseudo to avoid the 32-bit binary build.
>>   (If your machine has 32-bit binaries on it, you need to fix your compiler
>> to allow for 32-bit userspace builds, otherwise pseudo will be incapable of
>> wrapping any 32-bit binaries, resulting in a potential mismatch of user,
>> groups and modes set by any 32-bit applications.
>
> Could you give me a pointer on how to "fix" my compiler to allow for
> 32-bit userspace builds?

I don't use Ubuntu much, and when I do, it's only with 64-bit binaries.  (Fedora 
and RHEL I often use with mixed size systems...)

Most distributions have a 32-bit devel package, or set of packages.  I assume 
ubuntu does as well.  (I've recently been doing a lot of builds on 64-bit Mint 12.)

A quick google found me some references to:

glibc-devel-32bit, gcc-32bit

You might want to try apt-get those and see if that will work.  Under the hood, 
you'll need the 32-bit glibc development files, and libgcc.  Once you have that, 
I believe pseudo will build both 32-bit and 64-bit properly.

--Mark

> Thanks!
>
> Steve



