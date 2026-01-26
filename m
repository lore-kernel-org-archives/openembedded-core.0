Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125F5CF65CD
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:05:56 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16471.1769421951173182257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/IHn7NC;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-888bd3bd639so60451656d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769421950; cv=none;
        d=google.com; s=arc-20240605;
        b=ftULmX0U0rcG72G6ZJ5jyQZG/fCjVu0WU5wZvzHhAT5qQMFFlWqaTalfdmKiHBSuBo
         Xb69hJ9kmanGuc+ch3zIYrwTw4kjF5dAms9dfI7NwVP7dSGP6ae34WkYABSrM9xyHnSn
         kgGLHQTVnpohf99wiY07F14EFKohha+0E7tmDfBevfybjW1zu8CCISFQ6G1xktkeHHUt
         uv9uXQhyoQs3K9+fY/vtqFQ69WvOa1qEDDpJKZ9hcv50N1L8JtK8gkgxku/4alUqHCkr
         u4E0yz1aR/sZH2KhjVW5FWAHNWmmzn1ELG+xyAMtFgqy9mhHdepupFNunGRPL0CqM8os
         EAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DNSrhAS0QR4ePfrACCV3H+q/nJzJwXubVvTSc84z1ZY=;
        fh=QjXAH+OfBTpESV0MwSm6PeAP4WImsPPcdPRkRzUTTJE=;
        b=c67CvOG6HITyGHXOmwpYt2KNREbGWeSzoOe3Gz6mIJkvirmSKxA7cOWmZ3rKWECmXl
         6LlJFfi1Q503u5hKO/Z1GXc16O2AhWyYLzfXiF3xxvld/iBahUnLkA5X4x+MGUwd1eGt
         7eHyn5tpRJ8+74EZjQYl425fIb/l4QEV/LQ4hGZRZsC7BmNhmUEs5dAVNqJgOBmrXH+r
         U9N99w1Q+VOVkxJNeqp1mUGCMUgqVLFP15zqXxXRwRSQC1oWQrL3wLYCY/cUuFSkOAid
         BA7HezG2cZB9tih7OMoQFFkcMTdyBeRSQQZY0e7DylFMOwEt5q1hWd72fLE1z6K2mgOI
         FYJA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421950; x=1770026750; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DNSrhAS0QR4ePfrACCV3H+q/nJzJwXubVvTSc84z1ZY=;
        b=O/IHn7NC3eBp+agEetmyJtBTjO7bgn0AuWRyn+w4hJbgMQsRr01bRbHdyDi7Wv6aJG
         yuUyLt9vO/EjcDrUssoioGjBjG9XHqPW2HAkcKEy2Xnr5XbzEtZiOiri0/OfBxeMX2RK
         Q5IwYVuEvfpxYCkkuHVaRev31NqV1GptUnhVGUh28y7mGIUNgL8w8LzEhkPyz8hFHrqc
         oHkZ74jpPHa7KgTpoFiffDB/9xrYIjNL2FePeH7fj8wYkJIChhBmT4oqNrNa5ng20oa3
         X77TA7/N2PnaO37QbOAwZEClXl0qLaeYQRlW3TfnEfZroNpwo7cBXzmk3Sdp5m2tB/gA
         CfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421950; x=1770026750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNSrhAS0QR4ePfrACCV3H+q/nJzJwXubVvTSc84z1ZY=;
        b=NzyzIRQwolfcWK6Uk+ZIjnCBw2renGmD6Z7+r8WxFZvQ7YC6Lpw9hIFjLcP1TjLVYE
         XnLzfHhHOYDRcXZABDsfSFsjUYGT8dmxXbCvkvk/4KofwX/kX7ujP7d5YrH1Xxgo0ISw
         7lq/v/j8zQz8kbNdoCickROwPISrCSy8mFQUDFVGCBixQJG+MZGKYX+dwTvEgdZCuxEB
         x8pOGe+KM8Dsxrmb1jV3WjjiT1c2yqVnB2xddT/K/dCAsG24fSgfz6qJ+nvnuUC3gw4s
         GkJcipwvl7/lPfyA4bZe6wu+a5x5gnguctaRIe52/KtKxhwZa8RIRRXQjL6+C7lYqa+7
         s0Og==
X-Gm-Message-State: AOJu0YwrPH2FDYXgNRwcFEhKxxHjqNl3/SIEbjRmO1cwjKf0YBJR5gqp
	U7oCr4cewL547S5u6aO6A3l1wxrUZgWbItHnfBeNBQtwcVasJm0zsG5FfM35src116n0Bqoy4J3
	PuaU5Qq1bV5OszjdoDfoUyzJI6GLjDlo=
X-Gm-Gg: AZuq6aIbuISWATxckBs/CsWq7mQ8PLZKoSMnRLTUBF08Eir/s2eWMhirHGURw+4/SRi
	dkNRJwT8pKQmje/sAUIQMGAlW6RzsvEV3Un3+ulZoZW+XrM9UTMdGW3+lpNNxhk+f0/crOTvJQg
	bxPq5j92eSOEk+d7fxWRU+ury3tWNrjHU/Ks7TTVH/173txADB/9QdTL19jFfSopstTrHn3ThcI
	HPfUOqgcL51rNy5ft/o+PdM0Oq+BxsNCHWsWLGHtFGgMRok4PytFiorfc4LjlKUGfhDMq1yKwnn
	C0V8pNs51pC3HT5pX89d2FQM3szYxw==
X-Received: by 2002:a05:6214:2029:b0:88a:31e5:80fa with SMTP id
 6a1803df08f44-894b03d166bmr48060006d6.16.1769421950096; Mon, 26 Jan 2026
 02:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20260122025736.187410-1-colinmca242@gmail.com>
In-Reply-To: <20260122025736.187410-1-colinmca242@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 11:05:39 +0100
X-Gm-Features: AZwV_QiD0vbfQaEJrGhPKU-7BzjfhhooWmCkANlb_Sc9LWZ6Sb89-WtTIPw1wnY
Message-ID: <CANNYZj_2p1G8EseLFXAnbbUcuSbZxmQ-2V=TaZUSX5CKAiLdXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Add legacy-openssl packageconfig
To: colinmca242@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229977

On Thu, 22 Jan 2026 at 03:57, Colin McAllister via
lists.openembedded.org <colinmca242=gmail.com@lists.openembedded.org>
wrote:
>
> Fixes [YOCTO #15416]
>
> Adds legacy-openssl packageconfig option to allow users to specify
> if they would like the cryptography module to support the legacy OpenSSL
> module or not. The legacy-openssl packageconfig option ensures the
> openssl-ossl-module-legacy package is set as a runtime dependency. If
> the packageconfig option is disabled,
> CRYPTOGRAPHY_BUILD_OPENSSL_NO_LEGACY will prevent the library from ever
> attempting to load the legacy provdier.
>
> Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
> ---
>
> I wasn't sure if this new packageconfig option should be enabled or
> disabled by default. Leaving it enabled seems like the less disruptive
> option, although it's leaving the module in a less secure state by
> default.
>
> I'm happy to update the patch to leave the option disabled by default
> if others think that would be better.

It would help to understand what this legacy module is for. 'Legacy'
and 'crypto' together aren't a great pair of words.

In master it's possible to break such defaults. If the outcome is a
more secure system, it's even desirable.

Alex

