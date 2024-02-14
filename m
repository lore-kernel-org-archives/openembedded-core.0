Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C675C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:58:32 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.42905.1707922707194020129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 06:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=RWfdVnjp;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4F4229C2D13;
	Wed, 14 Feb 2024 09:58:25 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id kTo5fSPf7I8e; Wed, 14 Feb 2024 09:58:24 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9D1839C3FCA;
	Wed, 14 Feb 2024 09:58:24 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 9D1839C3FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707922704; bh=HDnu3CG8ACSrLELwBPm10eOs9mDp2Xz1sg2dXbaaA7Y=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=RWfdVnjpNjlc+WhOFwxGcQH8XCwM0FCRFTgYeWjPci5XyYfqA8c+JVqEIFyeOYpFM
	 6uWTycKzOBRVZkzeSc+GAbxRjI3vvUbMzoi2RK+P+c9wosw7zaNr+7DVZxLSklseHv
	 DKrWZGKQ1/8Q7zsts8Tt6V4UVS6fyOAlVNcaSVNW2qlQVDt93plyOZhrODz2dHt8oo
	 bq3GoiUuGgNyunPkVgZteDTU8kvipkCCEDxHeMnt2fWlYGa7+F9Mtn7F/OIPx2REoM
	 6PYYEVLB8ocHXz4UG7ElxYJYgshsn9nurEH8sAYYxi41o0mV2gJKxFIdbpO6HLS37W
	 a1mUE3JTgFABQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TUWy5gT7dzsJ; Wed, 14 Feb 2024 09:58:24 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CE9BC9C2D13;
	Wed, 14 Feb 2024 09:58:23 -0500 (EST)
Message-ID: <5f0e6f43-d462-459b-b55c-3fee820a8c1c@savoirfairelinux.com>
Date: Wed, 14 Feb 2024 15:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] VS Code plugin and multiple build directories
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
 <CANNYZj8GvH4RKa9phsQ7oSv2b0604DtLa09W1Fndm-bA3KANVg@mail.gmail.com>
 <71696e62-8d1f-43b4-8277-7a6619a20d73@savoirfairelinux.com>
 <DB5PR02MB10213E20ADB72DDCD1CAE6F75EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <DB5PR02MB10213E20ADB72DDCD1CAE6F75EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 14:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195482



> 
> While we do use Poky as the basis for our platform, not everyone does.
> It is just as likely that the build environment is setup by fetching the
> individual repositories for bitbake, OE Core and meta-poky.
> 
> Also, what do you mean by "parsing of Python segments by importing the
> modules in the poky Python librarie"? Do you mean the Python modules in
> meta/lib/oe? In that case you really should take all calls to `addpylib`
> into consideration instead as they can be used by any layer to add extra
> Python modules that bitbake should be aware of.
We configure the external Python extension to resolve as many symbols as 
possible inside lib/*.py files and python functions inside .bb files. We 
have very tricky API limitations for conveying configurations to the 
python extension. This configuration is used for linting Python errors, 
providing symbols definitions, everything you'd expect when editing 
Python code. Still we can't provide a super accurate result right now 
and track addpylib calls for instance. The external Python extension is 
very rigid. Despite that, our current tricks work surprisingly well for 
most setups. If a more complex one is used, it should only lead to false 
positives errors and a degraded Python symbols lookup which is not 
critical. The user can also correct the python configuration manually if 
desired.
> 
>>> Alex
>> Enguerrand de Ribaucourt
> 
> //Peter
> 
Enguerrand de Ribaucourt

