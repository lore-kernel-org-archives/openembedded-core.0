Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC58C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:27:22 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.118.1700497639319529109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PllCbhDV;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso58180991fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700497637; x=1701102437; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kKtPqDRyTQZc+pib0zFYiia2CDe0apPUs0qLGwom6vk=;
        b=PllCbhDVpe7i3y725BMrfZNc6MUf2RZVF7002vH2x8ki1puOO53OFApBUByMlsG2/x
         /E3kkY4kCEX0t4+Wc9hc8wlIEhvXTmI+0Yl4W9/aFAs4EevcwdqEJFFCiU6KZ1jbRm39
         ir2X6geJVwRpJNwl11203jObJTyf3RXG0xOdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497637; x=1701102437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKtPqDRyTQZc+pib0zFYiia2CDe0apPUs0qLGwom6vk=;
        b=FH4trVdhTtfUA5rEELF/HnJYj00cIoc12ug9YALZoQvIZSNpY2fKyA78bK/ZezDGsU
         FXu92HCuREAQxC9X+kXIsmK66WqvZVnc+AtM6NQJWEaPoOt9YbXiU5ZZElBEzlVmkb1I
         qffGYE8eHFQQ+JP5Z/R24WMn07NbEQE8VWEvMm/Lnu7v6iXu4Cb/xgqE6w1rrBKQhl9G
         gTi938WIRgi84QdMKZKRdyl83cuIJn2UpuWygeofu3/z1jojfpSq8s9tOY78IgKqDI44
         HxQRRto4aRHz2qKhKbe1L9NxpyVwEx0iBxT9mE3Zi5CEe2b6fc4dqE6PFqIaiZdzUcHl
         JRzQ==
X-Gm-Message-State: AOJu0Yx+Pq7am7QH9vCVXExYaCfJ2PlNUI+FJkp+zDe6EIajYjMz59BL
	fXy44mwGdYhAwukIMAP1R2SvzREGFOAMLPJ+3sINaw==
X-Google-Smtp-Source: AGHT+IFjZ2ENWaWXGmId3jty3bruoOMTRnu9gAM1vGF2Ifo/PLt4svUUJ5MiMYgx4/Gosx9DMEv1fSQDwGWNWInvkgo=
X-Received: by 2002:a2e:9157:0:b0:2c0:7d6:570a with SMTP id
 q23-20020a2e9157000000b002c007d6570amr5365023ljg.33.1700497637072; Mon, 20
 Nov 2023 08:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20231116040549.11447-1-vanusuri@mvista.com> <93710C32-2A78-417E-970F-E4B010262326@arm.com>
 <57008fe2-36a9-4a7e-909b-4cab0a86f351@mvista.com> <CANQUz1_qynUTH-3KOq11e+CO+xUGoZbxpu1qLRGEee4ddCK4cQ@mail.gmail.com>
 <PH7PR11MB798653248FA1F75F94D91844E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com>
 <0836df76-219c-4d82-92fd-0b7152d7cc7f@windriver.com>
In-Reply-To: <0836df76-219c-4d82-92fd-0b7152d7cc7f@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 20 Nov 2023 21:57:05 +0530
Message-ID: <CANQUz1-9BDwRoP_VwSsNdA+ttixdHjsgDJT9Fo0iWb5nTGDuGQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
To: Ross Burton <ross.burton@arm.com>, Steve Sakoman <steve@sakoman.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, "G Pillai, Hari" <hari.gpillai@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"jpuhlman@mvista.com" <jpuhlman@mvista.com>, meenali.gupta@windriver.com, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000997038060a97f5bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190887

--000000000000997038060a97f5bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross and Steve,

Please consider this patch for the Kirkstone branch.

As discussed again with Meenali, I will be sending patches to remaining
branches.

Thanks & Regards,
Vijay

On Fri, Nov 17, 2023 at 10:13=E2=80=AFPM Randy MacLeod <randy.macleod@windr=
iver.com>
wrote:

> Add Hari who will inform WR developers on his team once the CVE
> co-ordination scheme is available.
> Add Marta.
>
> On 2023-11-17 9:11 a.m., Meenali Gupta via lists.openembedded.org wrote:
>
> Hi Ross,
>
> As discussed with Vijay,  we'll cooperate on this CVE fixes.
>
> Marta,
>
>
> Do you have a wiki page set-up?
>
>
> I see:
>
>    https://wiki.yoctoproject.org/wiki/Synchronization_CVEs
>
> and it mentions, but does not point to, "A synchronization wiki page".
>
>
>
> ../Randy
>
>
>
> Regards
> Meenali
> ------------------------------
> *From:* Vijay Anusuri <vanusuri@mvista.com> <vanusuri@mvista.com>
> *Sent:* 16 November 2023 21:31
> *To:* jpuhlman@mvista.com <jpuhlman@mvista.com> <jpuhlman@mvista.com>;
> Ross Burton <Ross.Burton@arm.com> <Ross.Burton@arm.com>; Gupta, Meenali
> <Meenali.Gupta@windriver.com> <Meenali.Gupta@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
> Hi Ross,
>
> As discussed with Meenali, I agreed she was going to do this work.
> She has already submitted patches for multiple branches ( master,
> mickledore and kirkstone ).
>
> For CVE-2023-38469, we need to include 2 commits to fix the CVE. Meenali
> will send the v2 patch for CVE-2023-38469 which will include 2 patches fo=
r
> all the branches.
>
> Thank you Meenali for your timely response.
>
> Thanks & Regards,
> Vijay
>
> On Thu, Nov 16, 2023 at 7:56=E2=80=AFPM Jeremy Puhlman via lists.openembe=
dded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_L=
G6OXVHPwKv5R-0$>
> <jpuhlman=3Dmvista.com@lists.openembedded.org> wrote:
>
>
>
> On 11/16/2023 3:22 AM, Ross Burton wrote:
> > Hi Vijay and Meenali,
> >
> > Hopefully this will show everyone - especially WR and Montavista - that
> we need to communicate better when working on CVEs.  In the short term at
> least, Marta proposed a wiki page which can be updated via a tool and whe=
n
> someone is working on an issue that can be marked to avoid duplication of
> effort.  Would that be acceptable to both of your companies?
>
> Yeah, I think something like that would be great on our end, provided
> its automated and the data can be extracted, so it can be consolidated
> in internal CVE tracking that we are currently required to.
>
> >
> > I=E2=80=99ve not checked that the fixes are identical, but apparently I=
 need to
