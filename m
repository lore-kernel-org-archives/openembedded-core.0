Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.8665.1632492188119942155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=AMGbH+5k;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mTln6-0007bh-Cm; Fri, 24 Sep 2021 16:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=28jFHpiEL2e76gxP+SNF56uq4YUateVncevaFWbhfm8=; b=AMGbH+5kr1Ahk53vTEDs9AKgZ8
	A8+8QLpCanAEB4lgRX2YxKQSSBM4h2gOzYrFv7A5UhiXfZqhlZvlYCuFhZLxqiEV8+VKdIj4HP/U5
	/2XGHJFfpQxRyRS53+buqYAsKdu+7U3W0R+LqQN3IF9QmNVd4nbm4KLrs0eXy99ak7asqNrxdGF2X
	IZsHvGNTW3PCd/3nZDt16J7v9mSE2LM1sRxE1RwEPctKARosRiEZV96KRm0PRJ728BdFGygxR8pnE
	rMu09dO/mdD8ZbEFikYCis9usYpr6wuxc2He3P5qwptT1TDsxE51aBwsJ8KPq1R/v7q3P/mcxxebU
	tyq90Ndw==;
Received: from host-87-242-33-29.prtelecom.hu ([87.242.33.29] helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mTln2-0005xL-5h; Fri, 24 Sep 2021 16:03:02 +0200
Message-ID: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
Date: Fri, 24 Sep 2021 16:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: user/group XXX does not exist, using root with RPM/DNF packaging in Hardknott and Honister
X-Spam-Score: -7.3 (-------)
X-Scan-Signature: eb3d9b7f1f3400e9adcc1170d01d5e4d
X-Spam-Tracer: backend.mail.pr.hu -7.3 20210924140302Z
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I have a special package that creates users and groups
via inherit useradd. This package doesn't depend on any
others but it is depended on, both via DEPENDS and RDEPENDS
by packages using those users/groups in their do_install
scripts.

This works for packaging becase these ownerships
are encoded in the packages, confirmed by rpm -qp --dump ...

However, during do_rootfs, a couple of
"user/group XXX does not exist, using root"
messages appear for the packages depending on others
creating these users/groups.

log.do_rootfs shows that the package installation ordering
does not follow RDEPENDS. Instead, it's practically an
alphabetical order when running dnf.

This doesn't just involve my custom packages, but also clamav
plus another one in which I ship a small limited set of
virus signatures, also chown'd to clamav and with RDEPENDS
on clamav.

What is the correct solution to this?

Thanks in advance,
Zoltán Böszörményi
