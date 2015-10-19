Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E107077129
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:19:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 07:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="814396443"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.157])
	([10.219.5.157])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2015 07:19:12 -0700
Message-ID: <5624FC5E.2040303@linux.intel.com>
Date: Mon, 19 Oct 2015 09:21:18 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1c795f9672bcf9ffe43d311177019f10ce997d3a.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<722633449.5WlMM4sgsE@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <722633449.5WlMM4sgsE@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oeqa/utils/ftools: Checks before appending/reading files
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
X-List-Received-Date: Mon, 19 Oct 2015 14:19:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 10/19/2015 08:41 AM, Paul Eggleton wrote:
> Hi Leo,
>
> On Monday 19 October 2015 05:24:44 leonardo.sandoval.gonzalez@linux.intel.com
> wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Before trying to append/read a file, check if file exists.
>>
>> Signed-off-by: Leonardo Sandoval
>> <leonardo.sandoval.gonzalez@linux.intel.com> ---
>>   meta/lib/oeqa/utils/ftools.py | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
>> index 64ebe3d..70a55b8 100644
>> --- a/meta/lib/oeqa/utils/ftools.py
>> +++ b/meta/lib/oeqa/utils/ftools.py
>> @@ -8,20 +8,24 @@ def write_file(path, data):
>>
>>   def append_file(path, data):
>>       wdata = data.rstrip() + "\n"
>> -    with open(path, "a") as f:
>> +    if os.path.isfile(path):
>> +        with open(path, "a") as f:
>>               f.write(wdata)
>
> Hang on - opening a nonexistent file with mode 'a' is perfectly fine, it'll just
> get created - why do we need this check?

You are right, there is no need.

>
>
>>   def read_file(path):
>>       data = None
>> -    with open(path) as f:
>> -        data = f.read()
>> +    if os.path.isfile(path):
>> +        with open(path) as f:
>> +            data = f.read()
>>       return data
>>
>>   def remove_from_file(path, data):
>> -    lines = read_file(path).splitlines()
>> -    rmdata = data.strip().splitlines()
>> -    for l in rmdata:
>> -        for c in range(0, lines.count(l)):
>> -            i = lines.index(l)
>> -            del(lines[i])
>> -    write_file(path, "\n".join(lines))
>> +    rawdata = read_file(path)
>> +    if rawdata:
>> +        lines = rawdata.splitlines()
>> +        rmdata = data.strip().splitlines()
>> +        for l in rmdata:
>> +            for c in range(0, lines.count(l)):
>> +                i = lines.index(l)
>> +                del(lines[i])
>> +        write_file(path, "\n".join(lines))
>
> Checking a file exists before opening it isn't good practice. It's much better
> to try opening it and if the open fails with IOError of errno.ENOENT then
> ignore it (or rather, if e.errno  != errno.ENOENT then re-raise the
 > exception).

After applying patch into master

http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111704.html

I saw this error:

Traceback (most recent call last):
   File 
"/srv/ab/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/base.py", 
line 110, in remove_config
     ftools.remove_from_file(self.testinc_path, data)
   File 
"/srv/ab/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/ftools.py", 
line 21, in remove_from_file
     lines = read_file(path).splitlines()
   File 
"/srv/ab/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/ftools.py", 
line 16, in read_file
     with open(path) as f:
IOError: [Errno 2] No such file or directory: 
'/srv/ab/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/conf/selftest.inc'


That is why I created the latter check. I will change it to use IOError, 
safer and cleaner. Sending V2 today.

Thanks for your comments.

>
> Cheers,
> Paul
>

