Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SiGu2-00050o-Q9
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 05:20:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5N39u9G009608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jun 2012 20:09:56 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 22 Jun 2012 20:09:55 -0700
Message-ID: <4FE5337E.2030400@windriver.com>
Date: Sat, 23 Jun 2012 11:09:50 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4FDEF21A.5020004@windriver.com> <4FDF69BC.6080808@windriver.com>
	<4FE168BD.9000906@windriver.com> <4FE341CF.5060406@linux.intel.com>
In-Reply-To: <4FE341CF.5060406@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc detected *** groupadd: malloc(): memory corruption
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
X-List-Received-Date: Sat, 23 Jun 2012 03:20:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/21/2012 11:46 PM, Saul Wold wrote:
> On 06/19/2012 11:07 PM, Robert Yang wrote:
>>
>> Thanks Mark, the rpm.real also has the same problem when the length of
>> tmpdir
>> is 210, it seems that this is because of the glibc.
>>
>>
>> And also other problems found:
>> When use PACKAGE_CLASSES = "package_deb", and the length of tmpdir is 177,
>> the error is:
>>
>> /too/long/path/totmp/sysroots/x86_64-linux/usr/bin/dpkg-scanpackages:
>> bad interpreter: No such file or directory
>>
>> The interpreter is perl, and it does exist, it seems that we should limit
>> the length of tmpdir to a smaller value then 177 rather than fix these
>> strange
>> problems. I will go on working on it.
>>
> Robert,
>
> A path length of 175 or short is not ideal, we should file bugs against these

Thanks Saul, the bug is:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2639

I'd like to try to fix it next week, I will send a patch to show the WARNING
as you suggested if I can't fix it, but the value maybe shorter than 175,
I've realised that even 175 is a very short value, so this should be fixed:-)

// Robert

> issues. We should also add the sanity check you suggested as a WARNING for
> lenghts over 175. That should not be the final solution though, we need to
> address the issues and get them fixed up stream.
>
> The groupadd one sounds like it might be a buffer overflow issue which could
> have larger ramifications
>
> Thanks
>
> Sau!
>
>> // Robert
>>
>> On 06/19/2012 01:47 AM, Mark Hatle wrote:
>>> We're not away of any size limitations within pseudo, other then
>>> PATH_MAX which
>>> is typically 4096...
>>>
>>> --Mark
>>>
>>> On 6/18/12 4:17 AM, Robert Yang wrote:
>>>>
>>>> Hi Experts:
>>>>
>>>> I've met a strange issue, when set the length of builddir to
>>>> 266 (Why I did this is that I need to know how long the tmpdir
>>>> that oe-core can support):
>>>>
>>>> NOTE: package dbus-1.4.20-r3.0: task do_install: Started
>>>> *** glibc detected *** groupadd: malloc(): memory corruption:
>>>> 0x000000000101da70 ***
>>>> *** glibc detected *** groupadd: malloc(): memory corruption:
>>>> 0x000000000101da70 ***
>>>>
>>>> Then the build would hang, this is caused by the command:
>>>>
>>>> PSEUDO_PREFIX=/too/long/path/tmp/sysroots/x86_64-linux/usr
>>>> PSEUDO_LOCALSTATEDIR=... PSEUDO_PASSWD=...
>>>> PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0 PSEUDO_LOCALSTATEDIR
>>>> ... /too/long/path/to/tmp/sysroots/x86_64-linux/usr/bin/pseudo
>>>> groupadd --root /too/long/path/to/tmp/sysroots/qemux86 -r netdev -f
>>>>
>>>> 1) I had looked into the code of groupadd, and found that this would
>>>> happen when it used the glibc function which needs malloc(for example,
>>>> the access()), so it seemed this was caused by the glibc or pseudo,
>>>> but I didn't know why it only happened to groupadd/useradd.
>>>>
>>>> 2) I had tried not to use pseudo, it worked well:
>>>>
>>>> sudo groupadd --root /too/long/path/to/tmp/sysroots/qemux86 -r netdev -f
>>>>
>>>> From this, it seemed that the glibc was ok
>>>>
>>>> 3) I had tried to write a small piece of code which used the
>>>> access(), and
>>>> used pseudo to run it, it worked well:
>>>>
>>>> /too/long/path/for/pseudo/settings/and/then/run/pseudo my_app
>>>>
>>>> From this, it seemed that both pseudo and glibc were OK.
>>>>
>>>> These 3 steps make me puzzle, maybe we can think that the tmpdir can not
>>>> be too long, and limit it to a proper length, please see this:
>>>>
>>>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022112.html
>>>>
>>>>
>>>> BTW. the "argument list too long" error has been fixed.
>>>>
>>>> Any suggestion is appreciated.
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
>