> remind everyone that we take fixes in *master first* and then backport to
> the releases in order.
> There should also be an agree upon change decoration to indicate
> non-applicability/differently addressed in earlier releases.
>
> With 4 year LTS releases many issues are just not going to be applicable
> to master. Also there may well be very good reasons to fix a given set
> of CVEs in
> completely different ways, but making sure they are addressed in both is
> important. Setting aside this example, in almost all cases on master
> moving to the fixed version, is almost always the right answer, where as
> on say dunfell, moving to the new version may have too many knock on
> effects to make sense.
> In this instance, Khem has already indicated moving to the new release
> may make sense for both kirkstone and master.
>
> >
> > Luckily the avahi recipe is fairly untouched so this should be trivial.
> Can you both discuss and agree who is going to do this?
> Vijay can you work with Meenali to consolidate this patch.
> >
> > Ross
> >
> >> On 16 Nov 2023, at 04:05, Vijay Anusuri via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_L=
G6OXVHPwKv5R-0$>
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
> >>
> >> From: Vijay Anusuri <vanusuri@mvista.com>
> >>
> >> Patches to fix:
> >> CVE-2023-38469
> >> CVE-2023-38470
> >> CVE-2023-38471
> >> CVE-2023-38472
> >> CVE-2023-38473
> >>
> >> Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af=
6e3a1cf
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/a337=
a1ba7d15853fb56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$>
> >> &
> >>
> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/c6ca=
b87df290448a63323c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU$>
> >> &
> >>
> https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/94cb=
6489114636940ac683515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8$>
> >> &
> >>
> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/894f=
085f402e023a98cbb6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo$>
> >> &
> >>
> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/b024=
ae5749f4aeba03478e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo$>
> >> &
> >>
> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/b448=
c9f771bada14ae8de175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg$>
> ]
> >>
> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> ---
> >> meta/recipes-connectivity/avahi/avahi_0.8.bb
> <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZ=
eFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$>
> |   6 +
> >> .../avahi/files/CVE-2023-38469-1.patch        |  47 ++++++++
> >> .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
> >> .../avahi/files/CVE-2023-38470.patch          |  56 +++++++++
> >> .../avahi/files/CVE-2023-38471.patch          |  72 ++++++++++++
> >> .../avahi/files/CVE-2023-38472.patch          |  47 ++++++++
> >> .../avahi/files/CVE-2023-38473.patch          | 108 ++++++++++++++++++
> >> 7 files changed, 401 insertions(+)
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >>
> >> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZ=
eFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$>
> b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZ=
eFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$>
> >> index b5c966c102..772fb43939 100644
> >> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZ=
eFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$>
> >> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> <https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZ=
eFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_=
Ck9E$>
> >> @@ -26,6 +26,12 @@ SRC_URI =3D "
> https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/releases/do=
wnload/v$*7BPV*7D/avahi-$*7BPV*7D__;JSUlJQ!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZ=
hGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP0Am2ovI$>
> >>             file://0001-Fix-opening-etc-resolv.conf-error.patch \
> >>             file://handle-hup.patch \
> >>             file://local-ping.patch \
> >> +           file://CVE-2023-38469-1.patch \
> >> +           file://CVE-2023-38469-2.patch \
> >> +           file://CVE-2023-38470.patch \
> >> +           file://CVE-2023-38471.patch \
> >> +           file://CVE-2023-38472.patch \
> >> +           file://CVE-2023-38473.patch \
> >>             "
> >>
> >> UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/releases/__=
;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur7=
4kFZ8fbQ-9H_LG6OXVHP0Xuk60k$>
> "
> >> diff --git
> a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> new file mode 100644
> >> index 0000000000..99c717daf3
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> @@ -0,0 +1,47 @@
> >> +From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 200=
1
> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
> >> +Date: Mon, 23 Oct 2023 20:29:31 +0000
> >> +Subject: [PATCH] core: reject overly long TXT resource records
> >> +
> >> +Closes https://github.com/lathiat/avahi/issues/455
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/issues/455_=
_;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur=
74kFZ8fbQ-9H_LG6OXVHP-9siEVs$>
> >> +
> >> +CVE-2023-38469
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af=
6e3a1cf
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/a337=
a1ba7d15853fb56deef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$>
> ]
> >> +CVE: CVE-2023-38469
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-core/rr.c | 9 ++++++++-
> >> + 1 file changed, 8 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-core/rr.c b/avahi-core/rr.c
> >> +index 2bb89244..9c04ebbd 100644
> >> +--- a/avahi-core/rr.c
> >> ++++ b/avahi-core/rr.c
> >> +@@ -32,6 +32,7 @@
> >> + #include <avahi-common/malloc.h>
> >> + #include <avahi-common/defs.h>
> >> +
> >> ++#include "dns.h"
> >> + #include "rr.h"
> >> + #include "log.h"
> >> + #include "util.h"
> >> +@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
> >> +         case AVAHI_DNS_TYPE_TXT: {
> >> +
> >> +             AvahiStringList *strlst;
> >> ++            size_t used =3D 0;
> >> +
> >> +-            for (strlst =3D r->data.txt.string_list; strlst; strlst =
=3D
> strlst->next)
> >> ++            for (strlst =3D r->data.txt.string_list; strlst; strlst =
=3D
> strlst->next) {
> >> +                 if (strlst->size > 255 || strlst->size <=3D 0)
> >> +                     return 0;
> >> +
> >> ++                used +=3D 1+strlst->size;
> >> ++                if (used > AVAHI_DNS_RDATA_MAX)
> >> ++                    return 0;
> >> ++            }
> >> ++
> >> +             return 1;
> >> +         }
> >> +     }
> >> diff --git
> a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> new file mode 100644
> >> index 0000000000..b83a70e29b
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> @@ -0,0 +1,65 @@
> >> +From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 200=
1
> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
> >> +Date: Wed, 25 Oct 2023 18:15:42 +0000
> >> +Subject: [PATCH] tests: pass overly long TXT resource records
> >> +
> >> +to make sure they don't crash avahi any more.
> >> +
> >> +It reproduces https://github.com/lathiat/avahi/issues/455
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/issues/455_=
_;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur=
74kFZ8fbQ-9H_LG6OXVHP-9siEVs$>
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/c6ca=
b87df290448a63323c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU$>
> ]
> >> +CVE: CVE-2023-38469
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-client/client-test.c | 14 ++++++++++++++
> >> + 1 file changed, 14 insertions(+)
> >> +
> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> >> +index 7d04a6a..66e3574 100644
> >> +--- a/avahi-client/client-test.c
> >> ++++ b/avahi-client/client-test.c
> >> +@@ -22,6 +22,7 @@
> >> + #endif
> >> +
> >> + #include <stdio.h>
> >> ++#include <string.h>
> >> + #include <assert.h>
> >> +
> >> + #include <avahi-client/client.h>
> >> +@@ -33,6 +34,8 @@
> >> + #include <avahi-common/malloc.h>
> >> + #include <avahi-common/timeval.h>
> >> +
> >> ++#include <avahi-core/dns.h>
> >> ++
> >> + static const AvahiPoll *poll_api =3D NULL;
> >> + static AvahiSimplePoll *simple_poll =3D NULL;
> >> +
> >> +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     uint32_t cookie;
> >> +     struct timeval tv;
> >> +     AvahiAddress a;
> >> ++    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
> >> ++    AvahiStringList *txt =3D NULL;
> >> ++    int r;
> >> +
> >> +     simple_poll =3D avahi_simple_poll_new();
> >> +     poll_api =3D avahi_simple_poll_get(simple_poll);
> >> +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     printf("%s\n", avahi_strerror(avahi_entry_group_add_service
> (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site",
> "_http._tcp", NULL, NULL, 80, "foo=3Dbar", NULL)));
> >> +     printf("add_record: %d\n", avahi_entry_group_add_record (group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120,
> "\5booya", 6));
> >> +
> >> ++    memset(rdata, 1, sizeof(rdata));
> >> ++    r =3D avahi_string_list_parse(rdata, sizeof(rdata), &txt);
> >> ++    assert(r >=3D 0);
> >> ++    assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D
> sizeof(rdata));
> >> ++    error =3D avahi_entry_group_add_service_strlst(group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL=
,
> 123, txt);
> >> ++    assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> >> ++    avahi_string_list_free(txt);
> >> ++
> >> +     avahi_entry_group_commit (group);
> >> +
> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> new file mode 100644
> >> index 0000000000..1cbb00dcab
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> @@ -0,0 +1,56 @@
> >> +From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@red=
hat.com>
> >> +Date: Tue, 11 Apr 2023 15:29:59 +0200
> >> +Subject: [PATCH] Ensure each label is at least one byte long
> >> +
> >> +The only allowed exception is single dot, where it should return empt=
y
> >> +string.
> >> +
> >> +Fixes #454.
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/94cb=
6489114636940ac683515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8$>
> ]
> >> +CVE: CVE-2023-38470
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-common/domain-test.c | 14 ++++++++++++++
> >> + avahi-common/domain.c      |  2 +-
> >> + 2 files changed, 15 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
> >> +index cf763eca6..3acc1c1e4 100644
> >> +--- a/avahi-common/domain-test.c
> >> ++++ b/avahi-common/domain-test.c
> >> +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     printf("%s\n", s =3D avahi_normalize_name_strdup("fo\\\\o\\..f
> oo."));
> >> +     avahi_free(s);
> >> +
> >> ++    printf("%s\n", s =3D avahi_normalize_name_strdup("."));
> >> ++    avahi_free(s);
> >> ++
> >> ++    s =3D
> avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}.?.?.?.z.?.?.}.}=
."
> >> ++    "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.}=
.}"
> >> ++    ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.zM=
.?`"
> >> ++    "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?."
> >> ++    "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}."
> >> ++    "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?"
> >> ++    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM."
> >> ++    "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.?=
."
> >> ++    "}.?.?.?.}.=3D.?.?.}");
> >> ++    assert(s =3D=3D NULL);
> >> ++
> >> +     printf("%i\n", avahi_domain_equal("\\065aa
> bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
> >> +     printf("%i\n", avahi_domain_equal("A", "a"));
> >> +
> >> +diff --git a/avahi-common/domain.c b/avahi-common/domain.c
> >> +index 3b1ab6834..e66d2416c 100644
> >> +--- a/avahi-common/domain.c
> >> ++++ b/avahi-common/domain.c
> >> +@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char
> *ret_s, size_t size) {
> >> +         }
> >> +
> >> +         if (!empty) {
> >> +-            if (size < 1)
> >> ++            if (size < 2)
> >> +                 return NULL;
> >> +
> >> +             *(r++) =3D '.';
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> new file mode 100644
> >> index 0000000000..8242646da1
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> @@ -0,0 +1,72 @@
> >> +From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Mon, 23 Oct 2023 13:38:35 +0200
> >> +Subject: [PATCH] core: extract host name using avahi_unescape_label()
> >> +
> >> +Previously we could create invalid escape sequence when we split the
> >> +string on dot. For example, from valid host name "foo\\.bar" we have
> >> +created invalid name "foo\\" and tried to set that as the host name
> >> +which crashed the daemon.
> >> +
> >> +Fixes #453
> >> +
> >> +CVE-2023-38471
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/894f=
085f402e023a98cbb6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo$>
> ]
> >> +CVE: CVE-2023-38471
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-core/server.c | 27 +++++++++++++++++++++------
> >> + 1 file changed, 21 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/avahi-core/server.c b/avahi-core/server.c
> >> +index c32637af8..f6a21bb77 100644
> >> +--- a/avahi-core/server.c
> >> ++++ b/avahi-core/server.c
> >> +@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
> >> + }
> >> +
> >> + int avahi_server_set_host_name(AvahiServer *s, const char *host_name=
)
> {
> >> +-    char *hn =3D NULL;
> >> ++    char label_escaped[AVAHI_LABEL_MAX*4+1];
> >> ++    char label[AVAHI_LABEL_MAX];
> >> ++    char *hn =3D NULL, *h;
> >> ++    size_t len;
> >> ++
> >> +     assert(s);
> >> +
> >> +     AVAHI_CHECK_VALIDITY(s, !host_name ||
> avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
> >> +@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s=
,
> const char *host_name) {
> >> +     else
> >> +         hn =3D avahi_normalize_name_strdup(host_name);
> >> +
> >> +-    hn[strcspn(hn, ".")] =3D 0;
> >> ++    h =3D hn;
> >> ++    if (!avahi_unescape_label((const char **)&hn, label,
> sizeof(label))) {
> >> ++        avahi_free(h);
> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
> >> ++    }
> >> ++
> >> ++    avahi_free(h);
> >> ++
> >> ++    h =3D label_escaped;
> >> ++    len =3D sizeof(label_escaped);
> >> ++    if (!avahi_escape_label(label, strlen(label), &h, &len))
> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
> >> +
> >> +-    if (avahi_domain_equal(s->host_name, hn) && s->state !=3D
> AVAHI_SERVER_COLLISION) {
> >> +-        avahi_free(hn);
> >> ++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state
> !=3D AVAHI_SERVER_COLLISION)
> >> +         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
> >> +-    }
> >> +
> >> +     withdraw_host_rrs(s);
> >> +
> >> +     avahi_free(s->host_name);
> >> +-    s->host_name =3D hn;
> >> ++    s->host_name =3D avahi_strdup(label_escaped);
> >> ++    if (!s->host_name)
> >> ++        return AVAHI_ERR_NO_MEMORY;
> >> +
> >> +     update_fqdn(s);
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> new file mode 100644
> >> index 0000000000..43b26c1132
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> @@ -0,0 +1,47 @@
> >> +From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Thu, 19 Oct 2023 17:36:44 +0200
> >> +Subject: [PATCH] core: make sure there is rdata to process before
> parsing it
> >> +
> >> +Fixes #452
> >> +
> >> +CVE-2023-38472
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/b024=
ae5749f4aeba03478e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo$>
> ]
> >> +CVE: CVE-2023-38472
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-client/client-test.c      | 3 +++
> >> + avahi-daemon/dbus-entry-group.c | 2 +-
> >> + 2 files changed, 4 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> >> +index 66e3574..9a015d7 100644
> >> +--- a/avahi-client/client-test.c
> >> ++++ b/avahi-client/client-test.c
> >> +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> >> +     avahi_string_list_free(txt);
> >> +
> >> ++    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> >> ++    assert(error !=3D AVAHI_OK);
> >> ++
> >> +     avahi_entry_group_commit (group);
> >> +
> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> >> +diff --git a/avahi-daemon/dbus-entry-group.c
> b/avahi-daemon/dbus-entry-group.c
> >> +index 4e879a5..aa23d4b 100644
> >> +--- a/avahi-daemon/dbus-entry-group.c
> >> ++++ b/avahi-daemon/dbus-entry-group.c
> >> +@@ -340,7 +340,7 @@ DBusHandlerResult
> avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
> >> +         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl)))
> >> +             return avahi_dbus_respond_error(c, m,
> AVAHI_ERR_NO_MEMORY, NULL);
> >> +
> >> +-        if (avahi_rdata_parse (r, rdata, size) < 0) {
> >> ++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
> >> +             avahi_record_unref (r);
> >> +             return avahi_dbus_respond_error(c, m,
> AVAHI_ERR_INVALID_RDATA, NULL);
> >> +         }
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >> new file mode 100644
> >> index 0000000000..7b33d564f8
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >> @@ -0,0 +1,108 @@
> >> +From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Wed, 11 Oct 2023 17:45:44 +0200
> >> +Subject: [PATCH] common: derive alternative host name from its
> unescaped
> >> + version
> >> +
> >> +Normalization of input makes sure we don't have to deal with special
> >> +cases like unescaped dot at the end of label.
> >> +
> >> +Fixes #451 #487
> >> +CVE-2023-38473
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797
> <https://urldefense.com/v3/__https://github.com/lathiat/avahi/commit/b448=
c9f771bada14ae8de175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe=
79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg$>
> ]
> >> +CVE: CVE-2023-38473
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-common/alternative-test.c |  3 +++
> >> + avahi-common/alternative.c      | 27 +++++++++++++++++++--------
> >> + 2 files changed, 22 insertions(+), 8 deletions(-)
> >> +
> >> +diff --git a/avahi-common/alternative-test.c
> b/avahi-common/alternative-test.c
> >> +index 9255435ec..681fc15b8 100644
> >> +--- a/avahi-common/alternative-test.c
> >> ++++ b/avahi-common/alternative-test.c
> >> +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSE=
D
> char *argv[]) {
> >> +     const char* const test_strings[] =3D {
> >> +
>  "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
> >> +         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=
=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC",
> >> ++        ").",
> >> ++        "\\.",
> >> ++
> "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
> >> +         "gurke",
> >> +         "-",
> >> +         " #",
> >> +diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
> >> +index b3d39f0ed..a094e6d76 100644
> >> +--- a/avahi-common/alternative.c
> >> ++++ b/avahi-common/alternative.c
> >> +@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
> >> + }
> >> +
> >> + char *avahi_alternative_host_name(const char *s) {
> >> ++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
> >> ++    char *alt, *r, *ret;
> >> +     const char *e;
> >> +-    char *r;
> >> ++    size_t len;
> >> +
> >> +     assert(s);
> >> +
> >> +     if (!avahi_is_valid_host_name(s))
> >> +         return NULL;
> >> +
> >> +-    if ((e =3D strrchr(s, '-'))) {
> >> ++    if (!avahi_unescape_label(&s, label, sizeof(label)))
> >> ++        return NULL;
> >> ++
> >> ++    if ((e =3D strrchr(label, '-'))) {
> >> +         const char *p;
> >> +
> >> +         e++;
> >> +@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) =
{
> >> +
> >> +     if (e) {
> >> +         char *c, *m;
> >> +-        size_t l;
> >> +         int n;
> >> +
> >> +         n =3D atoi(e)+1;
> >> +         if (!(m =3D avahi_strdup_printf("%i", n)))
> >> +             return NULL;
> >> +
> >> +-        l =3D e-s-1;
> >> ++        len =3D e-label-1;
> >> +
> >> +-        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> >> +-            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> >> ++        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> >> ++            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> >> +
> >> +-        if (!(c =3D avahi_strndup(s, l))) {
> >> ++        if (!(c =3D avahi_strndup(label, len))) {
> >> +             avahi_free(m);
> >> +             return NULL;
> >> +         }
> >> +@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) =
{
> >> +     } else {
> >> +         char *c;
> >> +
> >> +-        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
> >> ++        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
> >> +             return NULL;
> >> +
> >> +         drop_incomplete_utf8(c);
> >> +@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s)=
 {
> >> +         avahi_free(c);
> >> +     }
> >> +
> >> ++    alt =3D alternative;
> >> ++    len =3D sizeof(alternative);
> >> ++    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
> >> ++
> >> ++    avahi_free(r);
> >> ++    r =3D avahi_strdup(ret);
> >> ++
> >> +     assert(avahi_is_valid_host_name(r));
> >> +
> >> +     return r;
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> >
>
> --
> Jeremy Puhlman
> jpuhlman@mvista.com
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190851): https://lists.openembedded.org/g/openembedde=
d-core/message/190851
> Mute This Topic: https://lists.openembedded.org/mt/102621335/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--000000000000997038060a97f5bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross and Steve,</div><div><br></div><div>Please co=
nsider this patch for the Kirkstone branch.<br><br></div><div>As discussed =
again with Meenali, I will be sending patches to remaining branches.</div><=
div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, N=
ov 17, 2023 at 10:13=E2=80=AFPM Randy MacLeod &lt;<a href=3D"mailto:randy.m=
acleod@windriver.com">randy.macleod@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>Add Hari who will inform WR developers
      on his team once the CVE co-ordination scheme is available.</div>
    <div>Add Marta.</div>
    <div><br>
    </div>
    <div>On 2023-11-17 9:11 a.m., Meenali Gupta
      via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
     =20
      <div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
        Hi Ross,</div>
      <div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
        <br>
      </div>
      <div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFont=
Service,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">As
          discussed with Vijay,=C2=A0 we&#39;ll cooperate on this CVE fixes=
.</span></div>
    </blockquote>
    <p>Marta, <br>
    </p>
    <p><br>
    </p>
    <p>Do you have a wiki page set-up?<br>
    </p>
    <p><br>
    </p>
    <p>I see: <br>
    </p>
    <p>=C2=A0=C2=A0 <a href=3D"https://wiki.yoctoproject.org/wiki/Synchroni=
zation_CVEs" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Synchroni=
zation_CVEs</a></p>
    <p>and it mentions, but does not point to, &quot;A synchronization wiki
      page&quot;.</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFont=
Service,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
        </span></div>
      <div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFont=
Service,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Regar=
ds</span></div>
      <div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFont=
Service,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Meena=
li</span></div>
      <hr style=3D"display:inline-block;width:98%">
      <div id=3D"m_-607970516658853564divRplyFwdMsg" dir=3D"ltr"><font styl=
e=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From=
:</b> Vijay
          Anusuri <a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">=
&lt;vanusuri@mvista.com&gt;</a><br>
          <b>Sent:</b> 16 November 2023 21:31<br>
          <b>To:</b> <a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blan=
k">jpuhlman@mvista.com</a> <a href=3D"mailto:jpuhlman@mvista.com" target=3D=
"_blank">&lt;jpuhlman@mvista.com&gt;</a>;
          Ross Burton <a href=3D"mailto:Ross.Burton@arm.com" target=3D"_bla=
nk">&lt;Ross.Burton@arm.com&gt;</a>; Gupta, Meenali
          <a href=3D"mailto:Meenali.Gupta@windriver.com" target=3D"_blank">=
&lt;Meenali.Gupta@windriver.com&gt;</a><br>
          <b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded=
.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>
          <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>Subject:</b> Re: [OE-core][kirkstone][PATCH] avahi: Fix for
          multiple CVE&#39;s</font>
        <div>=C2=A0</div>
      </div>
      <div><strong>
        </strong>
        <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;backgroun=
d:rgb(252,252,3)"><strong><span style=3D"font-size:11pt;color:rgb(0,0,0)">C=
AUTION: This email
              comes from a non Wind River email account!</span></strong><br=
>
          <span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click link=
s or
            open attachments unless you recognize the sender and know
            the content is safe.</span><br>
        </div>
        <div>
          <div dir=3D"ltr">
            <div>Hi Ross,</div>
            <div><br>
            </div>
            <div>As discussed with Meenali, I agreed she was going to do
              this work. <br>
              She has already submitted patches for multiple branches (
              master, mickledore and kirkstone ).
              <br>
            </div>
            <div><br>
            </div>
            <div>For CVE-2023-38469, we need to include 2 commits to fix
              the CVE. Meenali will send the v2 patch for CVE-2023-38469
              which will include 2 patches for all the branches.<br>
            </div>
            <div><br>
            </div>
            <div>Thank you Meenali for your timely response.<br>
            </div>
            <div>=C2=A0<br>
            </div>
            <div>Thanks &amp; Regards,<br>
            </div>
            <div>Vijay<br>
            </div>
          </div>
          <br>
          <div>
            <div dir=3D"ltr">On Thu, Nov 16, 2023 at
              7:56=E2=80=AFPM Jeremy Puhlman via
              <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa=
4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwKv5R-0$" target=3D"_blank">
                lists.openembedded.org</a> &lt;jpuhlman=3D<a href=3D"mailto=
:mvista.com@lists.openembedded.org" target=3D"_blank">mvista.com@lists.open=
embedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
              <br>
              <br>
              On 11/16/2023 3:22 AM, Ross Burton wrote:<br>
              &gt; Hi Vijay and Meenali,<br>
              &gt;<br>
              &gt; Hopefully this will show everyone - especially WR and
              Montavista - that we need to communicate better when
              working on CVEs.=C2=A0 In the short term at least, Marta
              proposed a wiki page which can be updated via a tool and
              when someone is working on an issue that can be marked to
              avoid duplication of effort.=C2=A0 Would that be acceptable t=
o
              both of your companies?<br>
              <br>
              Yeah, I think something like that would be great on our
              end, provided <br>
              its automated and the data can be extracted, so it can be
              consolidated <br>
              in internal CVE tracking that we are currently required
              to.<br>
              <br>
              &gt;<br>
              &gt; I=E2=80=99ve not checked that the fixes are identical, b=
ut
              apparently I need to remind everyone that we take fixes in
              *master first* and then backport to the releases in order.<br=
>
              There should also be an agree upon change decoration to
              indicate <br>
              non-applicability/differently addressed in earlier
              releases.<br>
              <br>
              With 4 year LTS releases many issues are just not going to
              be applicable <br>
              to master. Also there may well be very good reasons to fix
              a given set <br>
              of CVEs in<br>
              completely different ways, but making sure they are
              addressed in both is <br>
              important. Setting aside this example, in almost all cases
              on master<br>
              moving to the fixed version, is almost always the right
              answer, where as <br>
              on say dunfell, moving to the new version may have too
              many knock on <br>
              effects to make sense.<br>
              In this instance, Khem has already indicated moving to the
              new release <br>
              may make sense for both kirkstone and master.<br>
              <br>
              &gt;<br>
              &gt; Luckily the avahi recipe is fairly untouched so this
              should be trivial.=C2=A0 Can you both discuss and agree who i=
s
              going to do this?<br>
              Vijay can you work with Meenali to consolidate this patch.<br=
>
              &gt;<br>
              &gt; Ross<br>
              &gt;<br>
              &gt;&gt; On 16 Nov 2023, at 04:05, Vijay Anusuri via <a href=
=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_=
LG6OXVHPwKv5R-0$" rel=3D"noreferrer" target=3D"_blank">
                lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto=
:mvista.com@lists.openembedded.org" target=3D"_blank">mvista.com@lists.open=
embedded.org</a>&gt;
              wrote:<br>
              &gt;&gt;<br>
              &gt;&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@m=
vista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; Patches to fix:<br>
              &gt;&gt; CVE-2023-38469<br>
              &gt;&gt; CVE-2023-38470<br>
              &gt;&gt; CVE-2023-38471<br>
              &gt;&gt; CVE-2023-38472<br>
              &gt;&gt; CVE-2023-38473<br>
              &gt;&gt;<br>
              &gt;&gt; Upstream-Status: Backport [<a href=3D"https://urldef=
ense.com/v3/__https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56de=
ef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8n=
Oiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56dee=
f1f464529af6e3a1cf</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237__;!!Ajv=
eYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8f=
bQ-9H_LG6OXVHPlqjXgoU$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa5161=
66237</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c__;!!Ajv=
eYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8f=
bQ-9H_LG6OXVHPRzxTKP8$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b=
5d66c</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09__;!!Ajv=
eYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8f=
bQ-9H_LG6OXVHPwzmpbVo$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d=
93b09</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40__;!!Ajv=
eYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8f=
bQ-9H_LG6OXVHPOROFOvo$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8=
dee40</a><br>
              &gt;&gt; &amp;<br>
              &gt;&gt; <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797__;!!Ajv=
eYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8f=
bQ-9H_LG6OXVHPLLeXBTg$" rel=3D"noreferrer" target=3D"_blank">
https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f86=
46797</a>]<br>
              &gt;&gt;<br>
              &gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:v=
anusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt; meta/recipes-connectivity/avahi/<a href=3D"https://u=
rldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZh=
Ge79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$" rel=
=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a>=C2=A0
              |=C2=A0 =C2=A06 +<br>
              &gt;&gt; .../avahi/files/CVE-2023-38469-1.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0
              47 ++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38469-2.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0
              65 +++++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38470.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0
              56 +++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38471.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0
              72 ++++++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38472.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0
              47 ++++++++<br>
              &gt;&gt; .../avahi/files/CVE-2023-38473.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |
              108 ++++++++++++++++++<br>
              &gt;&gt; 7 files changed, 401 insertions(+)<br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<=
br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<=
br>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<br=
>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<br=
>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br=
>
              &gt;&gt; create mode 100644
              meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br=
>
              &gt;&gt;<br>
              &gt;&gt; diff --git a/meta/recipes-connectivity/avahi/<a href=
=3D"https://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIV=
ZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo=
_Ck9E$" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a>
              b/meta/recipes-connectivity/avahi/<a href=3D"https://urldefen=
se.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5K=
JTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$" rel=3D"noref=
errer" target=3D"_blank">avahi_0.8.bb</a><br>
              &gt;&gt; index b5c966c102..772fb43939 100644<br>
              &gt;&gt; --- a/meta/recipes-connectivity/avahi/<a href=3D"htt=
ps://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$"=
 rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
              &gt;&gt; +++ b/meta/recipes-connectivity/avahi/<a href=3D"htt=
ps://urldefense.com/v3/__http://avahi_0.8.bb__;!!AjveYdw8EvQ!YPO7NIVZeFhisa=
hLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSo_Ck9E$"=
 rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
              &gt;&gt; @@ -26,6 +26,12 @@ SRC_URI =3D &quot;<a href=3D"http=
s://urldefense.com/v3/__https://github.com/lathiat/avahi/releases/download/=
v$*7BPV*7D/avahi-$*7BPV*7D__;JSUlJQ!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5=
KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP0Am2ovI$" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/lathiat/avahi/releases/downloa=
d/v${PV}/avahi-${PV}</a><br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0<a>file://0001-Fix-opening-etc-resolv.conf-error.patch<=
/a> \<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>fi=
le://handle-hup.patch</a> \<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>fi=
le://local-ping.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38469-1.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38469-2.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38470.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38471.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38472.patch</a> \<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://=
CVE-2023-38473.patch</a> \<br>
              &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
              &gt;&gt;<br>
              &gt;&gt; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://urld=
efense.com/v3/__https://github.com/lathiat/avahi/releases/__;!!AjveYdw8EvQ!=
YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6=
OXVHP0Xuk60k$" rel=3D"noreferrer" target=3D"_blank">https://github.com/lath=
iat/avahi/releases/</a>&quot;<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..99c717daf3<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,47 @@<br>
              &gt;&gt; +From a337a1ba7d15853fb56deef1f464529af6e3a1cf
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evv=
ers@ya.ru" target=3D"_blank">evvers@ya.ru</a>&gt;<br>
              &gt;&gt; +Date: Mon, 23 Oct 2023 20:29:31 +0000<br>
              &gt;&gt; +Subject: [PATCH] core: reject overly long TXT
              resource records<br>
              &gt;&gt; +<br>
              &gt;&gt; +Closes <a href=3D"https://urldefense.com/v3/__https=
://github.com/lathiat/avahi/issues/455__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZh=
Ge79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9siEVs$" rel=
=3D"noreferrer" target=3D"_blank">
                https://github.com/lathiat/avahi/issues/455</a><br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38469<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56d=
eef1f464529af6e3a1cf__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPSO96cKo$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56de=
ef1f464529af6e3a1cf</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38469<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-core/rr.c | 9 ++++++++-<br>
              &gt;&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-core/rr.c b/avahi-core/rr.c<br>
              &gt;&gt; +index 2bb89244..9c04ebbd 100644<br>
              &gt;&gt; +--- a/avahi-core/rr.c<br>
              &gt;&gt; ++++ b/avahi-core/rr.c<br>
              &gt;&gt; +@@ -32,6 +32,7 @@<br>
              &gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
              &gt;&gt; + #include &lt;avahi-common/defs.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++#include &quot;dns.h&quot;<br>
              &gt;&gt; + #include &quot;rr.h&quot;<br>
              &gt;&gt; + #include &quot;log.h&quot;<br>
              &gt;&gt; + #include &quot;util.h&quot;<br>
              &gt;&gt; +@@ -689,11 +690,17 @@ int
              avahi_record_is_valid(AvahiRecord *r) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AVAHI_DNS_TY=
PE_TXT: {<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ava=
hiStringList *strlst;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t u=
sed =3D 0;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (str=
lst =3D
              r-&gt;data.txt.string_list; strlst; strlst =3D
              strlst-&gt;next)<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (str=
lst =3D
              r-&gt;data.txt.string_list; strlst; strlst =3D
              strlst-&gt;next) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (strlst-&gt;size &gt; 255 ||
              strlst-&gt;size &lt;=3D 0)<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 used +=3D 1+strlst-&gt;size;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (used &gt;
              AVAHI_DNS_RDATA_MAX)<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return 0;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn 1;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patc=
h
b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..b83a70e29b<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patc=
h<br>
              &gt;&gt; @@ -0,0 +1,65 @@<br>
              &gt;&gt; +From c6cab87df290448a63323c8ca759baa516166237
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evv=
ers@ya.ru" target=3D"_blank">evvers@ya.ru</a>&gt;<br>
              &gt;&gt; +Date: Wed, 25 Oct 2023 18:15:42 +0000<br>
              &gt;&gt; +Subject: [PATCH] tests: pass overly long TXT
              resource records<br>
              &gt;&gt; +<br>
              &gt;&gt; +to make sure they don&#39;t crash avahi any more.<b=
r>
              &gt;&gt; +<br>
              &gt;&gt; +It reproduces <a href=3D"https://urldefense.com/v3/=
__https://github.com/lathiat/avahi/issues/455__;!!AjveYdw8EvQ!YPO7NIVZeFhis=
ahLwBZhGe79g5KJTQ1xZy2oR8nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHP-9siEVs$=
" rel=3D"noreferrer" target=3D"_blank">
                https://github.com/lathiat/avahi/issues/455</a><br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/c6cab87df290448a6332=
3c8ca759baa516166237__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPlqjXgoU$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/c6cab87df290448a63323=
c8ca759baa516166237</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38469<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-client/client-test.c | 14 ++++++++++++++<br>
              &gt;&gt; + 1 file changed, 14 insertions(+)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-client/client-test.c
              b/avahi-client/client-test.c<br>
              &gt;&gt; +index 7d04a6a..66e3574 100644<br>
              &gt;&gt; +--- a/avahi-client/client-test.c<br>
              &gt;&gt; ++++ b/avahi-client/client-test.c<br>
              &gt;&gt; +@@ -22,6 +22,7 @@<br>
              &gt;&gt; + #endif<br>
              &gt;&gt; +<br>
              &gt;&gt; + #include &lt;stdio.h&gt;<br>
              &gt;&gt; ++#include &lt;string.h&gt;<br>
              &gt;&gt; + #include &lt;assert.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; + #include &lt;avahi-client/client.h&gt;<br>
              &gt;&gt; +@@ -33,6 +34,8 @@<br>
              &gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
              &gt;&gt; + #include &lt;avahi-common/timeval.h&gt;<br>
              &gt;&gt; +<br>
              &gt;&gt; ++#include &lt;avahi-core/dns.h&gt;<br>
              &gt;&gt; ++<br>
              &gt;&gt; + static const AvahiPoll *poll_api =3D NULL;<br>
              &gt;&gt; + static AvahiSimplePoll *simple_poll =3D NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t cookie;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0struct timeval tv;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0AvahiAddress a;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 uint8_t rdata[AVAHI_DNS_RDATA_MAX+1]=
;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 AvahiStringList *txt =3D NULL;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 int r;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0simple_poll =3D avahi_simple_po=
ll_new();<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0poll_api =3D
              avahi_simple_poll_get(simple_poll);<br>
              &gt;&gt; +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;,
              avahi_strerror(avahi_entry_group_add_service (group,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;Lathiat&#39;s S=
ite&quot;,
              &quot;_http._tcp&quot;, NULL, NULL, 80, &quot;foo=3Dbar&quot;=
, NULL)));<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;add_record: %d\n&q=
uot;,
              avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
              AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120,
              &quot;\5booya&quot;, 6));<br>
              &gt;&gt; +<br>
              &gt;&gt; ++=C2=A0 =C2=A0 memset(rdata, 1, sizeof(rdata));<br>
              &gt;&gt; ++=C2=A0 =C2=A0 r =3D avahi_string_list_parse(rdata,
              sizeof(rdata), &amp;txt);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 assert(r &gt;=3D 0);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 assert(avahi_string_list_serialize(t=
xt,
              NULL, 0) =3D=3D sizeof(rdata));<br>
              &gt;&gt; ++=C2=A0 =C2=A0 error =3D
              avahi_entry_group_add_service_strlst(group,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;,
              &quot;_qotd._tcp&quot;, NULL, NULL, 123, txt);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_INVALI=
D_RECORD);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 avahi_string_list_free(txt);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group=
);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser=
_new (avahi,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
              AVAHI_DOMAIN_BROWSER_BROWSE, 0,
              avahi_domain_browser_callback, (char*) &quot;omghai3u&quot;);=
<br>
              &gt;&gt; +--<br>
              &gt;&gt; +2.25.1<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..1cbb00dcab<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<=
br>
              &gt;&gt; @@ -0,0 +1,56 @@<br>
              &gt;&gt; +From 94cb6489114636940ac683515417990b55b5d66c
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk=
?=3D &lt;<a href=3D"mailto:pemensik@redhat.com" target=3D"_blank">pemensik@=
redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Tue, 11 Apr 2023 15:29:59 +0200<br>
              &gt;&gt; +Subject: [PATCH] Ensure each label is at least
              one byte long<br>
              &gt;&gt; +<br>
              &gt;&gt; +The only allowed exception is single dot, where
              it should return empty<br>
              &gt;&gt; +string.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #454.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/94cb6489114636940ac6=
83515417990b55b5d66c__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPRzxTKP8$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/94cb6489114636940ac68=
3515417990b55b5d66c</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38470<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-common/domain-test.c | 14 ++++++++++++++<br>
              &gt;&gt; + avahi-common/domain.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
              &gt;&gt; + 2 files changed, 15 insertions(+), 1
              deletion(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/domain-test.c
              b/avahi-common/domain-test.c<br>
              &gt;&gt; +index cf763eca6..3acc1c1e4 100644<br>
              &gt;&gt; +--- a/avahi-common/domain-test.c<br>
              &gt;&gt; ++++ b/avahi-common/domain-test.c<br>
              &gt;&gt; +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int
              argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;, s =3D
              avahi_normalize_name_strdup(&quot;fo\\\\o\\..f oo.&quot;));<b=
r>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_free(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; ++=C2=A0 =C2=A0 printf(&quot;%s\n&quot;, s =3D
              avahi_normalize_name_strdup(&quot;.&quot;));<br>
              &gt;&gt; ++=C2=A0 =C2=A0 avahi_free(s);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++=C2=A0 =C2=A0 s =3D
              avahi_normalize_name_strdup(&quot;,.=3D.}.=3D.?-.}.=3D.?.?.}.=
}.?.?.?.z.?.?.}.}.&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}=
.?.?.}.}.}&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.=
?.?.?.zM.?`&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}=
.}.?.?.&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?=
.}.}.}.&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D=
.?.?.}?&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.=
?.?.zM.&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0
              &quot;?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}=
