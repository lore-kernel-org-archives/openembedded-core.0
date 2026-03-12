Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19221067038
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:15:41 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22553.1773324931882349388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hl2JZU87;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7991d890ebbso10700577b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773324931; cv=none;
        d=google.com; s=arc-20240605;
        b=YPz5Ws9trRiBDhelnrxcvdEOMOAK8/HfHgo42y9/8tL8ERPZEi6Nt/X35PQB/8kY6P
         liP1oM1xK3kLTQduKhvmpHWTw58pZkZfP725V9TNT1QPnAPhQzu+uk5O76bVfCyoHYqe
         E5nx1r8Qag0MxeV/gWNAzwdqv2Z6sDvgsQb5OELFHqz6AH7J9y3czRFLAVaY3K82E3RK
         9A5xM2xPDJR4YLtAdRxA9tMaopoTpTDc79XAOA9r6GGdwwhukUcMvfGlHjyt7x9LlqoS
         QnsgpjhSGs5wPUWE+9LCgAS4Dxv2s3bEOWAZRoEwe1gTwf69dLUXjiSckM+npKPgTFeC
         2YjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTRa4bciUTcuDRueE3/k06WcZ3o9L8g788kpod7WVzE=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=NW8LQRWFmSyKfsltkarGaRs6NXnntY8ZjWSfmN5v2BfwH+KQPYJ5UFV33L1RvHAMyq
         t6VHL99vi3o3O9b8NuDKL4QueaZJXrP561mjS22pWNgxCyZjvZ9LiGX6sElmP2c2QlR3
         uS2fNOL+ixxBAf9UbPMgT1ui/PKGFAMQkLEsj+KktgAv8fqBbsi0H7X58kr0BAAmh2c3
         ngLWMMfuplTiQukRxKKGS5SPZnAzUO1524TD+JdkKlbT9AFl0uB/IsjGSB/SRCjAt6Jf
         OUe53FAVhEqBXqEGyoUjIRFPTEjbBaF1Qzs17wdzarVbasV4P1vODkIYi9mMlgYuZbfh
         Sj0A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773324931; x=1773929731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTRa4bciUTcuDRueE3/k06WcZ3o9L8g788kpod7WVzE=;
        b=Hl2JZU87ETmsrw+fEKMix4BVQJtT7nnxRweCR+iJMofStjIrZEKINmSaRpWFjLXiQa
         aKyrH05lmfO79TmMn7sOTcE+Fty+Z/tfp9loOUAp2uecyl7Y9ANLlDF+gyDCOwMQI3En
         4D77BFGr322QcsI/qbao+F8TEPL3bHC0MI6sD/dzKFn4NvKL6CWMaCIDMcNl8UuyIhjg
         hDEnkUr2s1d0HAKhmo9l5ULwRCv3WI5VGf/01WRte9A5doCSdY0MohjVJAeDfKJUdK1G
         UyfvDTH5SLcFIOb3xezaU3lRslw1RiebKEVdUOEbPkGCOrZJLzk1sOSA9OPVcV7kN6jK
         sykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324931; x=1773929731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTRa4bciUTcuDRueE3/k06WcZ3o9L8g788kpod7WVzE=;
        b=J6OqrBqWeFYUG0mjNXNjxSMUZpozcyN8i2UMix2G76C2az1OQd6z+uVA6M45o6YSBE
         J9Vy4WEsgoZXpZc0vG7ypaFBJ+fkUA9EtFyNeHF7tbP5rCkaHiHieowa6CJwKokdnaYt
         YJA7otb/ia2HVJRUUldL9J3WLZVAh0Y/ryONpnVkHqJuoEDoOWEFemMDnw72m3rv4smA
         JP52O/2r5cHiGYBMn9Q4CV7dUQRuRlI6ks490bzLA5EbaOjGz1UbdrSq//aTgpXq9bw5
         aLx8GkxsdThoyNMuY6+9MsqT5QuHf2Ge7a+RR+zC2Ops6YUqPtDbWR1x44FgqKIunZhm
         ThNw==
X-Gm-Message-State: AOJu0YxNVROUjf3NNggCI41JHt/hZz+7TDqQ8maQLamrjJmmmbfGPIjg
	tX6wwfh7RE8WmkrRHuHLLnGY9d2AdlPULSKfr98vdMoNM53tNdmIWRL7674zatHeZb5HdXYLaAY
	5J8ZIPCLs2NWk1RVkGI3uCqk+6lzouyQR9w==
