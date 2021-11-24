Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C96EC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 07:59:15 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web08.3295.1637740753054840154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 23:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=d8Bx1pqj;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:date:message-id:to:
	 subject:from:from;
	bh=R2QDnUyNky5pTH3qvCKtK3pgt7DI430khmgHMhZy5k8=;
	b=d8Bx1pqj1C8GvephO+zUL7Q3ZbcOw7EcM76Vinmn1YMOBWWHFFKCf6dzFZMkoMJX9FYSvt83SchIS
	 cV8jzh9GWADh3rfKvsnPyZyKi6lFdKmrc+1mMBhwh/1HQfX4vPej4Npjwczd/QT3IBEz3dkQS9Z9q2
	 QdALmAIe7bQfvZuXSMLS6wJjqTfnwyLCOvEu3U3r4ujzlAlZl1QlMi6ac1l9Bjw1xiAtJrHkEbZKFd
	 tD5awmYmUMH55vmBqtu9r10wpFY24CvPf4m3408UU5oS0Lvha3LjG1bBFKpavURZOAYReHosoexh9a
	 7X6v8PeaVFd8Weo8m4n0Zk0dVXgV7KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:mime-version:date:message-id:to:
	 subject:from:from;
	bh=R2QDnUyNky5pTH3qvCKtK3pgt7DI430khmgHMhZy5k8=;
	b=d58UE0RsbivMv9oeIfTw3esExo/zmnBccA2LtANZ639uCDVYFeAHEieIgly5PgPjlN3QWtCBV7kXr
	 eYxxYqTYChnTqQZyvx+PLhH1gnLpHga8i6pKv9WknX+24T6DkAMcQLH45+vAQL17UH6zBbg7Ou/+UP
	 rZ9o+YHKF+jmIlxCHyJODgFORlQUVqf4j0R6AWZY5ij/Oc9sAWtJZDcGwx0AauPCK+b/Csti2pjPuE
	 auKh6XUkOTTrm2deGH4wShpKPfh7Lz1tpXT/LADsFHmqnhKTuxUY9BTDL+xiN1nW0nDWp/QvKLHL8/
	 0/F+IoVp9aq4nxVEmg907LF+6UWgN0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:mime-version:date:message-id:to:
	 subject:from:from;
	bh=R2QDnUyNky5pTH3qvCKtK3pgt7DI430khmgHMhZy5k8=;
	b=hw5GAhmnOoXAYeQIEVj/bv6ikJRQoIGicbkYdBjGFw9EqT8FcJtzaBh+y38xogAwVfZCK3cjFehrY
	 706ilemCg==
X-HalOne-Cookie: 53888d399f857fb5d410e414c503ecb25c4a2040
X-HalOne-ID: 66987e1e-4cfc-11ec-b7dc-d0431ea8a283
Received: from [10.11.12.89] (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 66987e1e-4cfc-11ec-b7dc-d0431ea8a283;
	Wed, 24 Nov 2021 07:59:08 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
Subject: rust in SDK
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
Date: Wed, 24 Nov 2021 08:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 07:59:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158655

Hi,

I'm looking for information about how mature and tested it is to have 
rust tools in the SDK. In README-rust.md [1] there is a phrase "Once the 
Rust SDK support is added to oe-core..." which can be read that it is 
not ready yet. In the first bullet "What works:" it states "-buildsdk 
and -crosssdk" which I can't connect to oe-core terms.

I have suceeded to add rust tools to a SDK by adding 
'TOOLCHAIN_HOST_TASK:append = " 
packagegroup-rust-cross-canadian-${MACHINE}"' to my config. With this I 
have succeeded to cross-compile the simplest hello-world example for 
aarch64. Is this the way to go or is there work to do (reffering to 
README info)?

Any information around rust and the status in oe-core are appreciated.

Thanks,
/Peter