.=3D.?.?.&quot;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 &quot;}.?.?.?.}.=3D.?.?.}&quot;);<br=
>
              &gt;&gt; ++=C2=A0 =C2=A0 assert(s =3D=3D NULL);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_=
domain_equal(&quot;\\065aa
              bbb\\.\\046cc.cc\\\\.dee.fff.&quot;, &quot;Aaa
              BBB\\.\\.cc.cc\\\\.dee.fff&quot;));<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_=
domain_equal(&quot;A&quot;,
              &quot;a&quot;));<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/domain.c
              b/avahi-common/domain.c<br>
              &gt;&gt; +index 3b1ab6834..e66d2416c 100644<br>
              &gt;&gt; +--- a/avahi-common/domain.c<br>
              &gt;&gt; ++++ b/avahi-common/domain.c<br>
              &gt;&gt; +@@ -201,7 +201,7 @@ char
              *avahi_normalize_name(const char *s, char *ret_s, size_t
              size) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!empty) {<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size=
 &lt; 1)<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size=
 &lt; 2)<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(r=
++) =3D &#39;.&#39;;<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..8242646da1<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<=
br>
              &gt;&gt; @@ -0,0 +1,72 @@<br>
              &gt;&gt; +From 894f085f402e023a98cbb6f5a3d117bd88d93b09
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:mseklet=
a@redhat.com" target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Mon, 23 Oct 2023 13:38:35 +0200<br>
              &gt;&gt; +Subject: [PATCH] core: extract host name using
              avahi_unescape_label()<br>
              &gt;&gt; +<br>
              &gt;&gt; +Previously we could create invalid escape
              sequence when we split the<br>
              &gt;&gt; +string on dot. For example, from valid host name
              &quot;foo\\.bar&quot; we have<br>
              &gt;&gt; +created invalid name &quot;foo\\&quot; and tried to=
 set
              that as the host name<br>
              &gt;&gt; +which crashed the daemon.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #453<br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38471<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/894f085f402e023a98cb=
