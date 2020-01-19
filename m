Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39CDD7FCA2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 14:37:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00JEbfe6011674
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 19 Jan 2020 06:37:41 -0800 (PST)
Received: from [128.224.21.233] (128.224.21.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 19 Jan 2020 06:37:41 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20200116201933.29628-1-Trevor.Gamblin@windriver.com>
	<0f474dc25b7fb6861101254a2c4fd0301f28e167.camel@linuxfoundation.org>
	<26c295370010ee96d0265b0be5a716aa6bc166ce.camel@linuxfoundation.org>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <1de3add7-255c-5c22-2fa3-abef9894ec22@windriver.com>
Date: Sun, 19 Jan 2020 09:37:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <26c295370010ee96d0265b0be5a716aa6bc166ce.camel@linuxfoundation.org>
Subject: Re: [PATCH] logrotate.py: improve oeqa test implementation
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
X-List-Received-Date: Sun, 19 Jan 2020 14:37:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/19/20 7:15 AM, Richard Purdie wrote:

> On Sat, 2020-01-18 at 23:16 +0000, Richard Purdie wrote:
>> On Thu, 2020-01-16 at 15:19 -0500, Trevor Gamblin wrote:
>>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>>
>>> See bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=13632
>>>
>>> Autobuilder tests occasionally fail, reporting that a new logfile
>>> could not be created. While this failure did occur multiple times,
>>> it
>>> could not be manually reproduced. However, there are issues with
>>> the
>>> implementation of the logrotate.py script that can be fixed. These
>>> changes will help make the failures clearer, should they continue
>>> to
>>> occur.
>>>
>>> Previously, the test_2_logrotate test would, after running the
>>> logrotate tool, use "ls -al $HOME/logrotate_dir | wc -l" to count
>>> the number of files in the rotation directory and determine if the
>>> rotation was successful. The test to see if there are at least
>>> three
>>> files is problematic, because depending on the version of ls used,
>>> it
>>> may report the target value of 3 even when there are only hidden
>>> files
>>> in the directory, potentially reporting a pass for the test when it
>>> should actually fail. An example with coreutils:
>>>
>>> root@qemux86-64:~# ls -al emptydir/
>>> total 2
>>> drwxr-xr-x 2 root root 1024 Jan 14 19:50 .
>>> drwx------ 3 root root 1024 Jan 14 19:50 ..
>>> root@qemux86-64:~#
>>>
>>> Where "total" is the number of blocks used. Compare with busybox
>>> ls:
>>>
>>> root@qemux86-64:~# ls -al emptydir/
>>> drwxr-xr-x    2 root     root          1024 Jan 14 19:54 .
>>> drwx------    3 root     root          1024 Jan 14 19:54 ..
>>> root@qemux86-64:~#
>>>
>>> Instead of using ls to verify that a certain number of files exists
>>> in $HOME/logrotate_dir, the tests have been changed to rotate two
>>> specific logs: the log for wtmp and a new logrotate_testfile
>>> created
>>> during the second test. Both tests check that the logs are
>>> correctly
>>> rotated into $HOME/logrotate_dir by using find and grep on the
>>> expected filename (e.g. "wtmp" when rotated becomes "wtmp.1", so we
>>> check to see that wtmp.1 is present in $HOME/logrotate_dir). In
>>> addition, should the test fail, the directory listing is included
>>> in
>>> the log to aid debugging.
>>>
>>> Finally, note that while the autobuilder failures that this patch
>>> addresses were only seen during core-image-full-cmdline tests,
>>> these
>>> changes were successfully tested on core-image-minimal and
>>> core-image-sato with the manual addition of logrotate and openssh-
>>> sshd
>>> to the images.
>>>
>>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> Thanks for this, I haven't looked in detail but test builds came back
>> with:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1464
> Also:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1467
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1471
> (but there was a pass for the above target too:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1468)
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1464
> (interesting 1c and 2c failed)
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/216
> (may be related, systemd logrotate failure)
This is promising. I'll dig into it tonight/tomorrow.
>
> Cheers,
>
> Richard
>
>

