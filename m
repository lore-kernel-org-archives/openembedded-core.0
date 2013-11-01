Return-Path: <janis.coders@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 705006CCC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 13:56:13 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id el20so3417183lab.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ZIsVwRJr9gjFcufICjyOmJrNh85GpaW71LlS9uohRkA=;
	b=UHCrPNYysj68ngA1aP8Z5/43B+rVxqPDXqf9kivZOYUFNhzpV+3HL2zXUX/cNEG9T8
	1Y5Q8fyexxbSLPzpkohy7lx83vMqZsdbtn63vixVm6LQdmCeSrIsr06A6olBYsutAtEk
	gIVIlIalvWTc0l+t+ZGHOSqEHYaD//SbmsIHp+PhwWS6VUU8wztNPVQ4Vqc8vKfPFdEP
	ZgRP9VVf0k9ndMINqSj4ZbxDZlxfQC4NMFc0BU5L/udjB6ewUQ2ZSKzL/yh6Q7vKjoDJ
	n8Pu/Qgr83/Z6xGTBc/2xVSBgmhx0MAh01vJ7XmdUgxn8hHnXMfXBhj1yuTAbIuE/EZh
	rBKg==
X-Received: by 10.152.5.162 with SMTP id t2mr2067654lat.1.1383314174106;
	Fri, 01 Nov 2013 06:56:14 -0700 (PDT)
Received: from [10.0.1.5] ([80.232.254.7])
	by mx.google.com with ESMTPSA id oc1sm6479604lbb.3.2013.11.01.06.56.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Nov 2013 06:56:13 -0700 (PDT)
Message-ID: <5273B339.6090700@gmail.com>
Date: Fri, 01 Nov 2013 15:57:13 +0200
From: Janis Coders <janis.coders@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Patch file search order in DORA (1.5)
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
X-List-Received-Date: Fri, 01 Nov 2013 13:56:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi, I am working on Freescale's BSP with my custom layer which overrides 
(appends) the Linux kernel's recipe.
In version 1.4 my custom recipe's defconfig had priority over the 
'original' layer's defconfig, but in 1.5 the priority has
changed. After some debugging I found out that seems like order of patch 
file searching has changed in version 1.5.

Order in 1.4 (example):
DEBUG: Searching for defconfig in paths:
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/arm
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/armv7a
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx5
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx53
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
/home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/
/home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/arm
/home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/armv7a
/home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/mx5 

     ......
Order in 1.5 (example):
/home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/poky
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/poky
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/poky
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/poky
/home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/imx53be
/home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/imx53be
     .........

Was this intended and specially changed in version 1.5? Because now I 
have to move my defconfig one directory deeper
to get the priority.


