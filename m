Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC0EC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:16:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1729.1700500572683714845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jyh4wIP0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.42, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507b9408c61so6193389e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700500571; x=1701105371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQgpOdijZEAw0KKISfcgnX1iYgdOyhU+XREu10EYBHs=;
        b=Jyh4wIP0KjpVVxqM+zZCnBj2EOqUXTNE8fB/P6vrtki7ARzskWR0YXXbYg+oEQPo2N
         VJEhisFgU9Ck4FkG0o7ISKi04X3kCjSyoRyfeEHOQgqK73l1XPBiN2YWb56ZLay5L3rH
         ySzT1drNlw75t78PlW94dVxZTleDZjYF5pA3ZwU9RELDZnLgThUAKClMe65+LKQaDDRD
         XYZDdZ2ANWUONdu4M4No2Y/kJ2+j7DvbAQFCnbwZhTX0rcjE7jk9swH94fwvV2qRtk/q
         IWtj//3IIIOPBUBINZbnUMq9+qvk//7ONYfgH7QNLOtB5VM8TC56gxTifSQvQy6Mj53Y
         HAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500571; x=1701105371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQgpOdijZEAw0KKISfcgnX1iYgdOyhU+XREu10EYBHs=;
        b=OmL5gx7+udNz+RoQtNjuTS9SRZ88IVrXvYfMrxApcIUp9adLLs89wPDx8x27utYwLL
         QjFp+HRSnmoB2ToJJtBmJ/lmtdJ7KzFA1IqzqqJ5UPIJDXgWMHkLAYgSI34JSTCWMAPv
         sprOrDvI7vYZGXWHDm97DioXzZ2/qQm3Ram7jN/ipNiv1ewCL9YtcgQK4EHtAM2TF9U5
         VgsNLR1a1+DWDs5WhCVUehkNoNveaPYLht6WjYDJ0buKGmF980VzVK/6yg4xBBUm80YQ
         YFHfjfWe35qO54zSE9Y1sjhtLG0eoKPoxfWQTHwJzmq7vL391fqgTrQAb96wxcofbZFG
         Iwtg==
X-Gm-Message-State: AOJu0YwAz4wNFgMuaykjoU/75sTpIgXujpFlKAp5K/mc8nu8UI0uSExr
	UiNsbg2H/gxJ1BY24rTZYKJ4CdMivW7cXMNqUOyPuA==
X-Google-Smtp-Source: AGHT+IFbtacr7McEJdN9SK1eAKyS7k0x443Stsa3UKk7OsonAoxIwW3oHF0v0K56nFwO5Sk9p3rm1NKAqlG+p00V5X0=
X-Received: by 2002:a05:6512:3b0f:b0:50a:a660:d2f5 with SMTP id
 f15-20020a0565123b0f00b0050aa660d2f5mr7469582lfv.22.1700500570210; Mon, 20
 Nov 2023 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20231116040549.11447-1-vanusuri@mvista.com> <93710C32-2A78-417E-970F-E4B010262326@arm.com>
 <57008fe2-36a9-4a7e-909b-4cab0a86f351@mvista.com> <CANQUz1_qynUTH-3KOq11e+CO+xUGoZbxpu1qLRGEee4ddCK4cQ@mail.gmail.com>
 <PH7PR11MB798653248FA1F75F94D91844E5B7A@PH7PR11MB7986.namprd11.prod.outlook.com>
 <0836df76-219c-4d82-92fd-0b7152d7cc7f@windriver.com> <CANQUz1-9BDwRoP_VwSsNdA+ttixdHjsgDJT9Fo0iWb5nTGDuGQ@mail.gmail.com>
In-Reply-To: <CANQUz1-9BDwRoP_VwSsNdA+ttixdHjsgDJT9Fo0iWb5nTGDuGQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Nov 2023 07:15:58 -1000
Message-ID: <CAOSpxdZF4ounZi3==q9_aikW526n235etwXfqrrGjSQ1uvoF5g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: Ross Burton <ross.burton@arm.com>, Marta Rybczynska <rybczynska@gmail.com>, 
	"G Pillai, Hari" <hari.gpillai@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"jpuhlman@mvista.com" <jpuhlman@mvista.com>, meenali.gupta@windriver.com, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 17:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190924

