Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F6BC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 02:22:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.5264.1636597328289723139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQAHdnWq;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bi37so5640593lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmj3RVhOGyrna4w8F25hPdFuxTfmpab3zI5kr3MZRSs=;
        b=JQAHdnWqDYauFLw12fSukKCKKvUbe/Bq0yD49Ytgcy3TAJbzepiYbroWelTKhC+osa
         JkpToFJdVjXRT+xMS7ViIKFRKlc7vGct22kILAOEXuwT8iQzivJXfLlcQS+Tt983Kk4n
         Lzcmcwc1pvWlsYOlC47YMQsYk9aLDA+KJegFGZlTMbKopO9PAqS+m6C1HWRXhqvM4Swm
         KSJ+BwPdLiktxLEkNPHljb0u5FtJ2iJQSRlyG2YtV+nam0x06MoJjqdw+tjO8DpFDfUz
         fbsmKTyVQmhoiJj3Xp2Q1NU9thbwUq9xZf4e09ilAvGBuXp/X2nmsKXmmiMDpfNMHD7W
         6Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmj3RVhOGyrna4w8F25hPdFuxTfmpab3zI5kr3MZRSs=;
        b=oj8xeIkAKd8lG6Ne8K/IT0OwURlfO9b4ceVkktt1Ay8sLglkdEDft6SEPjMgW4UFcI
         8hFlymLq2tzyKDDCP93rgFaQnmw2NLDYXdlGl7FQfS07JXBD/IxDbiRGGFKpQDOQTxmr
         eS+Paj5llINiMRzXR0lgDuqx64w9m1D70rNwyJkIbGNQzkHs//yfaFhKTjTBt4+pbnk/
         DefQMGfi8HogecvWx67EQxC9MT4YAU/lW6QwpinY4aHjl3UV4jeREeT6fx/OGAaNUjlc
         ZEytvosRKU2FQyGzo7lPa5rPN/pOX72D5clsd3hmwKLKXRoraXtmniWqvHbz7402qkfR
         FYcg==
X-Gm-Message-State: AOAM530gRaBOsFf+kTr5i51AxNiCB3yRpQm+hFYHdBtvDF+8XG05LShX
	VadMcC0KjsQu9wyWYYhPjuIAlT9y7V8MGtJ4UNo=
X-Google-Smtp-Source: 
 ABdhPJy6+aOCYTBweU8ukMdLt02K8y2h9s1UhDhWrri8SpqJ56pK2818rWL+4YdnuNvGxmCyk1bO+IAEdGTSZz65iVs=
X-Received: by 2002:a05:6512:21c8:: with SMTP id
 d8mr3610307lft.7.1636597326229;
 Wed, 10 Nov 2021 18:22:06 -0800 (PST)
MIME-Version: 1.0
References: <20211110231856.5799-1-pkj@axis.com>
In-Reply-To: <20211110231856.5799-1-pkj@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 10 Nov 2021 18:21:50 -0800
Message-ID: 
 <CAJ86T=WQfkS3Un0q_61L-gYWEUrEwSwYgP3_brumpxUy5ypM0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] mirrors.bbclass: Clean up the additions to
 MIRRORS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 02:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158128

