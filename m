Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAB160664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 22:44:47 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id c11so1007333qcv.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 15:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=gMQJVbli+iAO/tpsBSwcEuxRZS+/jUXQoj9d0RVA0sA=;
	b=VgDLKMr9zmlIEUPfd6dHzzJTeVIiRnKysp/RHONa+Ay9xKHTuSKZAXZGqvQrUd8jr2
	zbjPI4fm+4bar2J7zSlMq5pXgpB/g3MhEmbXf/zUHtpnEp/RcX3XS4k2sw4qLcd7ezCj
	zBqLOxiWWXncuX6ylszXCx+mndnOr9nun8GF8pWiC1h0Ff55tGlEq/mTPN4Y0wFYdJSO
	klbfZxRSZfYBLGS3y6eP4W25nFqhQhUPY0zk1vQjj6abzbD7UQPdjnbBqHFKohBGnzbZ
	kOtcrrHXoKn/rmRPRuTNpes+SzjQjtU5n5ZlQ20OPUG+weM31AlxXzI1eVicdTMbYjxu
	+0wA==
X-Received: by 10.224.112.68 with SMTP id v4mr19644964qap.41.1375569887630;
	Sat, 03 Aug 2013 15:44:47 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [198.199.72.94])
	by mx.google.com with ESMTPSA id nh4sm614861qeb.6.2013.08.03.15.44.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 15:44:46 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1375569057-696-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 03 Aug 2013 22:44:43 +0000
In-Reply-To: <1375569057-696-1-git-send-email-otavio@ossystems.com.br> (Otavio
	Salvador's message of "Sat, 3 Aug 2013 19:30:57 -0300")
Message-ID: <871u6axulg.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3.50 (gnu/linux)
MIME-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Sat, 03 Aug 2013 22:44:47 -0000
Content-Type: text/plain

Hi Otavio,

On Sat,  3 Aug 2013 19:30:57 -0300 Otavio Salvador <otavio@ossystems.com.br> wrote:

> base.bbclass had code which handled the PNBLACKLIST in case of
> multilib use. This is better to be done in the blacklist.bbclass so it
> has all logic in a single place.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/base.bbclass      | 10 ----------
>  meta/classes/blacklist.bbclass | 25 +++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e2c9a7d..bc2b4f6 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -141,7 +141,6 @@ def pkgarch_mapping(d):
>  def preferred_ml_updates(d):
>      # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
>      # we need to mirror these variables in the multilib case;
> -    # likewise the PNBLACKLIST flags.
>      multilibs = d.getVar('MULTILIBS', True) or ""
>      if not multilibs:
>          return
> @@ -154,21 +153,12 @@ def preferred_ml_updates(d):
>  
>      versions = []
>      providers = []
> -    blacklists = d.getVarFlags('PNBLACKLIST') or {}
>      for v in d.keys():
>          if v.startswith("PREFERRED_VERSION_"):
>              versions.append(v)
>          if v.startswith("PREFERRED_PROVIDER_"):
>              providers.append(v)
>  
> -    for pkg, reason in blacklists.items():
> -        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
> -            continue
> -        for p in prefixes:
> -            newpkg = p + "-" + pkg
> -            if not d.getVarFlag('PNBLACKLIST', newpkg, True):
> -                d.setVarFlag('PNBLACKLIST', newpkg, reason)
> -
>      for v in versions:
>          val = d.getVar(v, False)
>          pkg = v.replace("PREFERRED_VERSION_", "")
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
> index 75abd99..6153cf8 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -12,6 +12,31 @@
>  #   PNBLACKLIST[pn] = "message"
>  #
>  
> +# Cope with PNBLACKLIST flags for multilib case
> +addhandler blacklist_multilib_eventhandler
> +blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
> +python blacklist_multilib_eventhandler() {
> +    multilibs = e.data.getVar('MULTILIBS', True) or ""
> +    if not multilibs:
> +        return

Is the `or ""' part necessary, given that `if not multilibs' would
branch to return in case multilib is bound to a falsy value?  It looks
redundant.

> +
> +    # this block has been copied from base.bbclass so keep it in sync
> +    prefixes = []
> +    for ext in multilibs.split():
> +        eext = ext.split(':')
> +        if len(eext) > 1 and eext[0] == 'multilib':
> +            prefixes.append(eext[1])
> +
> +    blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
> +    for pkg, reason in blacklists.items():
> +        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
> +            continue
> +        for p in prefixes:
> +            newpkg = p + "-" + pkg
> +            if not e.data.getVarFlag('PNBLACKLIST', newpkg, True):
> +                e.data.setVarFlag('PNBLACKLIST', newpkg, reason)
> +}
> +
>  python () {
>      blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)

Best wishes.
Mario
-- 
http://www.ossystems.com.br