b6f5a3d117bd88d93b09__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPwzmpbVo$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb=
6f5a3d117bd88d93b09</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38471<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-core/server.c | 27
              +++++++++++++++++++++------<br>
              &gt;&gt; + 1 file changed, 21 insertions(+), 6
              deletions(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-core/server.c
              b/avahi-core/server.c<br>
              &gt;&gt; +index c32637af8..f6a21bb77 100644<br>
              &gt;&gt; +--- a/avahi-core/server.c<br>
              &gt;&gt; ++++ b/avahi-core/server.c<br>
              &gt;&gt; +@@ -1295,7 +1295,11 @@ static void
              update_fqdn(AvahiServer *s) {<br>
              &gt;&gt; + }<br>
              &gt;&gt; +<br>
              &gt;&gt; + int avahi_server_set_host_name(AvahiServer *s,
              const char *host_name) {<br>
              &gt;&gt; +-=C2=A0 =C2=A0 char *hn =3D NULL;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 char label_escaped[AVAHI_LABEL_MAX*4=
+1];<br>
              &gt;&gt; ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX];<br>
              &gt;&gt; ++=C2=A0 =C2=A0 char *hn =3D NULL, *h;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 size_t len;<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !host_n=
ame ||
              avahi_is_valid_host_name(host_name),
              AVAHI_ERR_INVALID_HOST_NAME);<br>
              &gt;&gt; +@@ -1305,17 +1309,28 @@ int
              avahi_server_set_host_name(AvahiServer *s, const char
              *host_name) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hn =3D
              avahi_normalize_name_strdup(host_name);<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 hn[strcspn(hn, &quot;.&quot;)] =3D 0=
