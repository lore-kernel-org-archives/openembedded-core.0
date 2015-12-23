Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id CE7456080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 20:49:45 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p187so158296109wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5jHKslAVof/Z/gzJCli6Tr3CAo1frZs2EIWpeC7tVKk=;
	b=ZLJqFmsMc9O68TpBCQs4BZbWKHF3itrr8R8ka6Eomwl7+8UcfD3aClvXEaOc+L6hL/
	qRYuKNeo7ZDLbu+6spWMVa8OyT+DqNMwaPkfs1E+3ZkRHDDq0w1ywxA4AbtyUXrn2+g3
	obuGqtdRHqCjFlxiyALXCikQqR9lno5ydJTFTQodnhqls/+NgbD+bkoccsN6DZ/zgDoo
	3cXycWu6si6DLErHrADjw3/fnk2DWp/rC6aC8imx2LBMYCsC44DauQud+GSpdouiSG3R
	myXW3sFDFM3dEFylyfiISAX8TXB2WYxCRH+zSwYjAPBx+Gg1mXqzT9Oiypm5LY8ozjKK
	9KiQ==
MIME-Version: 1.0
X-Received: by 10.28.98.133 with SMTP id w127mr6938923wmb.4.1450903786107;
	Wed, 23 Dec 2015 12:49:46 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 23 Dec 2015 12:49:46 -0800 (PST)
In-Reply-To: <CAJTo0LYLr=Qq1ETPdwTyjGddUNmuZvx+z7GtzTM5-N+EeNcHkQ@mail.gmail.com>
References: <1450827499-32386-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYLr=Qq1ETPdwTyjGddUNmuZvx+z7GtzTM5-N+EeNcHkQ@mail.gmail.com>
Date: Wed, 23 Dec 2015 12:49:46 -0800
Message-ID: <CAJ86T=XDVLVzraADPy6O=9SiKpcZai__8m9VY=8DCEC4u=RHrw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update 4.10 -> 4.11
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
X-List-Received-Date: Wed, 23 Dec 2015 20:49:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 23, 2015 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 December 2015 at 23:38, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Noteworthy changes in release 4.11 (2015-12-21)
>
>
> They forgot to mention "breaks on the yocto autobuilder". :)
>
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/strace-4.11/tests/ksysent.c:45:24:
> fatal error: syscallent.h: No such file or directory
> | compilation terminated.
> | make: *** [ksysent.o] Error 1
> | make: Leaving directory
> `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/build/tests'
> | ERROR: Function failed: do_compile_ptest_base (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/temp/log.do_compile_ptest_base.18605)
>
> Did you test with ptests enabled?

Not for x86 :-(

Error is due to do_compile_ptest() forcing ARCH="${TARGET_ARCH}". The
tests Makefile uses ARCH to setup include paths but there isn't a
direct mapping between OE's arch values and the ones expected by
strace. In this case ARCH should be "i386" in order to find the header
file correctly, not "i586".

Removing ARCH="${TARGET_ARCH}" from do_compile_ptest() and letting
strace auto detect fixes the build failure.

Forcing ARCH was introduced here:

  http://git.openembedded.org/openembedded-core/commit/?id=af76eb0405352d66dfd00d7f856f401d892855e1

But I'm not 100% clear what the original problem was though, so I'm
not sure about just undoing that change without some more
investigation. Any thoughts?


> (full log at
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/235/steps/BuildImages/logs/stdio)
>
> Ross

