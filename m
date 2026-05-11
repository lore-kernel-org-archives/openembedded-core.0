Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BE2CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:12:43 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45461.1778487158207696531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 01:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RzaNGXKz;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b4000e51fdso41274426d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 01:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778487157; cv=none;
        d=google.com; s=arc-20240605;
        b=d5hIalqRziBhJthxhsgplRyKCoSMWTPhvykfdeEjhntvJ6ayzBgCXMtzboAoYzNmfR
         KVEm09nM2VIkdOjXJiZScwnDGFCeI9qXtEP1SdfWyDDFZkq9ppdTjT77mxRBg4OcyXOS
         lBvmTrtSr8o6IwPhps8H8l+cCvWHOZjfCrgu2fGGSWrj61jMG5zNQnl2oddjeE5M+VUE
         vlay6211/A+OKyfdBepY53LxqdJ1WqRqdTKRVq9w2WDmNqHes3cZM4tk/Gv78BUx3xBc
         khJUe//eon5ixQAs4RGVGlN4KfLueAHFuW3D4YcO+igw3k6XIVM35E/XEqbD78SC0q6F
         DhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KxDpNsM76Maqqwz2wZ8I4cyEBZtfXusEPnQ1k/dS0Po=;
        fh=vE3S8fOZE/Y6X3CakL7FEguElcSnTa3Nbo18GKSpjFc=;
        b=S85lU6/j0Q1kpe+CPoRqwsa1uu8pF+HYFheUE0fG3OuEplI4pAAPZN3azvyBrlGzrx
         0hpkFcpmmVf+0KA5ZIobYMqVYvPeme8FM4mDgJMu0eoP+VYAP/7KUQip7xqGWvkNGjwc
         OP3h3Ht2F1PBx0wWl7dVYr525qmydWXPgjBD+aHaBkqA6Kb/a6FGDphorrcPexEiAkMd
         9zUjT9c/3Oi45rC9Aixi7jfVjM2HXKXoPep3vT8oBe8YCT0H7MSlx5BtfjM3LdlRYLDB
         QjRp2S5oVqIviYKE1AsVy5fHaG4Yy7yNwyCYWNa0A4QFOn9pKrOsSvJ+UcjRaydhxBhI
         J0FQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778487157; x=1779091957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KxDpNsM76Maqqwz2wZ8I4cyEBZtfXusEPnQ1k/dS0Po=;
        b=RzaNGXKzB+Lca75YcOWrLBVEwHrT6GNCDaFRSSDxpMe2TJTJ1H/kqlukEsXW6s+DkF
         FSxAC7IcXcTKiSGJisUhHevnHC7YqLVWz+GlgTB9UYbFKmnXnOqK4oQ+MDKVLtLAvlc0
         9G6UKyIybQ2b4mUu6IyoDpLaAjcl6UhIzqui3r/z9rTEj2kjvzaeggseadjhCbXKwjJW
         fBMn/+Itvn0yLmyLcdSH+9guujQ6wFS7x/ZY4fHurlxFwxJFAXaERFK2rVMCuhg5BzDX
         PEHxPQrsCkS2kFi7+eUfO1qFpbEnLXv5pM3+chKWo4fjSU0HNtkkglSU15QPmbSScCJZ
         0pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487157; x=1779091957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxDpNsM76Maqqwz2wZ8I4cyEBZtfXusEPnQ1k/dS0Po=;
        b=hpbu37u7wsLbXIIrRsXnKOK46yEfaK2pb8OwbiLRZKfbCbHrRQnfOy5BOP3QTiRWct
         zNlgXMpPnusKJ0z6RwT9XYzKl1ffbk9CsG4Fh/gk++AB3h79bwbCg84Z5f/UoX0UWKYb
         BaPKI2e6UkluIny/jU3SrIt92PHxTLYlD58NQGfpGk+DQUEYnfBxBEaER7ze1tLWaGhg
         C/Hd3VfReDZj884OwaUW8GMoL0tlcMjIFS3juH+1JvspwucVt4wEzPjtZM/PKYWh+cE3
         e03FN3Zgo/24+XdGYUZXKx0lZ4WUDuG9zcznIB4WEnOBUn0P2gj8K1tC8wEu6V8LppTE
         aLRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9momK0e7sInHb72bvCH5WvGczJmvwcnveBfnUGdFJwpjjQp8ss//OIjKWx/AiJcHNVucN5wIZvK8bO0E69X4ejRw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxJV6A2jblg7Dt0V3JFE4S2QpRPpcj09ekZ0K9sLQHvEdEHg5s
	7oY8w29VONb+VXfQQoJK5AoEaRzHzmDgN01m6qrnLGGK3EphVf/2Hs23eLuqS/wg95gStClGGUN
	fdJ77dKgcaSZ1GgeIt44fhSLy6w+LsFup7g==
X-Gm-Gg: Acq92OG9a4CfQfC+/ze9x/1UrZW2BxNrU9yFguN/1NOvE52ixHhQI3Ta5jk3POsS9V/
	n+KDKoce8hz6CVHtZA4idNN0BYplR5VNYWXKj+wfXc/Lvjb7BCbvnEfdjNtku6AQ1U8kJI/VdGM
	K/pYS0Ml1q2x8vQ1FUNVrerNeAaOoUS5JZSVsmlFYPgj2FMctopfMlCENKMs9XMU2cQd2dCqNSo
	lUtSjzEVAV4pupAXLd7EAXr1i3MqLHBGGJ1tgHigx8MpvnqAcu2PWVdYvbmURDijGJYUNrvtIKM
	jFxz/AcGo6oAdrHFxCTnC+HulIXw8wD7iFEazstfGQ==
X-Received: by 2002:a05:6214:19e8:b0:8ac:a8df:639b with SMTP id
 6a1803df08f44-8c1afbb8c15mr142198656d6.39.1778487157112; Mon, 11 May 2026
 01:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
 <20260508191857.GE1858239@bill-the-cat> <PA3PR07MB10721F0DFCA5DC39A8D55DF4A8A382@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721F0DFCA5DC39A8D55DF4A8A382@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 10:12:25 +0200
X-Gm-Features: AVHnY4L3PYymwCJlLisy3TvDq_BaaLxl8VeNs3BBdQCrbE_PKeCNIQzKTteanQM
Message-ID: <CANNYZj_nMyNQyuiTJt__rAR7cnDLZueuda311ExtaqxxaoreKw@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] What to do with vim in openembedded-core?
To: daniel.turull@ericsson.com
Cc: "trini@konsulko.com" <trini@konsulko.com>, Paul Barker <paul@pbarker.dev>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 08:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236784

On Mon, 11 May 2026 at 10:06, Daniel Turull via lists.openembedded.org
<daniel.turull=ericsson.com@lists.openembedded.org> wrote:
>
> Why not always updating to the latest version also in stable releases? It is usually used in debug images and it is mostly used interactively by a user. This will reduce the effort on backporting CVEs and we let the AUH update it.
>
> Is there any other component that depends on it to keep backward compatibility?

It wouldn't be updated to latest version, it would be updated to a
latest commit in the middle of a development cycle. Vim upstream tags
every commit they make. It might be okay for master (although even in
master such random commits in general aren't acceptable), but it's not
okay for LTS.

Alex

