Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCEA471480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 06:26:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8H6QmCk016926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 23:26:50 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Sep 2014 23:26:48 -0700
Message-ID: <5419299C.9070700@windriver.com>
Date: Wed, 17 Sep 2014 14:26:36 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1410446513.git.hongxu.jia@windriver.com>	
	<f7654c9c712e2a736e7d177186e16b6a261ca7fc.1410446513.git.hongxu.jia@windriver.com>
	<1410886651.14624.62.camel@ted>
In-Reply-To: <1410886651.14624.62.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] sstatesig: incremental dump lockedsigs
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
X-List-Received-Date: Wed, 17 Sep 2014 06:26:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2014 12:57 AM, Richard Purdie wrote:
> On Thu, 2014-09-11 at 23:04 +0800, Hongxu Jia wrote:
>> While including an existed lockedsigs file to build from
>> locked sstate-cache, and we want to incremental build the
>> locked sstate-cache. Config with:
>> ...
>> SIGGEN_DUMP_LOCKEDSIGS = '1'
>> SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
>> require ${SIGGEN_LOCKEDSIGS_CONFIG}
>> ...
>> So we support to dump lockedsigs file incrementally
>>
>> Since we improve to handle locking of multiple machines and
>> add a new SIGGEN_LOCKEDSIGS_TYPES variable which lists the
>> package architectures to load in. We should add package
>> architectures as type to self.lockedsigs to reflect that.
>> Such as:
>> {recipename:{task:{hash1}}} --> {type:{recipename:{task:{hash1}}}}
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/sstatesig.py | 67 ++++++++++++++++++++++++++++++++----------------
>>   1 file changed, 45 insertions(+), 22 deletions(-)
> I've stared long and hard at this patch and I simply don't understand
> why we need to complicate the structure of the lockedsigs variable.

Ok, I will try to simplify and not complicate the structure of the
lockedsigs variable.

> I understand wanting to generate an incremental sig file, that much is
> fine, I just don't like the other seemingly unrelated change.
> Regardless, they should be split into separate patches.
>
> Can you explain more about what you're trying to do?

I want to save self.lockedsigs to the new sig file.

The idea of incremental sig is:

New sig file = Old sig file (if available) + New sig items in current build.

The self.lockedsigs contains the old locked-sigs.inc but missing 'type' 
(machine),
that's why I complicate it.

I will limit the modification within the dump_lockedsigs in V2,
and I have to add two variables 'self.lockedsigs_types' and
'self.lockedsigs_raw' keep old sig file.
...
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -93,6 +93,10 @@ class 
SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
          self.lockedhashfn = {}
          self.machine = data.getVar("MACHINE", True)
          self.mismatch_msgs = []
+        self.lockedsigs_types = (data.getVar("SIGGEN_LOCKEDSIGS_TYPES", 
True) or "").split()
+        self.lockedsigs_raw = {}
+        for t in self.lockedsigs_types:
+            self.lockedsigs_raw[t] = 
(data.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
...

V2 incoming

//Hongxu



> Cheers,
>
> Richard
>
>
>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index c9edd80..8b491a6 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -65,12 +65,15 @@ def sstate_lockedsigs(d):
>>       sigs = {}
>>       types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
>>       for t in types:
>> +        if t not in sigs:
>> +            sigs[t] = {}
>> +
>>           lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
>>           for ls in lockedsigs:
>>               pn, task, h = ls.split(":", 2)
>> -            if pn not in sigs:
>> -                sigs[pn] = {}
>> -            sigs[pn][task] = h
>> +            if pn not in sigs[t]:
>> +                sigs[t][pn] = {}
>> +            sigs[t][pn][task] = h
>>       return sigs
>>   
>>   class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
>> @@ -115,10 +118,14 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           recipename = dataCache.pkg_fn[fn]
>>           self.lockedpnmap[fn] = recipename
>>           self.lockedhashfn[fn] = dataCache.hashfn[fn]
>> -        if recipename in self.lockedsigs:
>> -            if task in self.lockedsigs[recipename]:
>> +
>> +        t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
>> +        if t not in self.lockedsigs:
>> +            return h
>> +        if recipename in self.lockedsigs[t]:
>> +            if task in self.lockedsigs[t][recipename]:
>>                   k = fn + "." + task
>> -                h_locked = self.lockedsigs[recipename][task]
>> +                h_locked = self.lockedsigs[t][recipename][task]
>>                   self.lockedhashes[k] = h_locked
>>                   self.taskhash[k] = h_locked
>>                   #bb.warn("Using %s %s %s" % (recipename, task, h))
>> @@ -137,6 +144,19 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>               return
>>           super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
>>   
>> +    def update_lockedsigs(self, type, recipename, task, hash):
>> +        if type not in self.lockedsigs:
>> +            self.lockedsigs[type] = {}
>> +
>> +        if recipename not in self.lockedsigs[type]:
>> +            self.lockedsigs[type][recipename] = {}
>> +
>> +        if task not in self.lockedsigs[type][recipename]:
>> +            self.lockedsigs[type][recipename][task] = hash
>> +        elif hash != self.lockedsigs[type][recipename][task]:
>> +            bb.warn('Conflict %s %s %s (new %s, old %s)' %
>> +                    (type, recipename, task, hash, self.lockedsigs[type][recipename][task]))
>> +
>>       def dump_lockedsigs(self, where_to_dump=None):
>>           if not where_to_dump:
>>               where_to_dump = os.getcwd() + "/locked-sigs.inc"
>> @@ -146,30 +166,33 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           for k in self.runtaskdeps:
>>               fn = k.rsplit(".",1)[0]
>>               t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
>> -            if t not in types:
>> -                types[t] = []
>> -            types[t].append(k)
>> +            recipename = self.lockedpnmap[fn]
>> +            task = k.rsplit(".",1)[1]
>> +            hash = self.taskhash[k]
>> +            self.update_lockedsigs(t, recipename, task, hash)
>>   
>>           with open(where_to_dump, "w") as f:
>> -            for t in types:
>> -                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
>> -                types[t].sort()
>> -                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>> -                for k in sortedk:
>> -                    fn = k.rsplit(".",1)[0]
>> -                    task = k.rsplit(".",1)[1]
>> -                    if k not in self.taskhash:
>> -                        continue
>> -                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
>> +            for type in sorted(self.lockedsigs):
>> +                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % type)
>> +
>> +                for recipename in sorted(self.lockedsigs[type]):
>> +                    for task in sorted(self.lockedsigs[type][recipename]):
>> +                        hash = self.lockedsigs[type][recipename][task]
>> +                        f.write("    " + recipename + ":" + task + ":" + hash + " \\\n")
>>                   f.write('    "\n')
>> -            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
>> +
>> +            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(self.lockedsigs.keys())))
>>   
>>       def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
>>           checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
>>           for task in range(len(sq_fn)):
>>               if task not in ret:
>> -                for pn in self.lockedsigs:
>> -                    if sq_hash[task] in self.lockedsigs[pn].itervalues():
>> +                t = sq_hashfn[task].split(" ")[1].split(":")[5]
>> +                if t not in self.lockedsigs:
>> +                    continue
>> +
>> +                for pn in self.lockedsigs[t]:
>> +                    if sq_hash[task] in self.lockedsigs[t][pn].itervalues():
>>                           self.checkmsgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
>>                                                  % (pn, sq_task[task], sq_hash[task]))
>>   
>


