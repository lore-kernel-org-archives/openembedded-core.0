Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BEBC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 17:19:52 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.12056.1671297583688130149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 09:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SrWc6s8V;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-14455716674so6932782fac.7
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 09:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bgbejC1CfmSYnuy7C8x1oFZrPv6TlWM0prpd6K/XboM=;
        b=SrWc6s8VI1KWWMo5VF/jkEy+L/QoMFV40ar+69IdzbLu65QBWavaptXQ20cK4D1ptu
         5ntE6xdBIGhH4Umxu2X5Zb2S2Ohv2K4V0q/Pyq/HXFqGl0qBj+OMBJ7bNJSQG5xbNjdK
         K3/h6polt136WqeQfnRgjXhyNjyiXWKZpSbT5ofZpu7Vnalg2qaesvlpwf/JfddjNhCy
         bz8eDR0aZZ/P6Ymnt4PQknFnTsS1e7CKBxtTWvZ5ebwaWWy0fxvW2bWqzw8u0m+ZXiri
         5Ty4lz/oFcTbdFnyLTrssL1nlA8mjKzVhZ/VG4MqYzlXPKg4EHBlGoKwd+hK42mSspFV
         JkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgbejC1CfmSYnuy7C8x1oFZrPv6TlWM0prpd6K/XboM=;
        b=b8iN/K3LL4uag1bmaTHwiO7Y+9ffrEqz8YJeCX4f79cvbW5AFY8brXqjv9ehcQvGCq
         9q0s9vLeq7kTT9auliolERjIBDY2y579hqzfHajZzVhHZSn9W8gjAf2zzy1gAATjzDW/
         Vq1aPjngc0MIvBu9Soz1ik2lEqrZUbhxBbseoPSfCG/IyBtTQ4vhrHnK7dmgKayZMfpr
         zUnOu575mtFRjl98i7yWC2YEpKPo3x/5w3eimlIPQtTznbZOCzAbmgFJrANU6q8m1X/H
         hhEXRlHEuMuZW1+9u/vK2CJJJTfKmIjJpYdGJn/nfrzEpVz4+wBeJkcO7jiB83EN65rL
         blbA==
X-Gm-Message-State: AFqh2kr0SYHochl+wC6W4YWL688mOGbUEWoWACVeL9zwxB3t+Tv/uRiM
	3wOR8zdiE4bvmnE5jr97SWT6W03mHJy6qixJwWc=
X-Google-Smtp-Source: AMrXdXvv76FMldTRVBqjSUuAuyCbPe+/Z8c2NnBPixx6LHqq+Dmn72waAFC/7WZL4LLAuMdwQRMsPy5swm+9UW4lt0Y=
X-Received: by 2002:a05:6870:98b1:b0:13b:1e05:a73d with SMTP id
 eg49-20020a05687098b100b0013b1e05a73dmr710922oab.55.1671297582776; Sat, 17
 Dec 2022 09:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-3-olani@axis.com>
 <bd77e4f055d3b5e85f48c0479e8734ec46a20daf.camel@linuxfoundation.org>
In-Reply-To: <bd77e4f055d3b5e85f48c0479e8734ec46a20daf.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Dec 2022 09:19:17 -0800
Message-ID: <CAMKF1sroDJBXrbjxC0aWBP6Y9p8mLTrnjYD5z_Yb_i1uLUUJGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 2/3] Add QA check for 32 bit time and file
 offset functions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ola x Nilsson <olani@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 17:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174781

On Sat, Dec 17, 2022 at 3:17 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-12-08 at 08:11 +0100, Ola x Nilsson wrote:
> > Check for known symbols that should have been redirected to 64bit
> > variants when -D_FILE_OFFSET_BITS=64 and -D_TIME_BITS=64 are set.
> >
> > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > ---
> >  meta/classes-global/insane.bbclass | 132 +++++++++++++++++++++++++++++
> >  1 file changed, 132 insertions(+)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> > index df2c40c3c5..b0e99c4c3f 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -506,6 +506,138 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
> >                  trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
> >                  oe.qa.add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
> >
> > +QAPATHTEST[32bit-time] = "check_32bit_symbols"
> > +def check_32bit_symbols(path, packagename, d, elf, messages):
> > +    """
> > +    Check that ELF files do not use any 32 bit time APIs from glibc.
> > +    """
> > +    # TODO: We should have some DISTRO_FEATURE flag to check here
> > +    # if '-D_TIME_BITS=64' not in d.getVar('GLIBC_64BIT_TIME_FLAGS'):
> > +    #     # No use checking if the feature is not enabled?
> > +    #     return
>
> I did merge this patch with two fixes:
>
> a) It needed the class name in the subject line so we know which code
> the patch changes at a glance
>
> b) I removed the above TODO since I don't think we should be adding a
> distro feature for this, it can be handled by including a the include
> file from the distro and setting WARN_QA and ERROR_QA as the distro
> wishes.

Right, I think once it's sorted out and is working well, we should
probably include it
in poky distro conf and/or maybe even in defaultsetup.conf eventually.

>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174772): https://lists.openembedded.org/g/openembedded-core/message/174772
> Mute This Topic: https://lists.openembedded.org/mt/95533492/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

