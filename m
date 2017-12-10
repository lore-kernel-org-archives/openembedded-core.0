Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C7BF877F90
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 12:32:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBACWkbv001052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 10 Dec 2017 12:32:48 GMT
Message-ID: <1512909166.19417.134.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 10 Dec 2017 12:32:46 +0000
In-Reply-To: <cover.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 10 Dec 2017 12:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-12-04 at 10:39 -0500, Bruce Ashfield wrote:
> Here is the latest set of kernel updates and bug fixes to the kernel-
> yocto
> build.
> 
> The 4.9 and 4.12 updates are routine -stable updates. I realize we
> are
> still fighting some boot/hang issues with 4.12, but I didn't see any
> new issues with the 4.12 updates, so I included them in this pull
> request.
> 
> I've also included Saul's in-tree defconfig fixes + one additional
> patch
> of my own.
> 
> I also bump linux-yocto-dev to 4.15-rcX, which brought in some build
> issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I've
> added the new dependencies directly in the linux-yocto-dev recipe,
> but
> they will very likely have to move lower into the stack over time.
> 
> I have some additional, structural changes that are coming shortly,
> but I'm traveling for the next 5 days and will send them when I
> return.

I tried this series, minus the -dev kernel change in -next and we see:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/676/steps/Running%20oe-selftest/logs/stdio

The duplicate logging bug makes it hard to read but the key takeaway is:

2017-12-09 10:49:53,667 - oe-selftest - INFO - Ran 317 tests in 14099.939s
2017-12-09 10:49:53,667 - oe-selftest - INFO -  (failures=16, skipped=1)

I can reproduce easily with:

oe-selftest -r runqemu.RunqemuTests.test_boot_deploy

which fails locally too. If I revert "linux-yocto/4.12: update to
v4.12.16" it works.

The test checks if it can login over the serial port so I'm guessing
some serial driver either got turned off or regressed?

Cheers,

Richard



