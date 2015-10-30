Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B65F375894
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 22:44:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9UMiTZ5002416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Oct 2015 15:44:29 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 30 Oct 2015 15:44:29 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <5633E452.9040500@windriver.com>
	<CAMKF1sp4Jd5765g2mvDAir6MgO_4pNRvByNV9_MPjrQX-NviEw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5633F2CC.6090903@windriver.com>
Date: Fri, 30 Oct 2015 17:44:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp4Jd5765g2mvDAir6MgO_4pNRvByNV9_MPjrQX-NviEw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: PowerPC / gcc / prelink
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
X-List-Received-Date: Fri, 30 Oct 2015 22:44:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/30/15 4:59 PM, Khem Raj wrote:
> On Fri, Oct 30, 2015 at 2:42 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> I finally chased down the PowerPC prelink problem.  It appears to be within GCC.
>>
>> On most systems GCC (for PPC) is configured with --enable-secureplt.  However,
>> the OE-Core version is not.  The prelinker assumes that for certain types of
>> relocations that the PPC_GOT table will exist, otherwise it gives up.  (It
>> doesn't know how to do the relocations in the old style .bss-got table.)
>>
>> I'm wondering if there is a reason that PPC is defaulting to the old style
>> .bss-got (other then the secureplt was not enabled by default).
>>
>> Is this something we should do in all cases, or should this become a
>> DISTRO_FEATURE like the mips 'mplt' setting?
>>
>>
>> I'm still building systems and running tests, but adding --enable-secureplt to
>> both the gcc-cross-initial, and gcc-cross appear to have resolved the prelinking
>> issues.
> 
> enabling secureplt is ok, ensure that binutils is configured correctly as well.

binutils 2.25.1 has all of the support needed for secure-plt.  So I don't
believe there are any issues there.

I'll prepare a patch that changes the default configuration.

--Mark

> 
>>
>> --Mark


