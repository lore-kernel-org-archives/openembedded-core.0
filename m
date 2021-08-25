Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web12.10183.1629865358271831804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=DWdGk7O2;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIkQt-0003ND-B7; Wed, 25 Aug 2021 06:22:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kMhcfcUZT5OeTRQiFf4mY9cLSVtyOZKmxXq+tYc3ULY=; b=DWdGk7O2nVMmw8DZYgzS4ZVWGE
	4iqEuOOqrwRJJIRT0gc5764600IGfQS5OHTVJM2EFdlcmk0raIgB8d+2gAgTwvb1twA43iHjzSWvo
	tGi1Q9nkZZSEVDlZF6AhH5wz9GWxBlL/bQU0C05p0ipNSpecJUm4Dq+p0rOCu2ULGRNZ9aaCwoUAl
	BAl4jKJgWdwG0ypdZ3TMDPEzzcTzBhVPoeW53qOedGV4QYyqNqn1e586PuTcVusR+gx9GxfLSd/3T
	uwIrK6ixgidyYHbWXT6W9ffT17VJY8bNkkosTV7axntbNUjZuXIYffDgNfQ4Rl9KdhZ3cVO6TrCdT
	tWh6RSRA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIkQp-00053s-Av; Wed, 25 Aug 2021 06:22:33 +0200
Subject: Re: [OE-core] usermod in EXTRA_USERS_PARAMS is broken in master
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <eb9225bc-cc13-aca4-b44f-f38c2f83556b@pr.hu>
 <4143bf5010d947b2b5f896b27cf7e0dd@axis.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <e22a31d8-d1cf-2f20-528c-b8cc6ae248b9@pr.hu>
Date: Wed, 25 Aug 2021 06:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4143bf5010d947b2b5f896b27cf7e0dd@axis.com>
X-Spam-Score: -1.5 (-)
X-Scan-Signature: 642093ab6d8c10dc6804d9159895b1ad
X-Spam-Tracer: backend.mail.pr.hu -1.5 20210825042233Z
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 24. 23:21 keltezéssel, Peter Kjellerstedt írta:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
>> lists.openembedded.org
>> Sent: den 24 augusti 2021 16:22
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] usermod in EXTRA_USERS_PARAMS is broken in master
>>
>> Hi,
>>
>> I tried to port my distro layer to Honister and
>> attempted to build an OS image.
>>
>> I have this in the image recipe:
>>
>> EXTRA_USERS_PARAMS += "usermod -P mypassword root; usermod -P mypassword2 myuser;"
> 
> The 0002-Allow-for-setting-password-in-clear-text.patch patch has been dropped
> from shadow with the update to 4.9 (see commit 759df739). It previously renamed
> the -P option to -A and added an insecure -P <cleartext password> option.
> 
> Replace the use of the -P <cleartext password> option with -p <encrypted password>
> and you should be good to go, also with Hardknott.

Thank you.

> 
>>
>> and the error I got was:
>>
>> NOTE: my-test-image: Performing usermod with [-R
>> /data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0-
>> r0/rootfs -P
>> mypassword root]
>> usermod: prefix must be an absolute path
>> ERROR: my-test-image: usermod command did not succeed.
>> WARNING:
>> /data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0-
>> r0/temp/run.set_user_group.2583229:260
>> exit 1 from 'exit 1'
>>
>> EXTRA_USERS_PARAMS has userdel and useradd commands
>> before the last two usermod, all of which succeed.
>>
>> I got the same error on both Fedora 33 and Fedora 34 hosts.
>>
>> It works with Hardknott.
>>
>> Best regards,
>> Zoltán Böszörményi
> 
> //Peter
> 

