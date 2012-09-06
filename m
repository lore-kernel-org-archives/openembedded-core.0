Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9cgh-0006rH-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 16:04:08 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 06:51:42 -0700
Received: by obblz20 with SMTP id lz20so2606124obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 06:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yGCde8QduzBisPA1MRk3R7l1zxeGWUiI4PkQXimv9fA=;
	b=T/CwMQL0jHZZZDJKXebjMPXYvfa+rO8AZUCyytAxM+omhxrD3+GEHsLBsSv+A0Xeoa
	3/cSoPbcHmjFDDzOA3BOT3epEF7/g+HxJ581VihoqTyEJnK804l8SLMPtitCbMmp3lc+
	kFY7SoxSHAA5WxR0ABNTKNPiPCIkKJQbb5rM3XwnYbglocgf5XjI+8thTRyWnFewOXy/
	kFoCi1XowVFGbffFXQ8XqKSMnpBNU97eDwLfDTH3OiXQrhvnB+nrJoGonbYp4NjntwnR
	YnyxwSdcu+39ROpSx6BQSvyG0RgZC4/XjcTbHJTINe9AV6DXtRKSczrrBA2flvz88umu
	dROw==
Received: by 10.60.30.168 with SMTP id t8mr2125058oeh.89.1346939501267; Thu,
	06 Sep 2012 06:51:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 6 Sep 2012 06:51:21 -0700 (PDT)
In-Reply-To: <644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2012 14:51:21 +0100
Message-ID: <CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlwh+nCCxMkbpp9f9ZBFvlx/1OYlpCUkvffcsYL8U+NERtM3rW4KlFHQCbfxpkle5tOTkOU
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] opengl / libgl / libgles
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 14:04:08 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2012 14:25, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It's not automatic, but you can do something like this:
>
>         http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=23b02134
>
> That recipe ships multiple copies of the libraries to account for different silicon revisions (the shader compiler will offload different things to the CPU), but we don't want the shlibs code to pickup the copies. So for mesa you can do:
>
>         PRIVATE_LIBS_${PN}-dri = "libGL.so"
>         RPROVIDES_${PN}-dri = $magic_python_function(PACKAGE_CONFIG, sometthing, something, libgl)
>
> And in the recipes that link to a GL lib you do:
>
>         RDEPENDS_${PN} = "libGL"

Ah, interesting.  I'm not entirely keen on the manual dependencies but
that's certainly a step in the right direction.

If automatic replacement dependencies were added to bitbake, how would
you implement them?  In Debian, libgl1-mesa installs a
libgl1-mesa-glx.shlibs file with this contents:

libGL 1 libgl1-mesa-glx | libgl1

"when linking to libGL.so, use the dependency 'libgl1-mesa-glx |
libg1".  All packages which contain libgl.so.1 have Provides: libgl1,
so they are interchangable.

Some way of expressing that in the bitbake recipe would be great.

Ross


