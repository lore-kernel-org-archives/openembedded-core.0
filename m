Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCAD606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 09:48:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9D9m8vl021409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Oct 2017 02:48:09 -0700 (PDT)
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 13 Oct 2017 02:48:07 -0700
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>,
	<peter.kjellerstedt@axis.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<34c855b7-3605-9c43-4a63-fdbdd39c2955@topic.nl>
	<411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d2c9a503-a8ff-34f8-2d0c-ccea52e4ee7d@windriver.com>
Date: Fri, 13 Oct 2017 17:53:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
X-Originating-IP: [128.224.163.189]
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Fri, 13 Oct 2017 09:48:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2017 09:56 PM, Mike Looijmans wrote:
> On 18-09-17 15:24, Mike Looijmans wrote:
>> On 18-09-17 15:08, Burton, Ross wrote:
>>> On 18 September 2017 at 12:31, Mike Looijmans 
>>> <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>> wrote:
>>>
>>>         This is basically the same change as I first sent a patch 
>>> for in
>>>         April, and
>>>         last pinged this Friday... The only real difference is that 
>>> this one
>>>         misses
>>>         passing error output from resize to /dev/null (which it 
>>> should do to
>>>         handle
>>>         the case where tty exists, but resize does not).
>>>
>>>
>>>     Yeah, indeed.
>>>
>>>
>>> Apologies for missing that patch!
>>>
>>>     Other problem is that "resize" outputs shell script on stdout to be
>>>     executed, so the proper "total" invokation would be:
>>>
>>>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
>>>
>>>     The "eval" part is missing in your version...
>>>
>>>
>>> Who is going to submit the One True patch with all the fixes in?  I 
>>> promise to merge it.
>>
>> I'll send the one ring, eh, patch, in a few minutes. I'll merge the 
>> two into a single as well.
>
> On second thought, just use Peter's patch "as is".
>
> I've been experimenting with the "eval" part and it doesn't behave 
> well. Tends to confuse minicom, create garbage, and in particular when 
> run from "profile", it seems to result in counterproductive COLUMNS=0 
> and LINES=0.
>
> I'm actually wondering why the call to "resize" is being done at all. 
> Just calling "resize" has no effect, since it outputs the results on 
> stdout as shell script, and that is being discarded. Looking at the 
> commit that introduced it:
>

Looking at the codes in busybox (console-tools/resize.c), I can see that 
tcsetattr is actually called.
The output is due to:

     if (ENABLE_FEATURE_RESIZE_PRINT)
         printf("COLUMNS=%d;LINES=%d;export COLUMNS LINES;\n",
             w.ws_col, w.ws_row);

I can confirm that calling 'resize' is needed. Otherwise, you might get 
input wrapping on the same line when typing long commands.

I just tried busybox init based system and I also met '-sh: command: not 
found' error message.
I think Peter's patch ([OE-core] [PATCHv2 1/1] base-files: profile: 
Avoid using "command" to determine if programs exist) is correct.

Best Regards,
Chen Qi

> cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)
>
> that already has no effect whatsoever. See the man page for resize:
> https://linux.die.net/man/1/resize
>
> I also would consider running some program's output as shell script a 
> bit spooky, it looks like a security hole waiting to be exploited.
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>