;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 h =3D hn;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_unescape_label((const cha=
r
              **)&amp;hn, label, sizeof(label))) {<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(h);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVAL=
ID_HOST_NAME;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 }<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++=C2=A0 =C2=A0 avahi_free(h);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++=C2=A0 =C2=A0 h =3D label_escaped;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 len =3D sizeof(label_escaped);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_escape_label(label,
              strlen(label), &amp;h, &amp;len))<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVAL=
ID_HOST_NAME;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_na=
me, hn)
              &amp;&amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION) {<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(hn);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_na=
me,
              label_escaped) &amp;&amp; s-&gt;state !=3D
              AVAHI_SERVER_COLLISION)<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_serv=
er_set_errno(s,
              AVAHI_ERR_NO_CHANGE);<br>
              &gt;&gt; +-=C2=A0 =C2=A0 }<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0withdraw_host_rrs(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_free(s-&gt;host_name);<br=
>
              &gt;&gt; +-=C2=A0 =C2=A0 s-&gt;host_name =3D hn;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 s-&gt;host_name =3D
              avahi_strdup(label_escaped);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if (!s-&gt;host_name)<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_NO_ME=
MORY;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0update_fqdn(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..43b26c1132<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<=
br>
              &gt;&gt; @@ -0,0 +1,47 @@<br>
              &gt;&gt; +From b024ae5749f4aeba03478e6391687c3c9c8dee40
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:mseklet=
a@redhat.com" target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Thu, 19 Oct 2023 17:36:44 +0200<br>
              &gt;&gt; +Subject: [PATCH] core: make sure there is rdata
              to process before parsing it<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #452<br>
              &gt;&gt; +<br>
              &gt;&gt; +CVE-2023-38472<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/b024ae5749f4aeba0347=
8e6391687c3c9c8dee40__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPOROFOvo$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478=
e6391687c3c9c8dee40</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38472<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-client/client-test.c=C2=A0 =C2=A0 =C2=A0 | 3=
 +++<br>
              &gt;&gt; + avahi-daemon/dbus-entry-group.c | 2 +-<br>
              &gt;&gt; + 2 files changed, 4 insertions(+), 1 deletion(-)<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-client/client-test.c
              b/avahi-client/client-test.c<br>
              &gt;&gt; +index 66e3574..9a015d7 100644<br>
              &gt;&gt; +--- a/avahi-client/client-test.c<br>
              &gt;&gt; ++++ b/avahi-client/client-test.c<br>
              &gt;&gt; +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED
              int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(error =3D=3D AVAHI_ERR_I=
NVALID_RECORD);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_string_list_free(txt);<br=
>
              &gt;&gt; +<br>
              &gt;&gt; ++=C2=A0 =C2=A0 error =3D avahi_entry_group_add_reco=
rd
              (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&q=
uot;,
              0x01, 0x10, 120, &quot;&quot;, 0);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 assert(error !=3D AVAHI_OK);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group=
);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser=
_new (avahi,
              AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL,
              AVAHI_DOMAIN_BROWSER_BROWSE, 0,
              avahi_domain_browser_callback, (char*) &quot;omghai3u&quot;);=
<br>
              &gt;&gt; +diff --git a/avahi-daemon/dbus-entry-group.c
              b/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; +index 4e879a5..aa23d4b 100644<br>
              &gt;&gt; +--- a/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; ++++ b/avahi-daemon/dbus-entry-group.c<br>
              &gt;&gt; +@@ -340,7 +340,7 @@ DBusHandlerResult
              avahi_dbus_msg_entry_group_impl(DBusConnection *c,
              DBusMessage<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(r =3D avahi=
_record_new_full (name,
              clazz, type, ttl)))<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn avahi_dbus_respond_error(c,
              m, AVAHI_ERR_NO_MEMORY, NULL);<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avahi_rdata_parse =
(r, rdata, size)
              &lt; 0) {<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdata || avahi_rd=
ata_parse (r,
              rdata, size) &lt; 0) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ava=
