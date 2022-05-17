Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4174AC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 13:34:03 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.7234.1652794434177739943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 06:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aop04GNU;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id g184so16976988pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fHsc12y/sEx3hAmRChL+dBevR+iNufpwzhz1Dt2/JIQ=;
        b=aop04GNUvR8Hbe88dZWg7sI4yOOfg7z5xSP4VkvZjlHi9VyHmSRVqYtQXhxExaonzc
         SuuJBPayvJ8lO09cTPdTkmZTp8skH7ULcuNgbv7arfpfrTZZr68msY613Ju24GRKqdKI
         sNiMfWMmzJOSluQ4/T66TcuWdO1EJ8n5f3QaECqErS6NQkiV37koOyF0y81eeYypA9+j
         LUtvJdhD39zJy6FnPLr7IRYNsY3cCsbA+ZkZPCIJEylzN9dmdgApNR34nTJXVgWbhIn3
         PrH8u47qXB6AOox5E/gy2zhWk3F2tQ9IjSHnVuybsYPcsyVY6PaX6fSdlE8+Vm2Cfj4t
         3bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fHsc12y/sEx3hAmRChL+dBevR+iNufpwzhz1Dt2/JIQ=;
        b=aKXg/Gf+Rgf459UU4tO/aNJspTstUZotp7PF2txGXxBthh5JjYpsWDcnFAitVOeXfV
         T8lvvA1LZdRkXb4TDJ59IKITfqsWrSo3bTQfTx39UOuwjRQK9NWZccHxYlg6/qSfKx6B
         01I2uAXkYAkH0v6qcdG36hey0fykj8HQm+5kR8en8e/YxPDybkXtwIP2u28BHaDzfvmN
         0qGI3WJ70HyG5firiuYi8DDNXKCI6BUF9E4+1iBZ28hM+PFXmu+XZzO9z/C9KYGlHV4P
         AodgSxn0wDo1Mr+inNfggpTezXdgNhZk42N5qf6pJbVEtesPHZjFOG8rTM5ZS/rVkFuS
         aYKA==
X-Gm-Message-State: AOAM532umYY62Gis0VmAXUQapPFoH/FI1qB7pbwsb3u/Nb8O4LXPPVqw
	ocMjTi4saMLhEtpQhrTfOs0M2SFz+NHhKCaD79k=
X-Google-Smtp-Source: 
 ABdhPJzGcfJPlcSS57iKJxYFuBEsq6kKkWKuzbF4BIzaPTO4GZR3Ps5Kz7Ey5k4OVKO8DupbKSruHMVkj0kn9Fn6qTU=
X-Received: by 2002:a63:ed4f:0:b0:3db:abfa:67b7 with SMTP id
 m15-20020a63ed4f000000b003dbabfa67b7mr16719513pgk.276.1652794433656; Tue, 17
 May 2022 06:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220511143613.25002-1-akash.hadke@kpit.com>
 <CAApg2=Q1STrbYF0PE_R9qZE9xRbM-su-iouWi=6CgEepGn--BA@mail.gmail.com>
 <PN3PR01MB67120A503C169C733A3C0A888ECE9@PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN3PR01MB67120A503C169C733A3C0A888ECE9@PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 17 May 2022 15:33:41 +0200
Message-ID: 
 <CAApg2=Rz9VaHE2EVOS9aVJ2B-1vnN9Opbqv-p26w_YqLRMdCgg@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new method
 get_ignored_cves
To: Akash Hadke <Akash.Hadke@kpit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>,
 Akash Hadke <hadkeakash4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 13:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165733

On Tue, May 17, 2022 at 1:42 PM Akash Hadke <Akash.Hadke@kpit.com> wrote:
>
> Hello Marta,
>
> Actually, I wanted to add the ignored and patched CVEs in buildhistory an=
d for that purpose, I am exporting variables CVE_IGNORED and CVE_PATCHED wi=
th those values. I don't want to use cve-check.bbclass as it checks for the=
 CVEs from the NVD database, and I only want to get ignored and patched CVE=
s from the recipe.

Hello again Akash,
What you'd like to do is to see the difference in ignored and patched
CVEs in buildhistory? Do I get it right?

>
> Regarding meta/conf/distro/include/cve-extra-exclusions.inc if any projec=
t includes it then CVEs that are ignored in cve-extra-exclusions.inc will g=
et shown for each recipe in the CVE_CHECK_IGNORED list even though the CVEs=
 are not related to that component recipe. Hence, I have did the changes to=
 exclude CVEs from cve-extra-exclusions.inc

I think I understand the idea. The point I'm making is that if someone
does not include the cve-extra-exclusions.inc in their distro, the
code will still use it and filter out CVEs they still see when doing
cve-check.

Kind regards,
Marta

>
> Best Regards,
> Akash
> ________________________________
> From: Marta Rybczynska <rybczynska@gmail.com>
> Sent: 17 May 2022 14:42
> To: Akash Hadke <Akash.Hadke@kpit.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>; Ranjitsinh Rathod=
 <Ranjitsinh.Rathod@kpit.com>; Akash Hadke <hadkeakash4@gmail.com>
> Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new me=
thod get_ignored_cves
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> On Wed, May 11, 2022 at 4:37 PM akash hadke via lists.openembedded.org
> <akash.hadke=3Dkpit.com@lists.openembedded.org> wrote:
> >
> > Add new method get_ignored_cves in cve_check.py
> > to get ignored CVEs from recipe by excluding distro-wide
> > ignored CVEs from meta/conf/distro/include/cve-extra-exclusions.inc
> >
> > While calling this method use below code to get argument values
> > paths =3D d.getVar('PATH').split(':')
> > cves =3D d.getVar('CVE_CHECK_IGNORE').split()
> >
>
> Hello Akash,
> While looking into this patch set I'm wondering what is your use case.
> It seems to be to get a list
> of ignored and patched CVEs. This is already available from the
> cve-check output or from the create-spdx
> output after some parsing. With the new JSON format for cve-check it
> becomes very easy. If you could
> elaborate more on the way you plan to use this data, I'm pretty sure
> we can come with a simple
> post-processing script to do the same.
>
> BTW Why do assume people always include
> meta/conf/distro/include/cve-extra-exclusions.inc ?
> We don't do that at Oniro and we use our own judgement on outstanding CVE=
s.
>
> Regards,
> Marta

