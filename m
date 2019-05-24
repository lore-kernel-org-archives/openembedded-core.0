Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2336E7E2B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 01:34:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4O1Y5al024270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 18:34:05 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 23 May 2019 18:34:05 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Adrian Bunk <bunk@stusta.de>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
Date: Fri, 24 May 2019 09:45:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 01:34:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2019 08:22 PM, Burton, Ross wrote:
> On Thu, 23 May 2019 at 11:34, Adrian Bunk <bunk@stusta.de> wrote:
>> systemd is fundamentally Linux-only and not portable to other kernels.
>>
>> systemd upstream is using glibc extensions not present in other
>> C libraries.
>>
>> systemd upstream is accepting technically correct patches that help
>> building with musl, but there is no interest upstream in keeping systemd
>> working with non-glibc C libraries.
>>
>> The way things currently go, systemd/musl will require an ever-growing
>> amount of not upstreamable patches - and this is not sustainable.
> I think I have to agree with you: several of the extensions are for
> security purposes, so we're potentially actively introducing issues.
>
> Ross


I suggest we only apply these musl patches when the libc is musl.

SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' 
else ''}"

In this way, these patches do not affect glibc users. People who 
actually use musl will test these patches and maybe improve them if they 
really care about it.

For example, the following patches are written by me.

0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch and
0001-do-not-disable-buffer-in-writing-files.patch

These two patches are to solve runtime problems in musl based system. I 
knew there's something different in buffering mechanism between glibc 
and musl that causes this problem, but I really did not want to spend 
time digging into it. And as systemd was using unbuffered way for 
writing files for a long time, I just disabled them.

As Adrian and Ross pointed out, these patches are introducing potential 
security problems. I agree that we should do something about it. At a 
minimum, the glibc based system should not be affected.

I'll send out patch and please help review it.

Best Regards,
Chen Qi


