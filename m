Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5406EDF9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 18:18:08 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so1303449iec.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OaFuiDDhReJgeY8k8XZFa5bclP16rrYR0Uh4oFZ+9WE=;
	b=Ro0GskGU5WoGCWum7XrUy/mnzEaTnfaETNNejcFuXMc+gWU5/gLGvnvfqa2TZHqa1b
	FJ0Z9O7KsdDfcFRe/7v/1oJlXf3xvscjNXAorcV762TdyjeIeynqY2+fxY4VwurSBRHv
	2SSehaN5ql1aI511UyGtESkG/iGxUNDYw9aNiwTrLS5TbpiYuTxpjCk1SBFTasKWDFCn
	GOdqR3jZSeMCndwbTXQZu6SkEkW/ZU/Q4m6dyJXukB8QPzy4FLQamR0DjWlzkfgmflVS
	EbiZ/nHRtLvKdoZVb4bG3R81sBvCnneqMU0c1OpqV2CIp8XzR7NKCfctjUrJocPFSd3H
	Jd+A==
X-Received: by 10.50.103.101 with SMTP id fv5mr23561219igb.2.1393870688959;
	Mon, 03 Mar 2014 10:18:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Mon, 3 Mar 2014 10:17:38 -0800 (PST)
In-Reply-To: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Mar 2014 10:17:38 -0800
Message-ID: <CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Mon, 03 Mar 2014 18:18:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 3, 2014 at 6:37 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> With this change, you can use shell like globbing expressions (as
> supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
> This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
> are supported" with the entry "Debian-7.*".

I dont think its a good thing. We should be strict about it as we are.
otherwise it can end up
with bigger problems to save few  typing words

>
> [YOCTO #5265]
>
> Signed-off-by: Olof Johansson <olof.johansson@axis.com>
> ---
>  meta/classes/sanity.bbclass | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index bae010d..d79db8f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -246,6 +246,8 @@ def check_connectivity(d):
>      return retval
>
>  def check_supported_distro(sanity_data):
> +    from fnmatch import fnmatch
> +
>      tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
>      if not tested_distros:
>          return
> @@ -255,12 +257,15 @@ def check_supported_distro(sanity_data):
>      except Exception:
>          distro = None
>
> -    if distro:
> -        if distro not in [x.strip() for x in tested_distros.split('\\n')]:
> -            bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
> -    else:
> +    if not distro:
>          bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
>
> +    for supported in [x.strip() for x in tested_distros.split('\\n')]:
> +        if fnmatch(distro, supported):
> +            return
> +
> +    bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
> +
>  # Checks we should only make if MACHINE is set correctly
>  def check_sanity_validmachine(sanity_data):
>      messages = ""
> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

