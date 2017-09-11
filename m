Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9470860107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:48:47 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 108so12989298wra.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=6hS+CevHc+/8nmxRQSxQleyD8uI1bo4BgRpy+x45QBQ=;
	b=1QxTaO/sukjf437cDFBG8ml+VbULn2URGZ8eltoD6VMMaA091zRaSlIBueIAtC7bxw
	R7Zf3Vcf26PNk/it3SlSAfsfWgF6E5Gzij80I++evy+qD7xiaD88twyTh4N3vPQl4+rl
	TdqJl4Nd1ie6QNCVnQ+XrtWh5NYsBfIuuCULT/0HmC9ohbcbZhsEOPjMx9KKTCNZVnxv
	ydEVFV/ZXQ4KEIUAY1iJnTl7gQ15G2QYtTZxcFXl08XP0zkd19Xt/YPQQvZfVeVko0Lj
	GNNFNAadf7wWg61gqLK8uLG5jdATBz8xDtYZ3vXwaxO7FU2wcmK99nRJfB7TpegT40Fi
	uIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=6hS+CevHc+/8nmxRQSxQleyD8uI1bo4BgRpy+x45QBQ=;
	b=BY262ZQVDVuafwq7CcmjkjTWDCus0vvxLWPIRtce31INP6JA9V0tdsGDUMLw/Bv/xj
	TYztro/839wcr29ILEQRcZbWyn34M/S7uQXVMSOmwUaM5bW01MTWFsDTYfcFFp8sBLBw
	WMILlqs1cncZ6E/OJ7nD+26ZLLuvQvJP9z1qjiAGlgXqk/tgaygLJgcKmGbybfJP+WPG
	Ea8x3aorduTw5p6JYKBTOiLYy6UJZFr0lqS/rEKXSENyfqL41oCK0YXwPbBjT6Z+pJin
	OxWWNBK+GWg1zyqypvjvYqRP27K8wR4+G5Iu3p/2VRy6SBwfo8OUr58qmkD+E8qs6R24
	AXiA==
X-Gm-Message-State: AHPjjUggu04ioxO3fOfZOcOT98zohr+I3JczCFiAsLNy6OkGBhbetsL9
	+CHX64AQDLRoLdH7
X-Google-Smtp-Source: ADKCNb6XJ8fswJXcQE1KJj61WXWU4WaiLVFgmjXiKcr+RRYOY5D9y3jsEWo5hEbVKxh/QfzpQjrPvA==
X-Received: by 10.223.161.194 with SMTP id v2mr8429429wrv.45.1505119728399;
	Mon, 11 Sep 2017 01:48:48 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F185.dip0.t-ipconnect.de. [93.232.241.133])
	by smtp.gmail.com with ESMTPSA id
	n57sm1231695wrn.29.2017.09.11.01.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 01:48:47 -0700 (PDT)
Message-ID: <1505119726.9633.18.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>,  OpenEmbedded
	<openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 10:48:46 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: hidraw support in the kernel(s)
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
X-List-Received-Date: Mon, 11 Sep 2017 08:48:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I am currently trying to get fwupd [1] working. For updating a Lenovo
Unifying Dongle (the USB thingie which connects to wireless mice and
keyboards), the kernel has to support hidraw, aka CONFIG_HIDRAW,
otherwise fwupd does not find the dongle.

http://www.signal11.us/oss/udev/ is an article that seems to explain
the underlying API used by fwupd. Other apps might also need it. The
recommendation is to enable it unless there are reasons not to do so:
http://cateee.net/lkddb/web-lkddb/HIDRAW.html

So is there a reason why CONFIG_HIDRAW is disabled in linux-intel and
(presumably, I haven't checked) linux-yocto for intel-corei7-64?

What would be the right way of enabling it? On by default as part of
some existing kernel feature perhaps? Or a new feature?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



