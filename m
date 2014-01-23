Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 719336DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:17:37 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so1058608wes.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=X4FmgUJVgWY8mAYbffugKEILqY5nPxl6Oft5oeAr8jE=;
	b=ksVV2Nr4VQdVsYl1l+f6QP8fGhci5tHFXfU9XdROVw5cB41lSY2x5JTd3KeMA6diVv
	gnTH5MQX8KrBO8tFMFthSnu88bg9RzmnxvBLr8lfEXWw0Ch+9MLwh0GoOXVvrFd4ESXZ
	wTd8mUnLPP5zl87K2ga8K4Y4bxs+v/waenx2NFDqnWfTjXg/jopCf+Ansywo9mDMIz3+
	A2Q2l2RlkjnTJfOBeaFiiKfluE4IUM6eYlQKiLlH4oyW40aaSeT2IFnZ6lmlePd07Bke
	OSAt2cUmsWEHgaRAUe2gf0sVrsiFsVobK2j6Lfx0uCZ/D2HG+80FK7oIs4X/ZQnfSXF9
	OMvw==
X-Gm-Message-State: ALoCoQk017PdPAKNcx5WzAIrZH5PTR25rpItzsHekkNSVSMrBbciYGBoju7LP3JxsVA3RyDQPZQ/
X-Received: by 10.194.86.130 with SMTP id p2mr183630wjz.88.1390479458066;
	Thu, 23 Jan 2014 04:17:38 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	jw4sm21881452wjc.20.2014.01.23.04.17.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 04:17:37 -0800 (PST)
Message-ID: <52E1085F.3060607@linaro.org>
Date: Thu, 23 Jan 2014 13:17:35 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] 'EFI' machine feature
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
X-List-Received-Date: Thu, 23 Jan 2014 12:17:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While working on the ARM support for GRUB I noticed that the EFI support 
in OE-core is a mess. A lot of it is due to GRUB insisting on its 
byzantine config/install/skynet system and the rest is due to the 
EFI==x86 assumption.

To improve this I'd like to start with adding an 'efi' MACHINE_FEATURE, 
which will:

* Mask non-EFI configs like grub-pc/grub-uboot
* allow PACKAGECONFIG instead of distro/arch/machine overrides in grub2
* Activate logic in image classes to create a GPT EFI System Partition

Further steps to address EFI support would be:

* integrate gummiboot into OE-core (meta-intel has an old version)
* deprecate grub-(not really)native
* create an efi bbclass that does the above ESP dance and knows how to 
populate it further e.g. grub.cfg and bootloader-spec entries for gummiboot.
* postinst magic to update bootloader config on kernel upgrade

Opinions/Flames/ACPI rants?

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

