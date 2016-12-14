Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 988137720B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 15:37:44 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id j191so3111366ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=CXPGMV+yKq4s3ERZLiSkmWgCWrIsdGFBOcysI3avw3Q=;
	b=shcmTFfcjFV6yri+9z2hMMuaXSf791MkjOeVErFanwbr+iKF2qnEr2Dc4fkAyakjSb
	2UhSWREIBnss3BXNS8aI0GVPZyVwYssHLGFf3ErusnbKIt67t2bA6zjwcd7XIOx6PWB6
	PZxh6JG/ZU/EEqUfU76R2qJl6vtdrFPfKl9IVSBzGBAyVNmexW7v/N1lSJSvry1i8o62
	q2/CgjVBb9tARiQhMOlwjiEZnVMilEAX9vyhcRae96jB0fLYsRajbjBY5xgLPzMezhO8
	4aw4ImRZ7Ih0h+rToSAO0VlXTCZgh/dk3HrYxLOdKAnN9QaQHUAL/vuuUZza8HA5q43L
	hSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=CXPGMV+yKq4s3ERZLiSkmWgCWrIsdGFBOcysI3avw3Q=;
	b=LGE1ysPTAgXzbn/TKtl0gLi9GzmH8skiQm/rrNiKkcYrqwEI2jQMZ6GcVEN4zGy4aR
	l4w4/T3P1R34d7m7dHuAvhWT/xZHHNP+gxpDp7k/a7BW+nWm942zDI0jyz4wS3tW4NyB
	XaDtrxsJU/vYHS0UWFCEwavKP5JNHvZl9Nb5DBXUbxzy0QdQqTT5r9XbzzLdR+jbpl9j
	R5IPhX1ONpYGwkN/SfewRXIQXct99aPUC3dGfuzxyiqlo0/0k1TqjBKLmSnRMNjxP5m0
	NbMCaGkjR5lEWwFoFjSc4SKpBRgDAAAJTNohaloVHHd+Ygs1a0FBPH+z5LeHQNhIxqrs
	lDfw==
X-Gm-Message-State: AKaTC01/PjUUz/6BnYqANaSpt2aBKitD5oCQj40ryqV3NyemPnr3lVR9+QLryawpOhAafluR
X-Received: by 10.36.238.139 with SMTP id b133mr7775777iti.81.1481729866124;
	Wed, 14 Dec 2016 07:37:46 -0800 (PST)
Received: from pohly-mobl1 (p57A561C0.dip0.t-ipconnect.de. [87.165.97.192])
	by smtp.gmail.com with ESMTPSA id
	p71sm23100396ioe.33.2016.12.14.07.37.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 07:37:45 -0800 (PST)
Message-ID: <1481729863.1544.33.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 16:37:43 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: multiconfig + siteinfo.bbclass
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
X-List-Received-Date: Wed, 14 Dec 2016 15:37:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

While trying out a multiconfig with two configurations (one for MACHINE
= intel-corei7-64, one for quark) in custom Ostro derivative I got an
error while parsing recipes:

ERROR: /work/iot-ref-kit/openembedded-core/../meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb: Unable to determine endianness for architecture 'INVALID'

That error comes from OE-core's meta/classes/siteinfo.bbclass;

python () {
    sitedata = set(siteinfo_data(d))
    if "endian-little" in sitedata:
        d.setVar("SITEINFO_ENDIANNESS", "le")
    elif "endian-big" in sitedata:
        d.setVar("SITEINFO_ENDIANNESS", "be")
    else:
        bb.error("Unable to determine endianness for architecture '%s'" %
                 d.getVar("HOST_ARCH", True))
        bb.fatal("Please add your architecture to siteinfo.bbclass")

HOST_ARCH is set to "x86_64" when not using BBMULTICONFIG in local.conf.

It's not specific to that recipe, everything using siteinfo.bbclass
seems to be affected. OE-core is d62f18c3 and bitbake is b65a81933 -
both fairly recent, but not quite master. I don't see any relevant
changes since then.

However, I can't reproduce this with just Poky :-/ Any suggestions?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




