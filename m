Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D043862136
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 02:39:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so15390433wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TTocUMPbjxC4Zvv1iVSutRLgts2Cj6vDcI+KvF66iXE=;
	b=QINEw2+XLKoWyXhk/aRli+vX6QwL8rNO3wQC+Rv4tmIcPl5sy6RcySmQi1mfX60x9T
	mXzCTW4Pae6L0ccTPtfE+GQrrBRmMkkpCO5xF5YW91LtTDciD8J5+l9UlZiNRLW0Ws9w
	4+B6AJw4c8edM4XTX1ORCMGOanbKcFaxhYFiI7AL+8s2HSrY3zhr/SkmyYOilbnw+Tkq
	YOzaGG8kPEDtGBRNZnRsWZjmDVzwLcS3kw7KnO7wtK7qg5b19v8YSYRJLNm5BXevxi5c
	0lvGlqyA04uAt8mPmb0J9L5Kipk4YJ1zECEJHkfRD+oE3MZrHn9KFUW5u3fTMFoLlxmj
	GRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TTocUMPbjxC4Zvv1iVSutRLgts2Cj6vDcI+KvF66iXE=;
	b=T9qP29XC7FYdaa7U4jOTHEBuSBnYEIm0wAwuII/SddjjIFgQs4oDoIZvlDGAPs14vS
	7U3PIyvHlcb0HrxPLXiXc/he39b1DYTKep+Cxf4+kAJ85evA5IKR8qeFkqGJpePBkgYC
	hd7/mk58H5OwAg4wHe9lzKEa/+qCo9V5JyRQ0mWoOBg1qJb5XpWJ1xCvxnyhMI6XXTg4
	PXdf/nBLuilDoAojT4pcE1otVvGIoqur/ITdmWrTPKGc7UKwKCeWqpw3c15qHKkJLH2J
	71Vkw9qn6CJaacga1Yv1OoiO82Q8vlBA0SofOz5y0EQFrWjNSlbqiOc/igMvvyDh/N2Y
	PLzw==
X-Gm-Message-State: ALyK8tK3WSShl8apNZLIBHeJeVE0tsARdxoEXJjvTzQ9M4CtKk91/nEojV1XQ7Cn7u6SNGXibNyO1ScdnniYcQ==
X-Received: by 10.28.89.6 with SMTP id n6mr17888177wmb.4.1466131151625; Thu,
	16 Jun 2016 19:39:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Thu, 16 Jun 2016 19:39:11 -0700 (PDT)
In-Reply-To: <1466074764-14109-4-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1466074764-14109-4-git-send-email-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Jun 2016 19:39:11 -0700
Message-ID: <CAJ86T=WKTAe3imuizQPWAmnZaMq5LvL-+2VqpaFC8GziS=gXxw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] security_flags.inc: add epiphany to SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 02:39:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 3:59 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Otherwise there is a QA warning about relocations in .text

Typically these warnings come from assembler and can't be fixed via
CFLAGS. If this one _can_ be fixed via CFLAGS then it suggests a bug
in the Epiphany build somewhere (e.g. reusing an object file intended
for a static lib in an .so). Maybe it's better to track that down and
fix properly instead of working around it by globally adding -fPIC to
CFLAGS?

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 26804bd..ea00bdd 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -38,6 +38,7 @@ SECURITY_CFLAGS_pn-glibc = ""
>  SECURITY_CFLAGS_pn-glibc-initial = ""
>  SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-epiphany = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

