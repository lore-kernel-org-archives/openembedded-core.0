Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07999C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 09:54:23 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.36195.1701597259419164923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 01:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmfEa0yl;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50be3eed85aso1554657e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701597257; x=1702202057; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e+sbAOwEMF6xEZHt6GJx++80wgLvGFqOmcMtYOjdsS4=;
        b=PmfEa0ylPE3QztCtCdfGJA3JunG2p04dMgxCIDnveQopgrBbt2sc92TR8J+ad90PTC
         mqZCOC6UFzbgM3XZh4vnh5RPlKzSCuIAVGni+X6vkVIKT3JLLJGPjmvxt6ZiAHBkQS6X
         PPDalCz73NzX4MKlZQ7hI3GvRI7xa3H8PZg3iJ0R/9x3okLuAX4JUH/gtxc/ZuCPITxM
         M1LO5o+lT1Z0V2yZ+6ap2uiEYC68iVjzwpi4HVlSrZINLTDarT8KG4sPGwU/3TNYv+5Y
         AOGfBZMREdtcjCDcKlXt/+FrKYLYBLMkmhOClLbDshUd7fPomMpPMPLNNSMEWFERiO3t
         eLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701597257; x=1702202057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+sbAOwEMF6xEZHt6GJx++80wgLvGFqOmcMtYOjdsS4=;
        b=SUt+Pdm52BzFqUympxO0xEKlvcLQ644YY9COWbcqdZqz+31XFkOmuVyM/yoZSmK5xj
         Uph1TTome19WctpJfa1FztMTrFzCK4ku6fvNgwU+sVSG7n991TRP1r4QIW9dRh8O5Hla
         wRKp5m88n/cs6YWLNqM2+W20SpbCLUu+j7zjWeD0DbqnggDhp5HKFZrYFpYX7fQNjBXY
         +aML3d8blO3kbudguyY22xZ/SzfBjMq3PhMtx37bXP2cjW7y6ctvXpJzCSXdWJmNz1XX
         0ttSfUH/09zAIESTgsG9uVS0VQnqhAN+r14Yu9z/oY0WntCb1a9hmSJuS7lpT2/IgEAV
         w8gw==
X-Gm-Message-State: AOJu0YxecffmMLXt1vozIekRC7BpIBIsy7l7Iihoikfvtc2nOTs/KknN
	CiBFinuQ2N6HJUXH8RH4L2sr1h7t09P+nKAsX+w=
X-Google-Smtp-Source: AGHT+IHPYcn7BbCW3l3n9ESaRQgj+oWx98k5ApFhZpCpcDI+jAFGnoNipuPo0cr2MrGT1KTBOia6XfmGBSRyDB2yHgU=
X-Received: by 2002:a19:f012:0:b0:50b:eeac:750d with SMTP id
 p18-20020a19f012000000b0050beeac750dmr531283lfc.43.1701597256814; Sun, 03 Dec
 2023 01:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20231201065336.1362984-1-quic_vkraleti@quicinc.com> <ZWmKKacNvYu-ao5r@nuoska>
In-Reply-To: <ZWmKKacNvYu-ao5r@nuoska>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sun, 3 Dec 2023 11:54:05 +0200
Message-ID: <CALT56yNh52PuA6DGOK73WeCa4MuGn7Yk=nJq44uy7ngJ4knKgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Add recipe to compile native
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Viswanath Kraleti <quic_vkraleti@quicinc.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 09:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191706

On Fri, 1 Dec 2023 at 09:24, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> On Fri, Dec 01, 2023 at 12:23:36PM +0530, Viswanath Kraleti wrote:
> > systemd has ukify, a native tool, which will combine the kernel/initrd/stub
> > components to build the UKI (unified kernel images). systemd-boot recipe
> > isn't providing this tool.
> >
> > To use ukify, one need systemd-boot native recipe so that a dependency can
> > be added on populate_sysroot task to get the tool under sysroot-native.

The description is superfluous. It is enough to say that we have to
provide ukify tool to build images for systemd-boot

>
> Why not call the recipe systemd-ukify then? systemd-boot doesn't provide more than that.

I support the name systemd-boot-native, it links this tool to the
systemd-boot target package, the main user of the generated images.

>
> Then, when using ukify, one needs to have the .efi binaries from target systemd recipe which
> for aarch64 are:
>
> /usr/lib/systemd/boot/efi/addonaa64.efi.stub
> /usr/lib/systemd/boot/efi/linuxaa64.efi.stub
> /usr/lib/systemd/boot/efi/systemd-bootaa64.efi
>
> and these could IMO be in a systemd-boot binary package because these files are not needed
> in the main systemd binary package and rootfs.

systemd-boot recipe installs those files already. ssytemd-bootaa64.efi
goes to ${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} in the package
(/boot/EFI/BOOT/), while addonaa64.efi.stub and linuxaa64.efi.stub are
installed to the DEPLOY_DIR. Indeed, they are not necessary on the
target system as one rarely builds a kernel on the OE rootfs. If the
need arises, we can probably add systemd-boot-stubs package, having
these two files.

>
> The recipe itself looks neat and small, thanks!
>
> For secure boot sbsign-native would be needed, but maybe a separate issue.
>
> Cheers,
>
> -Mikko
>
> > Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> > ---
> >  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> >
> > diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> > new file mode 100644
> > index 0000000000..6d89e493b6
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> > @@ -0,0 +1,15 @@
> > +require systemd.inc
> > +
> > +inherit native
> > +
> > +RRECOMMENDS:${PN} += "python3-pefile-native"
> > +
> > +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
> > +
> > +do_configure[noexec] = "1"
> > +do_compile[noexec] = "1"
> > +
> > +do_install () {
> > +     install -d ${D}${bindir}
> > +     install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> > +}
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191559): https://lists.openembedded.org/g/openembedded-core/message/191559
> Mute This Topic: https://lists.openembedded.org/mt/102910738/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

