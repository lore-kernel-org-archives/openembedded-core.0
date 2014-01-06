Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7CADC6B717
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 22:10:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 14:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,614,1384329600"; d="scan'208";a="462529943"
Received: from unknown (HELO [10.255.12.53]) ([10.255.12.53])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 14:10:05 -0800
Message-ID: <52CB29BA.5050404@linux.intel.com>
Date: Mon, 06 Jan 2014 14:10:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
In-Reply-To: <CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
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
X-List-Received-Date: Mon, 06 Jan 2014 22:10:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/2013 06:18 AM, Laszlo Papp wrote:
> Ping?
>
> Alternatively, the system could also have an option for further
> fine-tuning what to do with git patches
>
> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> It is better to use "git am" when possible to preserve the commit messages and
>> the mail format in general for patches when those are present. A typical use
>> case is when developers would like to keep the changes on top of the latest
>> upstream, and they may occasionally need to rebase. This is not possible with
>> "git diff" and "diff" generated patches.
>>
>> Since this is not always the case, the fallback would be the "git apply"
>> operation which is currently available.
>>
Looking at this, is it possible to detect a git patch and only then use 
git am?  Since most of the patches carried in oe-core and other layers 
the 'git am' will typically fail and increase the build time since it 
will have to re-run the git apply, we don't want to had more forking and 
work in the main hot path.

I am not the expert in this, neither is RP, so maybe Chris can comment 
further.

Thanks
	Sau!


>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>> ---
>>   meta/lib/oe/patch.py | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
>> index 59abd0a..b085c9d 100644
>> --- a/meta/lib/oe/patch.py
>> +++ b/meta/lib/oe/patch.py
>> @@ -203,17 +203,23 @@ class GitApplyTree(PatchTree):
>>           PatchTree.__init__(self, dir, d)
>>
>>       def _applypatch(self, patch, force = False, reverse = False, run = True):
>> -        shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
>> +        def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
>> +            if reverse:
>> +                shellcmd.append('-R')
>>
>> -        if reverse:
>> -            shellcmd.append('-R')
>> +            shellcmd.append(patch['file'])
>>
>> -        shellcmd.append(patch['file'])
>> +            if not run:
>> +                return "sh" + "-c" + " ".join(shellcmd)
>>
>> -        if not run:
>> -            return "sh" + "-c" + " ".join(shellcmd)
>> +            return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
>>
>> -        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
>> +        try:
>> +            shellcmd = ["git", "--work-tree=.", "am", "-3", "-p%s" % patch['strippath']]
>> +            return _applypatchhelper(shellcmd, patch, force, reverse, run)
>> +        except CmdError:
>> +            shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
>> +            return _applypatchhelper(shellcmd, patch, force, reverse, run)
>>
>>
>>   class QuiltTree(PatchSet):
>> --
>> 1.8.5.1
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

