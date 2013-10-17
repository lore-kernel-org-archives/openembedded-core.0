Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D35F66D030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H3TEK3028163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2013 20:29:14 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 16 Oct 2013 20:29:14 -0700
Message-ID: <525F598D.2010106@windriver.com>
Date: Thu, 17 Oct 2013 11:29:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
	<525DE1D4.40109@windriver.com>
	<EF2228FC-1E37-435B-A76A-426E585A2E0E@dominion.thruhere.net>
	<525E57FA.6000200@windriver.com>
	<lyppr5plyp.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyppr5plyp.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Thu, 17 Oct 2013 03:29:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/2013 06:08 PM, Enrico Scholz wrote:
> Rongqing Li <rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> writes:
>
>>>>> ConditionKernelCommandLine!=root=/dev/nfs
>>>>>>>
>>>>>
>>>>> What is your meaning?
>>> That's you are creating a huge script that does something built into systemd.
>>>
>>
>>
>> Yes, I can not find a way to avoid to that,
>>
>> Do you have any advice?
>
> I would split the cmdline generation into a dedicated one-shot service;
> e.g. modify the original connman.service to have something like
>
>    [Service]
>    EnvironmentFile = -/run/connmand.env
>    ExecStart=/usr/sbin/connmand -n ${CONNMAND_OPTS}
>
>
> The '/run/connmand.env' is created by a service with
>
>    [Unit]
>    Before = connman.service
>    ConditionKernelCommandLine!=root=/dev/nfs
>
>    [Service]
>    Type = oneshot
>    ExecStart = /usr/sbin/create-run-connmand.env
>
>    [Install]
>    WantedBy = connman.service
>
>
>


I test your method, but failed to start connmand,
it always report "hand over timeout", I think
it is caused by which the script run slow.


But I will follow your method, create two service.
the connman.service is run only when
ConditionKernelCommandLine!=root=/dev/nfs

other connman-nfs.service, which will start the
script to compute the ignored interface, is run
when ConditionKernelCommandLine=root=/dev/nfs


-Roy




> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Best Reagrds,
Roy | RongQing Li