On Mon, Nov 20, 2023 at 6:27=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Ross and Steve,
>
> Please consider this patch for the Kirkstone branch.

I have them in my kirkstone test queue.

Thanks,

Steve

> As discussed again with Meenali, I will be sending patches to remaining b=
ranches.
>
> Thanks & Regards,
> Vijay
>
> On Fri, Nov 17, 2023 at 10:13=E2=80=AFPM Randy MacLeod <randy.macleod@win=
driver.com> wrote:
>>
>> Add Hari who will inform WR developers on his team once the CVE co-ordin=
ation scheme is available.
>> Add Marta.
>>
>> On 2023-11-17 9:11 a.m., Meenali Gupta via lists.openembedded.org wrote:
>>
>> Hi Ross,
>>
>> As discussed with Vijay,  we'll cooperate on this CVE fixes.
>>
>> Marta,
>>
>>
>> Do you have a wiki page set-up?
>>
>>
>> I see:
>>
>>    https://wiki.yoctoproject.org/wiki/Synchronization_CVEs
>>
>> and it mentions, but does not point to, "A synchronization wiki page".
>>
>>
>>
>> ../Randy
>>
>>
>>
>> Regards
>> Meenali
>> ________________________________
>> From: Vijay Anusuri <vanusuri@mvista.com>
>> Sent: 16 November 2023 21:31
>> To: jpuhlman@mvista.com <jpuhlman@mvista.com>; Ross Burton <Ross.Burton@=
arm.com>; Gupta, Meenali <Meenali.Gupta@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.op=
enembedded.org>
>> Subject: Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>> Hi Ross,
>>
>> As discussed with Meenali, I agreed she was going to do this work.
>> She has already submitted patches for multiple branches ( master, mickle=
dore and kirkstone ).
>>
>> For CVE-2023-38469, we need to include 2 commits to fix the CVE. Meenali=
 will send the v2 patch for CVE-2023-38469 which will include 2 patches for=
 all the branches.
>>
>> Thank you Meenali for your timely response.
>>
>> Thanks & Regards,
>> Vijay
>>
>> On Thu, Nov 16, 2023 at 7:56=E2=80=AFPM Jeremy Puhlman via lists.openemb=
edded.org <jpuhlman=3Dmvista.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On 11/16/2023 3:22 AM, Ross Burton wrote:
>> > Hi Vijay and Meenali,
>> >
>> > Hopefully this will show everyone - especially WR and Montavista - tha=
t we need to communicate better when working on CVEs.  In the short term at=
 least, Marta proposed a wiki page which can be updated via a tool and when=
 someone is working on an issue that can be marked to avoid duplication of =
