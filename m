Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDBA6D50C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 01:05:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3H15pBe020957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2019 18:05:51 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 16 Apr 2019 18:05:50 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
	<6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <52db974d-c320-7f53-2fb4-75f353ed1b60@windriver.com>
Date: Wed, 17 Apr 2019 09:05:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH 1/2] systemd: change default locale from C.UTF-8 to C
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
X-List-Received-Date: Wed, 17 Apr 2019 01:05:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/16/19 6:22 PM, Richard Purdie wrote:
> On Tue, 2019-04-16 at 17:49 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> current default locale is set to C.UTF-8, but glibc not support
>> locale C.UTF-8. so set to the default locale C.
>>
>> [snip]
>>          if not meson.is_cross_build()
>>                  choose_default_locale_sh =
>> find_program('tools/choose-default-locale.sh')
>>                  default_locale =
>> run_command(choose_default_locale_sh).stdout().strip()
>>          else
>>                  default_locale = 'C.UTF-8'
>>          endif
>>
>> if default locale set to C.UTF-8, it will cause libpcre ptest fail:
>>
>>    re> //8+L
>> ** Failed to set locale ""
> Doesn't your second patch mean we don't need this one?

1.  No ,  we need this one.

because image maybe don't  install any locale except glibc default C 
locale, like below:

root@qemux86:~# locale -a
C
POSIX

if systemd set to C.UTF-8,   any image need to install C.UTF-8 locale by 
default, but only C is default locale.

with this patch,  sysVinit and systemd both set to default C locale.


2. patch 2/2 glibc: Add a C.UTF-8 locale

This patch is not necessary, it is just for add support of C.UTF-8 
locale.  if any package depend on it in the future,  it can install

this locale.


Add this patch just because I noticed most of major distro have support 
this locale. not for fix  "** Failed to set locale "".

>
> Cheers,
>
> Richard
>
>
-- 
BRs

Sandy(Li Changqing)


