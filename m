Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB0774E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 03:18:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w853IKrj010149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 20:18:20 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 20:18:18 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
	<591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
	<217b44d6-0d44-8f9f-80c6-7262324d751f@xilinx.com>
	<CAJ86T=WdMgTuGVRCZHhNrGSL8YkVswP8JNXHdM2ryF7wJMxL5Q@mail.gmail.com>
	<76e69943-5fe5-b629-08ab-852745136e95@windriver.com>
	<CAJ86T=VKYgJEg9M81r3+0U6N1XgfRMM48O8DAd_R5vf207Q-ZQ@mail.gmail.com>
	<52da2a71-147d-4431-b196-911d66e04b4e@windriver.com>
	<CAJ86T=XV4GgPYHXnNEw5cO4Y1rq_5OtqHCVnw8nVc2cmwNg6nA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <689ddde0-d3a1-59a4-a20d-6d5ebd5bd7d0@windriver.com>
Date: Wed, 5 Sep 2018 11:18:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XV4GgPYHXnNEw5cO4Y1rq_5OtqHCVnw8nVc2cmwNg6nA@mail.gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.bbclass: use var-SHELL as the shebang of wrapper script
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
X-List-Received-Date: Wed, 05 Sep 2018 03:18:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月05日 10:41, Andre McCurdy wrote:
> On Tue, Sep 4, 2018 at 7:16 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 2018年09月05日 09:59, Andre McCurdy wrote:
>>> On Tue, Sep 4, 2018 at 6:02 PM, Hongxu Jia <hongxu.jia@windriver.com>
>>> wrote:
>>>> On 2018年09月05日 03:14, Andre McCurdy wrote:
>>>>> Maybe I'm missing something, but what's the advantage of using SHELL
>>>>> to run this little wrapper script rather than hardcoding /bin/sh ?
>>>>>
>>>>> Task shell scripts created by bitbake use hardcoded /bin/sh (see
>>>>> bitbake/lib/bb/build.py -> shell_trap_code())
>>>> Keep align with the devshell as the comments mentioned above
>>> Yeah, I've read the comments. I still don't really understand why.
>>>
>>>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbclass
>>>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
>>>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>>>
>>>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>>>> we assign var-SHELL with `/bin/bash', the wrapper script is still
>>>> dashism.
>>> What exactly is a dashism?
>>
>> In another word, it does not support bashism.
>>
>> Here is a case which `export -f' is bashism although
>>
>> devshell using bash, but /bin/sh -> dash
>>
>> [case]
>>
>> function foobar { echo foobar; };
>>   export -f foobar
>> bitbake -c devshell virtual/kernel
>>
>> [case]
>>
>>
>> BTW, I've sent anther patch to fix it `[OE-core] [PATCH]
>> devshell.bbclass/terminal.bbclass: add a shell check at devshell'
> OK, but run.do_terminal.xxx is a trivial wrapper which (apart from
> exporting environment variables) just contains something like:
>
>    do_terminal() {
>    exec pseudo /bin/bash
>    }
>
>    do_terminal
>
> I'm not sure what the problem is running that with /bin/sh, regardless
> of whether /bin/sh points to bash or dash?

Isn't clear? In above case, even though `exec pseudo /bin/bash',

since /bin/sh points to dash, the devshell started failed

[snip]

bitbake -c devshell virtual/kernel
Trying to run: screen -r devshell_23640
Cannot open your terminal '/dev/pts/39' - please check.

[snip]

Since `export -f' is bashism, use dash to load wrapper script failed


//Hongxu


