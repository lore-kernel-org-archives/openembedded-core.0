Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9C860138
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 17:44:26 +0000 (UTC)
Received: by pdea3 with SMTP id a3so58221891pde.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Sz3WQi+VqidpkQzyk9XkytnAXX/YmSmYPTrDFaiYz0o=;
	b=FSFdyLWAHlB/wdMX8J07PTSoF2nySGjNhLud3vhubDd85TLT7d2sleMG1q73IpxEPL
	0x5lS2rbpOeF11z3XWkHzQnWocHG2QPKLIl17+DyQF5ZBtJF2WI0iAHgHAY1hb7vHgYW
	IThEYo1WyBlpliKP5E4IVhUqYQvjCYexACB8SFOvgXDHTGDBDMEPlerGlaRYXmaAk7S5
	svMywlKPu33KOIwvJWorSQkeUfmgbiNEF0Eif2g6RyGAfkCskY2FGnT5gv4hsRnBQ3fG
	GCu0JogyUtQkloL58GsabTxS3GapTyVnxsDEZJRoiEIjTRDQp0UxwRImS8B4VPTQExEV
	/rmg==
X-Received: by 10.70.88.170 with SMTP id bh10mr168054pdb.62.1431539068390;
	Wed, 13 May 2015 10:44:28 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:7c79:332d:8dea:73b5?
	([2601:c:a700:3ba7:7c79:332d:8dea:73b5])
	by mx.google.com with ESMTPSA id e5sm19933967pdc.94.2015.05.13.10.44.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 10:44:27 -0700 (PDT)
Message-ID: <55538D78.6040906@gmail.com>
Date: Wed, 13 May 2015 10:44:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
References: <1431350446.30971.56.camel@linuxfoundation.org>
	<5552FFAD.4070306@windriver.com>
In-Reply-To: <5552FFAD.4070306@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
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
X-List-Received-Date: Wed, 13 May 2015 17:44:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Robert,

this was the error I hit last week. There may be a fix I have not tried.

https://lkml.org/lkml/2015/2/18/422

- armin

On 05/13/2015 12:39 AM, Robert Yang wrote:
>
> I think that I met another problem when MACHINE = qemuarm64 with gcc5:
> linux-yocto_3.19.bb:
>
> /tmp/ccWk2lM2.s: Assembler messages:
> /tmp/ccWk2lM2.s:42: Error: .err encountered
> /tmp/ccWk2lM2.s:43: Error: .err encountered
> /tmp/ccWk2lM2.s:44: Error: .err encountered
> /tmp/ccWk2lM2.s:103: Error: .err encountered
> /tmp/ccWk2lM2.s:104: Error: .err encountered
> /tmp/ccWk2lM2.s:105: Error: .err encountered
> make[3]: *** [arch/arm64/kernel/psci.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
>    CC      mm/mmzone.o
>    CC      mm/vmstat.o
>    CC      mm/backing-dev.o
>    CC      net/socket.o
> make[2]: *** [arch/arm64/kernel] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> // Robert
>
> On 05/11/2015 09:20 PM, Richard Purdie wrote:
>> Hi Bruce,
>>
>> One of the things we're looking at in 1.9 is gcc 5.x support by default.
>> One of the areas this has significant impact is on the kernels,
>> linux-yocto in particular. I'm starting to see a potential problem here
>> since the kernels don't appear to work well with gcc 5.x:
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
>>
>>
>> (this is a test build I ran just to see how bad things were).
>>
>> Are we going to be in a position to get 5.x support backported into 3.14
>> (and maybe 3.10)? Or was we going to have to wait for later versions?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>

