Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00F6D71486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 05:24:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I5OjhP006174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Sep 2014 22:24:45 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 17 Sep 2014 22:24:44 -0700
Message-ID: <541A6C90.3070700@windriver.com>
Date: Thu, 18 Sep 2014 13:24:32 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1410939794.git.hongxu.jia@windriver.com>	
	<7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>
	<1410970596.14624.108.camel@ted>
In-Reply-To: <1410970596.14624.108.camel@ted>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 Sep 2014 05:24:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2014 12:16 AM, Richard Purdie wrote:
> On Wed, 2014-09-17 at 16:08 +0800, Hongxu Jia wrote:
>> The idea of incremental sig is:
>>
>> New sig file = Old sig file (if available) + New sig items in current build.
>>
>> Limit the modification within the dump_lockedsigs, and add two variables
>> 'self.lockedsigs_types' and 'self.lockedsigs_raw' keep old sig file.
>>
>> How to config for incremental dump:
>> ...
>> USER_CLASSES += "sstate_lockedsig"
>> SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
>> require ${SIGGEN_LOCKEDSIGS_CONFIG}
>> ...
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> I'm fine with the idea in principle. Why can't we do something like:
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index af7617e..1da282e 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -158,10 +158,14 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>                   sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>                   for k in sortedk:
>                       fn = k.rsplit(".",1)[0]
> +                    pn = self.lockedpnmap[fn]
>                       task = k.rsplit(".",1)[1]
>                       if k not in self.taskhash:
>                           continue
> -                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
> +                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.hashtask[k] == self.lockedsigs[pn][task]:
> +                        continue
> +                    sigentry = pn + ":" + task + ":" + self.taskhash[k]
> +                    f.write("    " + sigentry + " \\\n")
>                   f.write('    "\n')
>               f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
>   
>
> which is substantially simpler though?

Agree, thanks for the improvement, I will send V3 with some trivial fixes.

//Hongxu

>
> Cheers,
>
> Richard
>
>


