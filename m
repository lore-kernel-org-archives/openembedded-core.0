Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84ED978F73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 05:52:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w835qT3Y006810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Sep 2018 22:52:29 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 2 Sep 2018 22:52:28 -0700
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <1535100844-4514-1-git-send-email-hongxu.jia@windriver.com>
	<83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <591d25eb-bb99-746f-37ac-6769db4228b8@windriver.com>
Date: Mon, 3 Sep 2018 13:52:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <83f1c6c3-195c-b6c6-979c-3d58db4f9cb9@xilinx.com>
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
X-List-Received-Date: Mon, 03 Sep 2018 05:52:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月01日 08:14, Alejandro Enedino Hernandez Samaniego wrote:
> Hey Hongxu,
>
>
> On 08/24/2018 01:54 AM, Hongxu Jia wrote:
>> The devshell.bbclass set var-SHELL to var-DEVSHELL, and terminal.bbclass
>> initial var-SHELL with `bash'. Keep sync with it, use var-SHELL rather
>> than hardcoded `/bin/sh' as the shebang of wrapper script.
>>
>> On Ubuntu host, default shell is dash (/bin/sh -> dash), even though
>> we assign var-SHELL with `/bin/bash', the wrapper script is still 
>> dashism.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/terminal.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/terminal.bbclass 
>> b/meta/classes/terminal.bbclass
>> index a27e10c..73e765d 100644
>> --- a/meta/classes/terminal.bbclass
>> +++ b/meta/classes/terminal.bbclass
>> @@ -25,7 +25,8 @@ def emit_terminal_func(command, envdata, d):
>>       bb.utils.mkdirhier(os.path.dirname(runfile))
>>         with open(runfile, 'w') as script:
>> -        script.write('#!/bin/sh -e\n')
>> +        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
>> +        script.write('set -e\n')
> This is causing a bug on several systems, I believe that it is because 
> the way our systems are set up,
> basically, our running shell isn't necessarily $SHELL, so it is 
> causing the process to exit immediately,
> anything thats using this class is affected, devshell, menuconfig, etc.
>
>
> $ echo $SHELL
> /bin/csh
>
> $ echo $0
> /bin/bash
>

The csh does not support `export', in you case, you should correct 
var-SHELL to align with $0,

Such as:
$ usermod <username> -s $0



But the script should be more robust, it should
work well in this situation. I will try to fix it.

//Hongxu

>
>
> Sadly we are unable to set $SHELL correctly.
>
> I wonder if there is another way of doing this that wouldn't cause 
> this behavior.
>
> Cheers,
>
> Alejandro
>
>
>>           bb.data.emit_func(cmd_func, script, envdata)
>>           script.write(cmd_func)
>>           script.write("\n")
>


