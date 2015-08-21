Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA31060557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LDmmb2018677; Fri, 21 Aug 2015 14:48:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hiE204_0gT7e; Fri, 21 Aug 2015 14:48:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LDmXjk018641
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 21 Aug 2015 14:48:45 +0100
Message-ID: <1440164913.12105.236.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 14:48:33 +0100
In-Reply-To: <CAJTo0LYOCmMy_5L8qWxSfTveeevZkPZrYAjHMj4r_DViX1H+SQ@mail.gmail.com>
References: <1440144361-16138-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYOCmMy_5L8qWxSfTveeevZkPZrYAjHMj4r_DViX1H+SQ@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: fix the check
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
X-List-Received-Date: Fri, 21 Aug 2015 13:48:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-21 at 14:26 +0100, Burton, Ross wrote:
> 
> On 21 August 2015 at 09:06, <rongqing.li@windriver.com> wrote:
>         +       if [ "${@perf_feature_enabled('perf-scripting', 1, 0,
>         d)}" = "1" ] && grep -q install-python_ext
>         ${S}/tools/perf/Makefile; then
>         
> 
> So now of course Python gets installed, but not packaged:
> 
> ERROR: QA Issue: perf: Files/directories were installed but not
> shipped in any package:
>   /home
>   /home/pokybuild
>   /home/pokybuild/yocto-autobuilder
>   /home/pokybuild/yocto-autobuilder/yocto-worker
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
>   /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install. [installed-vs-shipped]

Note that this is even more broken since these are native python files,
not suitable for the target. Or at least native directories have been
used for what should be target libraries.

Cheers,

Richard



