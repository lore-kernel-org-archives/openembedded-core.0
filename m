Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AE6C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:43:54 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.20444.1741283024057236872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 09:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9lEUcAe;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so16427626d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 09:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283023; x=1741887823; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e1U/06SEdFT/AcPjyilQbmRaPNL9agD4QsGqxYwQV80=;
        b=M9lEUcAemB2LWq9fDDiqBFi8HyVX49vQi2bnr/EOF/gkwfoKQu9b8p3lHWd3eAzv79
         +xio0P5DaKso7rBJ76Gt7VQonO3MIJBub+HMEbWulVNw6ycZfUqWhfcg2PmDEDI+ngfW
         9lPvuVk74NneQfM4SSDBi8AYO8qey0XJfwx+ymUnaXNILYo3u3JyhuJBLoF8ZBQGwSrk
         NhLFe0bVWuDQocCYwhfkzcp03B7JPGxbvkWU7Y0ZC8lv6MNFde+6qytu28dnMCJmwaed
         jm8LTkkd+XzVLEQbSSNKaQ1WNlMxyTRRX0u1dXe4pW6wtHn25jKHA3WPDXYmgM+xrU6a
         U62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283023; x=1741887823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1U/06SEdFT/AcPjyilQbmRaPNL9agD4QsGqxYwQV80=;
        b=NdTFxCH2/TRml6AYmFhEQTRygDaxtCJ7Bo06JAE0kNv0hpNR2+5cy28JfT9mMGNbtV
         rq7SNmvUGQIBT5U7Hxv6a6BBDLvSFMkCR6zSHDF+sXYs7mPV/8+gQSUVQJfhsMdBK/9x
         2S43SOAd18+1EWlQ9GEUUNw9q8zql9lXr7ov9FA5+jnO0IWagqEqiX/b4lvWN1rLT5Fy
         ks0HuwSIgmAxl7XcoBypKb6lFZdA54sHQNslMUF1bwz+mOvuI7K4hvQ/nfh4Ev6BV4bE
         16A/x2ibHHo8jYEZreInywhS0+dKRNYqopy2ZSmwALzzFjqYVfshz/h78oDOnlCZHo5O
         8hwA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bIcBuQv0J332aNM0Zb5e8hx0hzokfUqmjAPJc2MgmwkHvi372g6PJ4K7hlHYgPvUL/sSSMpNYBWnieBqt177DA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzaXuxwWJ01Md8AHN7+Yl3TWC9Xkzx5SfmbEp+JolO4H8sFBT+O
	Wm4D+KWRwLLJrFN8G8TX+6TDDsSbIuZeD1IGMkUNsq/l4kJvbmI8H4tLqKdMVDzSsbnnLwSpLjo
	d4CWb9oNvdDm/RiOps6l4vQ8haYY=
X-Gm-Gg: ASbGncsUvrsRgnC+TK2o/tOZEmG/eWOyQBJpL2Bx69cELIPHtUlhGYsqYEfuHmcNr0z
	Ys0vxNVewK1ITU0J6DR6qWgmgrGuO71M7bN2D0BFaj3IsxCuZ0ljb1ghhwS2K3hhmPMzrdpDFeN
	Rjb9SqpvvH1XNqwkgbuvJj+VUwGoypgenumXDulkMLbFEnWDQE2g4Bl756jEHt
X-Google-Smtp-Source: AGHT+IFrgtJ1I4pVMXZwPAgGYVF41NWnTVqhZ5F0NNHg2I+rdjBno+VxzbNqkrA9NAOAH16twTHzNExMHxxyqKp2jSc=
X-Received: by 2002:a05:6214:20e7:b0:6e5:a0fc:f65d with SMTP id
 6a1803df08f44-6e8f46e4aa2mr54848866d6.10.1741283023061; Thu, 06 Mar 2025
 09:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20250306145246.2923077-1-quic_bpothuno@quicinc.com>
 <0ba2e2413c2573331e643f0021dc0aed964e005e.camel@linuxfoundation.org> <d5b6d423c5284906a7e69eb0184938d8@quicinc.com>
In-Reply-To: <d5b6d423c5284906a7e69eb0184938d8@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Mar 2025 18:43:31 +0100
X-Gm-Features: AQ5f1JpU8HKUrX2HcgoA1fgVCon7PnsbJSKvsEKxsl-HkMPoBGXtTIsk-maMk1o
Message-ID: <CANNYZj_rQ8YVcAGshyb0Ju84b0FPqzJ=RQ2nT3pUOJ5A2H6dew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] dhcpcd: upgrade 10.1.0 -> 10.2.2
To: quic_bpothuno@quicinc.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 17:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212401

On Thu, 6 Mar 2025 at 18:17, Balaji Pothunoori via
lists.openembedded.org
<quic_bpothuno=quicinc.com@lists.openembedded.org> wrote:
> > The key thing we need to know is did the license of the code change?
> > The recipe says it is BSD-2-Clause, is that still the case?
>
> I noticed that the dhcpd source code is licensed under the BSD 2-Clause License.
> The MD5 checksum of the dhcpcd LICENSE file has changed, causing the recipe to throw a compilation error.
>
> ERROR: dhcpcd-10.2.2-r0 do_populate_lic: QA Issue: dhcpcd: The LIC_FILES_CHKSUM does not match for file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c
> dhcpcd: The new md5 checksum is 4dda5beb433a809f2e0aeffbf9da3d91
>
> &
>
> #md5sum LICENSE
> 4dda5beb433a809f2e0aeffbf9da3d91  LICENSE

In this case, you need to actually check what changed in the LICENSE
file, and summarize it in License-Update tag. You cannot simply say
"License-Update: something changed".

It's probably just copyright years:
https://github.com/NetworkConfiguration/dhcpcd/commits/master/LICENSE

Alex

