Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 046DE602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 03:34:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8T3YMkh012253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Sep 2016 20:34:22 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 20:34:21 -0700
To: Seebs <seebs@seebs.net>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
	<23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
	<CB33D621-D8CC-4880-AC2F-EAE42D42F943@seebs.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <db01ab37-aeb0-46cd-b953-dd110f59de8b@windriver.com>
Date: Thu, 29 Sep 2016 11:34:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CB33D621-D8CC-4880-AC2F-EAE42D42F943@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Thu, 29 Sep 2016 03:34:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, it works for me now, I will send a V2 with your patch sooner.

How about the prefix issues? Which ones should be prefixed do you think
please ?

Yocto 2.2 may not need the prefix, but we can treat it as an enhancement
for YP 2.3.

// Robert

On 09/29/2016 11:15 AM, Seebs wrote:
> On 28 Sep 2016, at 21:31, Robert Yang wrote:
>
>> Thanks for the reply, I tested your patch from git repo, it doesn't work,
>> the message goes to the terminal:
>> Child process exit status 4: lock_held
>
> This, it turns out, is a result of a much worse bug which somehow previously
> evaded detection,
> and just happened to work by blind luck or coincidence or something.
>
> Which is that pseudo_logfile() was returning, not a file descriptor, but "either
> 0 or -1", but I was then treating it as a file descriptor.
>
> So actually the messages were going to fd 0, not to fd 2, in this case.
>
> Fixed with a one-line patch:
> -    return 0;
> +    return fd;
>
> (And actually, I think it may make sense to go change those messages from
> pseudo_diag to pseudo_debug, since they're basically useless unless you're
> debugging the startup code.)
>
> -s
>

