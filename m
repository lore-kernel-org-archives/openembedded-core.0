Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 86D066013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 12:35:44 +0000 (UTC)
Received: by labjg1 with SMTP id jg1so34670486lab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6KnEGk66rw3neBqBJIg24vRLCdzh9qxYThfaFTYpPUU=;
	b=jSgeBKxM3uV6HiseojKihqsTC5Ltih78PNFMYt3JdVBGxtFDw1OBMHTKwlS8jzAhsZ
	6iBudWv3eQtlMunVE6mnlfP7vae/Aaoi2wsDQd937uUHGD/RKh9HKkNjFGUYsoGnS4Uw
	Uq+DmocJz59TJ1/fNYRVHVRuwEd6STCMtAhJuqQn763VuPBf8ncvovsBOd4UoXFTThAR
	2Uqma+AELtXhL+F5g/jwlCrlT6h7kpnnKXXEn+gyrOj+3nwLbla+QyQB8tIbVmxY0nQk
	lh0vZ+3vCEzj51end/x+buk3ONS1PyOYxrJOEjVng5TBk89jFPLCPxO0+Ozq7FMNhNj8
	mxjQ==
MIME-Version: 1.0
X-Received: by 10.153.8.135 with SMTP id dk7mr63202582lad.93.1426682145169;
	Wed, 18 Mar 2015 05:35:45 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Wed, 18 Mar 2015 05:35:45 -0700 (PDT)
In-Reply-To: <1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
	<1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
Date: Wed, 18 Mar 2015 13:35:45 +0100
Message-ID: <CAC1BbcTHOXPNLyWBLYkNW5=4qMRGjF=XgMB=R-nZ=PSfCJA0hw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v2 PATCH 3/5] bootimg: Skip iso image build on aarch64
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
X-List-Received-Date: Wed, 18 Mar 2015 12:35:50 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2015 at 12:27, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> To generate bootable ISO image the x86 architecture uses syslinux package (syslinux/isolinux.bin).
> We have already skip the syslinux package on aarch64.  Hence skip the iso image build on aarch64.
>
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> ---
>  meta/classes/bootimg.bbclass |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index ed7b32f..5a8e70c 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -33,6 +33,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
> +NOISO_aarch64 = "1"

how does that help !COMPATIBLE_HOST (of syslinux) except aarch64?

I meant you to
def mycheck(d):
  h = d.getVar('COMPATIBLE_HOST', True)
  if h:
    t = d.getVar('TARGET_ARCH', True)
    if re.match(h, t):
      return 0
  return 1

and use that to set NOISO ?= "${@mycheck(d)}"
(modulo typos and testing)

I think something like that should work and i think this would be
preferable to adding all those upcoming NOISO_baz
See what i mean?

thanks,

