Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7320971486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 05:20:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I5KvjM006665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 22:20:58 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 17 Sep 2014 22:20:56 -0700
Message-ID: <541A6BAC.6000202@windriver.com>
Date: Thu, 18 Sep 2014 13:20:44 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1410939794.git.hongxu.jia@windriver.com>	<7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>	<1410970596.14624.108.camel@ted>
	<CAP9ODKoqzBXjjYjALrRH_2K3K2uobEUk4irxL=ZNB1m8hOPe_g@mail.gmail.com>
In-Reply-To: <CAP9ODKoqzBXjjYjALrRH_2K3K2uobEUk4irxL=ZNB1m8hOPe_g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] sstatesig: incremental dump lockedsigs
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
X-List-Received-Date: Thu, 18 Sep 2014 05:20:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2014 12:21 AM, Otavio Salvador wrote:
> On Wed, Sep 17, 2014 at 1:16 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2014-09-17 at 16:08 +0800, Hongxu Jia wrote:
>>> The idea of incremental sig is:
>>>
>>> New sig file = Old sig file (if available) + New sig items in current build.
>>>
>>> Limit the modification within the dump_lockedsigs, and add two variables
>>> 'self.lockedsigs_types' and 'self.lockedsigs_raw' keep old sig file.
>>>
>>> How to config for incremental dump:
>>> ...
>>> USER_CLASSES += "sstate_lockedsig"
>>> SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
>>> require ${SIGGEN_LOCKEDSIGS_CONFIG}
>>> ...
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> I'm fine with the idea in principle. Why can't we do something like:
> ...
>> which is substantially simpler though?
> Wouldn't it keep accumulating locked hashes for same recipes?

Of course not, checking added before write to file
...

+                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.hashtask[k] == self.lockedsigs[pn][task]:
+                        continue

...

But there are still accumulating empty SIGGEN_LOCKEDSIGS added, such as:
...
SIGGEN_LOCKEDSIGS_t-x86-64 += "\
     "
SIGGEN_LOCKEDSIGS_TYPES_qemux86 += "t-x86-64"
...

I will fix it in V3

//Hongxu

>
>


