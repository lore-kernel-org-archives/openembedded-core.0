Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DEAC47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 13:51:45 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11811.1705585900051570574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 05:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hn1vVp+I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so136334855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 05:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705585898; x=1706190698; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hb8jrGjMl7q3jLZk6ohrwW9XzFOaBga5x6vjdEmPrTo=;
        b=hn1vVp+IfiEPZ5y40Iv872PRLVkUbxTwr39932/PINE0lJv6/h+aJ7YxtuJB8C4NQc
         nyG3FJa6Z5yRYvXTX/nnUgO+cGoLVgVMJrWY+e8cMM5V7ynNbVDE0dOYJjE5N5akmdJd
         VycAbv8gDBIzYZwbRR1bYDiZu3U2xaL54XzQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705585898; x=1706190698;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb8jrGjMl7q3jLZk6ohrwW9XzFOaBga5x6vjdEmPrTo=;
        b=YI6g9GAyeUf+gNwtgDpkFbGUiv8b1Eh6kFCMEp9uqNTaMXUowr1hBTRWtRnkj00JQO
         UxttkIS9wzdZIq9KME+cf8ycxVxFHdbGHcVHcVpYGQkhcbLz1CUsDOat5KhzLVYD6prr
         QwHzt2y6U+OWasALzR0CxJ6kaxw8AkurPSaTeYtHZTjYb0Pq+JNdmQwoUnFuSTOVgYv8
         oJ0OiS7XhWbjOGrSvjMCwg7FHQo9r+nSTP9aF3Bj8Yiwhn21ztfnXWH/XC7viRiqmDHG
         ugJ0quYcU4/RpMxKNH0OGxPnuUIV9B1BnpZK93g+XkeMQBSwRm/oYrFFzUeXVY7ZUsxe
         nwCw==
X-Gm-Message-State: AOJu0YzD9jHnMNPBUDvWlvTMY8NssJnSEIApzjKDH0dSQDhYHH8WSg51
	mRhRaq/eem9Bzw/MKfD26ojTW8vymISKWwpG8WZDwwzujOEMoQSvsseDHdZ0mjU=
X-Google-Smtp-Source: AGHT+IGkijhQ8JYevaSf3Cims8glVwEqSpkg7tCDP6k2e7YbSJXNcola4h9Fd6SvNMJi5QCTKgTJqA==
X-Received: by 2002:a05:600c:4213:b0:40d:88a8:f89 with SMTP id x19-20020a05600c421300b0040d88a80f89mr353406wmh.149.1705585898503;
        Thu, 18 Jan 2024 05:51:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:40e2:c3a1:fc4b:1c22? ([2001:8b0:aba:5f3c:40e2:c3a1:fc4b:1c22])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d5350000000b0033761b2de64sm4107976wrv.76.2024.01.18.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 05:51:38 -0800 (PST)
Message-ID: <9a9d72fdb73c3833d1d6dec6e40b466ce6fa49ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] shadow: link executables statically
 for -native variant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Vishal Bhoj
	 <vishal.bhoj@linaro.org>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 18 Jan 2024 13:51:37 +0000
In-Reply-To: <CALT56yOsjdV8bsAPBcgQdQHQ7Mh28XUHCJ+gLWGRUDCuEV+4-A@mail.gmail.com>
References: <20240111131521.2305172-1-alex@linutronix.de>
	 <20240111131521.2305172-2-alex@linutronix.de>
	 <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com>
	 <e9283815ee1dc83b09470cefc75b0bb74bda974a.camel@linuxfoundation.org>
	 <CALT56yOsjdV8bsAPBcgQdQHQ7Mh28XUHCJ+gLWGRUDCuEV+4-A@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 13:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193981

On Thu, 2024-01-18 at 15:37 +0200, Dmitry Baryshkov wrote:
> On Thu, 18 Jan 2024 at 11:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2024-01-17 at 14:46 +0200, Dmitry Baryshkov wrote:
> > > On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
> > > >=20
> > > > shadow 4.14.x adds a number of libraries it dynamically links with
> > > > (md, bsd, attr). This causes troubles in setscene tasks where
> > > > shadow executables are used (such as useradd), as pulling in
> > > > the needed dynamic libraries needs unpleasant special-casing.
> > > >=20
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >=20
> > > It seems, this is causing issues with the TuxOE builds. We have been
> > > observing issues with the TuxOE build environment with the image
> > > creation choking on the home dirs. Reverting this patch seems to fix
> > > the problem. The build environment is Ubuntu 20.04 running in a
> > > container on Ubuntu 22.04.
> > >=20
> > > ERROR: rpb-weston-image-1.0-r0 do_image_tar:
> > > ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-lina=
ro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
> > > 1, None, None)
> > > ERROR: Logfile of failure stored in:
> > > /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-wes=
ton-image/1.0/temp/log.do_image_tar.160075
> > > Log data follows:
> > > > DEBUG: Executing python function set_image_size
> > > > DEBUG: 1402908.000000 =3D 1079160 * 1.300000
> > > > DEBUG: 1402908.000000 =3D max(1402908.000000, 65536)[1402908.000000=
] + 0
> > > > DEBUG: 1402908.000000 =3D int(1402908.000000)
> > > > DEBUG: 1404928 =3D aligned(1402908)
> > > > DEBUG: returning 1404928
> > > > DEBUG: Python function set_image_size finished
> > > > DEBUG: Executing shell function do_image_tar
> > > > tar: ./home/linaro/.bashrc: Unknown file type; file ignored
> > > > tar: ./home/linaro/.profile: Unknown file type; file ignored
> > > > tar: Exiting with failure status due to previous errors
> > > > WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-li=
nux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
> > > exit 1 from '[ $? -eq 1 ]'
> > >=20
> >=20
> > The error is coming from tar during archive creation, "Unknown file
> > type; file ignored". I'm a little confused/concerned about what it is
> > seeing which it can't handle.
> >=20
> > It might also be good to work out if that is tar from the host or tar
> > from tar-native. Is the host's tar unable to support something we're
> > relying upon?
> >=20
> > If it were me, I'd probably have a look into the tar source code too,
> > see what might trigger an error like that.
>=20
> I compared this to the ext4 creation error. The code for __populate_fs
> is more easy to follow. Basically this error means that st.st_mode
> doesn't match S_IFCHR, S_IFBLK, S_IFREG and S_IFDIR checks.
> I assume the files in home dir are created by useradd in some way that
> bypasses pseudo. Then when tar / mkfs are executed, pseudo doesn't
> know about the file and returns bad st_mode through lstat().

Files shouldn't be getting created in useradd that pseudo doesn't know
about. If they are, we could be missing an intercept on some glibc
function call for example.

Is this in a multiple worker setup with a shared sstate? We need to
track down which OS the escape is happening on. In theory it should be
reproducible. Do you have anything with a bleeding edge glibc there
(e.g. gentoo)?

Cheers,

Richard



