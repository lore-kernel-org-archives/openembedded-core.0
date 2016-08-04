Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E6DA273212
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74K4Ro5002941; Thu, 4 Aug 2016 21:04:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qimoT5on1WWo; Thu,  4 Aug 2016 21:04:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u74K4OJl002938
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Aug 2016 21:04:25 +0100
Message-ID: <1470341064.8166.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Aug 2016 21:04:24 +0100
In-Reply-To: <1469820963-6667-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1469820963-6667-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] patchelf: Update to version 0.9
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
X-List-Received-Date: Thu, 04 Aug 2016 20:04:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-29 at 16:36 -0300, Fabio Berton wrote:
> Remove patch maxsize.patch already applied upstream.
> 
> Add patch Skip-empty-section-fixes-66.patch to prevent errors like:
> 
> ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene: '('patchelf
> -uninative',
> '--set-interpreter', '/home/user/src/prj/build/tmp/sysroots
> -uninative/
> x86_64-linux/lib/ld-linux-x86-64.so.2',
> '/home/user/src/prj/build/tmp/
> work/x86_64-linux/go-cross/1.6.2-r0/sstate-install
> -populate_sysroot/x86_64-
> linux/usr/bin/aarch64-prj-linux/go')'
> failed with exit code 1 and the following output:
> cannot find section .rela.dyn

For reasons I haven't looked into, this causes all the ESDK tests to
fail on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/9
03
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/
877
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
90
https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/8
90
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
s/908

This can't really merge until we figure out what happened here :(

I was able to reproduce locally with:

bitbake core-image-minimal -c populate_sdk_ext
bitbake core-image-minimal -c testsdkext

Cheers,

Richard


