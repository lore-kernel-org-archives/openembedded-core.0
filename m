Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E15C43217
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:19:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.9815.1666358383010039215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 06:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=Ev6gmaNs;
 spf=pass (domain: google.com, ip: 209.85.160.180, mailfrom: wltu@google.com)
Received: by mail-qt1-f180.google.com with SMTP id s3so1557646qtn.12
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjeuZrSlwgnSnGFEy/EW44kVMqr85ZcGhrZYEdeDoDY=;
        b=Ev6gmaNspAOtAsPU6IOQt92aTaUAitvli1NDM+YulK18hMxcPwE9CKcAGU69TI/V4i
         TPEQ9JSDZjZg/SwkhwA083RTtGbW3Us6N2XJeFLR5WQ+ROMvxbZhCAOJW4o+zGwb09/f
         ZwyhzB7oEL1vc+Je4l8Nhvg237l4O460aOvaxtQlTK/MVMUOQtWlYMlwcUK6EW86JXcX
         QznjELEzlRcE4Ng4vK3D3D9A9qSsgNn1S0xWfUJhN4SHcbwsu5iVBF3JyG/QFTyz7tG6
         r9w+l2tUsRGPESeg7896ukrSTEIXWyavDAUJPge59huektTUvb/WUIEexAlEtqbVp9+v
         DfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjeuZrSlwgnSnGFEy/EW44kVMqr85ZcGhrZYEdeDoDY=;
        b=j8jp5JgXOu3L/qfruNtlxyZmMnnIVuAYWU0z2Ed0FgUiWR1FcncHnxv9UoNn3HGiVB
         8dCFGrj5YgJT/+XBUwgxWMgw8eDXZ/jk2jCwMdJZOb571TZS/4L0Hs81jRTnX+0/7WJ+
         nUozHw/vhpRRtX65D5xWNBkHrsU0mQOhCgOqDfv8K/ReaqpfvqlV6Y01MO8cE7tm66VL
         Z66WdDQkdd3P1zYDvhReLhu6iy2gemgmiRn6q0N73kC5NKnT70lq8WvkZlzjBGrJ0Xlk
         DUdj+dbwjfuzVHYG67Et5hIVVqUOFzNU+mub08CRQtqrqyffraQDcuShViADnL7b6bHG
         2Q2w==
X-Gm-Message-State: ACrzQf2ZgovWD5ncA4GmXeuhdEWxsEhJ8lI3NfPXFKYZXO2/rq0zIWn3
	GVjtjIyziM/0/dmmAstX1Smtr40BlkBm3lwuSei/smKiAWQ=
X-Google-Smtp-Source: AMsMyM5VmCFw7eyFX6hGBKV4gNUPpy0gICtQ9QH0rjaBOKovaeLi3nuoyjOBVzitHrDpEvPd7L+HOGzp2wUYRFo2K9U=
X-Received: by 2002:ac8:5c03:0:b0:39c:ee08:157f with SMTP id
 i3-20020ac85c03000000b0039cee08157fmr16056997qti.436.1666358381788; Fri, 21
 Oct 2022 06:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
In-Reply-To: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
From: Willy Tu <wltu@google.com>
Date: Fri, 21 Oct 2022 06:19:30 -0700
Message-ID: <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: openembedded-core@lists.openembedded.org
Cc: wltu@google.com, Tristan Lelong <tlelong@google.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172017

just for visibility.


On Fri, Oct 21, 2022 at 6:17 AM Willy Tu via lists.openembedded.org
<wltu=google.com@lists.openembedded.org> wrote:
>
> Install API only if opensshinternals is in DISTRO_FEATURES.
>
> Install the OpenSSH header + lib files for other repo to build using it.
> For example, https://github.com/google/hiba is dependent on those files
> to build and this change is needed to meet that requirement.
>
> https://github.com/openembedded/meta-openembedded/pull/597
>
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> index b63ea2b137..84da118ca6 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> @@ -137,6 +137,17 @@ do_install:append () {
>   ${D}${sysconfdir}/init.d/sshd
>
>   install -D -m 0755 ${WORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys
> +
> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals', 'true', 'false', d)}; then
> + install -d ${D}${includedir}/ssh
> + install -d ${D}${includedir}/ssh/openbsd-compat
> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
> + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/openbsd-compat
> +
> + install -d ${D}${libdir}
> + install -m0644 ${S}/libssh.a ${D}${libdir}
> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}
> + fi
>  }
>
>  do_install_ptest () {
> --
> 2.38.0.135.g90850a2211-goog
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172016): https://lists.openembedded.org/g/openembedded-core/message/172016
> Mute This Topic: https://lists.openembedded.org/mt/94475279/6858837
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [wltu@google.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

