Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBPii-00025D-Hu
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 14:10:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r21CrSIf029995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 04:53:28 -0800 (PST)
Received: from [128.224.162.206] (128.224.162.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Fri, 1 Mar 2013 04:53:27 -0800
Message-ID: <5130A4C6.8090605@windriver.com>
Date: Fri, 1 Mar 2013 20:53:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
	<CAJTo0LaFN=Q7kJQoJGTqrZamC=OT_pRD9qYrsO2854TWcG9Q0w@mail.gmail.com>
	<CAMKF1spTzzKjh+6+z2vEjXApLVFPU8MS0NrXVxa9UA=viOj8mQ@mail.gmail.com>
	<1362095877.1055.23.camel@ted>
In-Reply-To: <1362095877.1055.23.camel@ted>
Subject: Re: [PATCH V3 0/2]fix native package compile error with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Fri, 01 Mar 2013 13:10:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2013 07:57 AM, Richard Purdie wrote:
> On Thu, 2013-02-28 at 07:49 -0800, Khem Raj wrote:
>> On Thu, Feb 28, 2013 at 3:06 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 28 February 2013 07:09, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>> Change from V2: as Khem Raj suggested, use `-march=native' to cause the
>>>> compiler to auto-detect the architecture of the build computer, if the
>>>> auto-detect is unsuccessful the option has no effect.
>>> What happens if you're in an environment where you're sharing sstate
>>> between multiple developers, and the build machine is an i7 but
>>> another developer's machine is a Core2?    These machines have
>>> different sets of extensions available
>> yes I thought about it later on. adding march=i686 when host is 32bit
>> and march=x86-64 which build host is 64bit in bitbake.conf is probably
>> one way but I feel its overkill to please an old compiler and for one recipe
>> so may be you should try to deduce the version of gcc. i think best is to
>> fix the autoconf on glib-2.0 where you would add a test to find the version
>> of compiler and inject the needed option to flags
>>
>>
>>> Using the architecture as determined by bitbake seems like a better
>>> idea (which was V1, right?) as that's embedded in the sstate hash.
> How about we patch sanity.bbclass to test the gcc version and if its
> 4.3.4 and march isn't in BUILD_CFLAGS, we ask the user to add:
>
> BUILD_CFLAGS_append = " -march=native"
>
> to their local.conf, mentioning this is to fix an issue with older gccs?
Got it, I will work on it.

Thanks
Hongxu

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



