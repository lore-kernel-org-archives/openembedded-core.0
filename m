Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3A6EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 14:21:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.13499.1688134876635247610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aGdYAZuL;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.48, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so3081916e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688134875; x=1690726875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4vAhDcuR1aQgKlh7imuH79X69B0cjm4TbArHrPbE8Y=;
        b=aGdYAZuLF1uPPqQUEu90i4LDk7aKGeDRRR0YjJayEX/LlWP1rRrvyGmfTOyo8ogu64
         KH3UsA8YFlQZpOxvk9oTgkdMFlNTKi137ni66koE53l8PdoGUCm6CHnS10l8mWDW61zY
         nvLBw0b1CLc8zJoUrxnzNERXSdsO04cbJsIQJpsGBWXlGKLjCcO/ctV+rHJ/ObXEAKZ2
         JQnBNvVEjMjNZIo6jBjXtLVY7NY8m6LZO0rT00+q3QBAxI4Sj4aKCMfnP7p8OMzearsl
         VoQrdAE6GeyzIs+UMrrfVAJUzXJUi0wxsfrtsTfATHSFrmHQaktzkzbrgjBhyyVb6G1x
         mhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688134875; x=1690726875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4vAhDcuR1aQgKlh7imuH79X69B0cjm4TbArHrPbE8Y=;
        b=Kq5hcnDrwARrHtHO+Ov50m0eWUbT6ZznF77sxSokWdvkh8YsmKECBX/mXNdZ5dznBh
         k6MiSc/zzmZoqh+ucW5CUcEVHNLi7gr5TeTQpAQUHxEw+D0Af2UhtHz0Q99Xs8GYtIRo
         3IFcGcBMelp8yDVU4/fw2ON0YzWWMVRLOrse7jizvBEvBE+37vTRn62ed3U2e0VuHVlV
         gRbAGiBeTVYHF0GPmIl5oi20eE1Yn7Z4UPGsxyjKhkYn1xfSjDSUOMQ0xW+MAin0Tgu8
         XdMZkPH6IVxuO92tNo145ZIBJkvyMgyCEgHJ6Y7ibXoJfLYPcgQ7IsKQB/q3u4N/kfqo
         Gjrw==
X-Gm-Message-State: ABy/qLaK9FdhdwXWzie5akhzk/qT5WzjMQNqdnPIvDZeWr7dTQLGF7oG
	RHLNgi4dpN/rsQXnQiNtmIilYaHoHt4vPCFzWKmVqPOv/r0NHwoXpXE=
X-Google-Smtp-Source: APBJJlE68Heck9hUFG5MQDdWerOO24IILjhgtzfDS85iuYG2246jiTbfySerLUsbtMtzcmjev1mAUEd93hozTx7iybs=
X-Received: by 2002:a05:6512:1092:b0:4e0:a426:6ddc with SMTP id
 j18-20020a056512109200b004e0a4266ddcmr2861237lfg.0.1688134874324; Fri, 30 Jun
 2023 07:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230630083221.3927027-1-changqing.li@windriver.com> <20230630083221.3927027-2-changqing.li@windriver.com>
In-Reply-To: <20230630083221.3927027-2-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 30 Jun 2023 04:21:02 -1000
Message-ID: <CAOSpxdbsXPB6KSUtSiz7Kxvebz7cnZekhLwdT2WfvgcdoYcSPg@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 2/2] rootfs-postcommands.bbclass:
 add post func remove_unused_dnf_log_lock
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 14:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183697

Is this also a problem in master, or is it mickledore specific?

Steve

On Thu, Jun 29, 2023 at 10:32=E2=80=AFPM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Remove log_lock.pid which maybe created during do_rootfs. In commit
> [dnf: only write the log lock to root for native dnf],
> native dnf changed to write log lock to root, and target dnf still
> use /var/log, so log_lock.pid need to be removed post do_rootfs.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-recipe/rootfs-postcommands.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
> index 690fa976aa..7538c8b0b5 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -49,6 +49,8 @@ ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile;'
>
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES",=
 "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
>
> +ROOTFS_POSTPROCESS_COMMAND +=3D 'remove_unused_dnf_log_lock;'
> +
>  inherit image-artifact-names
>
>  # Sort the user and group entries in /etc by ID in order to make the con=
tent
> @@ -276,6 +278,11 @@ empty_var_volatile () {
>         fi
>  }
>
> +remove_unused_dnf_log_lock() {
> +       if [ -e ${IMAGE_ROOTFS}/log_lock.pid ]; then
> +               rm -rf ${IMAGE_ROOTFS}/log_lock.pid
> +       fi
> +}
>  # Turn any symbolic /sbin/init link into a file
>  remove_init_link () {
>         if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183686): https://lists.openembedded.org/g/openembedde=
d-core/message/183686
> Mute This Topic: https://lists.openembedded.org/mt/99869175/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

