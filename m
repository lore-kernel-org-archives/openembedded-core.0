Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36E5C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 16:58:24 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.20235.1655398702864794723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 09:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tSwhdrQT;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id gl15so3924696ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwi5Kc+Nom+pa+NHXYZsPfBKLk4LR4Vb/jbry3y7cfA=;
        b=tSwhdrQTohdFwbwJ1eT8rfi70SvZNtpMAdlozTWAVhrk5A5mEpwI5z04E83bUypE61
         nK+GMeDquxWB5GHoUmlWXexufcmrWyF4OkGxsvNIs4iLAktmR5v2udJED84VhJxDf/go
         yYFUn9hcpjU1nq8e5+muV1PPAvK800S7AJxJV78+cXYKh6K2i52iSDbortYFRavCwItR
         a9Xkq/NhntwA5BtqdmPn35iA4t4rcNO2weyUTfOZtaP8HXZbgmG3sp9XL7Y2VKIlNM4s
         cdGLTeH9NDaISgBdWcrFMreBnaLv+cHspC01Ah/bA5f2jhSmzvSMMzgepkOdynP+zvJq
         ghzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwi5Kc+Nom+pa+NHXYZsPfBKLk4LR4Vb/jbry3y7cfA=;
        b=Z4DpUTcaMqySoj3qGNUWIdZJzEy23n3n20+i6F7wZVvnOhxhSlw+1CDSzjqhexjKHM
         LZvsVlGaWVyVUz1ZsasOP4LHQfUZ55cHhqh8JGOtSjaDcxySUk1xpkVNbqq7HyWuLYLJ
         5uyV+bHRYfJJzU4p7MVsZ9RCPG0JdSUnG2YtI2LGGDoALG1m9BdXGSrBQVkfF3OpBjmI
         b4FRhUrmCnCd1wpNhRK+GG7lzWH5aRq6oWY0Re88rZi04W73zpYk3BWf81Q6tQMqDNev
         e5RqDK3FQ9GH+OqhIAfwEofvsIqAbPn4UP3ImZfoa/ZY0/wj0ACdpls7QSlXkp9ExHm4
         hqWg==
X-Gm-Message-State: AJIora/40C+dK25PUlGF44tknjUyGm/XxamlxvF9nvk5XSuS8zE7mgsm
	BVySkfaRhvxVXDMVzLsaL3JVmr/w5i3hV+jffalHAw==
X-Google-Smtp-Source: 
 AGRyM1veFNAej/19FzpSWRXA13hfBWzn5gqkwm53rZzS2VGEXVz4uOu55L5LUfDI1jOG4TidskBS30mIpSFmagxFHeE=
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr5381032eji.456.1655398700962; Thu, 16
 Jun 2022 09:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124515.322289-1-muhammad_hamza@mentor.com>
In-Reply-To: <20220616124515.322289-1-muhammad_hamza@mentor.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 16 Jun 2022 06:58:09 -1000
Message-ID: 
 <CAOSpxdbJpKLD54OW=7gZ2uujqJ-7pmJnTM83QgQY7=ww2s_jZw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][kirkstone][PATCH] initramfs-framework: move
 storage mounts to actual rootfs
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>
Cc: openembedded-core@lists.openembedded.org,
	Awais Belal <awais_belal@mentor.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 16:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167008

Hi Muhammad,

This issue is also present in the master branch, so you would need to
submit this first for master before I can take it for kirkstone.

Also, since this is a patch for oe-core you shouldn't include a
[meta-oe] tag in the subject line.  Some of us maintainers are easily
confused ;-)

Steve

On Thu, Jun 16, 2022 at 2:45 AM Muhammad Hamza
<Muhammad_Hamza@mentor.com> wrote:
>
> Operations such as mkfs fail on devices that are not
> switched to the actual rootfs before switch_root is
> called. The kernel interprets these devices as still
> being used even after unmounting and errors such as
> below are seen when the target is fully booted
>
> root@v1000:~# umount /dev/sdb1
> root@v1000:~# mkfs.ext4 /dev/sdb1
> mke2fs 1.43.8 (1-Jan-2018)
> /dev/sdb1 contains a ext4 file system
>         last mounted on Wed Nov 28 07:33:54 2018
> Proceed anyway? (y,N) y
> /dev/sdb1 is apparently in use by the system; will not make a filesystem here!
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  .../initrdscripts/initramfs-framework/finish             | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
> index f08a920867..ac0de9f996 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
> @@ -26,6 +26,15 @@ finish_run() {
>
>                 info "Switching root to '$ROOTFS_DIR'..."
>
> +               debug "Moving basic mounts onto rootfs"
> +               for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
> +                       # Parse any OCT or HEX encoded chars such as spaces
> +                       # in the mount points to actual ASCII chars
> +                       dir=`printf $dir`
> +                       mkdir -p "${ROOTFS_DIR}/media/${dir##*/}"
> +                       mount -n --move "$dir" "${ROOTFS_DIR}/media/${dir##*/}"
> +               done
> +
>                 debug "Moving /dev, /proc and /sys onto rootfs..."
>                 mount --move /dev $ROOTFS_DIR/dev
>                 mount --move /proc $ROOTFS_DIR/proc
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167006): https://lists.openembedded.org/g/openembedded-core/message/167006
> Mute This Topic: https://lists.openembedded.org/mt/91797957/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

