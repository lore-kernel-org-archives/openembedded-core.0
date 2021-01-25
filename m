Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.204.1611589338010763623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d/V4EkRn;
 spf=pass (domain: konsulko.com, ip: 209.85.210.51, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f51.google.com with SMTP id 36so13137267otp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDCPxGpX6IQZuaaB9ELla15AmrltXxdZpK8/jvbSp/M=;
        b=d/V4EkRnadW5d7L2vOj8RIIgjBqBbdpNWtfHUK22IMI+ooOkisOEKAFks6qXgYJYbi
         UyqolTn6EJ5o6ssFBN4G8+RVghvRpHhtGWM9R5T/oU3GYdmaYqYIF58XLY9QUa0t33M0
         sfuMfUa3ikeAuXjOD3/oPc3PA8xpvHYi7g+EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDCPxGpX6IQZuaaB9ELla15AmrltXxdZpK8/jvbSp/M=;
        b=fbPl3yk1zZS3ljzZ77tGlk8nHXvK6c9bt1F4k8aEPbnyOxpVTmYYtAA7oHuBVbgASJ
         YLPifmDFK1OBPmQasOn24zd2YJqgbak1svtTyGF6shiL4v64X/NIll69CRIyJddEsvi6
         VVohu5/AfEy87EnLBCMZumKuRVjr9dQGGzTEvSZbFSRHFIyLK9CsxO+i8YXofmrs0z85
         obJ+UYhmlidijXOBdEUyqgKTIHnoTKy9u687uQHVytesDv9iM0vGCgN4vmErBDMO+gHE
         Byp/MnJ6X0jagrZ66yjW3SPc5i9yB6rV6rgtupZP5KuA/kmnN0BXqTy5DEJcZDBtqAD0
         +rGw==
X-Gm-Message-State: AOAM532Ltsdfryxm+0b4v5RKgQ2dAph7GeWXWVz6w7ragouOx1JVKr5C
	Uw5KHiKlf78J2uUuKX62nPWkggUm4TigEterJLgluA==
X-Google-Smtp-Source: ABdhPJzhmCqVJfNU8M9RmG2ljaEvrNpz7ynlPqD/y89s9kjZ2yc3lAST36pkW6fPp+qk1IWhR+go5rD/H24wEd/imy0=
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr843675otq.305.1611589337337;
 Mon, 25 Jan 2021 07:42:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611585425.git.steve@sakoman.com>
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 25 Jan 2021 15:42:06 +0000
Message-ID: <CAM9ZRVsw+VO=L6Fc4iYCtOpB1mJnqmVrt8ADfG1q4q53mt0AuA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/47] Patch review - pseudo file mode corruption fix V2
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Jan 2021 at 14:51, Steve Sakoman <steve@sakoman.com> wrote:
>
> Issues with undetected file mode corruption in pseudo have been identified.
>
> Fixes have been merged into master and gatesgarth over the past several months and
> things seem to have stabilized enough that we can consider backporting these fixes
> to dunfell.
>
> This is a somewhat more invasive change than normal. Specifically the user will
> be required to clean TMPDIR after this merge. It may also expose issues with
> other layers, though master and gategarth have probably helped to pave the way for
> this change.
>
> Personally I think that this fixes a serious enough issue that we should consider
> this series for dunfell.
>
> This second version includes the wic patches which have been the gating item for
> merging this series.
>
> Note also that there is an associated bitbake patch for stable/1.46:
>
> lib/bb/utils.py: Do not preserve TERM in the environment
>
> This is due to taking:
>
> bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
>
> which was needed to do clean cherry-picks of the pseudo changes.

If this is just brought in to allow clean cherry-picks I think it
would be better left out and instead do the small bit of rebasing
required in the patches. We don't know what downstream users are doing
with TERM so minimising unnecessary changes in the stable branch is
preferable.

Everything else looks good to me at a glance.

-- 
Paul Barker
Konsulko Group
