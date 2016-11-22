Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7447B6093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 09:05:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t79so13442729wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 01:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:cc:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=PctfqYiYrpoUrmI0ri7mVPiFX14pWmVPjAPJWiNedM0=;
	b=KEemIy4udHwfDP47u9UBy876BiXaM0pJiIFByTW5aHX3crdZomUTRbIZhepx8/v3+o
	UQNZyD4ItEMnzhTkAktayvbR2wFDfEdvH737TZ0ektq3V3nKm8k2MkAUXlmRrl0s0i5T
	+c3Txnl4vTYpjKKQXiYcT337lHNKKDmz4N0PzDG9gIKr5bNQlLA23tWt4AdL6I6KMJmM
	dSMZEpzRjb4Sd3sj9JygvMd+twsaPpZ1YidRFMq5G/TvUs4bqn5hkeSs2o7rQ9H9cFE4
	nNOz9YiotndOau6yCQrWpGTMwzhgGHev1Jjz9CzxxKxGVVdnqWiUu7I6fdLNjL1f6Kmk
	x34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=PctfqYiYrpoUrmI0ri7mVPiFX14pWmVPjAPJWiNedM0=;
	b=IonM2qhc45HfPvsKwqhiT+l5Xccij/oqW8bbin/6hN9DEKJnZYsCw/sOb3F7h3gV1d
	6p1/dfC4M//imjYVrpl+597RXS3kM5i+PVQeJppqPlpAMH7fEw2P1CK2rX/B3WxXDKll
	XWugdv1I6OuaXnTW9VOurP29qfGnLx+oo/E7bkqFL4PUXvkxGyJKWDJNMvW955bKFyi1
	hITOIGIarMCDfU0w5F6MOC58/STbaSIYvCoEXO+YC47CSMNsHhp9aCZwgvCS2XckPEnp
	IVssvLbj2s58oUG9LliphWTWgK2XphoROYnXtnAzfwJxuHwo2agX0GoyrWsAIT5Sx2Bs
	iKtw==
X-Gm-Message-State: AKaTC03Ylh2xuFyb13lBKR90NVk2Sif9JW6tAKdtOH/V97CotbN//GQpuj2fXka3RBIo4Q==
X-Received: by 10.25.216.28 with SMTP id p28mr3971037lfg.16.1479805523410;
	Tue, 22 Nov 2016 01:05:23 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	89sm6124793lja.16.2016.11.22.01.05.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 01:05:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
Date: Tue, 22 Nov 2016 10:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: Contents of non-rootfs partitions
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
X-List-Received-Date: Tue, 22 Nov 2016 09:05:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hey

In Mender we are using a dual rootfs partition layout (A/B layout) with a persistent data partition on the side. We're using wic to do the actual image building.

However, putting files into this data partition is not a straightforward operation ATM. All recipes in OE put files into the rootfs only, and we'd like there to be a way to specify that files should go into the data partition.

I haven't seen any straightforward way to do this in OE. Some suggestions for how it could be done:

* A "DATA_FILES" variable (like "IMAGE_BOOT_FILES"), where you can list files you'd like to be included. This is very straightforward, but has the disadvantage of being a bit hairy when paths are involved, and it doesn't allow for much logic.

* Keep a special "data" directory, something similar to sysroot, where recipes could install files into in order to have it included on the data partition. We could potentially have a bbclass for use in recipes to make this more streamlined.

* Have a special recipe that users can bbappend, which specifically install to the data partition (this might also need a "data" directory, like above).

It's also possible that this should be generalized further so that it doesn't only apply to a data partition, but to any non-rootfs partition.

I'm willing to invest some time in this, but I thought I'd gather some opinions first.

Thoughts?

-- 
Kristian