X-Gm-Gg: ATEYQzzDlp5wdwRlYHohhHlImJPtw1CUwO00mtdXASweiaJsZzsF5bArXP1oUCDbjV/
	IE7qkqOgEPbl4MVYyjFn+gpCJ9uzMoqpy0E0ZT4D3SxyVvDl/DnzrlzpPReCEpU6QtcrodljoGQ
	TL4J7l0SOk4SgGYfqQCAvXBYwSPMRRdcL86VZBBzloIC2po9X+QRUTqicRySITpi424Z3l7VUXe
	lM5ulMcEH5+nlcejxqLtEFxt6DpP6a4XxndDn+xvbahtV1V44dQyzOzDt71032hx0DOiHRHdQfq
	/ShuyB7fkDfYI+1Gb4hmvQ==
X-Received: by 2002:a05:690c:110:b0:799:1913:1145 with SMTP id
 00721157ae682-79919131565mr53130937b3.29.1773324930764; Thu, 12 Mar 2026
 07:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <20260310184058.533343-10-JPEWhacker@gmail.com>
 <68df2a5e4d34f553e5e1c4e6ebaa95cf1e75d462.camel@linuxfoundation.org>
In-Reply-To: <68df2a5e4d34f553e5e1c4e6ebaa95cf1e75d462.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Mar 2026 08:15:19 -0600
X-Gm-Features: AaiRm53wOqgmV3fYgo0JA4GN5AJqh1lEIvEEKlnuI1kJ0zvnzSEMEoHVnW5yWqU
Message-ID: <CAJdd5GYbf7qApD_tfDP94faaJtVoG8KM=aHojGB8GQuF3tUJvw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 09/15] spdx30: Skip install package CVE information
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232971

On Thu, Mar 12, 2026 at 5:55=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org=
 wrote:
> > Skips adding the install package CVE information by default. This
> > information grows exponentially, since it ends up be N_CVES *
> > N_PACKAGES. The CVE information for a given installed package can be
> > determined by following the "generates" link between the install packag=
e
> > and the recipe and looking at the CVE information for the recipe,
> > meaning that the CVE information is only included once in the SPDX
> > document.
> >
> > If users still need the legacy method of including CVE information for
> > each package, then then can set SPDX_PACKAGE_INCLUDE_VEX =3D "1"
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
> >  meta/lib/oe/spdx30_tasks.py          | 39 ++++++++++++++--------------
> >  meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
> >  3 files changed, 43 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create=
-spdx-3.0.bbclass
> > index c3ea95b8bc..88b7ef9f42 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX informa=
tion is in the output. Set to
> >      including those already fixed upstream (warning: This can be large=
 and \
> >      slow)."
> >
> > +SPDX_PACKAGE_INCLUDE_VEX ?=3D "0"
> > +SPDX_PACKAGE_INCLUDE_VEX[doc] =3D "Link VEX information to the binary =
package outputs. \
> > +    Normally, VEX information is only linked to the common recipe that=
 `generates` the \
> > +    binary packages, but setting this to '1' will cause it to also be =
linked into the \
> > +    generated binary packages. This is off by default because linking =
the VEX data to \
> > +    each package causes the SPDX output to grow very large, and the sa=
me information \
> > +    can be determined by following the `generates` relationship back t=
o the recipe. \
> > +    Before recipe packages were introduced, this was the only way VEX =
data was \
> > +    expressed; you may need to enable this if your downstream tools do=
 not \
> > +    understand how to trace back to the recipe to find VEX information=
."
>
> To me, removing this duplication and keeping the SPDX docs usable seems
> like a very sensible thing to do. Do we want/need to make it
> configurable?
>
> I appreciate some tools/usage may need fixing to work with this but
> adding configuration options like this makes it harder to use our code
> and also adds maintenance/testing overhead.

Maybe, but I'm very hesitant to break any existing SPDX based CVE
workflows that people may have in a LTS release, which is the only
reason I added the option. I'm fine to remove this after the LTS, IMHO
it's just too close to LTS release to suddenly say "sorry this is all
broken for you now"

>
> I think I'm very much in favour of just changing and generating things
> like this unconditionally and if someone needs to work with it
> differently, they can post process the output.
>
> This goes back to my concern about the complexity of the code and
> configuration, I think we need to simplify and present fewer options to
> the user...
>
> Cheers,
>
> Richard

