Return-Path: <ross.burton@intel.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id B7BE365CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 11:22:08 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id el20so6853351lab.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 04:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6KtlWtEVlJD2WWpxJtDyyxRGrb7WqOQ7+BM2AVeVv5Y=;
	b=YvDHbq/oCuffn6nlDaEIkBGmsdFlHEbaNX3/Pg4tMisgU/IQ5w7wRYAzskmn1edveg
	DVWM5wwUYeyqYi7CNfO1Q5blhBAb1bh9R3LsKzOFWIJXf8tMHEppQPy8KMyhGuUk2unc
	5NyArPWZ0LFOyOjJb2XjSa6cyaop0nha2d0g9B7Q5QdOFZ8I9fEEZoOEdiF0oQtUVvb9
	RFYa/o+68hm0xPeFZYJMzcJjU/jKFUF3R0UlVKa7icbZreDPybM7EsWhLQ8n4EjVpoHP
	f7C1eg8Z1VG/+j99bDoJ8V8GIKzPAhVpBBe3O3HZtNNKamafgDdnoxpHEvKUkZKnFQn1
	D2IA==
X-Gm-Message-State: ALoCoQn/X6vIyFtAQdIC41uJLYTAaFRfgYSfkhvUYqEA7WQkWFk6v+fZurtGc8UXs3Edt24dIlVh
X-Received: by 10.112.148.165 with SMTP id tt5mr1561160lbb.61.1404300128854;
	Wed, 02 Jul 2014 04:22:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.1.170 with HTTP; Wed, 2 Jul 2014 04:21:48 -0700 (PDT)
In-Reply-To: <53B3D558.7070800@windriver.com>
References: <1402295373-27606-1-git-send-email-wenlin.kang@windriver.com>
	<1402295373-27606-2-git-send-email-wenlin.kang@windriver.com>
	<53B3D558.7070800@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Jul 2014 12:21:48 +0100
Message-ID: <CAJTo0LYDihXR3eiztNvUjFviVQ112rectiBwkAQRbhfGWJRtBw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: fix to build bash/po/ correctly
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
X-List-Received-Date: Wed, 02 Jul 2014 11:22:10 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2014 10:48, Robert Yang <liezhi.yang@windriver.com> wrote:
> There are always errors in bash/4.3-r0/temp/log.do_install if we check it:
>
> [snip]
> make[1]: *** No rule to make target `/config.status', needed by `Makefile'.
> Stop.
> [snip]
>
> This patch can fix the problem, and we may also need fix bash's Makefile
> to let it exit 1 when error so that bitbake can catch the error.

Patching aclocal is pointless as it's about to be rewritten, and I
think you'll need a good rationale as to why the configure.ac patches
to export more variables are correct if they're also OE-specific.

Interestingly, telling autotools to invoke autopoint also resolves
this bug, which implies that the real bug is that our home-grown
install-the-i18n-stuff code isn't complete.  So do we fix that, or
just enable autopoint (see poky-contrib:ross/i18n2 for my WIP).

Ross

