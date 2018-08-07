Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40C396E650
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 11:03:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w77B3olu030647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 7 Aug 2018 12:03:51 +0100
Message-ID: <2ccce963b9eab04f088362bcc1ef6262d2bd5e24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 07 Aug 2018 12:03:50 +0100
In-Reply-To: <20180802184352.20258-1-raj.khem@gmail.com>
References: <20180802184352.20258-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V3] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Tue, 07 Aug 2018 11:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-02 at 11:43 -0700, Khem Raj wrote:
> - its a general problem however observed on armv5te based boards in
> OE
>   other arches either have ways to compensate for misaligned access
> in hardware
>   or compiler does not use 8byte alignment
> 
> - fix internal linux headers
> 
> Full logs
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb34
> 9b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V3: Elaborate commit message
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This seems to cause runtime testing failures for qemux86 and qemux86-
64:

  4.137] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
| [     4.137] (II) LoadModule: "glx"
| [     4.138] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
| [     4.147] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: _ITM_deregisterTMCloneTable: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
| [     4.147] (II) UnloadModule: "glx"
| [     4.147] (II) Unloading glx
| [     4.147] (EE) Failed to load module "glx" (loader failed, 7)

https://autobuilder.yocto.io/builders/nightly-musl/builds/1208/steps/Running%20Sanity%20Tests/logs/stdio

Cheers,

Richard

