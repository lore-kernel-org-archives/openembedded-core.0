Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 922A4780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 06:24:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8M6OG0Z006808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 22 Sep 2017 07:24:17 +0100
Message-ID: <1506061456.18640.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 07:24:16 +0100
In-Reply-To: <20170921174216.33386-2-raj.khem@gmail.com>
References: <20170921174216.33386-1-raj.khem@gmail.com>
	<20170921174216.33386-2-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] go: Remove mips32r2 from march to get cgo working
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
X-List-Received-Date: Fri, 22 Sep 2017 06:24:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-21 at 10:42 -0700, Khem Raj wrote:
> on mips, cgo used mips32r1 and that conflicts with mips32r2
> lets remove it for now and work go upstream to make it work
> for golang as well
> 
> Fixes
> > 
> > # runtime/cgo
> > cc1: error: '-mips32r2' conflicts with the other architecture
> > options, which specify a mips32 processor
> Fixes [YOCTO #12108]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/go/go-common.inc | 4 ++++
>  meta/recipes-devtools/go/go_1.9.bb     | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)

I think this causes:

https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/486/steps/BuildImages/logs/stdio

| # /tmp/go-build282041009/libstd.so
| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-poky-linux/go-runtime/1.9-r0/go/pkg/tool/linux_amd64/link: running i586-poky-linux-gcc failed: exit status 1
| /tmp/go-link-130351246/go.o:(.data.rel.ro+0x36bfcc): undefined reference to `main.init'
| /tmp/go-link-130351246/go.o:(.data.rel.ro+0x36bfd0): undefined reference to `main.main'
| collect2: error: ld returned 1 exit status
| 
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-poky-linux/go-runtime/1.9-r0/temp/log.do_compile.29509)
NOTE: recipe go-runtime-1.9-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/meta/recipes-devtools/go/go-runtime_1.9.bb:do_compile) failed with exit code '1'

Cheers,

Richard

