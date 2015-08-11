Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 806F1755F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 02:00:16 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so157688167wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SEIfEluTgYZ+nKPYTnR7aPRIAgympws7ADD0clcK128=;
	b=u7K2jjuvZouWMRB7NZoB83cUMZpM30PidWMjgpS17qAlN+T26Zoww/twW6xTjssVVU
	vq7GgMMKxnAdu5YLPRzrjR/HOruhxfJxnKC9DwO40Tj1rTXDjIJM9elmnzTXLIaKIjDq
	OSF8QxU+Mte3jWI6h3NZskm3W1EtFfQXkGghLBshpB4ipie0/rbwxFuy17xG9vQrgfa2
	yxsd6WUlIXr3N3WlE3FVr/Tx9ouWmp5X5kB5MBYbNUkHgb6i7s3Q8NaSFfUseGfQCYZB
	MKzYcdtJv6cqViq5oiyitwzw3xEv8qzGK88bJyG6sG+GU/Tg2qUPFbM3okwnNEoI3gqn
	69qg==
MIME-Version: 1.0
X-Received: by 10.180.39.172 with SMTP id q12mr15943427wik.17.1439258417021;
	Mon, 10 Aug 2015 19:00:17 -0700 (PDT)
Received: by 10.194.89.129 with HTTP; Mon, 10 Aug 2015 19:00:16 -0700 (PDT)
In-Reply-To: <50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
Date: Mon, 10 Aug 2015 19:00:16 -0700
Message-ID: <CAJ86T=W=_iETkpDyVJqUD0g6xkd_xhpXf_jtUCGmXe-Mt+fjxQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Tue, 11 Aug 2015 02:00:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 8:18 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
> from d.getVarFlags()'s return dict when it causes many loops.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/base.bbclass      |    2 ++
>  meta/classes/blacklist.bbclass |    2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b7e22ad..9e33f44 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -336,6 +336,8 @@ python () {
>      # PACKAGECONFIG ??= "<default options>"
>      # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
>      pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
> +    # Remove PACKAGECONFIG[doc]
> +    pkgconfigflags.pop('doc', None)

This change breaks recipes which try to use 'doc' as a PACKAGECONFIG
option. Nothing in oe-core tries to do that, but there are recipes in
other layers which do (e.g. efl in meta-oe and lxc in
meta-virtualization).

Could this change we reworked somehow to allow 'doc' to continue to be
used as a PACKAGECONFIG option (as it is in fido)?


>      if pkgconfigflags:
>          pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
>          pn = d.getVar("PN", True)
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
> index a0141a8..39b3f82 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -28,6 +28,8 @@ python blacklist_multilib_eventhandler() {
>              prefixes.append(eext[1])
>
>      blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
> +    # Remove PNBLACKLIST[doc]
> +    blacklists.pop('doc', None)
>      for pkg, reason in blacklists.items():
>          if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
>              continue
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

