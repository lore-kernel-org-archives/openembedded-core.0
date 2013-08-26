Return-Path: <riku.voipio@linaro.org>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5359160990
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 09:37:18 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id cy11so1632429qeb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=l/NGwhC817oSgqMuUi8RVwmoe4TDvQiTtqL5g52dWuU=;
	b=LLQcqN68N/tK7M0oG574PWqXKlVBEMae14na2TVDPC261LvYhGguHdxWU7hvLgTm69
	1vSR6HkFbB+qfEK0cDPaizpLSMiufAQtcVKnIfTFKjo3pMA6feF3zywHqVr9q2EztE7n
	j/Q+XjeBAj5Bg/PoSTcLVODXcwyG/WvwpHjkI7tUNVHI0JlPiVTTDtOdlRIhpP6lRO1b
	yDuuEruAdBHNLice3Wa3e00j1RwZqWG1Y+T+Xc+GXVSx8mEnFLVrbIOtM3Htg0No7XfD
	+CzFxKhV/LM/Mmp613tfd4eoOusDHHVC+UQ+PQVy5GfMga9ODFYp0TBPq4aQ2eCzDJHl
	W0CQ==
X-Gm-Message-State: ALoCoQkfvYxt+ia3+7tj6F2zWyWqXGOuXdqXhQ7NBXBdmu7CK51ULKfo2kA5GgSsH08WWn7mvivy
MIME-Version: 1.0
X-Received: by 10.224.53.130 with SMTP id m2mr199041qag.74.1377509838515; Mon,
	26 Aug 2013 02:37:18 -0700 (PDT)
Received: by 10.49.81.137 with HTTP; Mon, 26 Aug 2013 02:37:18 -0700 (PDT)
In-Reply-To: <1377063923-23922-1-git-send-email-raj.khem@gmail.com>
References: <1377063923-23922-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 26 Aug 2013 12:37:18 +0300
Message-ID: <CAAqcGHmnX+7CCZ9BS0s2Xut5DbuzSgu1h-a-bFsDo588iyi6dA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Update SRC_URI and fix unpackaged empty dir
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
X-List-Received-Date: Mon, 26 Aug 2013 09:37:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 21 August 2013 08:45, Khem Raj <raj.khem@gmail.com> wrote:
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index a590cce..1a23805 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -76,6 +76,10 @@ do_install_append () {
>         rm -f ${D}${sysconfdir}/localtime
>         rm -rf ${D}${localstatedir}
>
> +       # remove empty eglibc dir
> +       if [ -d ${D}${libdir}/eglibc ]; then
> +               rmdir ${D}${libdir}/eglibc
> +       fi
>         oe_multilib_header bits/syscall.h
>
>         if [ -f ${D}${bindir}/mtrace ]; then

This breaks in the case the directory exists and is not empty - which
is the case when you build with eglibc-2.17. In that case there is a
pt_chown binary. pt_chown is deprecated since devpts was invented, and
now removed in 2.18.

Riku

