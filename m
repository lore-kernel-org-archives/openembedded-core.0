Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 425C371998
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:21:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2017 10:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="805121985"
Received: from cmarti7-mobl.amr.corp.intel.com (HELO [10.252.255.145])
	([10.252.255.145])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2017 10:21:07 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<5e3840aa19de9b634469c852a7c1446262ab73ab.1482363237.git.alejandro.hernandez@linux.intel.com>
	<CAMKF1soP7afwicknqti_muFYwGrMgNZE+n3rfnVQ8Hg8NeU2aw@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <2122f031-db47-1dc5-7080-1271e6fc1527@linux.intel.com>
Date: Wed, 4 Jan 2017 12:21:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soP7afwicknqti_muFYwGrMgNZE+n3rfnVQ8Hg8NeU2aw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] ksize.py: Python 3 fixes
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
X-List-Received-Date: Wed, 04 Jan 2017 18:21:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Khem,


Its an old script fro Tom, but as far as I remember it worked fine on 
python3, although thanks for checking and sending the patch!

Cheers

Alejandro


On 01/04/2017 12:39 AM, Khem Raj wrote:
> On Tue, Jan 3, 2017 at 2:30 PM, Alejandro Hernandez
> <alejandro.hernandez@linux.intel.com> wrote:
>> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>>
>> String errors and partial __cmp__ fix.
> may be fold it into previous patch.
>
>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>> ---
>>   scripts/tiny/ksize.py | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
>> index b9d2b19..ea1ca7f 100755
>> --- a/scripts/tiny/ksize.py
>> +++ b/scripts/tiny/ksize.py
>> @@ -41,7 +41,7 @@ def usage():
>>   class Sizes:
>>       def __init__(self, glob):
>>           self.title = glob
>> -        p = Popen("size -t " + glob, shell=True, stdout=PIPE, stderr=PIPE)
>> +        p = Popen("size -t " + str(glob), shell=True, stdout=PIPE, stderr=PIPE)
>>           output = p.communicate()[0].splitlines()
>>           if len(output) > 2:
>>               sizes = output[-1].split()[0:4]
>> @@ -62,18 +62,18 @@ class Report:
>>           r = Report(filename, title)
>>           path = os.path.dirname(filename)
>>
>> -        p = Popen("ls " + path + "/*.o | grep -v built-in.o",
>> +        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
>>                     shell=True, stdout=PIPE, stderr=PIPE)
>>           glob = ' '.join(p.communicate()[0].splitlines())
>> -        oreport = Report(glob, path + "/*.o")
>> -        oreport.sizes.title = path + "/*.o"
>> +        oreport = Report(glob, str(path) + "/*.o")
>> +        oreport.sizes.title = str(path) + "/*.o"
>>           r.parts.append(oreport)
>>
>>           if subglob:
>>               p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE)
>>               for f in p.communicate()[0].splitlines():
>>                   path = os.path.dirname(f)
>> -                r.parts.append(Report.create(f, path, path + "/*/built-in.o"))
>> +                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
>>               r.parts.sort(reverse=True)
>>
>>           for b in r.parts:
>> @@ -116,6 +116,13 @@ class Report:
>>                  self.deltas["data"], self.deltas["bss"]))
>>           print("\n")
>>
>> +    def __lt__(this, that):
>> +        if that is None:
>> +            return 1
>> +        if not isinstance(that, Report):
>> +            raise TypeError
>> +        return this.sizes.total < that.sizes.total
>> +
>>       def __cmp__(this, that):
>>           if that is None:
>>               return 1
>> --
>> 2.6.6
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


