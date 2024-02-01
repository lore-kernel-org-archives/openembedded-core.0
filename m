Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD28C47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 12:47:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14526.1706791669118980815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 04:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eHMIuut1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23627240002
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706791667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rEaKN2VlhKa379y79T4MkSTuN+QvxPBGByeYCttlLn4=;
	b=eHMIuut1Q6htLhgZXvwbBXdoBAQoBu/FqnX3ipPOM0aI+iW/epWR7cO0UK3d21AH61WpRo
	8Z4ccDYjF7FiUU1bU1FzfxHeonUgXu2QLSTYmc7RXa/rWqO1fABqFLfBvY+Ms5yRI2QQjw
	zQEhZtrijG1XqRGBdMcSb7sx160zsCH6HWfiT/PL3Wl3XrwG969MHB4pKXWhQQHoVpIg2R
	SMFsDv2f7rNlh6JN3LIGkCuvP8+r3dInvMYXZweRJbWsE4Vu+J1PztmBg2Zn+3XeiVsF/O
	WHzFZ49VD/jLrWhqLAZy6pa5FOzD44H1inFmOGLxuiBO2541A4GvJiYHP9p9vQ==
Message-ID: <c0b1cf77-830b-4838-a92c-cd0d70c1bb05@bootlin.com>
Date: Thu, 1 Feb 2024 13:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Shouldn't packages for all PACKAGE_CLASSES be generated?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 12:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194586

Greetings,

I'm surprised by this behavior, which I didn't expect... I'm running 
"bitbake core-image-cmdline-full; bitbake generate-index" from Poky master.

with PACKAGE_CLASSES = "package_ipk package_rpm package_deb"...

find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm | 
wc; find tmp/deploy/ipk -name *.ipk | wc
    1918    1918  129927
    1918    1918  135794
    5404    5404  393252

with PACKAGE_CLASSES = "package_rpm package_deb package_ipk"...

find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm | 
wc; find tmp/deploy/ipk -name *.ipk | wc
    1918    1918  129927
    5404    5404  393606
    1918    1918  135584

with PACKAGE_CLASSES = "package_deb package_ipk package_rpm"...

find tmp/deploy/deb -name *.deb | wc; find tmp/deploy/rpm -name *.rpm | 
wc; find tmp/deploy/ipk -name *.ipk | wc
    5404    5404  376187
    1918    1918  135794
    1918    1918  135584

So, more packages are generated to the first item in PACKAGE_CLASSES.

It's expected to have the first item in PACKAGE_CLASSES that is used to 
generate the image, but I expected all packages to be generated for all 
package types anyway. Isn't this the expected behavior? Otherwise, how 
would you generate 3 types of feeds (rpm, deb and ipk) at the same time?

Cheers
Michaell

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


