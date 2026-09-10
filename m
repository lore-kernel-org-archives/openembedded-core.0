Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D026C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:33:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14155.1789047204281915019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fvst6GEj;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso67857125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789047202; x=1789652002; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo+NblPRAMZ5mzfFNrm3LloeC9+9/ejSeLvlaTjmoxc=;
        b=Fvst6GEjm2xCHObQ3xMNAA9K15dir36izdZegjQRpC6PAgQXB2UgxWmPTUgU+IceFC
         t1ZjD12pL729O/2hzoaYK6zUwUIz6lr5OIxocwblbP/urvbXNJ/x0hJ5janRgaddSf/j
         P51k91VSZkOeKIFE6iixGdp+GcII1/DlVBq6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047202; x=1789652002;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo+NblPRAMZ5mzfFNrm3LloeC9+9/ejSeLvlaTjmoxc=;
        b=A3j170F01nScdN7XmHDnQc2ZlHvPwwRalqv0BtyUyWaiEjJzCF240YyTSn9/vep7+x
         IDUpRzuS4xGkW4fGXIf99H5FlDmEC0b1zS8j9K4haMJTBNPp+Xd+o8y6jUI/cTD9DbfI
         SdO3jQjaRvn55kwcBbl08uJGSJ1l1rAMkFUoVfY5Eyj04O2H3zh89Nx1IS56XwB3z2oH
         +JasyZXdLnT7ZmrHCK7YTgJ9aGKMBYuVbp++HlotJP87ByJ26mLmKRjqwPgIpZ18vZyF
         4Gk/CZMN5hZcHMRDGeTbIHJNMbXJ5iYCBrSD1BrP6h6uZz2t2DZVk06n+ZRbrGEU2Tkc
         CHAg==
X-Forwarded-Encrypted: i=1; AKwUvBzTrjyD8d5A78Lq/TpaoiOj+/0YsOs+L1dED5RJZgYAt3PpU0y3LAGC61lJdODWLhxAphmfsBPEBdQBQoTDw1kIcA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nM1RuKPVQaX/IZf8IOWAYO/yA9p/jzZ0NYnHJl04PjOaK7wb5+
	7UBCmIEMdIFiLSs3Mm8z/pX8GI1N87FeUHu7kp0RUQYReDxQIn4yuHqvbSqqbLH2f2g=
X-Gm-Gg: AYBFou3V6ZdCxzUwk16VJELlgXjFdW8pS/SnDWWpibhq0XU8D2Bm1xZ4FnCsRJOgNOH
	No1h7FyXpTgoLl1Sr06wle8hEXJ8eUE9MJzPvM/xt1Bnr8dVPvYl6c/BTdSwN2x2rt866sRY17P
	ea7dafhxI98rgRpYkJ5HXi/hdiunYZdZX7/8hzWtBgH1YdotzWLrroUdhj/MbJl4FYSj1lTL0yw
	Yg1u3+yNQWdGnusWtn/tHrZNsAYIErq19S9V9rovDbHwwz/vYK+2AONHJppKsOEdtE0pAux+JDD
	v3CChG6kxESP/c+PNjNGpAvk1mp//9194IWCHZo1MULU0SSHs4om2zTuJ2cp2eLgM/8T+DutSZF
	y+3sGfvhm/1Enx5tDiH/GrRfBGLte6WDYWRH2Pkk2DJeQ8ugBZDjk2P0/BwBrfnvq3KZZoJb1a+
	kbzj/9s1HmFv7KvHsouIe9dlrAqFxAvK5zG70HAiyNt9s+t5zL96z1o96v5XBI7/RxvjCxoLh+j
	WovcAL4bx9+9Rf10KEcFUwI6naf8yY6NsAw1qpz3g0XG2vYcf1H0K0Ky2hxgOo=
X-Received: by 2002:a05:600c:3b0e:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49cf8254d53mr402187955e9.13.1789047202498;
        Thu, 10 Sep 2026 06:33:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm63657495e9.4.2026.09.10.06.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:33:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 15:33:20 +0200
Message-Id: <DLBOAXWM0XB3.I2UNWZWB9X75@smile.fr>
To: <emzei.j@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [BUG][scarthgap] SPDX 3.0: NameError when
 SPDX_CUSTOM_ANNOTATION_VARS is set
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <ED0527D7-E28C-432C-99E2-D8AF19330D85@gmail.com>
In-Reply-To: <ED0527D7-E28C-432C-99E2-D8AF19330D85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245569

On Thu Sep 10, 2026 at 10:39 AM CEST, =EC=A0=84=EB=AF=BC=EC=A7=80 via lists=
.openembedded.org wrote:
>
>
> Hello,
>
> While investigating SPDX 3.0 annotation generation on the scarthgap
> branch, I noticed a difference between scarthgap and master in how
> SPDX_CUSTOM_ANNOTATION_VARS is handled in spdx30_tasks.py.
>
> In scarthgap (meta/lib/oe/spdx30_tasks.py, around line 520):
>
> new_annotation(
>     d,
>     build_objset,
>     build,
>     "%s=3D%s" % (var, d.getVar(var)),
>     oe.spdx30.AnnotationType.other,
> )
>
> In master (meta/lib/oe/spdx30_tasks.py, around line 549):
>
> objset.new_annotation(
>     build,
>     "%s=3D%s" % (var, d.getVar(var)),
>     oe.spdx30.AnnotationType.other,
> )
>
> When SPDX_CUSTOM_ANNOTATION_VARS is set on scarthgap, do_create_spdx
> fails with:
>
> Exception: NameError: name 'new_annotation' is not defined
>
> The failure occurs at meta/lib/oe/spdx30_tasks.py:520 while processing SP=
DX_CUSTOM_ANNOTATION_VARS.
>
> I could not determine whether this difference is intentional or whether t=
he corresponding fix was missed when changes were backported to scarthgap.
>
> Would it be appropriate to backport the master implementation to scarthga=
p?
>
> Thanks,
> Minji Jeon

Hello,

We decided to backport the SPDX3 generation feature from master to
scarthgap, so any fix done on master would be also acceptable on
scarthgap.

So, yes, it would be appropriate (albeit with some care as to not be too
intrusive...)

Thanks!
--=20
Yoann Congal
Smile ECS

