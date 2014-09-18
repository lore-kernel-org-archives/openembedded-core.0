Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E29BB601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8IDueUt027481
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 06:56:40 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 06:56:39 -0700
Message-ID: <541AE496.3010502@windriver.com>
Date: Thu, 18 Sep 2014 08:56:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Hongxu Jia
	<hongxu.jia@windriver.com>
References: <cover.1411023982.git.hongxu.jia@windriver.com>	
	<afb9eb87d6ebebd33c1f6febf8f37111db63a614.1411023982.git.hongxu.jia@windriver.com>
	<1411048067.4736.8.camel@ted>
In-Reply-To: <1411048067.4736.8.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] sstatesig: Only dump incremental locked signatures
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
X-List-Received-Date: Thu, 18 Sep 2014 13:56:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/14, 8:47 AM, Richard Purdie wrote:
> On Thu, 2014-09-18 at 15:23 +0800, Hongxu Jia wrote:
>> The idea of incremental sig is:
>>
>> New sig file = Old sig file (if available) + New sig items in current build.
>>
>> The condition of incremental locked signature dump is an existed locked sig
>> file is required and it is also the dump sig file.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/sstatesig.py | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index af7617e..56fd953 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -151,19 +151,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>                   types[t] = []
>>               types[t].append(k)
>>
>> -        with open(sigfile, "w") as f:
>> +        with open(sigfile, "a") as f:
>>               for t in types:
>> -                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
>> +                f.write('SIGGEN_LOCKEDSIGS_%s += "\\\n' % t)
>>                   types[t].sort()
>>                   sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>>                   for k in sortedk:
>>                       fn = k.rsplit(".",1)[0]
>> +                    pn = self.lockedpnmap[fn]
>>                       task = k.rsplit(".",1)[1]
>>                       if k not in self.taskhash:
>>                           continue
>> -                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
>> +                    if pn in self.lockedsigs and task in self.lockedsigs[pn] and self.taskhash[k] == self.lockedsigs[pn][task]:
>> +                        continue
>> +                    sigentry = pn + ":" + task + ":" + self.taskhash[k]
>> +                    f.write("    " + sigentry + " \\\n")
>>                   f.write('    "\n')
>> -            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
>> +            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s += "%s"\n' % (self.machine, " ".join(types.keys())))
>>
>>       def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
>>           checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
>
> I'm afraid I'm starting to feel very strongly this is not a direction we
> should move in. Having the ability to write out a .inc file containing
> on a delta is one thing, writing out a file for automatic inclusion and
> trying to maintain that file is not something I feel comfortable with.
>
> I think that at some point there needs to be external tooling handling
> the inclusion and updating of this file and that the sigs code is not
> the place for this.
>
> For example, consider the case where you switch machines and want to
> share an include file between these machines. With the changes proposed
> in this patch series it will simply overwrite the file and remove the
> entries for the other machine.
>
> We could keep trying to patch up this code to cover every combination
> and eventuality but in the end, I believe the maintenance of this file
> should be something external, the sigs code should only be concerned
> with the generation of the core entries.

This is why I was originally advocating a whitelist/blacklist approach with the 
read-only [or warn/error] sstate-cache approach.  It really is different then 
the locked signature.

The users want to use what they have that match the generated hashes, or get a 
warning/error -- unless the item is whitelisted.

They only need to manage a small list of the "things they changed" to support 
the white listing, and no complicated hashes are needed.

--Mark

> Cheers,
>
> Richard
>
>
>
>


