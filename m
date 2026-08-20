Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65380C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:40:28 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2762.1787215222344303219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o4dmJwrZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8efec2c28f8so13296336d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 01:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215221; cv=none;
        d=google.com; s=arc-20260327;
        b=Ex6b/uEZfPLOKcUstzXvxkqTSLuSvgPl/cFEwEqFI948vsxDe9r+XJ7hrPerppXQsR
         PYqtiN9/LkVDEjf/GUpuXwSDvlV1adIBfxOyUMoXlCOCk1n1m4dJHS4gCI9xnFIqCJ3N
         +mU5th1/VynoHX9Q2MxF0d1naGLvP9BRA86KAGx4kSrBDNQPKc1ICAMbQ4f1uqTSi79a
         yfaXQs/b4ZcZzypZxjS7CMw0YdkPG5/EMlTWCUZ2s2UoEv+8890KehU0aYHeyCciOsV7
         Iyq2LYOu5z5PbEw4ILZwQjr8NcKVU3auU7DBs161OUAyy7J82cT+LjHsLats0efqvTUG
         s6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=miGHNXoGo8l1oNYS01liZ4yC3ZGEcv7Pr85hN+gIzL4=;
        fh=ev3YHTlA+Rnn0+ia9p7eyeLVcBzKuVI57zldhlHf5Vk=;
        b=I/Vcc1ZyULiYm90a9KquPuc3OPIYcZDKI3HFqrGkczDxSdkgH5eYcBje8npTiGDsRw
         xs7JV4tivpkK+QK4LGCCUnRvNADlAGGkx0G0dieT6U3uHugQSLvknstPMsjfHWQhnNdh
         zopFWka32pk9jc5jJoMvPFrk/hNo01vESBLinipcfT1fzR/wjDZiQ9rXTsDLIIDDmuH+
         hkfnbKTlhRhhrWILDKgGreoY81IkoMGVFG99qk9pOD3H/aq+lcKOjif1mcZTXzLNNCLo
         /+TJwQYwhhsZTdpWOrh/K4/Uf1JHbpvWCZLNIjeinQWG3IfMlbGaT7Bm5N6UUvGTUJVB
         0dyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215221; x=1787820021; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miGHNXoGo8l1oNYS01liZ4yC3ZGEcv7Pr85hN+gIzL4=;
        b=o4dmJwrZ17NuowKXFfkuUyYiWHy+z0SUMdY7OTk8p09jj2H8H8sJk0qKSTnqHK/iJe
         k7a8iVQCnmKQt2HiYPNtgVwngTwYWjWUy+BZEv5uf+qzDFyo0doGVn8cjRJ6Rldmu+3O
         AiqW1MNftURmIk8i31dWT9Rn1+Ppp5wmNvebTgEDHBsA1G7ChTHhyAfGRZUGY4vXRmZr
         R1zYif2vRVA0nkjiCbBXknM7xFY+sBg/Sq1MvimUQzzd/QIdaYhja2nKxXuZQu3ceozo
         1lhd+MVY8lIHypTiW1nqdjV6t4JyGyTYw5tqYu+U+SmjbK42vqyRRsWmIkxoNciPpkyT
         TEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215221; x=1787820021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=miGHNXoGo8l1oNYS01liZ4yC3ZGEcv7Pr85hN+gIzL4=;
        b=fxHmKLO9jM/nxN0ubNOap0f5kZv/zCi98LA7HpiREj7puezgVSW7Vjm932kuvGFIDb
         hQgpsHdi8DVUtxrgp2s0B6uEUYxsbpDdpBTRP6MiZxcNU4Ft4EV+PY4U8F0zFKNPauEL
         jZYtUcO6BND57BHao1u81/cQUzcPvvwIxZN3QpZOJt64Q8pu1ZhGUQWuo5U9P4JMPwha
         ujrw5sGHVgq/80xvQgLeLZDK4WONMUD4eAp6d+mx0VV7+4ZIdO9MO33LTzbmWTHb0j/Q
         XOD6wNniuGqd4OVCMMvdwJtXYpWgIEeq91TCcSd0YlQH3rRfjavutgc8j4/A6+WrlZWc
         uHFg==
