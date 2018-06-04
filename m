Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8D64B7546D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 22:59:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 15:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,477,1520924400"; d="scan'208";a="44634819"
Received: from mmuhamm2-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.213])
	by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2018 15:59:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 05 Jun 2018 10:59:07 +1200
Message-ID: <2113513.UM95QSBf6H@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Mon, 04 Jun 2018 22:59:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Friday, 1 June 2018 2:23:59 PM NZST Trevor Woerner wrote:
> Earlier today I was working on recipes for some software which recently
> added the feature to dlopen() one of a couple shared objects based on
> various conditions. But instead of dlopen()'ing the SONAME, they were
> dlopen()'ing the raw .so file. OE's default packaging, of course, added the
> *.so.0 and *.so.0.0.0 files to the ${PN} package, and the raw *.so files to
> the ${PN}-dev package. So when the app tried to run, it failed.
> 
> Investigating, I realised there were two things I could do: 1) add the raw
> *.so files to the ${PN} package (with INSANE_SKIP += "dev-so") or 2) fix
> the app. I decided to try #2, with the help of devtool.
> 
> I made one small change to the app, "devtool deploy-target"'ed it, and,
> AMAZINGLY, everything worked!! Wow, what luck! ... or not.
> 
> Investigating, I discovered that "devtool deploy-target"'s only mode of
> operation is to upload the entire recipe's ${D} directory (i.e.
> ${WORKDIR}/image) to the target! I hope you'll be as surprised by that as
> am I. Considering ${D} includes *.a files, man pages, raw *.so files,
> pkgconfigs, (... thankfully it doesn't also include the -dbg packages) that
> is a lot of stuff to be uploading to the target, a lot of wrong stuff, and
> in my case that hindered my work. Most target filesystems are only 10%
> larger than required to hold their contents, so uploading static libraries,
> man pages, pkgconfigs, etc is not great.

This is intentional. The reason we do it this way is it frees the user from 
having to resolve any packaging issues that might otherwise prevent them from 
actually getting early development code onto the device to test - package QA, 
but also what if important files simply aren't in the right package? The user 
will then have to go and figure out how to fix that before they can get any 
further. devtool is supposed to shorten people's development cycles, 
especially if it's early in development and they tend to be a bit less patient 
to see something working on target.

Now, I appreciate that the flipside of the same coin is that there are issues 
we might pick up as part of package QA that would be helpful to highlight to 
the user (e.g. binary architecture was wrong), so it may be that we should 
revisit this, but I wouldn't want to wholesale switch over to packaging output 
by default - we'd need to be a bit more careful about it.

I will note that a small issue with your patch is that if you do use --package 
you can no longer just use devtool build to build what you need to deploy, 
since that only builds up to do_populate_sysroot / do_packagedata. This in 
turn means that you can't use this option within the eSDK as you can't 
conveniently run bitbake there (again, intentional).

I'm not violently opposed to this patch, but everyone does need to understand 
what the caveats are so we may need some extra notes in the help text at a 
minimum.

> I checked at the time, but I'm not 100% sure now, but I believe if one
> deploys two packages from one recipe, the on-target file gets appended. But
> now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
> reminder). 

The way I recall writing it, it will remove whatever it deployed last time, so 
I would be surprised if it were incremental.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre



