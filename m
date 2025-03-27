Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A92CC3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:55:18 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.46304.1743069316888863202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLcYE6QD;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so8761966d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743069316; x=1743674116; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4cuVanqRPnBE6Glr/cVe0VpGuY/sFGo+jkXNQhxH1o=;
        b=LLcYE6QDaC3yzQDpJdreH77PPmo6ItM76yNfM54x+05cY7Jfyly01tpii/E+UTMn8M
         H2bdKXd5q6zuddiNujwuO5zJVOqisu1ogopWDv841HbmZVwA87RsMpjOPZQbxVsZSCX4
         dahZfJd+r+q+3kSg4Ii5CNyUbzp5xPlRG178vaQiV+ODdcTENHRpiB0/ShJ70H+3p9RX
         C3oHKBrv1MttAyttrWEEXynuIVhYror9gwO9klVJc10jIfDGGxlNt9Ac634kSywqZDIY
         md5Ht706WmJxcPT7FDQcQokIZuGLwYJt6x7KzTk+MJrYe9aDL0xD/Yjz4Nw//IQDu+e9
         98+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069316; x=1743674116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4cuVanqRPnBE6Glr/cVe0VpGuY/sFGo+jkXNQhxH1o=;
        b=uEcZ/aEhiL2Wk2OAYxqfg1+LGAGBJGW8M9lxHfaFigwQYhmaSrQxvc7m9+tpzhCA37
         MpieAR6T0TgT20kqrwWBXPFH0r65cdBx+Ff5af0blOl9CrLm7v0IjxAF0hFoLMEDzhef
         cYmjlirF/C6jlu4X7+hqclkA07u23hxiUyBr8na8HMkpCJwcImfNIITN6TOufni8PrTE
         8yrH5cKzATaT/CGKYIbgj37MNqEWkixdCrNujN9BrV4u/Lciyh0MjzJsBNY4wma/W6GL
         z+sHL/MD5i6bA7XmjFYJc7khRdxXelFP6UliPrvhKw6L61Wtd/ynnfbtj60ZMf09JxuF
         VdkA==
X-Gm-Message-State: AOJu0YyL72IkZtvsyD7BxDvYGz0HUpbdLg+Xwg7BE1BkgOlOV1UDhCy1
	DQfbYHYyWNHu6DCVZW+YKUKOnA8CFCmBRZM9kOXi0ZNpUZ/Hqix7bX708vHVBz9By5qmx8LgV4q
	qwh8tWTn1Z1nvBBQTQxYcCE5fmgbRFg==
X-Gm-Gg: ASbGnctgnyjzEl2x40JtmQVxoFMpCiblpv2zIt//ba6nP8pZK0uPiFaY1ZncWVEBa+3
	dwcAY90kBFAgT0ngi2EGvANpyA2/vY9DqzADNp1Ae7N0toL3ipuj0fIbJaYZc8FRcaorKl7Dezj
	lqpz+xvggyMFAE7UR8qZ0Bm8Cw53ImrR/OGbxapIhjPj64Ii6WnU5r3IO/WppiByqZE4z+my4=
X-Google-Smtp-Source: AGHT+IHHfb/UMYeKvT4yupidiqTXK7ASKa8mIM9GYxDi2ndDlijwRxqzv0isjfAKL7vDcr0Wz11+fkSvoFdatehehBI=
X-Received: by 2002:a05:6214:3012:b0:6e6:668a:a27f with SMTP id
 6a1803df08f44-6ed23889164mr42207046d6.17.1743069315727; Thu, 27 Mar 2025
 02:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <ee5ec3420a89c2e32c539b1f1ceaa0f02db8c25f.camel@linuxfoundation.org>
 <1262.1743063639790716018@lists.openembedded.org>
In-Reply-To: <1262.1743063639790716018@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 10:55:04 +0100
X-Gm-Features: AQ5f1JpVmKvHlFRHBaRrrVY8GvwWpxLz4dKQfECkFAZkcVi3zAlPMXNVPGE3gIg
Message-ID: <CANNYZj-5g0OYMyORQa93ycfR=k6oc87FtHAPDpPmZsyo6fs0_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.79 -> 5.80
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213719

Please make sure upstream is aware of the issue. It's best to include
a link to any relevant report/ticket/etc.

Alex

On Thu, 27 Mar 2025 at 09:20, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> I'll try to find time next weekend to submit a v2 with the test disabled.=
 It looks like the issue is timing related as the issue can go away dependi=
ng on how you are executing the test. No fix in upstream yet.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213710): https://lists.openembedded.org/g/openembedde=
d-core/message/213710
> Mute This Topic: https://lists.openembedded.org/mt/111848497/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

