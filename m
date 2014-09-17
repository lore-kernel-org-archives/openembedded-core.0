Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E09736BBAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 02:46:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H2kQrf023383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 19:46:26 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Sep 2014 19:46:25 -0700
Message-ID: <5418F5F6.7040809@windriver.com>
Date: Wed, 17 Sep 2014 10:46:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1410446513.git.hongxu.jia@windriver.com>	
	<72ad01dfa444095899409c957c0f8574da6f8822.1410446513.git.hongxu.jia@windriver.com>
	<1410886837.14624.65.camel@ted>
In-Reply-To: <1410886837.14624.65.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] sstate/sstatesig: optimize the support for locked down sstate cache usage
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
X-List-Received-Date: Wed, 17 Sep 2014 02:46:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2014 01:00 AM, Richard Purdie wrote:
> On Thu, 2014-09-11 at 23:04 +0800, Hongxu Jia wrote:
>> This fix is based on Richard Purdie's 'sstatesig: Improve to handle
>> locking of multiple machines' which located in master-next.
>>
>> Add code in the sstate hash validation code to ensure it really did
>> install these from sstate since if it didn't should to warn/abort
>> the build. The judgment condition is:
>> 1) If a build is replaced by locked sstate-cache, it will triger a
>>     warn/error;
>> 2) If objects are not used from the locked cache, it will triger a
>>     warn/error;
>> 3) Use SIGGEN_LOCKEDSIGS_CHECK_LEVEL variable controls whether this
>>     is just a warning or a fatal error or nothing to report.
>>
>> Use SIGGEN_DUMP_LOCKEDSIGS variable controls whether to dump
>> lockedsigs. Add a event handler at 'bb.event.BuildCompleted', so
>> while the locked sstate-cache was created, it will dump the lockedsigs
>> files rather than manually invoking 'bitbake -S **' again.
>>
>> Use SIGGEN_LOCKEDSIGS_CONFIG variable controls where to dump the
>> lockedsigs file, the default is placed into ${SSTATE_DIR}/locked-sigs.inc.
>>
>> [YOCTO #6639]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/sstate.bbclass | 14 ++++++++++++++
>>   meta/lib/oe/sstatesig.py    | 43 +++++++++++++++++++++++++++----------------
>>   2 files changed, 41 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index 0cb5235..7a6a107 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -802,3 +802,17 @@ python sstate_eventhandler() {
>>           bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
>>   }
>>   
>> +SIGGEN_LOCKEDSIGS_CONFIG ?= "${SSTATE_DIR}/locked-sigs.inc"
>> +addhandler sstate_dump_lockedsig
>> +sstate_dump_lockedsig[eventmask] = "bb.event.BuildCompleted"
>> +python sstate_dump_lockedsig() {
>> +    d = e.data
>> +    if d.getVar('SIGGEN_DUMP_LOCKEDSIGS', True) == '1':
>> +        if e.getFailures():
>> +            return
>> +
>> +        if hasattr(bb.parse.siggen, "dump_lockedsigs"):
>> +            lockedsigs = d.getVar('SIGGEN_LOCKEDSIGS_CONFIG', True)
>> +            bb.parse.siggen.dump_lockedsigs(lockedsigs)
>> +}
>
> Firstly, I think the change to sstate.bbclass should be as a separate
> patch and I'm not sure I like that patch as it stands. Should this
> perhaps be as a separate class?

It provides a method to dump lockedsigs at recipe building time,
so no need to invoke 'bitbake -S **' again.

And I will name a new class 'sstate_lockedsig' and move the
event handler to it.

>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>> index add2619..c9edd80 100644
>> --- a/meta/lib/oe/sstatesig.py
>> +++ b/meta/lib/oe/sstatesig.py
>> @@ -92,6 +92,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           self.lockedpnmap = {}
>>           self.lockedhashfn = {}
>>           self.machine = data.getVar("MACHINE", True)
>> +        self.checkmsgs = []
> I think this should be called "mismatch_msgs" instead.

Agree

>>           pass
>>       def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
>>           return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
>> @@ -109,18 +110,24 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>           return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
>>   
>>       def get_taskhash(self, fn, task, deps, dataCache):
>> +        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
>> +
>>           recipename = dataCache.pkg_fn[fn]
>>           self.lockedpnmap[fn] = recipename
>>           self.lockedhashfn[fn] = dataCache.hashfn[fn]
>>           if recipename in self.lockedsigs:
>>               if task in self.lockedsigs[recipename]:
>>                   k = fn + "." + task
>> -                h = self.lockedsigs[recipename][task]
>> -                self.lockedhashes[k] = h
>> -                self.taskhash[k] = h
>> +                h_locked = self.lockedsigs[recipename][task]
>> +                self.lockedhashes[k] = h_locked
>> +                self.taskhash[k] = h_locked
>>                   #bb.warn("Using %s %s %s" % (recipename, task, h))
>> -                return h
>> -        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
>> +
>> +                if h != h_locked:
>> +                    self.checkmsgs.append('The %s:%s sig (%s) changed, use locked sig %s to instead'
>> +                                          % (recipename, task, h, h_locked))
>> +
>> +                return h_locked
>>           #bb.warn("%s %s %s" % (recipename, task, h))
>>           return h
>>   
>> @@ -130,8 +137,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>               return
>>           super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
>>   
>> -    def dump_lockedsigs(self):
>> -        bb.plain("Writing locked sigs to " + os.getcwd() + "/locked-sigs.inc")
>> +    def dump_lockedsigs(self, where_to_dump=None):
> where_to_dump -> sigfile

Agree

>> +        if not where_to_dump:
>> +            where_to_dump = os.getcwd() + "/locked-sigs.inc"
>> +
>> +        bb.plain("Writing locked sigs to %s" % where_to_dump)
>>           types = {}
>>           for k in self.runtaskdeps:
>>               fn = k.rsplit(".",1)[0]
>> @@ -140,11 +150,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>                   types[t] = []
>>               types[t].append(k)
>>   
>> -        with open("locked-sigs.inc", "w") as f:
>> +        with open(where_to_dump, "w") as f:
>>               for t in types:
>>                   f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
>>                   types[t].sort()
>> -                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>> +                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
>>                   for k in sortedk:
>>                       fn = k.rsplit(".",1)[0]
>>                       task = k.rsplit(".",1)[1]
>> @@ -155,17 +165,18 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>               f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
>>   
>>       def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
>> -        enforce = (d.getVar("SIGGEN_ENFORCE_LOCKEDSIGS", True) or "1") == "1"
>> -        msgs = []
>> +        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
> Perhaps this should default to error?

Agree, I will initial it with 'error' in class 'sstate'

>>           for task in range(len(sq_fn)):
>>               if task not in ret:
>>                   for pn in self.lockedsigs:
>>                       if sq_hash[task] in self.lockedsigs[pn].itervalues():
>> -                        msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?" % (pn, sq_task[task], sq_hash[task]))
>> -        if msgs and enforce:
>> -            bb.fatal("\n".join(msgs))
>> -        elif msgs:
>> -            bb.warn("\n".join(msgs))
>> +                        self.checkmsgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
>> +                                               % (pn, sq_task[task], sq_hash[task]))
>> +
>> +        if self.checkmsgs and checklevel == 'warn':
>> +            bb.warn("\n".join(self.checkmsgs))
>> +        elif self.checkmsgs and checklevel == 'error':
>> +            bb.fatal("\n".join(self.checkmsgs))
>>   
>>
>>   # Insert these classes into siggen's namespace so it can see and select them
>
> I have an updated version of this patch at
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=17c255cd72810616139e36ae8ad30cc4daefe9d1
> if you're ok with the changes although I do need to update the commit
> message.

Got it, I will rebase it according the latest changes

//Hongxu

>
> Cheers,
>
> Richard
>