hi_record_unref (r);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn avahi_dbus_respond_error(c,
              m, AVAHI_ERR_INVALID_RDATA, NULL);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; +--<br>
              &gt;&gt; +2.25.1<br>
              &gt;&gt; +<br>
              &gt;&gt; diff --git
              a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br>
              &gt;&gt; new file mode 100644<br>
              &gt;&gt; index 0000000000..7b33d564f8<br>
              &gt;&gt; --- /dev/null<br>
              &gt;&gt; +++
              b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<=
br>
              &gt;&gt; @@ -0,0 +1,108 @@<br>
              &gt;&gt; +From b448c9f771bada14ae8de175695a9729f8646797
              Mon Sep 17 00:00:00 2001<br>
              &gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:mseklet=
a@redhat.com" target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
              &gt;&gt; +Date: Wed, 11 Oct 2023 17:45:44 +0200<br>
              &gt;&gt; +Subject: [PATCH] common: derive alternative host
              name from its unescaped<br>
              &gt;&gt; + version<br>
              &gt;&gt; +<br>
              &gt;&gt; +Normalization of input makes sure we don&#39;t have
              to deal with special<br>
              &gt;&gt; +cases like unescaped dot at the end of label.<br>
              &gt;&gt; +<br>
              &gt;&gt; +Fixes #451 #487<br>
              &gt;&gt; +CVE-2023-38473<br>
              &gt;&gt; +<br>
              &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8d=
