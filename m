Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC27C77DCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 07:51:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0C7p8Yk009122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jan 2018 23:51:08 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 11 Jan 2018 23:51:08 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, ChenQi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-3-alexander.kanavin@linux.intel.com>
	<77edf942-1e45-d129-1af5-35809f0c94d6@windriver.com>
	<991321f1-d190-3b20-c2c3-572bf6e5fcc5@linux.intel.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <1d60e67e-cf3a-8a2c-e8bc-52e8060e8cae@windriver.com>
Date: Fri, 12 Jan 2018 15:49:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <991321f1-d190-3b20-c2c3-572bf6e5fcc5@linux.intel.com>
X-Originating-IP: [128.224.162.134]
Subject: Re: [PATCH 3/9] json-glib: convert to meson build
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
X-List-Received-Date: Fri, 12 Jan 2018 07:51:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I also encountered this issue. For now, I found it only happened on 
ubuntu 14.04.

Looks like it invokes g-ir-scanner but not g-ir-scanner-wrapper when 
building gir.

In build.ninja:

COMMAND = 
'/buildarea/build/tmp/work/core2-64-poky-linux/json-glib/1.2.8-r0/recipe-sysroot-native/usr/bin/g-ir-scanner' 
...

On ubuntu 16.04, it uses g-ir-scanner-wrapper that could work:

COMMAND = 
/buildarea/build/tmp/work/core2-64-poky-linux/json-glib/1.2.8-r0/recipe-sysroot/usr/bin/g-ir-scanner-wrapper 
...


//Yi


在 2018年01月04日 17:27, Alexander Kanavin 写道:
> On 01/04/2018 10:51 AM, ChenQi wrote:
>>> file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch 
>>> \
>>> +           "
>>
>> I removed this patch and the compile succeeded.
>> Could you please check if this patch is really needed?
>> If it is, I think we'd better make build to succeed by default anyway.
>
> Yes, it is really needed. Without it, introspection files will not be 
> generated at all. I'll try to reproduce the failure.
>
> Alex


