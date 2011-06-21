Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QYpo1-0008Qe-SS
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 03:31:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5L1RVUD028683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 18:27:31 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 20 Jun 2011 18:27:31 -0700
Message-ID: <4DFFF381.7020606@windriver.com>
Date: Tue, 21 Jun 2011 09:27:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308391365.git.liezhi.yang@windriver.com>	<9A9B307C-87E6-445D-9432-739EBF04090F@dominion.thruhere.net>	<4DFEA6E4.6060108@windriver.com>
	<BANLkTiknBxHhpfuJJaFkDx83CJamSZr2EQ@mail.gmail.com>
In-Reply-To: <BANLkTiknBxHhpfuJJaFkDx83CJamSZr2EQ@mail.gmail.com>
Subject: Re: [PATCH 0/6 V3] Share gcc work directories
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
X-List-Received-Date: Tue, 21 Jun 2011 01:31:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/21/2011 05:01 AM, Khem Raj wrote:
> On Sun, Jun 19, 2011 at 6:48 PM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>>> How does this interact with rm_work?
>>>
>>
>> The rm_work does not delete anything in work-shared, I think this is fine,
>> otherwise the source can not be shared.
>>
>
> it also limits the possibility of patching the sources differently if need be.
> Can it do that easily suppose gcc intermediate needs a patch for a given arch


Yes, the source must be the same if they want to use the shared source. When we
want to patch the source, I think proper way is try to patch them general(not
only for a given arch).

> and others don't then can it make gcc cross intermediate not use shared source

Yes, when the following variables are not defined(or defined to other value)
for gcc intermediate, then it would not use the shared source.


S = "${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}"
B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"

# SS means Shared Stamps directory
SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}"
do_fetch[stamp-base] = "${SS}"
do_unpack[stamp-base] = "${SS}"
do_patch[stamp-base] = "${SS}"

# SW means Shared Work directory
SW = "${TMPDIR}/work-shared/gcc-${PV}"
WORKDIR_task-unpack = "${SW}"
WORKDIR_task-patch = "${SW}"

// Robert

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


