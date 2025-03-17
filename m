Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B19C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:25:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.51087.1742214315504478353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWQ1N7q0;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e91d323346so46350806d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742214314; x=1742819114; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QTDaate3W0WW93RpAlKz1lu+GG5+/i5WBJN9kCtREnA=;
        b=NWQ1N7q0oiAWiSbU4I6f7rwj0WeNLBLwrgLiIHDI/R3twEcoX/+7VM9elkzAjC4/GR
         xF8pWzl6L2H+Ri2O4hcHsT3od2tZL6stEEZeTD5Cwl3MFTfomEPkdQvgG9XsPsLuLm4L
         3RuJ3XpWzbSlmz8POhRzCuy4R+thtkbo4k5uDcxSy/Vn/HhI7VRRUyh0/cbHwijB6mEy
         CmZAi7iaYZOhZg/W2x2PL7t91dCadjwxCMeHin/RubyoS8RTrxBDMOf255o4XGd1Pehx
         4ZpbHzOg65xw0bZ5bT96hX0QFiuouX+M33gPwqMp1nyMIvOMpA+7GFcq0G/7j09clNgq
         pxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214314; x=1742819114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTDaate3W0WW93RpAlKz1lu+GG5+/i5WBJN9kCtREnA=;
        b=KxEnuDiQ/AOs7TcuxKvz+QJfk3yRXkPFdW8N03N/LBWPgxIAH9cdA58cQ8EKR8GKLG
         d+qxao79o3EYygti/BN/2xHMmb+q8oJESvKJndD5bGg4VVY+ALk2pCgNSTnJDc/79Ol0
         AWfCYtj9RJEFD+1DXBDJ0hsBL5i5UEpk0FjUNxt8Dxq8nSP6CXbtm9oY0Sapopcwcduf
         ZwvHdY/kuE69qBtKUrTWLJO8PNDXd3CvZEm7/P6QmotMduTQWG7ja7NzHJeJvZkVCGFL
         FoG1OPKUKEQrc+Fri0eUSLYos9U4GFWnbx5TK4WMjw/KByUbH2X7xSAfnDTCjkrA+X4B
         DUVg==
X-Gm-Message-State: AOJu0YyEiHWLCT8fMUWUOV25M2fSr4bke6i61vxChkOsmi0PExD8yG2K
	c9d7RJFSHQSuZO7RaT//NAegiCPhCF+OIlW1fKQPNZ6eKek+TSeg5mhjelFH3GpvVXcWcKwjUhS
	h/C6kI/OIsUd1T3x6pp3yypJShYDjXA==
X-Gm-Gg: ASbGncsrWds7DKM0JhYByKo9mF8nnemAyr+g1TwbUdobJEfcJtDuSjbpbfrOcl1xdPE
	NW8enwoQt/gd30qhlejUb3zg/ZcglaQUSvASWMuNq1LK5dVtYigI9xgFPLjHCxmw+NdHGykRw0Y
	0gZYF3IaV8KDZg8qZ362OH73S1fgAadzgKTlFciGIYFBCDWc9giQWB6lbvJ6r4
X-Google-Smtp-Source: AGHT+IGVTK8I49bqdd9X/HgXqpp+EYDMp+h96xsO/pzQfWRvlSDKIkH1cXLGZesO1ONG6/FNoCubgxuHdsqGS12HrCA=
X-Received: by 2002:a05:6214:624:b0:6e8:af23:b6f1 with SMTP id
 6a1803df08f44-6eaeac38796mr129849586d6.10.1742214314459; Mon, 17 Mar 2025
 05:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250317014144.2113-1-maxj.fnst@fujitsu.com>
In-Reply-To: <20250317014144.2113-1-maxj.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Mar 2025 13:25:02 +0100
X-Gm-Features: AQ5f1Jpjx76KlXWL29IBQFQgpQkP3jKeWXSqnApDUMAIpsRG6Rmfx86wuj7j3zw
Message-ID: <CANNYZj_hxdDtmR3WZ5H87KArf_cDMbS_9svx14c7Tt2Dg4gQzw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kea: fix conflict between multilibs
To: maxj.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213083

On Mon, 17 Mar 2025 at 02:41, Xinjian Ma (Fujitsu) via
lists.openembedded.org <maxj.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +Subject: [PATCH] kea: fix conflict between multilibs
> +
> +There are conflict of config files between kea and lib32-kea:
> +  | Error: Transaction test error:
> +  | file /etc/kea/kea-dhcp6.conf conflicts between attempted installs of lib32-kea-2.6.1-r0.core2_32 and kea-2.6.1-r0.core2_64
> +
> +Similar to:
> +  | 8cc65e7eb067413b4a9b1449c51f88158f3a6ae1 kea: fix conflict between multilibs

Can you rather adjust that patch (add the new chunk to it and your
s-o-b), instead of adding a whole new patch?

Alex

