Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 538BD6CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 06:59:44 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VVyba-0002CW-2p from Paul_Woegerer@mentor.com ;
	Mon, 14 Oct 2013 23:59:46 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Oct 2013 23:59:46 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.2.247.3; Tue, 15 Oct 2013 07:59:44 +0100
Message-ID: <525CE7DF.4040102@mentor.com>
Date: Tue, 15 Oct 2013 08:59:43 +0200
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Tom Zanussi
	<tom.zanussi@linux.intel.com>
References: <525C13C0.4020805@mentor.com>	<1381768366.19281.64.camel@empanada>
	<CADkTA4MsaVcdtEkG8VJOuneZwayuRi4uwXrRVt6PW_3_Nv8kTw@mail.gmail.com>
In-Reply-To: <CADkTA4MsaVcdtEkG8VJOuneZwayuRi4uwXrRVt6PW_3_Nv8kTw@mail.gmail.com>
X-OriginalArrivalTime: 15 Oct 2013 06:59:46.0148 (UTC)
	FILETIME=[21D77240:01CEC974]
Cc: Christopher Larson <chris_larson@mentor.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: lttng-modules may trigger deadlock in the timekeeping subsystem with Linux <= 3.10.13, <= 3.11.2
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
X-List-Received-Date: Tue, 15 Oct 2013 06:59:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/15/2013 12:50 AM, Bruce Ashfield wrote:
> On Mon, Oct 14, 2013 at 12:32 PM, Tom Zanussi
> <tom.zanussi@linux.intel.com> wrote:
>> On Mon, 2013-10-14 at 17:54 +0200, Woegerer, Paul wrote:
>>> Hi,
>>>
>>> looking at the following commits shows that the current version of
>>> lttng-modules 2.3.x can trigger a deadlock in the timekeeping subsystem
>>> of Linux.
>>>
>>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=fc8216ae9ec5d18172d8227d179475e7cc1fb45c
>>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=9998f5216f4641a79e158135c4c1658dcc6cd2d8
>>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=e14bf96416c39675a5f785b032d1c5279020b93d
>>>
>>> This is caused by a bug in the kernel that was introduced in 3.10. The
>>> problem is already fixed in Linux 3.10.14, 3.11.3 and 3.12. See:
>>> http://marc.info/?l=linux-kernel&m=137894350929349
>>>
>>> lttng-modules 2.3.2 contains preprocessor-code that makes sure that
>>> building of lttng-modules fails for the unlucky combinations of kernel
>>> and lttng-modules. The problem is when we update our lttng-modules 2.3.0
>>> to 2.3.2 then we would have lttng-modules failing to build for our qemu*
>>> MACHINEs.
>>>
>>> Any recommendations on how we should address this ?
>>>
>> Probably just get Bruce to update linux-yocto-3.10 to 3.10.14, or pull
>> the specific commit that fixes it in.
> Precisely. And I already have all the -stable updates queued, it just needs
> to be 1.5.1, since I stopped sending updates to 3.10 for 1.5 proper a few
> weeks ago.

Bruce, as soon as you have updated linux-yocto-3.10 to 3.10.14 (or
later) I will send the patch that updates lttng-modules from 2.3.0 to
2.3.2. This will ensure we will have the checks from 2.3.2 in, so that
users of other bsps will get a compile time error if they are tring to
build a fatal combination of lttng-modules and kernel.

Thanks,
Paul

>
> This isn't severe enough to warrant any special handling outside of getting
> the -stable update into 1.5.1.
>
> Cheers,
>
> Bruce
>
>> Tom
>>
>>> Many thanks,
>>> Paul
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Paul Woegerer, SW Development Engineer
Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Software Division


