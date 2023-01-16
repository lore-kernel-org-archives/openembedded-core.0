Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC745C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 09:36:26 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.162814.1673861781412378971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 01:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j0DKPoQl;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id x37so29385978ljq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvHAtGv5MSCHqJUYNJnsWEz8ygo2faZUTeqSJknp22s=;
        b=j0DKPoQlHz4NPwx/l1N5tCyOgP2c1AczeNQLa/ZnZlMxj50IbHixpH9dzAQi2f658P
         gpdnpfxjTUiMEDXiYZ96bANEjvaOBTZOULWp+auS4zcTsSmVBf0KSQfQA+mRYUfJSXvh
         Iy5CcyCHMQ4CfeHwcMwBUHDbwqjZOO24YF9c31erNcV3hbs7boci0kvhOrbaUwrosjlO
         73Z2tnexqemgZKValiJwQPEwX+ErOoyDzR/MUSXQ69mc4E04BE9ivTWBJxpNYesH4CXe
         VC5itzbiJ5eY26I6QlQ8Bi7RoQfT7M2gQ1cwRGH0RsRAhL5twDhlZY24Fr/GcT/CPLv2
         ZYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvHAtGv5MSCHqJUYNJnsWEz8ygo2faZUTeqSJknp22s=;
        b=DwjkHntHRjDu92oAP+5xkP/BJcpfQq8jv9VgERte9PZr6gY7fPTbrnsHRvFbMrKUv8
         /4H6JK01dWXhgNGfpSkv+4siLH5XkEa7fRcgyql4hoVaxhEEmFzPD3wzJjWuvf1ICuz/
         IcNsVFNrClgyNiRXfNr0Nbu7AdyziKGF1m83l6F6hbtJk2KUhE2DR2DnaFyqcNRJFKRK
         zdl+RO+s8xNs1lauX3ZKXtGUxehjPFflvDCOo1gJcgHD+Pne/Wk5SUmK68g/N+fVVDIH
         6K2s3mBdRHARu4UVb1QzZx2LV+UTeqtrYNtf32XEflwd2wd/x2ZL+MHfFyluew8Zzr+D
         zB7w==
X-Gm-Message-State: AFqh2kppr/XRPTe5sJ7A6arM6NkoHzfZJ4n5t8aHTHoTI/m8dkPeQ8p3
	7LlLg+7Hudj9OaIpz5t+LcTQcRjQ/UGDRsHAjBpt9yBj
X-Google-Smtp-Source: AMrXdXsE6t0395S3GPqlJY/s6otCXa4Sq7LaKOGTGlCsf0oL+q4mw2Zn4KuwfH/xvnOTSKkqexjYvKAfOB1g0R7Y6k4=
X-Received: by 2002:a2e:a26c:0:b0:28b:8da3:57b0 with SMTP id
 k12-20020a2ea26c000000b0028b8da357b0mr144219ljm.403.1673861779134; Mon, 16
 Jan 2023 01:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20230116084809.16470-1-Qi.Chen@windriver.com> <CANNYZj9h_X1dKVuPfC+OpL4VOA-=nRy54eZHvrDfieW6AM4vWA@mail.gmail.com>
 <CO6PR11MB560292113F663792C30B79DFEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560292113F663792C30B79DFEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Jan 2023 10:36:07 +0100
Message-ID: <CANNYZj-_JUSs8gTBF5YgVpFrj5xPx322KPA0QXnhWxqEF2JCBg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175968

Thanks, it's fine then.

Alex

On Mon, 16 Jan 2023 at 10:26, Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> This is because the MAGIC var is pointing a file that does not exist. And the file is provided by nativesdk-file.
>
> Some of the strace output:
> openat(AT_FDCWD, "/buildarea2/chenqi/builds/build-poky-sysvinit/sdkinst/sysroots/x86_64-pokysdk-linux/usr/share/misc/magic.mgc", O_RDONLY) = -1 ENOENT (No such file or directory)
> stat("/buildarea2/chenqi/builds/build-poky-sysvinit/sdkinst/sysroots/x86_64-pokysdk-linux/usr/share/misc/magic.mgc", 0x7ffcddb11330) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/buildarea2/chenqi/builds/build-poky-sysvinit/sdkinst/sysroots/x86_64-pokysdk-linux/usr/share/misc/magic.mgc", O_RDONLY) = -1 ENOENT (No such file or directory)
> write(2, "file: could not find any valid m"..., 44) = 44
> exit_group(1)                           = ?
> +++ exited with 1 +++
>
> Regards,
> Qi
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, January 16, 2023 5:18 PM
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
>
> I'm not sure I understand the issue. Why isn't file from the host working properly in the presence of the MAGIC env var?
>
> Alex
>
> On Mon, 16 Jan 2023 at 09:48, Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > For now, running `file' inside SDK errors out.
> >   file: could not find any valid magic files!
> >
> > This is because nativesdk-rpm exports MAGIC. So let's make
> > nativesdk-rpm depend on file for better user experiences.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > index 8eb0ab207e..3b7d4d640a 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > @@ -188,6 +188,7 @@ PROVIDES += "python3-rpm"
> >  FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
> >
> >  RDEPENDS:${PN}-build = "bash perl python3-core"
> > +RDEPENDS:nativesdk-rpm += "nativesdk-file"
> >
> >  PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
> >
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175963):
> > https://lists.openembedded.org/g/openembedded-core/message/175963
> > Mute This Topic: https://lists.openembedded.org/mt/96303256/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

