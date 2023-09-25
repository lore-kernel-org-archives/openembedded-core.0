Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A626CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 07:42:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.56643.1695627727724092664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 00:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uz2vyy+X;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-503397ee920so9032066e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695627726; x=1696232526; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RWxQeOnQfV0C3NqjDSMM5LaxmiGl4AkIcvgH1Pyapg=;
        b=Uz2vyy+XP9rROtVNzF7Kq9WEpYYDGT+K1oehWFGtRNTjJro04fN19haP7xIKnSO16j
         Vd+a79D9vBxbAbr2Mrlr/uN4BiJgzbLQom2A7qukaLBUrU5ugQOzuXdiyThgJF7eX8IM
         djbWBdCJp91PCaV6DGYV+bXZ7Gswdj6JauHOIJY9tAZER8d3vF1vgWjqt9grIPYuWTiW
         u1lBrSkjVOBDQGnnS5Z3GmUW1hE2xhkTOZfjFcMnANv/ZzpLOQPYSbRzskPFQqZMipK4
         rMBmv2Mye1SKNseQqT0EOMlzQzD2WQqtKhiWYArOSPwDZIqnvERk/5U/e0oEoGJCs+ky
         D42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627726; x=1696232526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RWxQeOnQfV0C3NqjDSMM5LaxmiGl4AkIcvgH1Pyapg=;
        b=LxOCXBPndg4mOzF+YcwQ/QpeK0R/dtY6JepbkBxCgnxOdVBzqLnQTgWKbwNA3wT35b
         nGBEuOaCcainSa7+kIsXqfSpUUAfoksEHDCvVQKv5BCe/3xbEQZLBgHBDirSRhFGiWKM
         hV94ldnSVUFasMoYgWdZPgmA043PorxOQJ4P8BEc5qruHveAuRGyWbfrU2xdF6KV1Eig
         raWB3K2TOlj4u0hCQzvQ36/heF3dvcOJSVrjeCIQmBuGa78wKo9v1FJ6PzRX24XdHh7q
         3RuzR2nrKqge9lwnsU+sNgvuobYDgEvXfdOv9TRylatYY31JAVjFtz0mxGVnw4wfyfYE
         Eb7g==
X-Gm-Message-State: AOJu0YwIrF8qv5O8CWt+ig+schq84hptTEBW3fvdrGx4S7+9h4K5dzJj
	jme4cYGRazCiRuxKlINsinN7HGvhZ3QVzUVDwzU=
X-Google-Smtp-Source: AGHT+IGp3PvQ1jeny4gfxHNPiAOmVvF3vMEGSFAsoWZ1HticxXHYr9fhobKrIrUt398wgaDd5KjfaiwDU4yOk2n880A=
X-Received: by 2002:a05:6512:12c4:b0:503:60e:91f5 with SMTP id
 p4-20020a05651212c400b00503060e91f5mr6258518lfg.36.1695627725595; Mon, 25 Sep
 2023 00:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230923204507.882395-1-raj.khem@gmail.com> <20230923204507.882395-2-raj.khem@gmail.com>
In-Reply-To: <20230923204507.882395-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Sep 2023 09:41:54 +0200
Message-ID: <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: Remove failing ptests on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 07:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188172

Wait, shouldn't the reason for the failures be at least mentioned, if
not addressed? "Remove test because it fails" is never a valid change.

Alex


On Sat, 23 Sept 2023 at 22:45, Khem Raj <raj.khem@gmail.com> wrote:
>
> FAIL: glib/convert.test (Child process killed by signal 6)
> FAIL: glib/collate.test (Child process killed by signal 6)
> FAIL: glib/gdatetime.test (Child process killed by signal 6)
> FAIL: glib/date.test (Child process killed by signal 6)
> FAIL: glib/converter-stream.test (Child process killed by signal 6)
> FAIL: glib/option-context.test (Child process killed by signal 6)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 5183f37a6ef..c508990ee8c 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -134,7 +134,12 @@ do_install:append:class-target () {
>          # https://gitlab.gnome.org/GNOME/glib/-/issues/2810
>          rm -f ${D}${datadir}/installed-tests/glib/thread-pool-slow.test
>  }
> -
> +do_install:append:class-target:libc-musl () {
> +        # Remove failing tests on musl libc systems
> +        for t in convert.test collate.test gdatetime.test date.test converter-stream.test option-context.test; do
> +                rm -rf ${D}${datadir}/installed-tests/glib/$t
> +        done
> +}
>  # As we do not build python3 for windows, makes no sense to ship the script that's using it
>  do_install:append:mingw32() {
>          rm -f ${D}${bindir}/gtester-report
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188154): https://lists.openembedded.org/g/openembedded-core/message/188154
> Mute This Topic: https://lists.openembedded.org/mt/101546413/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

