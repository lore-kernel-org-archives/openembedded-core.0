Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web10.39931.1629814906811980634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 07:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=cC5zL6lS;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIXJ3-0001fR-Vz
	for openembedded-core@lists.openembedded.org; Tue, 24 Aug 2021 16:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CfsnZoQuMEj1I3P/R2mTQZ9HjvqWmPyUAFofXpaEzSs=; b=cC5zL6lSzgFXZXVNWmIZRlZWkJ
	q3XV/UQacXgeJ8nuk7IhM2BpycM4mCLsAbS8nylYs9Wb6YbWjZAdcKC+111NbbV66769nKOn7g6IQ
	f9wF8rRC57r7LkNL/iUlDEjG2zMLU8ymOlh9Pk79Z+cLFQxcJvceta/1BgCqRXoRK0pLRCUMJ8imb
	WDrbm8HQL7x6vscc1LCoSqmwdqRgXP8h97i8OSSAUG3bXl+WcgK4sFzHtiX/jGQ7KjDf28nNfI31V
	xUYlGhr1E65Lp1JBbHr/0dCA5yyuD+IEkGyiuxrewZMA0Nc/AQEKsICjWEVc9XOMHL5UbeX/NmWtG
	Bt1p7skw==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIXJ0-0002X1-1h
	for openembedded-core@lists.openembedded.org; Tue, 24 Aug 2021 16:21:35 +0200
To: openembedded-core@lists.openembedded.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: usermod in EXTRA_USERS_PARAMS is broken in master
Message-ID: <eb9225bc-cc13-aca4-b44f-f38c2f83556b@pr.hu>
Date: Tue, 24 Aug 2021 16:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: eb3d9b7f1f3400e9adcc1170d01d5e4d
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210824142135Z
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I tried to port my distro layer to Honister and
attempted to build an OS image.

I have this in the image recipe:

EXTRA_USERS_PARAMS += "usermod -P mypassword root; usermod -P mypassword2 myuser;"

and the error I got was:

NOTE: my-test-image: Performing usermod with [-R 
/data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0-r0/rootfs -P 
mypassword root]
usermod: prefix must be an absolute path
ERROR: my-test-image: usermod command did not succeed.
WARNING: 
/data/yocto/tmp-sicom-glibc/work/genericx86_64-oe-linux/my-test-image/1.0-r0/temp/run.set_user_group.2583229:260 
exit 1 from 'exit 1'

EXTRA_USERS_PARAMS has userdel and useradd commands
before the last two usermod, all of which succeed.

I got the same error on both Fedora 33 and Fedora 34 hosts.

It works with Hardknott.

Best regards,
Zoltán Böszörményi
