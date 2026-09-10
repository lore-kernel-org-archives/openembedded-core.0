Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16522C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:14 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9212.1789030028990499111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 01:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QA6Lhxl2;
 spf=pass (domain: gmail.com, ip: 74.125.230.140, mailfrom: emzei.j@gmail.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so12587646d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789030028; x=1789634828; darn=lists.openembedded.org;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/mHm+EmOov3Zri/Y9Qc+u/Y926b5IjGKBuZXxOXleo=;
        b=QA6Lhxl2RZ/818urTIb8ubH/qtQgCQice3TLJ7q00FQS+lSEzb6yXfVRQ7tGtCqWpX
         pJjPngRfQt46eSSeEs7WWmGf2cg0kkLvW20UTsOofZTUVQ6VUu4d9oiHBM0P60wIti/o
         ndA6vDtOSQqodBu3wDECJboatm2ag/+8sVcICYMlDLcTekUuSRgDJ4gs3TkY7WgvyIOf
         TevUjf6MIXI1wvNIEOysbH/vQHIPm6faOk8d70fRwUFguTcv5AlxWMB9cyKiXpf9HU6x
         +lXnXjyesxe/nMHjMltzwG6GUNn+htvv+mngXySBuvbEU9SLN5GIPNGRTjqdytivWrp8
         Mnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030028; x=1789634828;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:content-type:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/mHm+EmOov3Zri/Y9Qc+u/Y926b5IjGKBuZXxOXleo=;
        b=SX5Y1aDV8LKTK0YM/v+qkxG7qzrD8KywimwENp4NCka+vMYsQa/9FKFtWUDEWK1QWZ
         boChtWE8mbGbe/JVq4BSN2z6cIZd1uA2hdapnVHsALt+WoV1S12c11/6d+RENqJPzbQN
         MA1jEsWEc1D8gtbIMSYrzWd29hkeHenlE/imbWpduYuxg55uNZbj4w1I7Zv53ONz7xcs
         jgLPqxbz2WxGWHQQaOtaHUk/pQbxRpCfvkE6Kfaj8vqy8sKasQA9PKXgX7BS1fWHQatQ
         Q+WxiSiJgEaEXirCjtHgn+4kleeOWAPC+IHH/KdakvslVTdsHOXiBBmLVQBFLQn5I2Wx
         ujLw==
X-Gm-Message-State: AFuF++lRomfUrAqRjGj4YYJeNL2zBhzk+aPAInI+UQss6I44Xk4y9vUG
	DnvKs+9ci30RMKjvXViek/kv0gnd76MFvL5oLLG2HHBemtSZt0RwQC4lDb+xNQ==
X-Gm-Gg: AYBFou1FrSbxsrwoSSX4ijYGFqviPNAuDUIMNiMnalLnLFi7Kw2IIbQDr+MhQ4FZnu9
	NdWFPnMGqZxgwj5DzT4s4x8QTkhhI/W44J9wfpZ5OU3Jz08O+7Vp9POCOg6Ll16JG71F0gAWBPp
	j27Ut5TihaEKEV2QLckm5NH6zkMGpkBLXJE1vjL26dRxmtnUYpA74w8HUTsFuNsLuHd24zy4z6e
	nvL61Ig7g4HTcbyL/AWMYb+MeW6WAvdX9+RrSGq7oCYqx4a/fKlrEkYpK2knQ6laBCPLWz91w3g
	bDpNMO0ZYim0fXFXcOc8eTbobiZrFaulncFfwj38XkqxzDVWzSspFd0wmgfjCNCX2fnw8pwmBSD
	9aoW6AMngILAoifXXVgQjWxpy8Pw8zCVYblLO1i/H7GARWcXsjCzzxXmla6cI8MMvdYIpxOybDw
	KiHmRAOQwlVjtwTkc9Q/S85/4wjKyy9JKA2mMlrpPPRHoJKw783NanbKoyTU4Zx4hk15lP3MoWh
	qJwliBH1jczme45x/GKQHGxVMYUyA8Y+0Px/A==
X-Received: by 2002:a05:6a00:4145:b0:857:726d:2e97 with SMTP id d2e1a72fcca58-8694832863fmr5869179b3a.20.1789029606995;
        Thu, 10 Sep 2026 01:40:06 -0700 (PDT)
Received: from smtpclient.apple ([2001:2d8:ee8e:f914:3079:cd60:9e66:4477])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f871fc6sm7852085b3a.7.2026.09.10.01.40.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:40:06 -0700 (PDT)
From: =?utf-8?B?7KCE66+87KeA?= <emzei.j@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 10 Sep 2026 17:39:54 +0900
Subject: [BUG][scarthgap] SPDX 3.0: NameError when SPDX_CUSTOM_ANNOTATION_VARS is set
Message-Id: <ED0527D7-E28C-432C-99E2-D8AF19330D85@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: iPhone Mail (23G83)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245564



Hello,

While investigating SPDX 3.0 annotation generation on the scarthgap
branch, I noticed a difference between scarthgap and master in how
SPDX_CUSTOM_ANNOTATION_VARS is handled in spdx30_tasks.py.

In scarthgap (meta/lib/oe/spdx30_tasks.py, around line 520):

new_annotation(
    d,
    build_objset,
    build,
    "%s=3D%s" % (var, d.getVar(var)),
    oe.spdx30.AnnotationType.other,
)

In master (meta/lib/oe/spdx30_tasks.py, around line 549):

objset.new_annotation(
    build,
    "%s=3D%s" % (var, d.getVar(var)),
    oe.spdx30.AnnotationType.other,
)

When SPDX_CUSTOM_ANNOTATION_VARS is set on scarthgap, do_create_spdx
fails with:

Exception: NameError: name 'new_annotation' is not defined

The failure occurs at meta/lib/oe/spdx30_tasks.py:520 while processing SPDX_=
CUSTOM_ANNOTATION_VARS.

I could not determine whether this difference is intentional or whether the c=
orresponding fix was missed when changes were backported to scarthgap.

Would it be appropriate to backport the master implementation to scarthgap?

Thanks,
Minji Jeon=

