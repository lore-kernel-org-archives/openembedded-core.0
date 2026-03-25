Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDCC106B527
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:46:35 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21340.1774442792212432137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CiD+AtEa;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899a5db525cso17736906d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442791; cv=none;
        d=google.com; s=arc-20240605;
        b=IszsTxTuueDOEEmXm0wTCFabI3SG9mcWu87yvgtDbEdNIG24mWo4dwQC6pqP/DcMiJ
         mmB2vPd9oVJ3MTdF9s9OM/N1Tj0KP+ZWOKqtAoWXCVbTmM4JROk3rPe+vPfffl4hgKkW
         cgEMnSKxmI3qcWB/EA9UdVJ2zKKoPGi8ZJGWJPtt3+YNOUSo3UgqaT/R1WoE/Lllg07p
         tb84OaFUIk3BSP8bx4/Kfu091zM1K4XxiM+3TQoR0DJ5CVKu0i33CkDkMhwF1u+ILJLz
         P3e85VW3MdVucpQjz70L78Gy4EklwtypqRCj/lYNcaeDrutQYUBwNM2Abq/+ioxZSg2c
         1rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k9LUuCziPsRKlC47YTcv87tiRW+znv78KbrXBfKrGdQ=;
        fh=3dFdSa06sIBSurIbwyKgVgvfprkdWimgIZOm9DdWiG8=;
        b=BNgZFgESe1+TVyTZDi9cFbECb38+H83pe6GoIg2U7XzEZ55IL18qWe/tBrogLx8j7B
         E9wz2PrP2VvnZ3Hcr1yY0a73YgwetHLujihKZiiPBi1QHRPSrrnX0T2WtAHcbkBeIcV7
         NWJV5K3zZ8ca+ik0MwqsG7zmpT9uZsQJPWk8V1GdaazfwmjSMeZq0jpcSq4CIJwXE+lc
         WG+E+x4I6cXhjnkOWuU5vKlIoR9UHq/3It42c0Lbtj0sCPURsx4luV/icJAozEz2gXik
         vP9iTgvofH58VRTJGc9eviUbiqjTSvajGsWVAWzKt7wAs3kaxfM+D8YarEWwSjcqjoRe
         vQPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774442791; x=1775047591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k9LUuCziPsRKlC47YTcv87tiRW+znv78KbrXBfKrGdQ=;
        b=CiD+AtEaKvVrYKdQwxcqYZFv/eT58Anr4ck6tPEx72TY77uSmoi2cd2KmGNwtYSaTj
         4GRVgANKhdHTHyF3/pdcVhp72QgIDeyzgcUtS1aMfyeOE0CC4PgH1CUfO/TWLHq/4evn
         yUQUAOlvX9JX46by9B8psrobKM/bKHZ7SL8s895ZwTUSkrSRjZ8qWd6eT7hDuYe6ALjQ
         DKOwU+SSakpaL2JJF3BZzxUTF/VCMvJDI9eiEC7BjpiPHN7LuE432AVAr3rx+BrlSUOr
         PyxykaCd2N0pzYRbc+8oYLT/lOOIvlVXHmluMkO9j1/YnqmPfdnpkUK2e5YrAcYcoTW5
         L3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442791; x=1775047591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9LUuCziPsRKlC47YTcv87tiRW+znv78KbrXBfKrGdQ=;
        b=I57IDfPDflKkdpq4k++IFAwG+UtLdE8myq21cGETXolMFrGJfo4To4oEIqhINFrl1R
         0BRLfncYZ0ZIDHGEWD2GEu59QB9M25n8ErvRhq/5CUZNnOcyUL/2t/3c3ZjZCkDF3jJ1
         MTZp7rgAUpP6AaNhuiASUGC3kISAFiSYaBoGHfT3bubkCPp5Kf7yC9fzsin8yR+m7hfk
         7QduN+YWnnIYgrvF0nq0QxmbJCL/KhqqFxwpCppl6o7jBh6M75wJ9cXW6RafsiUgosBw
         GNSYm4EDmJyPKPvlciCq/IFmBm+oe5OFMnNh9SyQ4zbFV2nC0wPiSi6OWpaXjgi0P7mj
         1kUg==
X-Gm-Message-State: AOJu0YxnqVfG2wV/XecAmcCAfk6u6jXdCZ0rzwXn11VAUu6XipQszsmn
	Ujk6eNwmy/SjJvkWPGCVmWPKE+prI8QOcXWskS9Q6gnl8YmrlGa4MwXoiQ55wXvxdAoWOhpz/ui
	fWGLBwwWIkTBEtwKAyMtsEyhZLmhGJw1ehoX6hbE=
X-Gm-Gg: ATEYQzz0n99ZA48UhFMKnTjMrX5gcP6zlAbhLos61HSdHRqgqPpG5X8/xVZI15bKOL3
	xOCGZ+mBqIgkWnzhJwScdIwwyOwCCly2sMkbrn67OxPOptRNxH/JdXZwdukGjEXXFHT4z+tHDwE
	deDEMN8PPrvCvBn5MbOkvVLtc+Nq7eRCsFLhkGzUyuGtC3RC6gO6oBN6PZslETxQ0NnQyTUqJ00
	S4jL8SKId/mAYh6yhOdkk07gGCYgLiWJVsl9SIOS5uy+Cyp1ygFmMd8K2ghGyh63jpaQPlSX6Xb
	egBlBs/dcj8W9ZJY4gvKC2UAZxfTBA4cHnGSvkLV1w==
X-Received: by 2002:ad4:5965:0:b0:89c:cb0f:a4e7 with SMTP id
 6a1803df08f44-89ccb0fb02cmr21617846d6.53.1774442791092; Wed, 25 Mar 2026
 05:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260325022629.2245688-1-hongxu.jia@windriver.com>
In-Reply-To: <20260325022629.2245688-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:46:20 +0100
X-Gm-Features: AQROBzDe9Lc9aATGVsFBX_CBL2hy44iof0SXgUVG4BEQ5a0c7F7jaf9-0J7oSxs
Message-ID: <CANNYZj9i9EFbo79nNPAtzXo03gLeJNC4qW-9Pp9u1UstvQp46g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-numpy: add cpu-optimization option
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233900

On Wed, 25 Mar 2026 at 03:26, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>
> Add a cpu-optimization option for disable-optimization [1], disabled by default,
> otherwise import numpy failed on qemux86-64 with kvm
> [snip]
> >>> import numpy as np
> ...
> RuntimeError: NumPy was built with baseline optimizations:
> (X86_V2) but your machine doesn't support:
> (X86_V2).
> [snip]

This error is odd. The default tune is v3, qemu guest does support
both v2 and v3, so perhaps you could check why numpy selects v2, and
claims that machine doesn't support that, and whether we can configure
it to match?

>  +PACKAGECONFIG[cpu-optimization] = "-Ddisable-optimization=false,-Ddisable-optimization=true"

Reading https://numpy.org/doc/stable/reference/simd/build-options.html,
I do not think setting disable_optimization to true by defailt is
correct. Currently, numpy will auto-detect the capabilities of target
machine, and configure itself accordingly. With this change, that auto
detection is compeltely turned off.

Please explain the rationale for this change.

Alex