effort.  Would that be acceptable to both of your companies?
>>
>> Yeah, I think something like that would be great on our end, provided
>> its automated and the data can be extracted, so it can be consolidated
>> in internal CVE tracking that we are currently required to.
>>
>> >
>> > I=E2=80=99ve not checked that the fixes are identical, but apparently =
I need to remind everyone that we take fixes in *master first* and then bac=
kport to the releases in order.
>> There should also be an agree upon change decoration to indicate
>> non-applicability/differently addressed in earlier releases.
>>
>> With 4 year LTS releases many issues are just not going to be applicable
>> to master. Also there may well be very good reasons to fix a given set
>> of CVEs in
>> completely different ways, but making sure they are addressed in both is
>> important. Setting aside this example, in almost all cases on master
>> moving to the fixed version, is almost always the right answer, where as
>> on say dunfell, moving to the new version may have too many knock on
>> effects to make sense.
>> In this instance, Khem has already indicated moving to the new release
>> may make sense for both kirkstone and master.
>>
>> >
>> > Luckily the avahi recipe is fairly untouched so this should be trivial=
.  Can you both discuss and agree who is going to do this?
>> Vijay can you work with Meenali to consolidate this patch.
>> >
>> > Ross
>> >
>> >> On 16 Nov 2023, at 04:05, Vijay Anusuri via lists.openembedded.org <v=
anusuri=3Dmvista.com@lists.openembedded.org> wrote:
>> >>
>> >> From: Vijay Anusuri <vanusuri@mvista.com>
>> >>
>> >> Patches to fix:
>> >> CVE-2023-38469
>> >> CVE-2023-38470
>> >> CVE-2023-38471
>> >> CVE-2023-38472
>> >> CVE-2023-38473
>> >>
>> >> Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/a3=
37a1ba7d15853fb56deef1f464529af6e3a1cf
>> >> &
>> >> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759b=
aa516166237
>> >> &
>> >> https://github.com/lathiat/avahi/commit/94cb6489114636940ac6835154179=
90b55b5d66c
>> >> &
>> >> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d11=
7bd88d93b09
>> >> &
>> >> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687=
c3c9c8dee40
>> >> &
>> >> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9=
729f8646797]
>> >>
>> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> ---
>> >> meta/recipes-connectivity/avahi/avahi_0.8.bb  |   6 +
>> >> .../avahi/files/CVE-2023-38469-1.patch        |  47 ++++++++
>> >> .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
>> >> .../avahi/files/CVE-2023-38470.patch          |  56 +++++++++
>> >> .../avahi/files/CVE-2023-38471.patch          |  72 ++++++++++++
>> >> .../avahi/files/CVE-2023-38472.patch          |  47 ++++++++
>> >> .../avahi/files/CVE-2023-38473.patch          | 108 +++++++++++++++++=
+
>> >> 7 files changed, 401 insertions(+)
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
69-1.patch
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
69-2.patch
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
70.patch
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
71.patch
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
72.patch
>> >> create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
73.patch
>> >>
>> >> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/reci=
pes-connectivity/avahi/avahi_0.8.bb
>> >> index b5c966c102..772fb43939 100644
>> >> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
>> >> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
>> >> @@ -26,6 +26,12 @@ SRC_URI =3D "https://github.com/lathiat/avahi/rele=
ases/download/v${PV}/avahi-${PV}
>> >>             file://0001-Fix-opening-etc-resolv.conf-error.patch \
>> >>             file://handle-hup.patch \
>> >>             file://local-ping.patch \
>> >> +           file://CVE-2023-38469-1.patch \
>> >> +           file://CVE-2023-38469-2.patch \
>> >> +           file://CVE-2023-38470.patch \
>> >> +           file://CVE-2023-38471.patch \
>> >> +           file://CVE-2023-38472.patch \
>> >> +           file://CVE-2023-38473.patch \
>> >>             "
>> >>
>> >> UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/"
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.p=
atch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>> >> new file mode 100644
>> >> index 0000000000..99c717daf3
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>> >> @@ -0,0 +1,47 @@
>> >> +From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 20=
01
>> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
>> >> +Date: Mon, 23 Oct 2023 20:29:31 +0000
>> >> +Subject: [PATCH] core: reject overly long TXT resource records
>> >> +
>> >> +Closes https://github.com/lathiat/avahi/issues/455
>> >> +
>> >> +CVE-2023-38469
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/a=
337a1ba7d15853fb56deef1f464529af6e3a1cf]
>> >> +CVE: CVE-2023-38469
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-core/rr.c | 9 ++++++++-
>> >> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> >> +
>> >> +diff --git a/avahi-core/rr.c b/avahi-core/rr.c
>> >> +index 2bb89244..9c04ebbd 100644
>> >> +--- a/avahi-core/rr.c
>> >> ++++ b/avahi-core/rr.c
>> >> +@@ -32,6 +32,7 @@
>> >> + #include <avahi-common/malloc.h>
>> >> + #include <avahi-common/defs.h>
>> >> +
>> >> ++#include "dns.h"
>> >> + #include "rr.h"
>> >> + #include "log.h"
>> >> + #include "util.h"
>> >> +@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
>> >> +         case AVAHI_DNS_TYPE_TXT: {
>> >> +
>> >> +             AvahiStringList *strlst;
>> >> ++            size_t used =3D 0;
>> >> +
>> >> +-            for (strlst =3D r->data.txt.string_list; strlst; strlst=
 =3D strlst->next)
>> >> ++            for (strlst =3D r->data.txt.string_list; strlst; strlst=
 =3D strlst->next) {
>> >> +                 if (strlst->size > 255 || strlst->size <=3D 0)
>> >> +                     return 0;
>> >> +
>> >> ++                used +=3D 1+strlst->size;
>> >> ++                if (used > AVAHI_DNS_RDATA_MAX)
>> >> ++                    return 0;
>> >> ++            }
>> >> ++
>> >> +             return 1;
>> >> +         }
>> >> +     }
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.p=
atch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>> >> new file mode 100644
>> >> index 0000000000..b83a70e29b
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>> >> @@ -0,0 +1,65 @@
>> >> +From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 20=
01
>> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
>> >> +Date: Wed, 25 Oct 2023 18:15:42 +0000
>> >> +Subject: [PATCH] tests: pass overly long TXT resource records
>> >> +
>> >> +to make sure they don't crash avahi any more.
>> >> +
>> >> +It reproduces https://github.com/lathiat/avahi/issues/455
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/c=
6cab87df290448a63323c8ca759baa516166237]
>> >> +CVE: CVE-2023-38469
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-client/client-test.c | 14 ++++++++++++++
>> >> + 1 file changed, 14 insertions(+)
>> >> +
>> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
>> >> +index 7d04a6a..66e3574 100644
>> >> +--- a/avahi-client/client-test.c
>> >> ++++ b/avahi-client/client-test.c
>> >> +@@ -22,6 +22,7 @@
>> >> + #endif
>> >> +
>> >> + #include <stdio.h>
>> >> ++#include <string.h>
>> >> + #include <assert.h>
>> >> +
>> >> + #include <avahi-client/client.h>
>> >> +@@ -33,6 +34,8 @@
>> >> + #include <avahi-common/malloc.h>
>> >> + #include <avahi-common/timeval.h>
>> >> +
>> >> ++#include <avahi-core/dns.h>
>> >> ++
>> >> + static const AvahiPoll *poll_api =3D NULL;
>> >> + static AvahiSimplePoll *simple_poll =3D NULL;
>> >> +
>> >> +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_U=
NUSED char *argv[]) {
>> >> +     uint32_t cookie;
>> >> +     struct timeval tv;
>> >> +     AvahiAddress a;
>> >> ++    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
>> >> ++    AvahiStringList *txt =3D NULL;
>> >> ++    int r;
>> >> +
>> >> +     simple_poll =3D avahi_simple_poll_new();
>> >> +     poll_api =3D avahi_simple_poll_get(simple_poll);
>> >> +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_=
UNUSED char *argv[]) {
>> >> +     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (gr=
oup, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp"=
, NULL, NULL, 80, "foo=3Dbar", NULL)));
>> >> +     printf("add_record: %d\n", avahi_entry_group_add_record (group,=
 AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya=
", 6));
>> >> +
>> >> ++    memset(rdata, 1, sizeof(rdata));
>> >> ++    r =3D avahi_string_list_parse(rdata, sizeof(rdata), &txt);
>> >> ++    assert(r >=3D 0);
>> >> ++    assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D sizeof(=
rdata));
>> >> ++    error =3D avahi_entry_group_add_service_strlst(group, AVAHI_IF_=
UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL, 123, txt)=
;
>> >> ++    assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
>> >> ++    avahi_string_list_free(txt);
>> >> ++
>> >> +     avahi_entry_group_commit (group);
>> >> +
>> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AV=
AHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browse=
r_callback, (char*) "omghai3u");
>> >> +--
>> >> +2.25.1
>> >> +
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.pat=
ch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>> >> new file mode 100644
>> >> index 0000000000..1cbb00dcab
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
>> >> @@ -0,0 +1,56 @@
>> >> +From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00 20=
01
>> >> +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@re=
dhat.com>
>> >> +Date: Tue, 11 Apr 2023 15:29:59 +0200
>> >> +Subject: [PATCH] Ensure each label is at least one byte long
>> >> +
>> >> +The only allowed exception is single dot, where it should return emp=
ty
>> >> +string.
>> >> +
>> >> +Fixes #454.
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/9=
4cb6489114636940ac683515417990b55b5d66c]
>> >> +CVE: CVE-2023-38470
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-common/domain-test.c | 14 ++++++++++++++
>> >> + avahi-common/domain.c      |  2 +-
>> >> + 2 files changed, 15 insertions(+), 1 deletion(-)
>> >> +
>> >> +diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
>> >> +index cf763eca6..3acc1c1e4 100644
>> >> +--- a/avahi-common/domain-test.c
>> >> ++++ b/avahi-common/domain-test.c
>> >> +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNU=
SED char *argv[]) {
>> >> +     printf("%s\n", s =3D avahi_normalize_name_strdup("fo\\\\o\\..f =
oo."));
>> >> +     avahi_free(s);
>> >> +
>> >> ++    printf("%s\n", s =3D avahi_normalize_name_strdup("."));
>> >> ++    avahi_free(s);
>> >> ++
>> >> ++    s =3D avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}=
.?.?.?.z.?.?.}.}."
>> >> ++    "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.=
}.}"
>> >> ++    ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.z=
M.?`"
>> >> ++    "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?.=
"
>> >> ++    "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}.=
"
>> >> ++    "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?=
"
>> >> ++    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=
"
>> >> ++    "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.=
?."
>> >> ++    "}.?.?.?.}.=3D.?.?.}");
>> >> ++    assert(s =3D=3D NULL);
>> >> ++
>> >> +     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\=
.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
>> >> +     printf("%i\n", avahi_domain_equal("A", "a"));
>> >> +
>> >> +diff --git a/avahi-common/domain.c b/avahi-common/domain.c
>> >> +index 3b1ab6834..e66d2416c 100644
>> >> +--- a/avahi-common/domain.c
>> >> ++++ b/avahi-common/domain.c
>> >> +@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *=
ret_s, size_t size) {
>> >> +         }
>> >> +
>> >> +         if (!empty) {
>> >> +-            if (size < 1)
>> >> ++            if (size < 2)
>> >> +                 return NULL;
>> >> +
>> >> +             *(r++) =3D '.';
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.pat=
ch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>> >> new file mode 100644
>> >> index 0000000000..8242646da1
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
>> >> @@ -0,0 +1,72 @@
>> >> +From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00 20=
01
>> >> +From: Michal Sekletar <msekleta@redhat.com>
>> >> +Date: Mon, 23 Oct 2023 13:38:35 +0200
>> >> +Subject: [PATCH] core: extract host name using avahi_unescape_label(=
)
>> >> +
>> >> +Previously we could create invalid escape sequence when we split the
>> >> +string on dot. For example, from valid host name "foo\\.bar" we have
>> >> +created invalid name "foo\\" and tried to set that as the host name
>> >> +which crashed the daemon.
>> >> +
>> >> +Fixes #453
>> >> +
>> >> +CVE-2023-38471
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/8=
94f085f402e023a98cbb6f5a3d117bd88d93b09]
>> >> +CVE: CVE-2023-38471
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-core/server.c | 27 +++++++++++++++++++++------
>> >> + 1 file changed, 21 insertions(+), 6 deletions(-)
>> >> +
>> >> +diff --git a/avahi-core/server.c b/avahi-core/server.c
>> >> +index c32637af8..f6a21bb77 100644
>> >> +--- a/avahi-core/server.c
>> >> ++++ b/avahi-core/server.c
>> >> +@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
>> >> + }
>> >> +
>> >> + int avahi_server_set_host_name(AvahiServer *s, const char *host_nam=
e) {
>> >> +-    char *hn =3D NULL;
>> >> ++    char label_escaped[AVAHI_LABEL_MAX*4+1];
>> >> ++    char label[AVAHI_LABEL_MAX];
>> >> ++    char *hn =3D NULL, *h;
>> >> ++    size_t len;
>> >> ++
>> >> +     assert(s);
>> >> +
>> >> +     AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_host_name(=
host_name), AVAHI_ERR_INVALID_HOST_NAME);
>> >> +@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *=
s, const char *host_name) {
>> >> +     else
>> >> +         hn =3D avahi_normalize_name_strdup(host_name);
>> >> +
>> >> +-    hn[strcspn(hn, ".")] =3D 0;
>> >> ++    h =3D hn;
>> >> ++    if (!avahi_unescape_label((const char **)&hn, label, sizeof(lab=
el))) {
>> >> ++        avahi_free(h);
>> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
>> >> ++    }
>> >> ++
>> >> ++    avahi_free(h);
>> >> ++
>> >> ++    h =3D label_escaped;
>> >> ++    len =3D sizeof(label_escaped);
>> >> ++    if (!avahi_escape_label(label, strlen(label), &h, &len))
>> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
>> >> +
>> >> +-    if (avahi_domain_equal(s->host_name, hn) && s->state !=3D AVAHI=
_SERVER_COLLISION) {
>> >> +-        avahi_free(hn);
>> >> ++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state=
 !=3D AVAHI_SERVER_COLLISION)
>> >> +         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
>> >> +-    }
>> >> +
>> >> +     withdraw_host_rrs(s);
>> >> +
>> >> +     avahi_free(s->host_name);
>> >> +-    s->host_name =3D hn;
>> >> ++    s->host_name =3D avahi_strdup(label_escaped);
>> >> ++    if (!s->host_name)
>> >> ++        return AVAHI_ERR_NO_MEMORY;
>> >> +
>> >> +     update_fqdn(s);
>> >> +
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.pat=
ch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>> >> new file mode 100644
>> >> index 0000000000..43b26c1132
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>> >> @@ -0,0 +1,47 @@
>> >> +From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 20=
01
>> >> +From: Michal Sekletar <msekleta@redhat.com>
>> >> +Date: Thu, 19 Oct 2023 17:36:44 +0200
>> >> +Subject: [PATCH] core: make sure there is rdata to process before pa=
rsing it
>> >> +
>> >> +Fixes #452
>> >> +
>> >> +CVE-2023-38472
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b=
024ae5749f4aeba03478e6391687c3c9c8dee40]
>> >> +CVE: CVE-2023-38472
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-client/client-test.c      | 3 +++
>> >> + avahi-daemon/dbus-entry-group.c | 2 +-
>> >> + 2 files changed, 4 insertions(+), 1 deletion(-)
>> >> +
>> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
>> >> +index 66e3574..9a015d7 100644
>> >> +--- a/avahi-client/client-test.c
>> >> ++++ b/avahi-client/client-test.c
>> >> +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_U=
NUSED char *argv[]) {
>> >> +     assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
>> >> +     avahi_string_list_free(txt);
>> >> +
>> >> ++    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,=
 AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
>> >> ++    assert(error !=3D AVAHI_OK);
>> >> ++
>> >> +     avahi_entry_group_commit (group);
>> >> +
>> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AV=
AHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browse=
r_callback, (char*) "omghai3u");
>> >> +diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-ent=
ry-group.c
>> >> +index 4e879a5..aa23d4b 100644
>> >> +--- a/avahi-daemon/dbus-entry-group.c
>> >> ++++ b/avahi-daemon/dbus-entry-group.c
>> >> +@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_imp=
l(DBusConnection *c, DBusMessage
>> >> +         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl))=
)
>> >> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMO=
RY, NULL);
>> >> +
>> >> +-        if (avahi_rdata_parse (r, rdata, size) < 0) {
>> >> ++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
>> >> +             avahi_record_unref (r);
>> >> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID=
_RDATA, NULL);
>> >> +         }
>> >> +--
>> >> +2.25.1
>> >> +
>> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.pat=
ch b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>> >> new file mode 100644
>> >> index 0000000000..7b33d564f8
>> >> --- /dev/null
>> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>> >> @@ -0,0 +1,108 @@
>> >> +From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 20=
01
>> >> +From: Michal Sekletar <msekleta@redhat.com>
>> >> +Date: Wed, 11 Oct 2023 17:45:44 +0200
>> >> +Subject: [PATCH] common: derive alternative host name from its unesc=
aped
>> >> + version
>> >> +
>> >> +Normalization of input makes sure we don't have to deal with special
>> >> +cases like unescaped dot at the end of label.
>> >> +
>> >> +Fixes #451 #487
>> >> +CVE-2023-38473
>> >> +
>> >> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b=
448c9f771bada14ae8de175695a9729f8646797]
>> >> +CVE: CVE-2023-38473
>> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> +---
>> >> + avahi-common/alternative-test.c |  3 +++
>> >> + avahi-common/alternative.c      | 27 +++++++++++++++++++--------
>> >> + 2 files changed, 22 insertions(+), 8 deletions(-)
>> >> +
>> >> +diff --git a/avahi-common/alternative-test.c b/avahi-common/alternat=
ive-test.c
>> >> +index 9255435ec..681fc15b8 100644
>> >> +--- a/avahi-common/alternative-test.c
>> >> ++++ b/avahi-common/alternative-test.c
>> >> +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUS=
ED char *argv[]) {
>> >> +     const char* const test_strings[] =3D {
>> >> +         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXX",
>> >> +         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=
=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC",
>> >> ++        ").",
>> >> ++        "\\.",
>> >> ++        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AA\\\\",
>> >> +         "gurke",
>> >> +         "-",
>> >> +         " #",
>> >> +diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
>> >> +index b3d39f0ed..a094e6d76 100644
>> >> +--- a/avahi-common/alternative.c
>> >> ++++ b/avahi-common/alternative.c
>> >> +@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
>> >> + }
>> >> +
>> >> + char *avahi_alternative_host_name(const char *s) {
>> >> ++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
>> >> ++    char *alt, *r, *ret;
>> >> +     const char *e;
>> >> +-    char *r;
>> >> ++    size_t len;
>> >> +
>> >> +     assert(s);
>> >> +
>> >> +     if (!avahi_is_valid_host_name(s))
>> >> +         return NULL;
>> >> +
>> >> +-    if ((e =3D strrchr(s, '-'))) {
>> >> ++    if (!avahi_unescape_label(&s, label, sizeof(label)))
>> >> ++        return NULL;
>> >> ++
>> >> ++    if ((e =3D strrchr(label, '-'))) {
>> >> +         const char *p;
>> >> +
>> >> +         e++;
>> >> +@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s)=
 {
>> >> +
>> >> +     if (e) {
>> >> +         char *c, *m;
>> >> +-        size_t l;
>> >> +         int n;
>> >> +
>> >> +         n =3D atoi(e)+1;
>> >> +         if (!(m =3D avahi_strdup_printf("%i", n)))
>> >> +             return NULL;
>> >> +
>> >> +-        l =3D e-s-1;
>> >> ++        len =3D e-label-1;
>> >> +
>> >> +-        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
>> >> +-            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
>> >> ++        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
>> >> ++            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
>> >> +
>> >> +-        if (!(c =3D avahi_strndup(s, l))) {
>> >> ++        if (!(c =3D avahi_strndup(label, len))) {
>> >> +             avahi_free(m);
>> >> +             return NULL;
>> >> +         }
>> >> +@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s)=
 {
>> >> +     } else {
>> >> +         char *c;
>> >> +
>> >> +-        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
>> >> ++        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
>> >> +             return NULL;
>> >> +
>> >> +         drop_incomplete_utf8(c);
>> >> +@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s=
) {
>> >> +         avahi_free(c);
>> >> +     }
>> >> +
>> >> ++    alt =3D alternative;
>> >> ++    len =3D sizeof(alternative);
>> >> ++    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
>> >> ++
>> >> ++    avahi_free(r);
>> >> ++    r =3D avahi_strdup(ret);
>> >> ++
>> >> +     assert(avahi_is_valid_host_name(r));
>> >> +
>> >> +     return r;
>> >> --
>> >> 2.25.1
>> >>
>> >>
>> >>
>> >>
>> >
>> >
>> >
>>
>> --
>> Jeremy Puhlman
>> jpuhlman@mvista.com
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190851): https://lists.openembedded.org/g/openembedd=
ed-core/message/190851
>> Mute This Topic: https://lists.openembedded.org/mt/102621335/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux

