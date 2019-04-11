Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id E97D57D3B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 11:14:51 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id s24so4826586otk.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 04:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OABcIOC58gZLGDFXB5sZK0ebZdIwTJhddpNkf/yAs/s=;
	b=YadhuLF7THgrtGhZSJTO9sYU4sZ5kD7UTQyba35FfZWEPcvMUf4y0WX/VpSwQVZFRB
	F0CUbKCNnh0GyGP4sJWx+bT/SRzwvUmIul/GYBp/QNfABHx6a+AV8BEAG4cMAg1pcfMU
	HjeFBnQp0TV8O75FKOSBZA5kHsSwwqP+edHS4vPUVrs+o0UDX4efD75H9Skm2XZl86OY
	6KHgz517zXG3Fv+jAwEJlU/sTEd/E3amWPgU4pH5ZAWm5kJn182Q+dy8u15fW4Bu0XF9
	kyGcKeMYgUaj5iWPEX7mWJUjj9oVyfG/nVvCRLLSA8GONUyzJhc2rPMgeRobw5S6njyt
	C3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OABcIOC58gZLGDFXB5sZK0ebZdIwTJhddpNkf/yAs/s=;
	b=Ln0Y0EIczz36XgmXo2eaBjnPbCFo8oqAfKSC54kRLbXE4aRwctcajQp92xzvDzGdOo
	sYr9kGVkrENaTaUt75ZRjxzjAIicWlp64UYuiAh2TZbWxelxaB/idkglulJirehvrRt7
	4iZtrfG+oBIQ2UieC3YHB73QtBIfmMH9/rkEEQ8qZ3x2G3DJN4CraI+7slit6UeRv8xT
	bFpG2337X6yIOA6kZDfCWctkv6kFoPAIpTK/RX+ukZ5Y7czPfnW0RBEqJVw2fcPwrC1c
	rLEYFOVg8Syhd9ltWrtsv1tlyrjwf7lO2MVFluGsCwnMfXoONCZgIw2Tjqg2w5uJp1ku
	oAQg==
X-Gm-Message-State: APjAAAUiWKowvESe+ORHxwpuxV8pNpLvFR2ibvU9yO0jMb/IVwJu0ikm
	mjIExHHaX7M5TAzrE+Cm+6Da5ONMPThSwFLSyP8=
X-Google-Smtp-Source: APXvYqyQlJslKCUwGSLIUr3pJi23LXUjl4s8Uii0695RPqtvv1FUlaN9BQlUtoWQDovld2/Z8laOCIOQtpFkKT0Kq/o=
X-Received: by 2002:a9d:62ca:: with SMTP id z10mr30751450otk.207.1554981292970;
	Thu, 11 Apr 2019 04:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190410215402.20055-1-jason.wessel@windriver.com>
In-Reply-To: <20190410215402.20055-1-jason.wessel@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 13:14:41 +0200
Message-ID: <CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 11:14:52 -0000
Content-Type: text/plain; charset="UTF-8"

gdk-pixbuf-native should not be running g-ir-scanner at all, as we
explicitly disable this for native builds. Can you please look into
why it is happening, because the patch is really treating the symptom
rather than the problem.

Alex

On Wed, 10 Apr 2019 at 23:54, Jason Wessel <jason.wessel@windriver.com> wrote:
>
> Investigation of an end user going over their quota in the user's home
> directory showed that the gobject-instrospection is writing files into
> the ~/.cache/g-ir-scanner when building -native packages.  The test
> package in this case was gdk-pixbuf-native.
>
> Setting the GI_SCANNER_DISABLE_CACHE in the bbclass should be all that
> is needed.  The qemu wrapper was already setting this properly, but we
> also need it for the -native builds.
>
> meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.3.bb:131:
> export GI_SCANNER_DISABLE_CACHE=1
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/gobject-introspection.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
> index 4ceb0c68b1..359620fba7 100644
> --- a/meta/classes/gobject-introspection.bbclass
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -27,6 +27,9 @@ DEPENDS_append_class-nativesdk = " gobject-introspection-native"
>  # This is used by introspection tools to find .gir includes
>  export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
>
> +# Disable writing to $HOME/.cache/g-ir-scanner
> +export GI_SCANNER_DISABLE_CACHE = "1"
> +
>  do_configure_prepend_class-target () {
>      # introspection.m4 pre-packaged with upstream tarballs does not yet
>      # have our fixes
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

