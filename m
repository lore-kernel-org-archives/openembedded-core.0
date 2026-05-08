Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC2FCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:42:38 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2641.1778269354444338730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 12:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GSUr8bzv;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899a5db525cso15246226d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778269353; cv=none;
        d=google.com; s=arc-20240605;
        b=jOSyxwRoCJfcO2C8JnX3B3FI6TPtqh5eiyeG6/gzKW0VzI99fyu/BkoYXMM1MYbVdB
         jNWT2ifMpNSpnxoHbvoABlamDtBJ5Y+Z1Rn/AW8KWafCdlglqyYn0iaUIs3EWCuLO0ES
         5yHVTMUZwdGPYZWFQFANCzh7l7jpxviq8wTyZeNYT/KGa9fDRdGAxLrDcyXF4S9j8SCY
         Zyaocu0USfPM3QrihloSS5z0fq5sB1Nm/djh5PvnerefCJ2OR9l8i5iDQ5n5cctI6j10
         w/KNnMge8gHFi9Y+3e4TBT9EmW7d159MPC8rhzu51nOXB26LIM3Iejr+TeDOel+fy6KH
         MXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wPg4GrRqo+tBVYpIEe2FdN06H5Hv1/GueqW8V+0fTRE=;
        fh=MSjz4K3LYtALKJOtqf1MAWHHev6PceV020mgDq1NNBA=;
        b=SNmpo9jc7xmvqSJ1+c/nPKDKU3m9i0bhTSCkdokF6uKdqyRb+lB2+aWfJMznsLEtuZ
         p/L4QkXfCl20dnfN7ZSf6+u1jfGBqUT0ZqVgih23I0gWg/xWr0mfl+FlG34eL4on5QwM
         qqx10psbiQKuKkSLnV5fsrYigTmW8GaixCUhTw0adEuchY6Ar3Cn2FnXpfdikH+OsTuY
         8pu6sqA9xarHM1TtyQOCckB2wQohq2sUEvapdwOGe5fC0y3sylCDiyM4Jr4T7GtU9B5L
         JzHvOLkjdn8kKGuOjTSEKLFjxLZsDqZReuLLUO5z8Rq2OM9tnrhdm7pmMTV5w2BE49q3
         Zndw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269353; x=1778874153; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wPg4GrRqo+tBVYpIEe2FdN06H5Hv1/GueqW8V+0fTRE=;
        b=GSUr8bzv3j4nU/5BqelSAJpZH+bBlLJUsPmOYq99QTMtrBW9FVkGGrnWhO82rm1qLX
         nXG7p0+LmQdKYH7PnouFq+mnCw542hVG8OeOUKxdkN3Pw90xobdjBzE4NShqQdIy9CGo
         XWwpXixTau3IyKrb6iijEt33bw+CCuUDu9CE85eYTUn1ccd75/KPLLmH+cq+UuUt28jw
         yQehorckcwNZ1FHq5rBg4Jo4Ix3HScvuGwWE/YTf9Zr9Try6H/l93+CjQyayFU1v9zV+
         sxj/jYCEeKXw4O4K+Qvhrbqx6Wpocye3R7bPvVQWwu//sbVcp7drf96KIp6KUpx27VjZ
         drAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269353; x=1778874153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPg4GrRqo+tBVYpIEe2FdN06H5Hv1/GueqW8V+0fTRE=;
        b=WT0Db5hY1FuxeRY7yfWtgr6QfIec0ELW44SZl5seQVxD6lDSTf+F4uiAOl1Grmbyal
         IKPOkVwWtp4gA5+k3sv7PVOc5Ithnf5Eni9clYvyV1ZGkamyXMm+lefYPpGY1HE/cmzR
         iwzeWgHrmaN6YkL99mbCxXGPgtNzO9fo66G8mNdAceMaH+G7THaQDDPfKF9SZ4vHlDrp
         i3hU5hlX5RID+HkFpI7BvZNQjm6h3yGuOR26bt80svm7saUg86Gpc3WuSZMWIyt2IWyM
         7F0EiaLdBYzYDQAfrKZJBHCw6JX/gcWwFMHeSyqgh/eYs2HFQTFNlKcJmuCXVj0Yz1GR
         fejQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Y5IE0XoQExe3/9uYkMLg9HUxV14tHax+lrXrCY6zoulQ922zhSPaXrbT92RCHHS9b2+Vakii4+VmeeEhwkOI6fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwF5b8FkV4MEwAVToLyH6t3FINugJzY7oHX5GWnyVQ7/JkRrsiP
	5CUhvXh3yYxGxfQUujlIOlLoNvwcIvYNYrIOdWLJQpOXa07TqrHXyVh4PkQv41OkK6zUpRq52Jf
	Zt1oz3xUrvah4MgJ/yg0Zh+iTszXN7Hs=
X-Gm-Gg: Acq92OHkulfbnr1l1PjBja5jo0fUDyXAnVI+mPgUJYZInPHC6zjVS4Jc5sAfjdRdvCs
	xQV+eDpRG4IrlYaB+icwGpll/2VTcMaGxg0kU9qvL86LnSrDX7Y+iegyUHZVlEApVIJo8dBORS6
	LbLnIvl52B7Njn3hdS3W+FA/IAjkIeiI22MrFnzscMTTMu+XHdvqE2QVv90B61DfdJeK+iQdqxO
	u9WteRneoeiV3wD9DKe5mXX8QH2ul1g1XIRA2BinoWz1mhEQMtRFErhwchWXQXkG+O2dhJDsnFb
	AjUpv0gpNhFEtSPcc9LHM+KvXkd51dMOp1/7LGki0A==
X-Received: by 2002:a05:6214:319c:b0:896:fdd6:4a93 with SMTP id
 6a1803df08f44-8bc467e16acmr189928656d6.50.1778269353346; Fri, 08 May 2026
 12:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
 <20260507-update-sbom-cve-check-v1-2-3c398db78f5f@bootlin.com> <18ADAC6FE23DE2EF.2984594@lists.openembedded.org>
In-Reply-To: <18ADAC6FE23DE2EF.2984594@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 21:42:20 +0200
X-Gm-Features: AVHnY4I_iGpWc8Gc8ZZJVeLSrCpqurVrgfP3RSPF9UbP8wa0juxblJ-Pw7zMhCM
Message-ID: <CANNYZj-fGt-JVeuqFcd6Kx4O7F15aYgvd_0uPQkGdNswz3qSZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] sbom-cve-check-update-cvelist-native:
 Update source revision
To: alex.kanavin@gmail.com
Cc: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
	ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
	antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
	thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236736

On Fri, 8 May 2026 at 21:03, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Note that I submitted a patch that sets PV and tag checks properly,
> and fixes upstream checks:
>
> https://lists.openembedded.org/g/openembedded-core/message/236714
>
> Can you rebase the version upgrade on it please?

NVM, there's an issue Peter pointed out in my patch that I need to fix first.

Alex