X-Gm-Message-State: AFuF++k4dm8lf6DQdcHh0nR0O6+QIduZ0N/jb+LvBt2ekjW+M5Mr1yZC
	Ud5DePa2XascA3aL2NI9UzGLlceZ37Vq/FkHMNHXS9319H9M0oxfePm5nvI68fR+5O1cYZ47bvH
	UZ4SSfGHBYioI1Fuo0WAuxTc3aLPZRqc=
X-Gm-Gg: AR+sD11624TSOlP6DfKSUV67SynuJa0Zy3vzGI/nlXeHTdpI3khCz4QS2ULEBGSZaHj
	IpqKZyc9M8T7oWnoUCM16TSU20kq26pd5pJ3kPbySs7FQZ4RhrfpMHODKZZTrYdeZEyXEAyk1SY
	PaOdkjBEJ2VPjuTwKyRxHajFzgd+fj71GArVX0Nsigifp39/baFJ6/3XJHMiqssqEmvt8PwT0ap
	ExIvcbzLS1jMjnU45jPUepKZYxGzmtU6Begh240LDpw8w4FXmidm9YqCiqyc+Gvj7jurTIUWeqm
	L6OSDVn9B4IdsMrMRlD7AFymJjio3Xnzk/0lR3nZEEPSegvrujAny+4sKTgCspwF4g474r8g22C
	H6Lc=
X-Received: by 2002:a05:6214:212b:b0:8ee:cf22:88f1 with SMTP id
 6a1803df08f44-90c5eb1debfmr100106286d6.17.1787215221183; Thu, 20 Aug 2026
 01:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Aug 2026 10:40:07 +0200
X-Gm-Features: AcwNN1V29FkMvaOuVZg0BzD9vybjZwVcp0pmXAFfl6RVZj2runVcgw-_QnEn_gk
Message-ID: <CANNYZj98f769T2und7rXmwOwjtegdLL5=PkyOwy-OnC-RGVGrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipe_sanity: accept new renameVar() arguments
 in the monkey-patch
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243821

This class is very old and not used anywhere in core or meta-oe. Is it
still useful? What prompted you to look at it? Should we rather move
useful checks to actual qa classes/libraries?

Alex

On Thu, 20 Aug 2026 at 02:22, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>
> Any build inheriting recipe_sanity fails during base configuration
> parsing with:
>
>   TypeError: recipe_sanity_eh.<locals>.myrename() got an unexpected
>   keyword argument 'recurse'
>
> recipe_sanity_eh() replaces bb.data_smart.DataSmart.renameVar() with its
> own wrapper in order to record variable renames. The wrapper hardcoded
> the signature as (self, key, newkey), so it broke as soon as bitbake
> grew a new parameter: renameVar() gained a 'recurse' argument and
> bb.data.expandKeys() now passes recurse=False, which the wrapper cannot
> accept. As expandKeys() is called while hashing the base datastore, this
> kills the build before a single recipe is parsed.
>
> Forward any extra positional and keyword arguments to the original
> renameVar() instead of enumerating them, so the wrapper stays working
> across future signature changes as well.
>
> Fixes: a3c6a020da9a ("data: Fix expandKeys recursion issue")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/classes/recipe_sanity.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
> index a5cc4315fb86..cd35ed6a1302 100644
> --- a/meta/classes/recipe_sanity.bbclass
> +++ b/meta/classes/recipe_sanity.bbclass
> @@ -141,9 +141,9 @@ python recipe_sanity_eh () {
>      # Sick, very sick..
>      from bb.data_smart import DataSmart
>      old = DataSmart.renameVar
> -    def myrename(self, key, newkey):
> +    def myrename(self, key, newkey, *args, **kwargs):
>          oldvalue = self.getVar(newkey, 0)
> -        old(self, key, newkey)
> +        old(self, key, newkey, *args, **kwargs)
>          newvalue = self.getVar(newkey, 0)
>          if oldvalue:
>              renames = self.getVar("__recipe_sanity_renames", 0) or set()
> --
> 2.47.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243799): https://lists.openembedded.org/g/openembedded-core/message/243799
> Mute This Topic: https://lists.openembedded.org/mt/120839376/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

