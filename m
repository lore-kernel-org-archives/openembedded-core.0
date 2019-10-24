Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 21D2D7F983
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:54:13 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1iNbh0-0001HM-OQ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Oct 2019 13:54:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=glHXIlI3O84k/oFk/1T9qnmIVcsnSd/YDF9XBJWXmVI=;
	b=fbp6UN8JpFzl+84pHfpHjGJrp5
	hh8++2IjMONeHoBCCvOlzlzd1ZJA4s+jNmvCp3CaagC+6Q7RhITgfEptyAvZReeE+sU+c9YPY2LuF
	WtqagvEYaeg92HElN166OFh30wuvjz2IiB68h4S500Wu+yZbdT4qiGanlPD++IwFDDfUtgXDTHsE/
	RqS1GCsG2VxO5suIKTWlWIKq13mQtL561YilyDdEiBfJciO5/DEVgsGIXmuAKxJ2ElnShxj7f1gKE
	hkE5yU1oa2NwfES4B947XnZg2sZuvMF29f8z/cGOuqWMheFJjEisKPsKuEyXRHmLc82LgFwjfJZK8
	C3SflggA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=[192.168.1.13])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>) id 1iNbgw-0008IE-SD
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Oct 2019 13:54:12 +0200
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <7699ce77-9326-8095-43b2-b8cd2fd0cc28@pr.hu>
Date: Thu, 24 Oct 2019 13:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 179ef3736e309226eac6e039e192467d
X-Spam-Tracer: backend.mail.pr.hu -1.8 20191024115412Z
Subject: OPKG intercept scripts vs RPM %posttrans
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
X-List-Received-Date: Thu, 24 Oct 2019 11:54:14 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I know that OPKG supports running scripts at the very end of
the package manager transaction. These are the so called
"intercept scripts" in OPKG speak. pkg_postinst() scripts can
run these scripts that create another script that eventually
run at the end of the transaction.

However, these are not applicable when building an RPM based
system with Yocto.

In RPM, there are these %posttrans scriptlets that are scheduled
for the end of the transaction. However, creating a %posttrans
scriptlet is not supported in package_rpm.bbclass.

For example, one package may depend on another for upgraded
contents but if this dependency is not versioned, then the
upgrade of these two packages may be done in the wrong order,
making the pkg_postinst (%post) script of the first package
run earlier than the script for the dependency package.

An intercept script or RPM %posttrans script is perfect in any case.

Is it planned to support %posttrans?

Best regards,
Zoltán Böszörményi

