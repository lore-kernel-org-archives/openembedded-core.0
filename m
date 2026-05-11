Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87147CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:47:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46349.1778492841611416583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EZIpSrEC;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8f984bddf4eso392796685a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 02:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492840; cv=none;
        d=google.com; s=arc-20240605;
        b=VuY3ernBWVbaSmluBeXU+/t3hjGZSkJ3mrDlM2e8mvx0kUDmay+sDpQMpXBLLStYrX
         RWMVSwTOtuoW1q0W1aILBim4LpR/DzOQdk7i9p6EK6GwaftM1boXYD5APnYT5S1RupMp
         VJKg7nstDZ8Q/Yo9hmX7ZW1BAwVXCQYZqXWsFkfAS9m7I+fKc6/OjjPmvGQfdjr3Q3dv
         iR91oIpy99soUnr8fFYnB5qCNPnXslD5NWjFLjqRDGncMAfEHzSK3CeW2t0ER1w2wQ40
         MMX2JO+zeKZPrDhadKuotwuDR2JDixBPXPb4A5/MWdxAHYEsgZrWRz1fVjZoRPpc7+U6
         eCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dLZA2nshSNiwdqjcZyScH7ca2h4WZCcTtmQhColpK7A=;
        fh=6D08F4ViEPMn9fNUTnXxh/MfSY/OtXZrNXQvtB6wCB0=;
        b=OzFVvtazBRS5A89Kcs4L+zoFpSpQ+cKeUXJssExigUcryHjMIhNwGjIOdAiz7xmtUw
         CaLd5v/EclAtIxO8dqqbPf1YwDGQZnGvW3Nq5OjTl3Pp3IIuEKEkz4jnQUmNkJlannr6
         lJzdrPe3aqeseKsN/JVWvdpFQaVYOFFXyoLguRNhDAdaEWFkOQhhNWe8od8cyZ+UDPA4
         ZenYip4QITMUF8ecxKjLW+6W5GwpNf9rt7I5u5pUcgKe54BbUBtHjzalbJ1hyFEVj8cR
         40AmLu2mWVzulapEjnVfEkVq24p++4kL5EwveVFn2kHxpNm3hAbatWwkYo7b6JL1gRTB
         yJfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778492840; x=1779097640; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dLZA2nshSNiwdqjcZyScH7ca2h4WZCcTtmQhColpK7A=;
        b=EZIpSrECVUGZDa09rhjj3SWQ1zaIOwQDrcac+0BDpHNEEpqokNHWmC7K3Ws1kltETR
         fA3QBi06jxCnicvil7up00hXehfzZ3dI7mfBgDtN0uQhRojZbHLjZUaujgNs/PFwXFek
         taN855PfvbNtjLB2v/R9A5TdjcGzoTq8PhBwcUAzEejePttIamaE8ivniZkQZgy0UET5
         E7QPBVc3IPm/vGMTH+Z/nC/sJPLHtINMGxbbOM0zSRcuCkO4VtFg+8s6fQDWnP7lr1pq
         Vcn/pGxvMhynw03Pz/5tEbAF2e18AjTUcHLqTe/PKyGq+Y+MoprdWBQZq4V2CJ/NxpEp
         fWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492840; x=1779097640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLZA2nshSNiwdqjcZyScH7ca2h4WZCcTtmQhColpK7A=;
        b=FCkMBqFnUaQX9VSE1l6Ejx3kfyCyqJN/G3NKVUuR+zI3jXUZ2vXn+z//iGq6qb/fB9
         kkDkbkusAfuPaIj7EXBNoZucyIWwtAKDNHz6xsdLK8OGCCQ8Ji8NqlgziJFltEGvLIT4
         4YnDrYVpoYfOiB/339dgx1/kNOe3L8XirtsVu8j5JdGR0A9X3aP1vVOeCQIbTColNL6+
         LWLdJDBqR5I4chYg1IGnZJKhpGu/ym+FpC4mQFnH/1YiYhUCXaK+YweRwkzdwfa9YKMc
         5vJE9vz6A6sC8ZaeLl39FBzN6E9x7DhmZeya2V8JkNAjR0I3U3t2/Z+z8coYOUjXr860
         JYNw==
X-Gm-Message-State: AOJu0Yx4kDKMXPhY/lTdM5e4aY/2Tb/OG/S7VxERFkYr1fs9WsqvrzZB
	HQQMl2XYJyqEnw+2BYVnx4wvjltk4TM321ReYD7lHGGerXG51VQMaIiN6dGnlbKfG7DVV9+ERV3
	dzG+SOcfcfH2Nuad9BBxK9x5Bgutr7QMMehNv
X-Gm-Gg: Acq92OHYFKX4iWeAgeMI9GZiQF4GEExj+25CWtu2QJlnLTNPbXgkkRlVZNapSUMZWV6
	C1QWoalZ2rW35e7WCxOjl9Pzf4VZLjgxSKH5AEI0NCvsNTHEpoVO0QWcKU0Y+ILXoCYV8hnGtpz
	VQGT2+W8y+PpiUZ/Q9E+Pu8tgSQfIx2nnolnnq1VSQLr6XUs8c+FqE9q/+FXyL4JSQr94jvfb0p
	LMm/OC//z6CWAlIQsfFnnWdiAHCV8zeE6MafAWpTiDWA66BidIGnt+OjMdrW3rbnTqtkZVoLQPY
	HB1TD92rpJYpe+ieSnmJaDJ7wrUGO+PzmyE44M7P7g==
X-Received: by 2002:a05:620a:29cf:b0:8f4:3895:25da with SMTP id
 af79cd13be357-904d4d530c0mr3234808585a.25.1778492840475; Mon, 11 May 2026
 02:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
 <20260509053033.1565462-2-Qi.Chen@windriver.com> <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
In-Reply-To: <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 11:47:07 +0200
X-Gm-Features: AVHnY4IQdRw4qUSnL1bb27yqeDAi_-n1cAJmex6ULUakx9YbOTm5RbRLBVBCMbI
Message-ID: <CANNYZj9fyVhh+WoMf-HP3RhfkaxGaBaKd464wvSHLzgF4dL3Gw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 2/6] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236795

On Mon, 11 May 2026 at 11:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> To be honest, I would not special-case the len(v_parts) == 1, as the
> class becomes somewhat inconsistent:
>
> x -> x.1 is supported
> x.y -> x.y.1 is not supported (instead it treats the stable versions
> as x.y -> x.y+1 )
>
> These are two different schemes, so I would not mix them in a single
> class, and support only:
>
> x.y -> x.y+1
> x.y.z -> x.y.z+1
> x.y.z.zz -> x.y.z.zz+1
> etc
>
> For x->x.1 we can make a different class,
> 'upstream-stable-release-append-number' maybe ?

On further thought, the class should support only
major.minor.point[.subpoint] schemes.

The problem with removing only the last number is when upstream issues:
x.y.z -> x.y.z.zz, we update to that, and then there's
x.y.z.zz -> x.y.z+1 - this would not be considered a stable update,
even though it is.

It's a bit complicated to get it right :)

So basically:

def get_majmin_version_regex(d):
    pv = d.getVar('PV')
    v_parts_majmin = pv.split('.')[:2]
    return '\.'.join(v_parts_majmin)

...
UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION_REGEX}(\.\d+)+"


Alex

