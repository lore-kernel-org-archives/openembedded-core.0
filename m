Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53C110A62C4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:06:46 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47748.1774530403778733085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 06:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ScjSmzSz;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-604d732cd22so543260137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 06:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774530403; cv=none;
        d=google.com; s=arc-20240605;
        b=APu7a9BfWmytru//pUVHaMFUyYy/SJ8ZMWIa0FMX1qkez9N99EWn0uDD/OBCrF7PRP
         FJTenVM95NriDX1tsJkIdv88rb4nfnQiyeXmlQz6QTSZ95IEDDv9ElN2qp2VVn0gZZh0
         hnigHXcOa5ksqiwSFjRguALqLlVWpJTjsf1fkRF9uPPubGEkV/vQXAAj/89Ay8Ooz2RX
         NdkirIulpURSBlLIw0OUsyRoZypyR7Rp0w6jfNg5wS06hSDJeoaLJQH2NkWo/1xM/KHD
         NnmKOuKpIjMDwnuPNatAZaDDfKWYHw4OL/TltbZ6hobHYnLnJK0aQaFNQugUXexWrCWf
         uGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u9tKFYWCPkfU5T36e0VwU2oFPktWd6n5Aul2jOjACew=;
        fh=/0Y43L5PGdOdPI/V/fnP3dDZP+IhznhUJ8dXlECQ+G8=;
        b=TqsZeCIDMZ1hcznJvzim5sP1v+FxjXUnGtvpNNOOMsSPdiLjhnWxK8duXRIilg01xT
         rJ5Gmaqwkb1IlF1riMPxWpgkN+e83KJtZXEY1QSGz2xLrZEGiIcXS3bBH6/+EuWolSdk
         RJLtTQlMFlR16Gb9lFQskYZ/WGLkmolu7TjfVbJNu6GLPCB0dXIakSvR0z7gCgo89jva
         7WOMOIKPO7ErKXdHumsJJCwtsyITrIyz4WJWABsRnfPLFm7H+RchbUp0bUrapHoaCpkG
         eRzzW/+zU/8C70sVjANiktdQcsK0fhgaZJe+k5ExgCj78R8d6bMMlO8nacZquJWPMYbs
         ZtOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774530403; x=1775135203; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u9tKFYWCPkfU5T36e0VwU2oFPktWd6n5Aul2jOjACew=;
        b=ScjSmzSzs5nZEEK28KQ8hdmHOrCgHMkXnc9l9ma4UpCmxhy5+w71ACa6kY9eMuGFEw
         ZFOxbfKMesaAjS9qLIvpKYjJMmRbi2P4rhR9DPAT8AnNlIOeXBAJU/IaHcQQ/YgPsAWy
         mIDEu71OsKJP6rBv74iLNF8PMdCCP69C8K2zygNzcFDa0ZKbfseEaeMjLifntvYyu3NV
         yJ2HzPSEowOWTMcd4i1Jk7pL9cK7iM277L1fOWHvZK7rj9+Y2Cvk5s53tKRiTqep3UGm
         sWuO7dEmKGa9gPSuoBtWlXjNTGfqwi1f6RpFZkfT2rWaOft2/gFpo3Auc/WD5LrbO8JV
         sorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530403; x=1775135203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9tKFYWCPkfU5T36e0VwU2oFPktWd6n5Aul2jOjACew=;
        b=OKYXms5AsuSuArze+J6Sb4nTh5hIkL1buETXsoQ7hh7O27WzNsnnLeAinOmHj5GIJO
         kMzuOphtHFV34yyqDtmxxjx81fn0n47elQ8dTTurJ5amjt8y8T5jpKm1v6KtUlhSSdoz
         mxOh5de/kuKTnzPz0TmArH45DSprezKwPXwV/fve3fE++8DI6qsy/S9/khW4REzAG22y
         kuxb1s14eZ3gCbzRMN2FmVe10fF4eQeI5CfrOyq259/I22jhGN/w8dPl97E02bvIMJ6q
         YzqrLgpbWfF7ZVIod5byY8Etqm3b01fFX4e8skxa8Br7nVVQ036Zdr0OZaKf5QuaXV/Z
         oLwA==
X-Gm-Message-State: AOJu0YzFxwXoCG6RHIz6YCORCbXndF7lbLunnTi4vYkcm3I5/XrR6Wle
	K9deDhwXdwlGAk5+RfKe5aHlxHK9gpLTIksS0B+G28k8Jqz7ILcV0pxcf3V41wNZYV9xhMmx2Gs
	qAAHjiKkRkSYaX/YcoiOibwrUJPkypRE=
X-Gm-Gg: ATEYQzz9DJxUy0/TtvxNAkyL5UWvdAcw7vIb2ZPuQdo86DNxwXGgqRSjilkGACcB3K/
	8fBIYdCKsZQmGHN9vNy530g5afrHIZEMFT6eKBmp46eOkI7JPB0B/sVDZx0NSYUaR76/wpgGhfp
	H656ZYseA/SPdnYoz5NBSofbUzxOwqSf68Eta+6FSMmWbPSNslVpgg0vP0NczJVhvdzJ2Vivwdr
	d0TcVQkTzV+WMs6eQOZxn0RW7/d8V/nbbbrFj6GmHR+6fL+q47YIl81Ic8cP1HbbXAk6XDIeh3M
	jIvDXPicJENDKcGzmXNEAgmsnzzlz+8UfAIdNfxEeqOEwvvtrKvT
X-Received: by 2002:a05:6102:8026:b0:602:ac40:96a7 with SMTP id
 ada2fe7eead31-60394891e43mr2989636137.19.1774530402692; Thu, 26 Mar 2026
 06:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260326125113.1853869-1-zboszor@gmail.com> <20260326125113.1853869-14-zboszor@gmail.com>
In-Reply-To: <20260326125113.1853869-14-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Mar 2026 14:06:31 +0100
X-Gm-Features: AQROBzAaaNIMbSO2VBkL03TBCrvWy_55tDLVssf2FUO2vwvt6cE9Fbe1PMFjD9U
Message-ID: <CANNYZj9__EU9=6DyLviLss6vXmX52Vf1Rk1i5REobSkbRDq5Uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/13] libxcb: inherit python3native
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234000

On Thu, 26 Mar 2026 at 13:51, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:
> Instead of open coding, use python3native and xcb-proto-native
> as an extra build dependency.
> -DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
> +DEPENDS = "xcb-proto-native xcb-proto xorgproto libxau libpthread-stubs libxdmcp"

This change isn't explained.

> -inherit autotools pkgconfig features_check
> +inherit autotools pkgconfig python3native features_check
> -export PYTHON = "python3"

I'm not sure this is an improvement? We try to avoid using native
python whenever possible, and use python from the host if it doesn't
cause issues.

The rest of the patchset looks okay on first glance, but it does
include a breaking change, and you need to at least try to fix meta-oe
(or ensure nothing breaks in there which is unlikely).

Alex

