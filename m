Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 338EA6B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 07:57:16 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1V44nz-00034Z-KH from Muhammad_Shakeel@mentor.com ;
	Tue, 30 Jul 2013 00:57:15 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 30 Jul 2013 00:57:15 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Tue, 30 Jul 2013 08:57:13 +0100
Message-ID: <51F7720E.2000206@mentor.com>
Date: Tue, 30 Jul 2013 12:58:06 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
	<51F155BF.8040301@linux.intel.com>
In-Reply-To: <51F155BF.8040301@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 30 Jul 2013 07:57:15.0149 (UTC)
	FILETIME=[67CC7BD0:01CE8CFA]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: Remove unnecessary runtime dependency on sysvinit-pidof
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
X-List-Received-Date: Tue, 30 Jul 2013 07:57:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 09:43 PM, Saul Wold wrote:
> On 07/25/2013 03:02 AM, Shakeel, Muhammad wrote:
>> -RDEPENDS_avahi-daemon = "sysvinit-pidof"
>> -
> I am sure there was a reason that the sysvinit version of pidof was 
> required over the busybox, did you test that the busybox version works 
> correctly in both systemd and sysvinit usages?
>
> It maybe that the busybox version now work correctly.
>
> Also as Paul pointed out, this is an RDEPENDS on a single package not 
> all the sysvinit packages.
>
> Sau!
>
I have tested that pidof from busybox works fine for both systemd and 
sysvinit and also avahi-daemon works fine with this.

Also sysvinit is rdepending on 'sysvinit-pidof' and for sysvinit systems 
pidof will always come from inside it. It is only systemd enabled 
systems which will get pidof from busybox and it seems to be working fine.

I have tried to track it that why this rdepend was added for avahi 
daemon. It was added back in May 2007 but commit 
(1641c2bd2c71bb08de7057b052ae74c00eedb330) message doesn't have any more 
detail. I am sure that pidof from busybox is much more stable now.

This is definitely installing only 'sysvinit-pidof' but I was of the 
opinion that if we can avoid all of sysvinit for systemd only build, 
given that it is not impacting any of the functionality, then it will be 
nice. IMHO, we should try to prevent as many unnecessary bits from 
build/image as possible.

Regards,
Shakeel


