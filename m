Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3AD62134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 11:58:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FBvp5J022515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 04:58:06 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 04:57:50 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<CALbNGRToT5fCwHNMzruzoJZDC34zymY52_uEmASqHQmacL2+Xw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <d9970f51-76a8-e2c4-1abe-ae5ffc61f46e@windriver.com>
Date: Wed, 15 May 2019 19:57:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRToT5fCwHNMzruzoJZDC34zymY52_uEmASqHQmacL2+Xw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 11:58:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/15/19 6:54 PM, Andreas Müller wrote:
> On Wed, May 15, 2019 at 11:50 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 5/15/19 5:32 PM, Andreas Müller wrote:
>>
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -90,7 +90,11 @@ oe_runconf () {
>>                  bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>>                  if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
>>                          bbnote "The following config.log files may provide further information."
>> -                       bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
>> +                       config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
>> +                       bbnote "$config_log"
>> +                       [ -e "$config_log" ] && cat "$config_log" | while read line; do
>> +                               bbnote "$line"
>> +                       done
>>                          bbfatal_log "configure failed"
>>                  fi
>>          else
>> --
>> 2.7.4
>>
>> That output is useful only sometimes and extremly verbose. I'd suggest
>> to introduce a switch to enable/disable (even as newbie user I am able
>> to find config.log). How about making autobuilder's WORKDIR
>> accessible?
>>
>> The output only happens while do_configure failure, it does nothing when build succeed,
>>
>> while failure occurs, I believe related message is the more the better.
>>
>> The autobuilder is just an example, for community development, it is hard to login
>>
>> others build host to debug issue, and we have to take time to reproduce it
>>
>> if we could trace it with a simple glance from the log, why not
>>
> Errors are common at recipe creation. I am asking for a knob to
> prevent me from scrolling through endless wallpapers (confg.logs can
> be >> 100K) to find simple errors.

I think a knob does make sense, I will add it in V2

//Hongxu

> And it just works around an autobuilder hiding useful information,
>
> My 2ct
>
> Andreas



