Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D848CD49235
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 14:48:45 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14174.1765550921389514954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 06:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VG3cdIIj;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88054872394so17135066d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765550920; x=1766155720; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DEjaRwMWlk6AI+oyc4tVrFZv2k307p/s4nEbrAj/tKE=;
        b=VG3cdIIjXh6fLL77Pu0Eet08YF1H6CpVhKKjtuKIo0xMNDG/Vh1ZeW8WpBgTHxUoT0
         Aa7dkvalPOBAz6VyliJDCHxmqdofxkj+My2b0NcB7R10XZ5d0uOx1Zcv97z+OI98CKBU
         +fz9Tl1IZ0bOX0SCPBVIKudpoMFE+I9TNmiQ31vaQljyTxZdFdVanWvE4U7OdAP6H3hH
         q7/Mu3A4BfMKkBHqpJCysfLwF1n6p6saQ92s9VtgKp0VloR+ZIfQVvTCSbdcSNY5fJm9
         Hw90rkgqX/YNvarYu2jw3EOpb6kVmYU9ba+oOty5r9ndg6wFNdD7IHK+IJtZeAUiHBGu
         hHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765550920; x=1766155720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEjaRwMWlk6AI+oyc4tVrFZv2k307p/s4nEbrAj/tKE=;
        b=Yt7Be5AFeiMIp/KDW72uS/rZQMs1po1pOEf7igE9y0t7A+mDWjrL1xBrbZUkGLwSBb
         hK6jNaEi4s8fN9ggoJgppdKNB4hQBbHyhyv7+6YlDpintEB5FiLPzL511eYAi7bx9GqO
         +4hx3bDzHoA+zpgUjPETYRn1jRXmyFAhAyMMrkDyuvzz5LbTKiHt9X1+WG0MqtPKEzOT
         6z0GVl+noTYl9A5MKurN/aUhwSmTk0fMRgu2KozwPM+M1+vZeMjx+Ly+V7Gw/Ll6JMN+
         JR1ggSaOYzoT9cZr5nF/9xMGoPR/cxOjk+9Wk/5ZfNFocVFjvYVR8DpBUdj9qesbUCRl
         mshw==
X-Gm-Message-State: AOJu0YxBf6dLRG+/C7Uj9C9KDv6ZIaJwjNc1tV/tQzp1xKernaXrDInE
	a1SnpM7Dsq3KcJjLnqSSy/gqgx71Qyu7PtvnVi18k9NJ+pzKybu2RPT4QrpiOshFmuhOcGRlykd
	0/onyUbo2G4Viwrt/IB/rpjdleqxl4u5vNQ==
X-Gm-Gg: AY/fxX4ChFHCN1B4xFYPn7ThgZP4iU+RlG/ak4qLxOhGSNSb3t0BxkdYbHiS+/I6nGN
	g/tfhNtNt7mBjd97HtU1z7wK2DGrWiBRL8h+KAjIecRP13xOMXbfJ2GwqEUhtr6Wr5Fx/U+5k2N
	J085b1Iy5FMbfFrofklGm27h5F759caGdtMQhbuco7X2Vhq2vZNyX6SBcVqEHzXdqmTJUV3AtsX
	qUm9wFpDFsRJH/GVCC25oTIUXj+j/oIJVcxevy5hClRDMKlOhrOOU3Iq8aykV+rq7WTHQ==
X-Google-Smtp-Source: AGHT+IEuwDWBdS79Hmqyy65pAe7g+n2MBdcgDl054xLoeK7GTroi3gKitYA8L3gjBtfWyThxHytkik3JQcL/OMkTBaA=
X-Received: by 2002:a05:6214:509b:b0:87f:fffc:10a3 with SMTP id
 6a1803df08f44-8887e112b12mr37261856d6.39.1765550920409; Fri, 12 Dec 2025
 06:48:40 -0800 (PST)
MIME-Version: 1.0
References: <GV0P278MB06880222F486E5880988044993A1A@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj95ZV1CTMFDTLPR_0WQf-7XW4ypo9ihdM0VTJr6ERwQqA@mail.gmail.com> <GV0P278MB0688BAE9BDECB0FBFF31582993AEA@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0688BAE9BDECB0FBFF31582993AEA@GV0P278MB0688.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Dec 2025 15:48:29 +0100
X-Gm-Features: AQt7F2rX-3GD2d5cYWS7_uVhZbibnPn2gyhlA_bpHRA-2y4WvQuSGkyyxlffGFM
Message-ID: <CANNYZj-iPf9L6axGN=vV2KqQn6tf17jMda-cZZKnO=6rN9LqKg@mail.gmail.com>
Subject: Re: [PATCH] run-postinsts: propagate exit state to run-postinsts.service
To: "Germann, Bastian" <Bastian.Germann@duagon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 14:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227594

Thanks, I think this looks fine. If it somehow doesn't make through
yocto CI tests, you'll get a notice.

Alex

On Fri, 12 Dec 2025 at 14:47, Germann, Bastian
<Bastian.Germann@duagon.com> wrote:
>
> In case an exec_postinst_scriptlets child process fails during installation we
> want indication that the run-postinsts.service had a problem.
>
> We still try to install all scriptlets and only run remove_rcsd_link if all
> postinst scripts ran without error. Otherwise on every following boot a new
> install attempt of the missing scriptlet(s) is performed.
>
> Signed-off-by: Bastian Germann <Bastian.Germann@duagon.com>
> ---
>  .../run-postinsts/run-postinsts/run-postinsts | 34 +++++++++++--------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> index a94a769b59..b7352aa24d 100755
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> @@ -62,22 +62,29 @@ if [ "$POSTINST_LOGGING" = "1" ]; then
>  fi
>
>  exec_postinst_scriptlets() {
> -       for i in `ls $pi_dir`; do
> -               i=$pi_dir/$i
> +       ret=0
> +       for i in "$pi_dir"/*; do
>                 echo "Running postinst $i..."
>                 [ "$POSTINST_LOGGING" = "1" ] && eval echo "Running postinst $i..." $append_log
> -               if [ -x $i ]; then
> -                       (sh -c $i $append_log)
> -                       rm $i
> +               if [ -x "$i" ]; then
> +                       (sh -c "$i" $append_log)
> +                       status=$?
> +                       if [ $status -ne 0 ]; then
> +                               echo "ERROR: postinst $i failed with exit code $status."
> +                               [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed with exit code $status." $append_log
> +                               ret=1
> +                       else
> +                               rm -f "$i"
> +                       fi
>                 else
> -                       echo "ERROR: postinst $i failed."
> -                       [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
> -                       remove_rcsd_link=0
> +                       echo "ERROR: postinst $i is not executable."
> +                       [ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i is not executable." $append_log
> +                       ret=1
>                 fi
>         done
> +       return $ret
>  }
>
> -remove_rcsd_link=1
>  if $pm_installed; then
>         case $pm in
>                 "ipk")
> @@ -96,10 +103,9 @@ if $pm_installed; then
>                         ;;
>         esac
>  else
> -       exec_postinst_scriptlets
> -fi
> -
> -# since all postinstalls executed successfully, remove the rcS.d link
> -if [ $remove_rcsd_link = 1 ]; then
> +       if ! exec_postinst_scriptlets; then
> +               exit 1
> +       fi
> +       # since all postinstalls executed successfully, remove the rcS.d link
>         remove_rcsd_link
>  fi

