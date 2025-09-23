Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC5CCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 22:57:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2191.1758668227369475711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 15:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b30Ff9b+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so59041735e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758668225; x=1759273025; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t/fFHLf1EbsoC+kgVdnZve7SavUXSSFhzsbEKcJG5d0=;
        b=b30Ff9b+KCs4z6AVuYz/VMY03cKeYSrVaUDO3a8y0Jbswj6UcMqpi8GwzSy+TgWloK
         bmrRgbiieCJS7VFGxPIrvvmBR0CAX3AnYZ8mviR0K/+K8LxwzdY+B4R2VsxhTod1U1ag
         Ieius3Mp1ypx/q6T/jIOVRNgzGK4Yi0lTsHhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668225; x=1759273025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/fFHLf1EbsoC+kgVdnZve7SavUXSSFhzsbEKcJG5d0=;
        b=rG3E0VT2JKFrNDeM3pL9+CGx9ihyIV2MR/A9n+CMkwfP5W0yKvwhxpVWcJeVDBe710
         1tcMplNNniAamr8ZeG+6IfB+2wIDFJ+iYhnmF5IuVH+XlwJaPHw7W6/yTnEwpXsEw8+e
         I4lnjgpIpr25I75feqd0GRPY2CEIdpK9ov5CQXtGKcrE4/36w3fx9cgyMtMMGfv91ntT
         9qgMlCebHl+pmKcrK2imEAnmnAHfRHetjHKBLgTU8s+VPoRriPRPjK8HjLvXEPgX4/hE
         lo8IwyiHI0BeO4Y02t6hn4ekG+wWGjf+huNx8gy6xIuhmDsWl6+CFRPABi52tsg+e9TM
         trcg==
X-Forwarded-Encrypted: i=1; AJvYcCXG8jsgliYX+TPTHYWz3h4zidxf2jYShYvokgeFkFIaxRhZGQLUIefUIRTM+Qd86PljtQbsHo2UjvPNQVBRN4oReQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+WLKLeiahEoz/R1YeQXQ8kp8h/Bj+eNF53Qiqc/nafGCe3evQ
	fVqDVnWzKxSaYSEAi3FUU6BcT0g8rn09bI4rB2df2jDs3KZzDFqksY5xfdhKWOjrcnY=
X-Gm-Gg: ASbGncvBSGuYOVxfW+4u0dnCZnaFS7uFnDjZONwM62QkoKDg/OFucKhX2W6Gj77dGOr
	IY0+aGfvdulrcXCT8zwrHjiPtWaegEyjxNwmZt1/f+8uIPm5Pyv8eWDk8rF5PI70k2CxWtwh0Tc
	KTNjoQyybbS/6rrlR0hG/ysGw8ZlV/Wja1uTQmF7s5EajDyo07Ub8cVgGkfn39pLJqRoQgtihgy
	8+E02rk+TWomMfjSlhoxe63ULiW1XJoOi6PDS/0FUUuH8N5/j5GL70DGYGfvvP1HYlpcNkh34oF
	7TapUVAMSKDmZesPomHhaVUfYfw6GfBiNP+cUfXadH6wBwgbbMz2yxk2AMnglk1+cIpF8MAZG8s
	X5lBbGc8hEfCrs4I7uD10H78sXUl5yaJYtqLI9gfIVdjqhSZjUt8NbJSkKZ4KIYpF16m0ZiyWnv
	NWdgW9dbWm68ff6h1JNSRikA==
X-Google-Smtp-Source: AGHT+IHRPmKGxJtjS/d9RM4QWDdrdXRWaCU0gnKMx4giB68R9dcyWZ6QoZTkWHAWfDCXI+EuQnPE/Q==
X-Received: by 2002:a05:600c:1d07:b0:45d:d97c:235e with SMTP id 5b1f17b1804b1-46e1daa0526mr47683595e9.12.1758668225219;
        Tue, 23 Sep 2025 15:57:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5838:93cb:ccd2:5e08? ([2001:8b0:aba:5f3c:5838:93cb:ccd2:5e08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac582sm4704585e9.9.2025.09.23.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 15:57:04 -0700 (PDT)
Message-ID: <2868d1ad803cb9d135c09104470c0614a7cd2f17.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv10 7/7] xuser-account: merge with
 xserver-nodm-init
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rs@ti.com, mathieu.dubois-briand@bootlin.com, alex@linutronix.de, 
	otavio@ossystems.com.br, kexin.hao@windriver.com
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com, 
	openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Tue, 23 Sep 2025 23:57:01 +0100
In-Reply-To: <20250923225150.2407390-8-rs@ti.com>
References: <20250923225150.2407390-1-rs@ti.com>
	 <20250923225150.2407390-8-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 22:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223938

On Tue, 2025-09-23 at 17:51 -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Merge the xuser-account recipe with xserver-nodm-init, since:
>=20
> =C2=A0- This is the only recipe dependent on it

This is not a good reason to merge them. The reason they were kept
separate was so that people could replace the user with their own user
setup whilst reusing the xserver init code (or vice versa).

> =C2=A0- This matches the current behavior in weston-init
> =C2=A0- Running x11 as root is no longer a supported path in
> =C2=A0=C2=A0 xserver-nodm-init

Does rootless X work everywhere now?=20

Cheers,

Richard