e175695a9729f8646797__;!!AjveYdw8EvQ!YPO7NIVZeFhisahLwBZhGe79g5KJTQ1xZy2oR8=
nOiu1HFt04VXa4FsGlVur74kFZ8fbQ-9H_LG6OXVHPLLeXBTg$" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de=
175695a9729f8646797</a>]<br>
              &gt;&gt; +CVE: CVE-2023-38473<br>
              &gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
              &gt;&gt; +---<br>
              &gt;&gt; + avahi-common/alternative-test.c |=C2=A0 3 +++<br>
              &gt;&gt; + avahi-common/alternative.c=C2=A0 =C2=A0 =C2=A0 | 2=
7
              +++++++++++++++++++--------<br>
              &gt;&gt; + 2 files changed, 22 insertions(+), 8
              deletions(-)<br>
              &gt;&gt; +<br>
              &gt;&gt; +diff --git a/avahi-common/alternative-test.c
              b/avahi-common/alternative-test.c<br>
              &gt;&gt; +index 9255435ec..681fc15b8 100644<br>
              &gt;&gt; +--- a/avahi-common/alternative-test.c<br>
              &gt;&gt; ++++ b/avahi-common/alternative-test.c<br>
              &gt;&gt; +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int
              argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0const char* const test_strings[=
] =3D {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXX&quot;,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC&quot;,<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;).&quot;,<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\.&quot;,<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0
              &quot;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAA\\\\&quot;,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;gurke&quot;=
