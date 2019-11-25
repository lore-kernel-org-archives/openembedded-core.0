Return-Path: <mac@mcrowe.com>
Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
	by mail.openembedded.org (Postfix) with ESMTP id BA9C37F857
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 15:34:16 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id ZGNOidn28SXPqZGNPiFPHl; Mon, 25 Nov 2019 15:34:17 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=MeAgGD-zjQ4A:10 a=Q2qzCmMbANTYpvSMx2MA:9
	a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=auptGTlbGQybQOyYzp+An7y8kzpCwFwyAWd3QYEd1lI=;
	b=Vw
	B09q/Hlk32uhlJVzSVy+dGim6zwZG764PCEiQkDzgtn9RlzCxycqMsKV8A0Zfu2qDPcmUZJobq0T2
	J6btVkm/fa5I2FBVPyrIooX/J3P8Y9sX9K6xmc8aI6zeWzeOBUwrDXCO2JlwMod2xvaFnSxM1jP/G
	7UzIotS0KD3Vaydfqwoc6NyKUhBuy/9mF9pAVA42S0Ovb1Vfdvkspwmwyc4pAVDvOlbx5w8C7be6j
	kwHKWcT6NPU07mEWaHnyj2qtN1CdtFi1Ta6FxmacMl2rvZKgNIYYlxcM/j0FmSg6KtHD4G9q49Se2
	YNEFjoOxrsgk+2emAgKO8eTf1el6zn6A==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>) id 1iZGNO-0000xz-OC
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Nov 2019 15:34:10 +0000
Date: Mon, 25 Nov 2019 15:34:10 +0000
From: Mike Crowe <mac@mcrowe.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20191125153410.GA31863@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfLUCwBMRcmW11fZLN9bt2hRECb1EXoZd6lSBIFKYX9l8MlQDVcLnUryRhe2//qEVd7upgwoHpRAFJzitJU4Y2um77nO/mx6alfOwIh6x6PDo6q4D5oXt
	g3ND9vEul0+mgvpwQZrjfgAG+mB3QwPqnV0YCI2oKxZR1HMRkc+odtxJ
Subject: Using kernel device tree when compiling U-Boot
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
X-List-Received-Date: Mon, 25 Nov 2019 15:34:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'd like to use a single set of device tree sources for both the kernel and
U-Boot. I'd like to take the dtb files generated when compiling the kernel
and use it for U-Boot. This means that I need to able to find them from the
U-Boot recipe - ideally without having a list of them there.

So, I thought that I'd teach my kernel recipe to install the device trees
in the sysroot. I ought to be able to do this by adding

  SYSROOT_DIRS +="/boot"

to my kernel recipe. Unfortunately, kernel.bbclass contains:

 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 sysroot_stage_all () {
         :
 }

which stops this being effective. This code predates
80e7e7f78d957b8159bede2a5cd5614d8d73039c. Would it now be more appropriate
to influence staging.bbclass's behaviour by setting SYSROOT_DIRS_BLACKLIST
to fix the mentioned clashes? Perhaps the invention of recipe-specific
sysroots might mean that these clashes no longer occur?

The device tree dtb files are published to the deploy directory. I could
try to grab them from there, but even apart from having to deal with the
symlinks, it doesn't feel quite right to do so.

Or perhaps I've missed a much simpler way to solve this problem.

Thanks.

Mike.

