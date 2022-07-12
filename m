Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3256CCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:31:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7414.1657621891889793179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 03:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d0R/U0mK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id bu1so9351885wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bELdOKSpBkLMVFfMEjVZM9jorht7BJj38rIcTTjDlgE=;
        b=d0R/U0mKGf72ujWnwT4Tbd5NrEi4ochfzkhbmaQhOHvsosxKO7nNcXDtnvTB1FB2pF
         pEkTENhj4BcrUcOKhBnGnn7uzQ9q+mSObJ4hm/hcEt4VPwMkYsgB4BwttP+XLsZ6KhAz
         HCEboqDox1NN9xQuXr4gGf3iNYnwQF7Knl4SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bELdOKSpBkLMVFfMEjVZM9jorht7BJj38rIcTTjDlgE=;
        b=js2/kl4H5xDr/6Hse6DqTrTSm93bbQ1y2/MarBZNbH3fOB9/CGFHC5ghWlTK9zbywJ
         XAhc8mO0vgndfOfd1OYpo83yvdPcKphMqqY7iKoI0IOq5NiNN5o7hmi1GufyUaGQiu/n
         VUoBcj1lmWfnfRdvTnk7NT/4Xhtx5Avbhoa6SMAjyutbhtBD0Jjg3+9oBmE1tZzy27Nn
         Z7H4DN8PRI83uBq/QPnREAmWav/EttKhuN0EHBZY2HmVuuOgYIS5mJ3uev7jExRPaHyE
         9W7/S+C0bAi1EsjYETAMXZt3Il+AvMEPLGr11SNcmvjb4F7jcUHj6MFDNtjtLgJSsQJd
         k+dA==
X-Gm-Message-State: AJIora8RQt4WhYgzWVDG5DiCgZNP23Cd1LH6WLUZZBS5c6qphhmLiILW
	Q32DOArJXEbdcO6m0oeInD+z9g==
X-Google-Smtp-Source: 
 AGRyM1ujAuHnJt8TShycxckFhM/cUgyqkldEwKQnDH81MkR8Vn6nDHhWj8Tf4Eo6sqp8udpmc9Hkgg==
X-Received: by 2002:a05:6000:15ca:b0:21d:a72d:beb8 with SMTP id
 y10-20020a05600015ca00b0021da72dbeb8mr8276051wry.624.1657621890339;
        Tue, 12 Jul 2022 03:31:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:375:1449:b69:de14?
 ([2001:8b0:aba:5f3c:375:1449:b69:de14])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c41c300b0039c362311d2sm14563513wmh.9.2022.07.12.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:31:29 -0700 (PDT)
Message-ID: 
 <f1147b78ba7fc515767a479f81ec4f5e2eb0c9fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2022 11:31:28 +0100
In-Reply-To: <81f50f6f0da7441998ed05862b9b0e7e@axis.com>
References: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
	 <81f50f6f0da7441998ed05862b9b0e7e@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 10:31:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167918

On Mon, 2022-07-11 at 18:42 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 11 juli 2022 14:24
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
> >=20
> > Avoid accidentally linking to the rdma library from the host by
> > adding a PACKAGECONFIG for the option. This was found on new
> > Fedora 36 autobuilder workers.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/recipes-devtools/qemu/qemu.inc | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > devtools/qemu/qemu.inc
> > index ef4e949805b..e9095fd750f 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -186,6 +186,7 @@ PACKAGECONFIG[pulsedio] =3D "--enable-pa,--
> > disable-
> > pa,pulseaudio"
> > =C2=A0PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
> > =C2=A0PACKAGECONFIG[bpf] =3D "--enable-bpf,--disable-bpf,libbpf"
> > =C2=A0PACKAGECONFIG[capstone] =3D "--enable-capstone,--disable-capstone=
"
> > +PACKAGECONFIG[rdma] =3D "--enable-dma,--disable-rdma"
>=20
> Shouldn't that be "--enable-rdma"?

It should. I've tweaked the patch in master-next.

Cheers,

Richard

