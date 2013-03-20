Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UIJYC-0002SA-3q
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 14:59:32 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so2995993lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=48upuFGJCqd/P54XTwCVQ6GiZwbsR6TTjPgJzdIa944=;
	b=wf8I0um8lbfpLBwiIrMeEtqemzq3TRPIVtCZRSVUxQxLV/lZWy1YToCH9fr7hmpoRm
	xoT4gd0Gow93TjeoKlKXVc5jMeRwgw5Cxair2BQ0ZSTyN2EO4TbUXw2EMBiqUQPnyCVm
	jvqvSbTpScyjqGf+ul0pEiBhxwq+/OR/XMYrEeFUUzrsE/g+EEKxXhyukZKZD9DKhxqz
	+qBbK9k9K9vrylbl6Vv3Bx0E7weNIVLfYBGUzhM4cvnIF0qY2qML1pJiGbClNFXW99vV
	aH+eaaKLWjcb78AjO6kCrZlgMWEB1PS7ZTmtZDpn7LmfZ4vLJNde444LFXAwVBQ8fVxv
	7UMQ==
MIME-Version: 1.0
X-Received: by 10.152.47.97 with SMTP id c1mr5511644lan.6.1363786957901; Wed,
	20 Mar 2013 06:42:37 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 20 Mar 2013 06:42:37 -0700 (PDT)
In-Reply-To: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
References: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
Date: Wed, 20 Mar 2013 09:42:37 -0400
Message-ID: <CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: anders.roxell@gmail.com
Cc: Anders Roxell <anders.roxell@enea.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-kernel-base: linux/version.h path update for 3.7-rc1
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
X-List-Received-Date: Wed, 20 Mar 2013 13:59:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 9:22 AM,  <anders.roxell@gmail.com> wrote:
> From: Anders Roxell <anders.roxell@enea.com>
>
> In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
> The path include/linux/version.h was updated to
> include/generated/uapi/linux/version.h

It's true that uapi now holds the generated version.h, but what build
error were you seeing without this change in place ? utsrelease.h is
still created where it has been for some time, and should be what is
typically used for any version checks.

Cheers,

Bruce



>
> Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> ---
>  meta/classes/linux-kernel-base.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
> index 4f2b0a4..b7d0ffa 100644
> --- a/meta/classes/linux-kernel-base.bbclass
> +++ b/meta/classes/linux-kernel-base.bbclass
> @@ -8,6 +8,9 @@ def get_kernelversion(p):
>          fn = p + '/include/generated/utsrelease.h'
>      if not os.path.isfile(fn):
>          fn = p + '/include/linux/version.h'
> +    if not os.path.isfile(fn):
> +        # after 3.7-rc1
> +        fn = p + '/include/generated/uapi/linux/version.h'
>
>      import re
>      try:
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


