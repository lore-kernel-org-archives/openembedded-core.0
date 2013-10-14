Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8EB6CC88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:36:02 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so4791741vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mQkK3whecaCblFuE30dPfnr8v4aJbDDa2XuEcDxZJkY=;
	b=JQ9tuvxK3pDBaqYfPdHY/jUEhme/N3sefOdDSbPprxhbgYW2xSePJyFP5aiCTtVtAN
	zM/DlQEheK0HrSafrPenFRlXJEfZZgGPoGF7AqLHjP5BCy1QfjaQEyuYXPwIafsRtwT0
	EhxA7xQXt2HcyuyUB7AV//sfO14w6BDMNkn/mBKuQ1hSMYA7tLCkjnhR3m0qjmeCXydL
	sCMfry6Y6TguTl1Ura8ZByL6Kq0kTAx8hB5IS555enK5hlw6sq7zs8Y7l29rAgqmBrqS
	bRt3BazaGtxpqZ/wc4KjvdWwDsnIaV9Yt1BFhvvchk+UEnxfCTC2qDVlMVmj2rNbX07F
	Mp5g==
X-Gm-Message-State: ALoCoQnJPp5PTTWVEoHlw49L4x6GZthWEQJNBrfaIszA5d2b5HAlN66x3bPpkjkPO9UN64wGhOJD
X-Received: by 10.58.156.106 with SMTP id wd10mr7672431veb.7.1381768564002;
	Mon, 14 Oct 2013 09:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 14 Oct 2013 09:35:43 -0700 (PDT)
In-Reply-To: <CAJTo0LZkw-6jSdrmegNJfy8AcU5PvrFi0s=fSAQh4ic03CvfYg@mail.gmail.com>
References: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<CAJTo0LZkw-6jSdrmegNJfy8AcU5PvrFi0s=fSAQh4ic03CvfYg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Oct 2013 17:35:43 +0100
Message-ID: <CAJTo0LYZkEaaJKAD-SxEHe-9esJNo6M4yiCO6FyVwtz0SpK=jg@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/3] Wayland : Bump to version 1.3.0
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
X-List-Received-Date: Mon, 14 Oct 2013 16:36:02 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2013 16:40, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 October 2013 15:08, Ewan LE BIDEAU-CANEVET
> <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
>> Remove do_configure_append_class-native() function useless for this version
>> (file wayland-scanner.m4.in does not exist anymore)
>
> When building weston:
>
> | configure:17492: checking for WAYLAND_SCANNER
> | configure:17499: $PKG_CONFIG --exists --print-errors "wayland-scanner"
> | Package wayland-scanner was not found in the pkg-config search path.
> | Perhaps you should add the directory containing `wayland-scanner.pc'
> | to the PKG_CONFIG_PATH environment variable
> | No package 'wayland-scanner' found
>
> The script is calling pkg-config so is trying to find a target .pc
> file, but this is only installed by wayland-native so is in the host
> native sysroot.  I'll dig into this and work out a fix.

There needs to be a proper fix done upstream, but this works for now:

do_install_append_class-native() {
  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
      -e 's,$PKG_CONFIG,pkg-config-native,g' \
      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
}

I'll send a revised series when I've tested it on hardware.

Ross