,<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-&quot;,<br=
>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; #&quot;,<b=
r>
              &gt;&gt; +diff --git a/avahi-common/alternative.c
              b/avahi-common/alternative.c<br>
              &gt;&gt; +index b3d39f0ed..a094e6d76 100644<br>
              &gt;&gt; +--- a/avahi-common/alternative.c<br>
              &gt;&gt; ++++ b/avahi-common/alternative.c<br>
              &gt;&gt; +@@ -49,15 +49,20 @@ static void
              drop_incomplete_utf8(char *c) {<br>
              &gt;&gt; + }<br>
              &gt;&gt; +<br>
              &gt;&gt; + char *avahi_alternative_host_name(const char
              *s) {<br>
              &gt;&gt; ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX],
              alternative[AVAHI_LABEL_MAX*4+1];<br>
              &gt;&gt; ++=C2=A0 =C2=A0 char *alt, *r, *ret;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0const char *e;<br>
              &gt;&gt; +-=C2=A0 =C2=A0 char *r;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 size_t len;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(s);<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (!avahi_is_valid_host_name(s=
))<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 if ((e =3D strrchr(s, &#39;-&#39;)))=
 {<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_unescape_label(&amp;s, la=
bel,
              sizeof(label)))<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++=C2=A0 =C2=A0 if ((e =3D strrchr(label, &#39;-&#39=
;))) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;<br=
>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e++;<br>
              &gt;&gt; +@@ -74,19 +79,18 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (e) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c, *m;<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t l;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int n;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D atoi(e)+1;<=
br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(m =3D avahi=
_strdup_printf(&quot;%i&quot;,
              n)))<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D e-s-1;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D e-label-1;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt;=3D
              AVAHI_LABEL_MAX-1-strlen(m)-1)<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D AV=
AHI_LABEL_MAX-1-strlen(m)-1;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D
              AVAHI_LABEL_MAX-1-strlen(m)-1)<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D
              AVAHI_LABEL_MAX-1-strlen(m)-1;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strn=
dup(s, l))) {<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strn=
dup(label, len))) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ava=
hi_free(m);<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn NULL;<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; +@@ -100,7 +104,7 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c;<br>
              &gt;&gt; +<br>
              &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strn=
dup(s,
              AVAHI_LABEL_MAX-1-2)))<br>
              &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strn=
dup(label,
              AVAHI_LABEL_MAX-1-2)))<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn NULL;<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop_incomplete_u=
tf8(c);<br>
              &gt;&gt; +@@ -109,6 +113,13 @@ char
              *avahi_alternative_host_name(const char *s) {<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(c);<br=
>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
              &gt;&gt; +<br>
              &gt;&gt; ++=C2=A0 =C2=A0 alt =3D alternative;<br>
              &gt;&gt; ++=C2=A0 =C2=A0 len =3D sizeof(alternative);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 ret =3D avahi_escape_label(r, strlen=
(r),
              &amp;alt, &amp;len);<br>
              &gt;&gt; ++<br>
              &gt;&gt; ++=C2=A0 =C2=A0 avahi_free(r);<br>
              &gt;&gt; ++=C2=A0 =C2=A0 r =3D avahi_strdup(ret);<br>
              &gt;&gt; ++<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(avahi_is_valid_host_name=
(r));<br>
              &gt;&gt; +<br>
              &gt;&gt; +=C2=A0 =C2=A0 =C2=A0return r;<br>
              &gt;&gt; -- <br>
              &gt;&gt; 2.25.1<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;<br>
              &gt; <br>
              &gt;<br>
              <br>
              -- <br>
              Jeremy Puhlman<br>
              <a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuh=
lman@mvista.com</a><br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#190851): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190851" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/190851</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102621335/361=
6765" target=3D"_blank">https://lists.openembedded.org/mt/102621335/3616765=
</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank=
">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>

--000000000000997038060a97f5bb--

