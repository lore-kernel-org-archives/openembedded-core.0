Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 386D76BD80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 22:07:40 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id f8so3176458obp.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=AJFinm9elbV26rU4kP049vxNIHyGwyobAfnfXpQvR/4=;
	b=pTxnWIUEGS0rp8enScm74hfLsQIo2lUhXMTrdTom+8O7GiWPO9W25TRD/Yd649Vqlr
	pXEObCOI3LH5+v+jaGV//PJR0IgXZRraMFOLmGHi7Lw7ikaR8qKDqEOc2r2ip4NUrdfQ
	zo5MtY/oJbBwyVrqKJONWRO7NiazRBSrhwIqjKvc9YfU6C3qe6vyZr3xCvoEhrp3K+9r
	3Yl6WCPnbBpQFiy8wlftFAXQduVV6u/cqvYIbYZdU2NfDn8wsD5DIvPrqbKb3aNcmzms
	P3oWRrMbHu8ZAzEzBJwfbZ00KEiPm6Qqcexo0ahR1rPFLMvfj2EZWUVNu+b2xRaJ5V7P
	OixA==
MIME-Version: 1.0
X-Received: by 10.182.38.228 with SMTP id j4mr11765135obk.94.1377986860179;
	Sat, 31 Aug 2013 15:07:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 31 Aug 2013 15:07:40 -0700 (PDT)
In-Reply-To: <5221CAA0.60601@windriver.com>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
	<454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
	<1377795605.1059.20.camel@ted> <521FF438.5040702@windriver.com>
	<1377876563.1059.100.camel@ted> <5221CAA0.60601@windriver.com>
Date: Sat, 31 Aug 2013 19:07:40 -0300
X-Google-Sender-Auth: 0jimuKyTRYOEr36L9AnoSgg_htI
Message-ID: <CAP9ODKpEmUuuKs5DiozesCAsU0xCKeZGcs6soBQ=BuvB2=+iTA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate.bbclass: check before open the manifest
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
X-List-Received-Date: Sat, 31 Aug 2013 22:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 31, 2013 at 7:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi RP,
>
> Thanks, I've made a draft patch for fixing why make-3.82 is being built,
> the problem is that when we run "bitbake make-3.81":
> - For 'make' itself, it will build make_3.81.bb
> - But for make-dev/dbg, it will build make_3.82.bb since there is no
> PREFERRED_VERSION and it will use the highest version.
>
> This draft patch sets the PREFERRED_VERSION for the pkg and will fix the
> problem, I will send it to bitbake-devel later.

Nice discovery :-) This does seem to address a core issue.

> diff --git a/bitbake/lib/bb/taskdata.py b/bitbake/lib/bb/taskdata.py
> index 58fe199..fc8ee6d 100644
> --- a/bitbake/lib/bb/taskdata.py
> +++ b/bitbake/lib/bb/taskdata.py
> @@ -429,6 +429,22 @@ class TaskData:
>              return
>
>          all_p = dataCache.providers[item]
> +        logger.warn("pppreferred: %s" % dataCache.preferred)
> +
> +        # Check whether item has the one of following formats and set the
> +        # PREFERRED_VERSION if it does:
> +        # - <pn>-<pv>
> +        # - <pn>-<pv>-<pr> (when no PE)
> +        # - <pn>_<pe>-<pv>-<pr> (when PE)
> +        for fn in all_p:
> +            pn = dataCache.pkg_fn[fn]
> +            pe = dataCache.pkg_pepvpr[fn][0]
> +            pv = dataCache.pkg_pepvpr[fn][1]
> +            pr = dataCache.pkg_pepvpr[fn][2]
> +            if not pe and (item == "%s-%s" % (pn, pv) or item == "%s-%s-%s"
> % (pn, pv, pr)):
> +                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)
> +            elif pe and item == "%s_%s-%s-%s" % (pn, pe, pv, pr):
> +                cfgData.setVar("PREFERRED_VERSION_" + pn, pv)

I understand the problem here but maybe this should be checked in
bitbake and avoid iterate in all packages?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