On Wed, Nov 10, 2021 at 3:19 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> * Since commit ce0579dc in bitbake (fetch2: Revert the regexp removal
>   for the type field and instead anchor regexp) the type regexp has
>   been automatically anchored at the end.
> * Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
>   entries) there is no need to separate the entries in MIRRORS with "\n".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/mirrors.bbclass | 134 +++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 67 deletions(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 08abcce52c..dc95cc1174 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -1,75 +1,75 @@
>  MIRRORS += "\
> -${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \n \
> -${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \n \
> -${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \n \
> -${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.de.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.au.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.cl.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.hr.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.fi.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.hk.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.hu.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.ie.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.it.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.jp.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.no.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.pl.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.ro.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.si.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.es.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.se.debian.org/debian/pool \n \
> -${DEBIAN_MIRROR}       http://ftp.tr.debian.org/debian/pool \n \
> -${GNU_MIRROR}  https://mirrors.kernel.org/gnu \n \
> -${KERNELORG_MIRROR}    http://www.kernel.org/pub \n \
> -${GNUPG_MIRROR}        ftp://ftp.gnupg.org/gcrypt \n \
> -${GNUPG_MIRROR}        ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \n \
> -${GNUPG_MIRROR}        ftp://mirrors.dotsrc.org/gcrypt \n \
> -ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
> -ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
> -ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
> -ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
> -http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
> -http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \n \
> -${APACHE_MIRROR}  http://www.us.apache.org/dist \n \
> -${APACHE_MIRROR}  http://archive.apache.org/dist \n \
> -http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
> -${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
> -${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
> -ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \n \
> -ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \n \
> -ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \n \
> -cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
> -bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
> -osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
> -ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> -npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
> -cvs://.*/.*     http://sources.openembedded.org/ \n \
> -svn://.*/.*     http://sources.openembedded.org/ \n \
> -git://.*/.*     http://sources.openembedded.org/ \n \
> -hg://.*/.*      http://sources.openembedded.org/ \n \
> -bzr://.*/.*     http://sources.openembedded.org/ \n \
> -p4://.*/.*      http://sources.openembedded.org/ \n \
> -osc://.*/.*     http://sources.openembedded.org/ \n \
> -https?$://.*/.* http://sources.openembedded.org/ \n \
> -ftp://.*/.*     http://sources.openembedded.org/ \n \
> -npm://.*/?.*    http://sources.openembedded.org/ \n \
> -${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
> -${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
> -https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
> +${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian/20180310T215105Z/pool \
> +${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \
> +${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \
> +${DEBIAN_MIRROR}       http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.de.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.au.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.cl.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.hr.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.fi.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.hk.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.hu.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.ie.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.it.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.jp.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.no.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.pl.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.ro.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.si.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.es.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.se.debian.org/debian/pool \
> +${DEBIAN_MIRROR}       http://ftp.tr.debian.org/debian/pool \
> +${GNU_MIRROR}  https://mirrors.kernel.org/gnu \
> +${KERNELORG_MIRROR}    http://www.kernel.org/pub \
> +${GNUPG_MIRROR}        ftp://ftp.gnupg.org/gcrypt \
> +${GNUPG_MIRROR}        ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt \
> +${GNUPG_MIRROR}        ftp://mirrors.dotsrc.org/gcrypt \
> +ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \
> +ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \
> +ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \
> +ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \
> +http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \
> +http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/ http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/ \
> +${APACHE_MIRROR}  http://www.us.apache.org/dist \
> +${APACHE_MIRROR}  http://archive.apache.org/dist \
> +http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \
> +${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \
> +${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
> +ftp://sourceware.org/pub http://mirrors.kernel.org/sourceware \
> +ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
> +ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
> +cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
> +bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
> +osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
> +ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
> +npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
> +cvs://.*/.*     http://sources.openembedded.org/ \
> +svn://.*/.*     http://sources.openembedded.org/ \
> +git://.*/.*     http://sources.openembedded.org/ \
> +hg://.*/.*      http://sources.openembedded.org/ \
> +bzr://.*/.*     http://sources.openembedded.org/ \
> +p4://.*/.*      http://sources.openembedded.org/ \
> +osc://.*/.*     http://sources.openembedded.org/ \
> +https?://.*/.*  http://sources.openembedded.org/ \
> +ftp://.*/.*     http://sources.openembedded.org/ \
> +npm://.*/?.*    http://sources.openembedded.org/ \
> +${CPAN_MIRROR}  http://cpan.metacpan.org/ \
> +${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
> +https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
>  "
>
>  # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
>  # where git native protocol fetches may fail due to local firewall rules, etc.
>
>  MIRRORS += "\
> -git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \
> -git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \n \
> -git://.*/.*                   git://HOST/PATH;protocol=https \n \
> -git://.*/.*                   git://HOST/git/PATH;protocol=https \n \
> +git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \

Not related to your cleanup, but this is redundant as it's covered by
the generic mapping below.

> +git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \
> +git://.*/.*                   git://HOST/PATH;protocol=https \
> +git://.*/.*                   git://HOST/git/PATH;protocol=https \
>  "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158116): https://lists.openembedded.org/g/openembedded-core/message/158116
> Mute This Topic: https://lists.openembedded.org/mt/86970462/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

