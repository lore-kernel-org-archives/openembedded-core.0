Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751AFC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 18:53:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.30928.1743015195226817197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H9yabG2r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3082B442AD;
	Wed, 26 Mar 2025 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743015193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wW8seBOdstTzhLncf9vPqXzFCUt8zTwkN6hWflYZkE0=;
	b=H9yabG2rK/1LkkvsS3smNrE+MYemOfEjV8f520QMjihNETm4aeDIXcUEG2HNUIIFOTBWvN
	Nllv4RJmIguX+1BOk8L/i+9oyNFfCkcD4VIkpk7j8FLqKIQa87GKZsxpkpUvX3jkhFiPXE
	hXDrnlgpckhhFPwrY1bt3kci3X74lt42ahZQD1UrVY6tVt3FY8Z55bUchhNs+vYi0Pl339
	Sf/dyUZ2DiPDKFe5/HyEw42nUB4BxxprRYW7XPfmP5hMXBwU+pYfLUkScaEfspiodVHOCF
	6cfJqRWV1RkLd99ME68F/MtCQxr1hSctWqFv1RsTMZZ5ACnhMEknmCIBIxo7qA==
Message-ID: <7d04bf14-4b4d-4027-b2af-d045d21a6ab0@bootlin.com>
Date: Wed, 26 Mar 2025 19:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Khem Raj <raj.khem@gmail.com>, richard.purdie@linuxfoundation.org
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [scarthgap] recipe's sysroot misconfiguration in multilib
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeifedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvvefhufhotgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvdefjeeggfeftefgledvhfejfeeujeffhfekffdthefghfetjeegleevjedtueenucfkphepvddttddumeekiedumedvtddtmehffhgttdemtgehiedtmeekhedufeemgeejvghfmeekheehfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemvddttdemfhhftgdtmegtheeitdemkeehudefmeegjegvfhemkeehhehfpdhhvghloheplgfkrfggieemvddttddumeekiedumedvtddtmehffhgttdemtgehiedtmeekhedufeemgeejvghfmeekheehfhgnpdhmrghilhhfrhhomhepjhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhho
 hhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 18:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213656

Hello,

(Just in case, I'm re-sending this email as the first one bounced back)

I have been trying to set up a multilib environment to generate 
libraries built with Control Flow Integrity support. The gcc toolchain 
is already patched to support this custom multilib ABI, and it is indeed 
capable of generating binaries with the CFI flags.

I am, however, facing this strange issue where a header is not found in 
the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given 
package (e.g., zstd), and do_compile task fails:

libcfi-zstd/1.5.5/libcfi-recipe-sysroot/usr/include/c++/13.2.0/cstdint:38:10: 
fatal error: bits/c++config.h: No such file or directory
|    38 | #include <bits/c++config.h>
|       |          ^~~~~~~~~~~~~~~~~~
| compilation terminated.
| make: *** [Makefile:248: Options.o] Error 1

The strange part is the header is there:
libcfi-recipe-sysroot/usr/include/c++/13.2.0/riscv64-freedomusdkmllibcfi-linux/bits/c++config.h

Another strange aspect in this very same context is: the 
recipe-sysroot-native seems misconfigured and incomplete. For reference, 
let me use libcfi-zstd/zstd again:

zstd/1.5.5$ ls recipe-sysroot-native/sysroot-providers/ -l | wc -l
66
zstd/1.5.5$ du -sh recipe-sysroot-native/
457M    recipe-sysroot-native/

libcfi-zstd/1.5.5$ ls recipe-sysroot-native/sysroot-providers/ -l | wc -l
27
libcfi-zstd/1.5.5$ du -sh recipe-sysroot-native/
194M    recipe-sysroot-native/

Unless I'm missing something, shouldn't I have roughly the same values here?

Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
'GCCMULTILIB = "--enable-multilib"' to gcc-cross.inc, to enable multilib 
for the cross toolchain. Could I be missing something, maybe with
recipes-devtools/gcc/gcc-multilib-config.inc?

Any help is very appreciated, and please excuse me for such a text wall.

-- 
Best regards,
João Marcos Costa

