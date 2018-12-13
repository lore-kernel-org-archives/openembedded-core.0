Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F30E6B06D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:37:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBD3aZT1027282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2018 19:36:57 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Dec 2018 19:36:36 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
	<37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
	<117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
	<0b4127efa7077e49230199b08757d7aa13fb518a.camel@linuxfoundation.org>
	<bb74d937-c676-77d2-2258-0db6037fce51@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d195944c-6a16-3d26-4af3-65c6b12c4784@windriver.com>
Date: Thu, 13 Dec 2018 11:41:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <bb74d937-c676-77d2-2258-0db6037fce51@windriver.com>
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Thu, 13 Dec 2018 03:37:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/11/18 6:12 PM, Robert Yang wrote:
> Hi RP,
> 
> On 12/11/18 5:44 PM, richard.purdie@linuxfoundation.org wrote:
>> On Tue, 2018-12-11 at 17:24 +0800, Robert Yang wrote:

[snip]

> I did a test:
> 
> $ ln -s /usr/bin/ccache /folk/lyang1/bin/gcc
> I got errors with/without the code:
> 
> $ bitbake -p
> bb.BBHandledException
> ERROR: Error running gcc  --version:

I've sent a patch to fix/explain this problem:

[OE-core] [PATCH 0/1] lib/oe/utils: Set stderr for host_gcc_version()


// Robert

> 
> $ ls -l tmp/hosttools/gcc
> tmp/hosttools/gcc -> /folk/lyang1/bin/gcc
> 
> $ ls -l /folk/lyang1/bin/gcc
> /folk/lyang1/bin/gcc -> /usr/bin/ccache
> 
> It worked well if I run gcc --version manually:
> $ gcc --version
> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
> Copyright (C) 2015 Free Software Foundation, Inc.
> $ echo $?
> 0
> 
> There must be something wrong in such a case. I will fix this later.
> 
> Let's get back to he code:
> 
>              srctool = bb.utils.which(path, tool, executable=True)
>              if "ccache" in srctool:
>                  srctool = bb.utils.which(path, tool, executable=True, direction=1)
>              if srctool:
>                  os.symlink(srctool, desttool)
> 
> 
> * If tool == "gcc", then srctool would be gcc, too.
> * If tool == "ccache", then srctool would be ccache, too.
> 
> So I think that the code doesn't help when gcc links to ccache ?
> 
> // Robert
> 
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>

