Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5055810F2855
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 16:50:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78074.1774630215332747889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 09:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pU5WQN1p;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so1563956f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774630214; x=1775235014; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pETJTC88W39f3YvUD1ddYk8RVhcIjLnNSr+gpcTeh4=;
        b=pU5WQN1pwEjt/AUfIWb6K4wR3Q8zyKYkmR2BFC9bvA+xY1CpDLtcN0WE53Dh5Y0gFf
         DiQr8C7OCVcUcOmt+iX3EBFJHfK+OJEVnRJliSAOorJW4lxeJj8iJTzl92yTWuAXZmVw
         k+lrEr4TWVF3gw8tGNfTqLOV4jCfbtFJh+RMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630214; x=1775235014;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pETJTC88W39f3YvUD1ddYk8RVhcIjLnNSr+gpcTeh4=;
        b=BxAFMPgpQgcOWAhoif5/hfUhNl1WkZG47Im1lphlLu1A0Laaxt5HrTTMWiIGOCep0p
         ncvabvXEFarJhAaRnHHG0VQ2WScL1tD/8esvxcAeRJDonv3bJrT/y10NpneQHm9XcsCj
         TyTjgoilG6rfoOiaPW8kCXnq6u/dWAnkANHa/zDGtOGM5RTFxE67QiVNSmPCkTK6yy1c
         QbKyel7vQJ02Oo4teLsq8QfPtTmnufMcpo4NVUwzN/Vq1cQ+kMi9nAMccYqHi4ME+Wum
         DqYOnW03iskwfkGANYhKDQ+o98Eg7RewCw+j6MJ0MANQXH6YZgvJd9kV0RGIQMkSUmqC
         bhHQ==
X-Gm-Message-State: AOJu0YwxUQpjZfFriMVDGMyCUPXQkeVoDZgmm4opAPN9vA8eMenV1by0
	E/4IKJtz784LCLz+TEODaosJ3cn9zRYe6eb8lpTHtqr59IBsXY141fYa0HVwafJqkTKwRz7aQqL
	XAFlA3PQ=
X-Gm-Gg: ATEYQzyfoRgegpsXLeKaQoHSh/Rr9+XSVnjJ+44qANi1clNnbLAFJ259h2jNnwG+tCx
	15q7Pktab7s6Oo170R87KVhDSUkbfwEUQI+9Kp0vbNPURUABYNogs6ahMtLaanzmt/E2dTRnsqM
	D6uXQUyGmhrMwYeZSrZFTCyxl5AR12IZnu5VCGkFHfmn0KXR1IOAlfnjQVxkFDltAnR20uGHq/p
	VgITxced6VwBc9cMVB8N72NcWAGsHH39rkfLWkgZtp7gW9/drJasqJpM4DMB1OYRgT/DJRU7iFo
	aWB/GRcVcaCxaC+s5LyusLAL1cu733U/I6jS6qn1TaZ4ZRXzo996u35PUM4Ielu5p+Rx/mpZnpY
	AmifqNKK321Zi8X6MMrnvzgxU3zk+ZZypfbQ7VuiTaAdqNvxr5IlTOrj+MvxHMK5DhJwxJjq1ld
	viUMdBjEkvJ78WnO14dKSQ27MXKd8bz4YwhkYIOh1Pwp/rZhTHYcwEZV/3eG7ZNg96jg2KlKvhH
	X1+YI8eSjOkPPI=
X-Received: by 2002:a05:6000:2382:b0:43b:4757:cc5 with SMTP id ffacd0b85a97d-43b9e9e8e21mr4997468f8f.19.1774630213285;
        Fri, 27 Mar 2026 09:50:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7372sm17859378f8f.34.2026.03.27.09.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:50:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 17:50:12 +0100
Message-Id: <DHDPWOVRK39H.3VJFFRHZ2VK50@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Vijay Anusuri"
 <vanusuri@mvista.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Subject: Re: [OE-core][scarthgap][patch] gnutls: Fix CVE-2025-14831
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260217081454.864791-1-vanusuri@mvista.com>
 <DGH47ONU1OJ3.289ICU6CP597J@smile.fr>
 <CANQUz185OOq3hJoDsOgdj326DeTg85BHJcmo_Qp1okJEZbKTxA@mail.gmail.com>
 <DGN54QDQJMTS.2QHWXPP9EDYGD@smile.fr>
 <AS1PR10MB56977E8CE685239B00ED8C8FFD57A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56977E8CE685239B00ED8C8FFD57A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234101

qn Fri Mar 27, 2026 at 5:03 PM CET, Peter Marko wrote:
> Hello,
>
> Any update on picking this patch?

The whinlatter equivalent merged as commit f524e8772146 ("gnutls: Fix
CVE-2025-14831"). So I took this patch for the next scarthgap.

Thanks!

>
> Peter
>
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoan=
n.congal=3Dsmile.fr@lists.openembedded.org>
> Sent: Tuesday, February 24, 2026 12:04 PM
> To: Vijay Anusuri <vanusuri@mvista.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core][scarthgap][patch] gnutls: Fix CVE-2025-14831
>
> On Tue Feb 24, 2026 at 5:25 AM CET, Vijay Anusuri wrote:
>> Hi Yoann,
>>
>> I will send it for Whinlatter soon.
>
> Received, thanks!
>
>> I couldn't see this patch in scarthgap-nut. Any update on this?
>
> I had to wait for you to send the whinlatter patch first. That's why it
> did not appear. I'll review them during the next cycle for scarthgap and
> whinlatter.
>
>> Thanks & Regards,
>> Vijay
>>
>>
>>
>> On Tue, Feb 17, 2026 at 2:34=E2=80=AFPM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>>
>>> On Tue Feb 17, 2026 at 9:14 AM CET, Vijay Anusuri via
>>> lists.openembedded.org wrote:
>>> > Picked commits which mentions this CVE per [1].
>>> >
>>> > [1] https://ubuntu.com/security/CVE-2025-14831
>>> > [2] https://security-tracker.debian.org/tracker/CVE-2025-14831
>>> > [3] https://gitlab.com/gnutls/gnutls/-/issues/1773
>>> >
>>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > ---
>>> >  .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
>>> >  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
>>> >  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
>>> >  .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
>>> >  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++=
++
>>> >  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
>>> >  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
>>> >  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
>>> >  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
>>> >  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
>>> >  10 files changed, 1656 insertions(+)
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
>>> >  create mode 100644
>>> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
>>>
>>> Hello,
>>>
>>> It looks like these patches are also needed for whinlatter.
>>> Can you send this fix for whinlatter?
>>>
>>> Thanks!
>>>
>>> >
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
>>> > new file mode 100644
>>> > index 0000000000..ae52a43a2c
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
>>> > @@ -0,0 +1,61 @@
>>> > +From 0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Mon, 26 Jan 2026 19:02:27 +0100
>>> > +Subject: [PATCH] x509/name_constraints: use actual zeroes in univers=
al
>>> exclude
>>> > + IP NC
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/0b2377dfccd99be641bf3f1a0de9f=
0dc8dc0d4b1
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 9 +++++----
>>> > + 1 file changed, 5 insertions(+), 4 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -61,7 +61,7 @@ struct gnutls_name_constraints_st {
>>> > +
>>> > + static struct name_constraints_node_st *
>>> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsign=
ed
>>> type,
>>> > +-                      unsigned char *data, unsigned int size);
>>> > ++                      const unsigned char *data, unsigned int size)=
;
>>> > +
>>> > + static int
>>> > + name_constraints_node_list_add(struct name_constraints_node_list_st
>>> *list,
>>> > +@@ -285,7 +285,7 @@ static void name_constraints_node_free(s
>>> > +  -*/
>>> > + static struct name_constraints_node_st *
>>> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsign=
ed
>>> type,
>>> > +-                      unsigned char *data, unsigned int size)
>>> > ++                      const unsigned char *data, unsigned int size)
>>> > + {
>>> > +     struct name_constraints_node_st *tmp;
>>> > +     int ret;
>>> > +@@ -339,6 +339,7 @@ static int name_constraints_node_list_in
>>> > +     struct name_constraints_node_list_st removed =3D { .data =3D NU=
LL,
>>> > +                                                      .size =3D 0,
>>> > +                                                      .capacity =3D =
0 };
>>> > ++    static const unsigned char universal_ip[32] =3D { 0 };
>>> > +
>>> > +     /* temporary array to see, if we need to add universal excluded
>>> constraints
>>> > +      * (see phase 3 for details)
>>> > +@@ -471,7 +472,7 @@ static int name_constraints_node_list_in
>>> > +             case GNUTLS_SAN_IPADDRESS:
>>> > +                     // add universal restricted range for IPv4
>>> > +                     tmp =3D name_constraints_node_new(
>>> > +-                            nc, GNUTLS_SAN_IPADDRESS, NULL, 8);
>>> > ++                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,=
 8);
>>> > +                     if (tmp =3D=3D NULL) {
>>> > +                             gnutls_assert();
>>> > +                             ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +@@ -484,7 +485,7 @@ static int name_constraints_node_list_in
>>> > +                     }
>>> > +                     // add universal restricted range for IPv6
>>> > +                     tmp =3D name_constraints_node_new(
>>> > +-                            nc, GNUTLS_SAN_IPADDRESS, NULL, 32);
>>> > ++                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,
>>> 32);
>>> > +                     if (tmp =3D=3D NULL) {
>>> > +                             gnutls_assert();
>>> > +                             ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
>>> > new file mode 100644
>>> > index 0000000000..0d34032554
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
>>> > @@ -0,0 +1,30 @@
>>> > +From 85d6348a30c74d4ee3710e0f4652f634eaad6914 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Mon, 26 Jan 2026 19:10:58 +0100
>>> > +Subject: [PATCH] tests/name-constraints-ip: stop swallowing errors..=
.
>>> > +
>>> > +... now when it started to pass
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/85d6348a30c74d4ee3710e0f4652f=
634eaad6914
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + tests/name-constraints-ip.c | 2 +-
>>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> > +
>>> > +diff --git a/tests/name-constraints-ip.c b/tests/name-constraints-ip=
.c
>>> > +index 7a196088dc..a0cf172b7f 100644
>>> > +--- a/tests/name-constraints-ip.c
>>> > ++++ b/tests/name-constraints-ip.c
>>> > +@@ -772,5 +772,5 @@ int main(int argc, char **argv)
>>> > +             cmocka_unit_test_setup_teardown(
>>> > +                     check_ipv4v6_single_constraint_each, setup,
>>> teardown)
>>> > +     };
>>> > +-    cmocka_run_group_tests(tests, NULL, NULL);
>>> > ++    return cmocka_run_group_tests(tests, NULL, NULL);
>>> > + }
>>> > +--
>>> > +GitLab
>>> > +
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
>>> > new file mode 100644
>>> > index 0000000000..ed4a7da3c7
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
>>> > @@ -0,0 +1,45 @@
>>> > +From c28475413f82e1f34295d5c039f0c0a4ca2ee526 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Mon, 26 Jan 2026 20:14:33 +0100
>>> > +Subject: [PATCH] x509/name_constraints: reject some malformed domain
>>> names
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/c28475413f82e1f34295d5c039f0c=
0a4ca2ee526
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 17 +++++++++++++++++
>>> > + 1 file changed, 17 insertions(+)
>>> > +
>>> > +diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints=
.c
>>> > +index d07482e3c9..9783d92851 100644
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -159,6 +159,23 @@ static int
>>> validate_name_constraints_node(gnutls_x509_subject_alt_name_t type,
>>> > +                     return gnutls_assert_val(GNUTLS_E_MALFORMED_CID=
R);
>>> > +     }
>>> > +
>>> > ++    /* Validate DNS names and email addresses for malformed input *=
/
>>> > ++    if (type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_RF=
C822NAME) {
>>> > ++            unsigned int i;
>>> > ++            if (name->size =3D=3D 0)
>>> > ++                    return GNUTLS_E_SUCCESS;
>>> > ++
>>> > ++            /* reject names with consecutive dots... */
>>> > ++            for (i =3D 0; i + 1 < name->size; i++) {
>>> > ++                    if (name->data[i] =3D=3D '.' && name->data[i + =
1] =3D=3D
>>> '.')
>>> > ++                            return gnutls_assert_val(
>>> > ++                                    GNUTLS_E_ILLEGAL_PARAMETER);
>>> > ++            }
>>> > ++            /* ... or names consisting exclusively of dots */
>>> > ++            if (name->size =3D=3D 1 && name->data[0] =3D=3D '.')
>>> > ++                    return
>>> gnutls_assert_val(GNUTLS_E_ILLEGAL_PARAMETER);
>>> > ++    }
>>> > ++
>>> > +     return GNUTLS_E_SUCCESS;
>>> > + }
>>> > +
>>> > +--
>>> > +GitLab
>>> > +
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
>>> > new file mode 100644
>>> > index 0000000000..99ec9c5e9a
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
>>> > @@ -0,0 +1,200 @@
>>> > +From 6db7da7fcfe230f445b1edbb56e2a8346120c891 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Thu, 5 Feb 2026 13:22:10 +0100
>>> > +Subject: [PATCH] x509/name_constraints:
>>> name_constraints_node_add_{new,copy}
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/6db7da7fcfe230f445b1edbb56e2a=
8346120c891
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 112 ++++++++++++++++-----------------=
---
>>> > + 1 file changed, 51 insertions(+), 61 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -86,6 +86,38 @@ name_constraints_node_list_add(struct na
>>> > +     return 0;
>>> > + }
>>> > +
>>> > ++static int
>>> > ++name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
>>> > ++                          struct name_constraints_node_list_st *lis=
t,
>>> > ++                          unsigned type, const unsigned char *data,
>>> > ++                          unsigned int size)
>>> > ++{
>>> > ++    struct name_constraints_node_st *node;
>>> > ++    int ret;
>>> > ++    node =3D name_constraints_node_new(nc, type, data, size);
>>> > ++    if (node =3D=3D NULL) {
>>> > ++            gnutls_assert();
>>> > ++            return GNUTLS_E_MEMORY_ERROR;
>>> > ++    }
>>> > ++    ret =3D name_constraints_node_list_add(list, node);
>>> > ++    if (ret < 0) {
>>> > ++            gnutls_assert();
>>> > ++            return ret;
>>> > ++    }
>>> > ++    return GNUTLS_E_SUCCESS;
>>> > ++}
>>> > ++
>>> > ++static int
>>> > ++name_constraints_node_add_copy(gnutls_x509_name_constraints_t nc,
>>> > ++                           struct name_constraints_node_list_st *de=
st,
>>> > ++                           const struct name_constraints_node_st *s=
rc)
>>> > ++{
>>> > ++    if (!src)
>>> > ++            return gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
>>> > ++    return name_constraints_node_add_new(nc, dest, src->type,
>>> > ++                                         src->name.data,
>>> src->name.size);
>>> > ++}
>>> > ++
>>> > + // for documentation see the implementation
>>> > + static int name_constraints_intersect_nodes(
>>> > +     gnutls_x509_name_constraints_t nc,
>>> > +@@ -188,7 +220,6 @@ static int extract_name_constraints(gnut
>>> > +     unsigned indx;
>>> > +     gnutls_datum_t tmp =3D { NULL, 0 };
>>> > +     unsigned int type;
>>> > +-    struct name_constraints_node_st *node;
>>> > +
>>> > +     for (indx =3D 1;; indx++) {
>>> > +             snprintf(tmpstr, sizeof(tmpstr), "%s.?%u.base", vstr,
>>> indx);
>>> > +@@ -231,15 +262,9 @@ static int extract_name_constraints(gnut
>>> > +                     goto cleanup;
>>> > +             }
>>> > +
>>> > +-            node =3D name_constraints_node_new(nc, type, tmp.data,
>>> tmp.size);
>>> > ++            ret =3D name_constraints_node_add_new(nc, nodes, type,
>>> tmp.data,
>>> > ++                                                tmp.size);
>>> > +             _gnutls_free_datum(&tmp);
>>> > +-            if (node =3D=3D NULL) {
>>> > +-                    gnutls_assert();
>>> > +-                    ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +-                    goto cleanup;
>>> > +-            }
>>> > +-
>>> > +-            ret =3D name_constraints_node_list_add(nodes, node);
>>> > +             if (ret < 0) {
>>> > +                     gnutls_assert();
>>> > +                     goto cleanup;
>>> > +@@ -459,14 +484,7 @@ static int name_constraints_node_list_in
>>> > +             // Beware: also copies nodes other than DNS, email, IP,
>>> > +             //       since their counterpart may have been moved in
>>> phase 1.
>>> > +             if (!used) {
>>> > +-                    tmp =3D name_constraints_node_new(
>>> > +-                            nc, t2->type, t2->name.data,
>>> t2->name.size);
>>> > +-                    if (tmp =3D=3D NULL) {
>>> > +-                            gnutls_assert();
>>> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    ret =3D name_constraints_node_list_add(permitte=
d,
>>> tmp);
>>> > ++                    ret =3D name_constraints_node_add_copy(nc,
>>> permitted, t2);
>>> > +                     if (ret < 0) {
>>> > +                             gnutls_assert();
>>> > +                             goto cleanup;
>>> > +@@ -488,27 +506,17 @@ static int name_constraints_node_list_in
>>> > +             switch (type) {
>>> > +             case GNUTLS_SAN_IPADDRESS:
>>> > +                     // add universal restricted range for IPv4
>>> > +-                    tmp =3D name_constraints_node_new(
>>> > +-                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,=
 8);
>>> > +-                    if (tmp =3D=3D NULL) {
>>> > +-                            gnutls_assert();
>>> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    ret =3D name_constraints_node_list_add(excluded=
,
>>> tmp);
>>> > ++                    ret =3D name_constraints_node_add_new(
>>> > ++                            nc, excluded, GNUTLS_SAN_IPADDRESS,
>>> > ++                            universal_ip, 8);
>>> > +                     if (ret < 0) {
>>> > +                             gnutls_assert();
>>> > +                             goto cleanup;
>>> > +                     }
>>> > +                     // add universal restricted range for IPv6
>>> > +-                    tmp =3D name_constraints_node_new(
>>> > +-                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,
>>> 32);
>>> > +-                    if (tmp =3D=3D NULL) {
>>> > +-                            gnutls_assert();
>>> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    ret =3D name_constraints_node_list_add(excluded=
,
>>> tmp);
>>> > ++                    ret =3D name_constraints_node_add_new(
>>> > ++                            nc, excluded, GNUTLS_SAN_IPADDRESS,
>>> > ++                            universal_ip, 32);
>>> > +                     if (ret < 0) {
>>> > +                             gnutls_assert();
>>> > +                             goto cleanup;
>>> > +@@ -516,13 +524,8 @@ static int name_constraints_node_list_in
>>> > +                     break;
>>> > +             case GNUTLS_SAN_DNSNAME:
>>> > +             case GNUTLS_SAN_RFC822NAME:
>>> > +-                    tmp =3D name_constraints_node_new(nc, type, NUL=
L, 0);
>>> > +-                    if (tmp =3D=3D NULL) {
>>> > +-                            gnutls_assert();
>>> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    ret =3D name_constraints_node_list_add(excluded=
,
>>> tmp);
>>> > ++                    ret =3D name_constraints_node_add_new(nc, exclu=
ded,
>>> type,
>>> > ++                                                        NULL, 0);
>>> > +                     if (ret < 0) {
>>> > +                             gnutls_assert();
>>> > +                             goto cleanup;
>>> > +@@ -544,20 +547,13 @@ static int name_constraints_node_list_co
>>> > +     struct name_constraints_node_list_st *nodes,
>>> > +     const struct name_constraints_node_list_st *nodes2)
>>> > + {
>>> > ++    int ret;
>>> > ++
>>> > +     for (size_t i =3D 0; i < nodes2->size; i++) {
>>> > +-            const struct name_constraints_node_st *node =3D
>>> nodes2->data[i];
>>> > +-            struct name_constraints_node_st *tmp;
>>> > +-            int ret;
>>> > +-
>>> > +-            tmp =3D name_constraints_node_new(nc, node->type,
>>> node->name.data,
>>> > +-                                            node->name.size);
>>> > +-            if (tmp =3D=3D NULL) {
>>> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR)=
;
>>> > +-            }
>>> > +-            ret =3D name_constraints_node_list_add(nodes, tmp);
>>> > ++            ret =3D name_constraints_node_add_copy(nc, nodes,
>>> > ++                                                 nodes2->data[i]);
>>> > +             if (ret < 0) {
>>> > +-                    name_constraints_node_free(tmp);
>>> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR)=
;
>>> > ++                    return gnutls_assert_val(ret);
>>> > +             }
>>> > +     }
>>> > +
>>> > +@@ -687,7 +683,6 @@ static int name_constraints_add(gnutls_x
>>> > +                             gnutls_x509_subject_alt_name_t type,
>>> > +                             const gnutls_datum_t *name, unsigned
>>> permitted)
>>> > + {
>>> > +-    struct name_constraints_node_st *tmp;
>>> > +     struct name_constraints_node_list_st *nodes;
>>> > +     int ret;
>>> > +
>>> > +@@ -697,15 +692,10 @@ static int name_constraints_add(gnutls_x
>>> > +
>>> > +     nodes =3D permitted ? &nc->permitted : &nc->excluded;
>>> > +
>>> > +-    tmp =3D name_constraints_node_new(nc, type, name->data, name->s=
ize);
>>> > +-    if (tmp =3D=3D NULL)
>>> > +-            return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
>>> > +-
>>> > +-    ret =3D name_constraints_node_list_add(nodes, tmp);
>>> > +-    if (ret < 0) {
>>> > +-            name_constraints_node_free(tmp);
>>> > ++    ret =3D name_constraints_node_add_new(nc, nodes, type, name->da=
ta,
>>> > ++                                        name->size);
>>> > ++    if (ret < 0)
>>> > +             return gnutls_assert_val(ret);
>>> > +-    }
>>> > +
>>> > +     return 0;
>>> > + }
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
>>> > new file mode 100644
>>> > index 0000000000..7c5ffdf6d8
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
>>> > @@ -0,0 +1,500 @@
>>> > +From 094accd3ebec17ead6c391757eaa18763b72d83f Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Mon, 26 Jan 2026 20:16:36 +0100
>>> > +Subject: [PATCH] x509/name_constraints: introduce a rich comparator
>>> > +
>>> > +These are preparatory changes before implementing N * log N intersec=
tion
>>> > +over sorted lists of constraints.
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/094accd3ebec17ead6c391757eaa1=
8763b72d83f
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 411 ++++++++++++++++++++++++++++-----=
---
>>> > + 1 file changed, 320 insertions(+), 91 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -39,6 +39,9 @@
>>> > + #include "ip.h"
>>> > + #include "ip-in-cidr.h"
>>> > + #include "intprops.h"
>>> > ++#include "minmax.h"
>>> > ++
>>> > ++#include <string.h>
>>> > +
>>> > + #define MAX_NC_CHECKS (1 << 20)
>>> > +
>>> > +@@ -63,6 +66,282 @@ static struct name_constraints_node_st *
>>> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsign=
ed
>>> type,
>>> > +                       const unsigned char *data, unsigned int size)=
;
>>> > +
>>> > ++/* An enum for "rich" comparisons that not only let us sort name
>>> constraints,
>>> > ++ * children-before-parent, but also subsume them during intersectio=
n.
>>> */
>>> > ++enum name_constraint_relation {
>>> > ++    NC_SORTS_BEFORE =3D -2, /* unrelated constraints */
>>> > ++    NC_INCLUDED_BY =3D -1, /* nc1 is included by nc2 / children sor=
t
>>> first */
>>> > ++    NC_EQUAL =3D 0, /* exact match */
>>> > ++    NC_INCLUDES =3D 1, /* nc1 includes nc2 / parents sort last */
>>> > ++    NC_SORTS_AFTER =3D 2 /* unrelated constraints */
>>> > ++};
>>> > ++
>>> > ++/* A helper to compare just a pair of strings with this rich
>>> comparison */
>>> > ++static enum name_constraint_relation
>>> > ++compare_strings(const void *n1, size_t n1_len, const void *n2, size=
_t
>>> n2_len)
>>> > ++{
>>> > ++    int r =3D memcmp(n1, n2, MIN(n1_len, n2_len));
>>> > ++    if (r < 0)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    if (r > 0)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++    if (n1_len < n2_len)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    if (n1_len > n2_len)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++    return NC_EQUAL;
>>> > ++}
>>> > ++
>>> > ++/* Rich-compare DNS names. Example order/relationships:
>>> > ++ * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE
>>> y.b */
>>> > ++static enum name_constraint_relation compare_dns_names(const
>>> gnutls_datum_t *n1,
>>> > ++                                                   const
>>> gnutls_datum_t *n2)
>>> > ++{
>>> > ++    enum name_constraint_relation rel;
>>> > ++    unsigned int i, j, i_end, j_end;
>>> > ++
>>> > ++    /* start from the end of each name */
>>> > ++    i =3D i_end =3D n1->size;
>>> > ++    j =3D j_end =3D n2->size;
>>> > ++
>>> > ++    /* skip the trailing dots for the comparison */
>>> > ++    while (i && n1->data[i - 1] =3D=3D '.')
>>> > ++            i_end =3D i =3D i - 1;
>>> > ++    while (j && n2->data[j - 1] =3D=3D '.')
>>> > ++            j_end =3D j =3D j - 1;
>>> > ++
>>> > ++    while (1) {
>>> > ++            // rewind back to beginning or an after-dot position
>>> > ++            while (i && n1->data[i - 1] !=3D '.')
>>> > ++                    i--;
>>> > ++            while (j && n2->data[j - 1] !=3D '.')
>>> > ++                    j--;
>>> > ++
>>> > ++            rel =3D compare_strings(&n1->data[i], i_end - i,
>>> &n2->data[j],
>>> > ++                                  j_end - j);
>>> > ++            if (rel =3D=3D NC_SORTS_BEFORE) /* x.a BEFORE y.a */
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            if (rel =3D=3D NC_SORTS_AFTER) /* y.a AFTER x.a */
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            if (!i && j) /* x.a INCLUDES z.x.a */
>>> > ++                    return NC_INCLUDES;
>>> > ++            if (i && !j) /* z.x.a INCLUDED_BY x.a */
>>> > ++                    return NC_INCLUDED_BY;
>>> > ++
>>> > ++            if (!i && !j) /* r =3D=3D 0, we ran out of components t=
o
>>> compare */
>>> > ++                    return NC_EQUAL;
>>> > ++            /* r =3D=3D 0, i && j: step back past a dot and keep co=
mparing
>>> */
>>> > ++            i_end =3D i =3D i - 1;
>>> > ++            j_end =3D j =3D j - 1;
>>> > ++
>>> > ++            /* support for non-standard ".gr INCLUDES example.gr" [=
1]
>>> */
>>> > ++            if (!i && j) /* .a INCLUDES x.a */
>>> > ++                    return NC_INCLUDES;
>>> > ++            if (i && !j) /* x.a INCLUDED_BY .a */
>>> > ++                    return NC_INCLUDED_BY;
>>> > ++    }
>>> > ++}
>>> > ++/* [1]
>>> https://mailarchive.ietf.org/arch/msg/saag/Bw6PtreW0G7aEG7SikfzKHES4VA =
*/
>>> > ++
>>> > ++/* Rich-compare email name constraints. Example order/relationships=
:
>>> > ++ * z@x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x@b BEFORE
>>> y@b */
>>> > ++static enum name_constraint_relation compare_emails(const
>>> gnutls_datum_t *n1,
>>> > ++                                                const gnutls_datum_=
t
>>> *n2)
>>> > ++{
>>> > ++    enum name_constraint_relation domains_rel;
>>> > ++    unsigned int i, j, i_end, j_end;
>>> > ++    gnutls_datum_t d1, d2; /* borrow from n1 and n2 */
>>> > ++
>>> > ++    /* start from the end of each name */
>>> > ++    i =3D i_end =3D n1->size;
>>> > ++    j =3D j_end =3D n2->size;
>>> > ++
>>> > ++    /* rewind to @s to look for domains */
>>> > ++    while (i && n1->data[i - 1] !=3D '@')
>>> > ++            i--;
>>> > ++    d1.size =3D i_end - i;
>>> > ++    d1.data =3D &n1->data[i];
>>> > ++    while (j && n2->data[j - 1] !=3D '@')
>>> > ++            j--;
>>> > ++    d2.size =3D j_end - j;
>>> > ++    d2.data =3D &n2->data[j];
>>> > ++
>>> > ++    domains_rel =3D compare_dns_names(&d1, &d2);
>>> > ++
>>> > ++    /* email constraint semantics differ from DNS
>>> > ++     * DNS: x.a INCLUDED_BY a
>>> > ++     * Email: x.a INCLUDED_BY .a BEFORE a */
>>> > ++    if (domains_rel =3D=3D NC_INCLUDED_BY || domains_rel =3D=3D NC_=
INCLUDES) {
>>> > ++            bool d1_has_dot =3D (d1.size > 0 && d1.data[0] =3D=3D '=
.');
>>> > ++            bool d2_has_dot =3D (d2.size > 0 && d2.data[0] =3D=3D '=
.');
>>> > ++            /* a constraint without a dot is exact, excluding
>>> subdomains */
>>> > ++            if (!d2_has_dot && domains_rel =3D=3D NC_INCLUDED_BY)
>>> > ++                    domains_rel =3D NC_SORTS_BEFORE; /* x.a BEFORE =
a */
>>> > ++            if (!d1_has_dot && domains_rel =3D=3D NC_INCLUDES)
>>> > ++                    domains_rel =3D NC_SORTS_AFTER; /* a AFTER x.a =
*/
>>> > ++    }
>>> > ++
>>> > ++    if (!i && !j) { /* both are domains-only */
>>> > ++            return domains_rel;
>>> > ++    } else if (i && !j) { /* n1 is email, n2 is domain */
>>> > ++            switch (domains_rel) {
>>> > ++            case NC_SORTS_AFTER:
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_SORTS_BEFORE:
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            case NC_INCLUDES: /* n2 is more specific, a@x.a AFTER
>>> z.x.a */
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_EQUAL: /* subdomains match, z@x.a INCLUDED_BY x=
.a
>>> */
>>> > ++            case NC_INCLUDED_BY: /* n1 is more specific */
>>> > ++                    return NC_INCLUDED_BY;
>>> > ++            }
>>> > ++    } else if (!i && j) { /* n1 is domain, n2 is email */
>>> > ++            switch (domains_rel) {
>>> > ++            case NC_SORTS_AFTER:
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_SORTS_BEFORE:
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            case NC_INCLUDES: /* n2 is more specific, a AFTER z@x.a=
 */
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_EQUAL: /* subdomains match, x.a INCLUDES z@x.a =
*/
>>> > ++                    return NC_INCLUDES;
>>> > ++            case NC_INCLUDED_BY: /* n1 is more specific, x.a BEFORE=
 z@a
>>> */
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            }
>>> > ++    } else if (i && j) { /* both are emails */
>>> > ++            switch (domains_rel) {
>>> > ++            case NC_SORTS_AFTER:
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_SORTS_BEFORE:
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            case NC_INCLUDES: // n2 is more specific
>>> > ++                    return NC_SORTS_AFTER;
>>> > ++            case NC_INCLUDED_BY: // n1 is more specific
>>> > ++                    return NC_SORTS_BEFORE;
>>> > ++            case NC_EQUAL: // only case when we need to look before
>>> the @
>>> > ++                    break; // see below for readability
>>> > ++            }
>>> > ++    }
>>> > ++
>>> > ++    /* i && j, both are emails, domain names match, compare up to @=
 */
>>> > ++    return compare_strings(n1->data, i - 1, n2->data, j - 1);
>>> > ++}
>>> > ++
>>> > ++/* Rich-compare IP address constraints. Example order/relationships=
:
>>> > ++ * 10.0.0.0/24 INCLUDED_BY 10.0.0.0/16 BEFORE 1::1/128 INCLUDED_BY
>>> 1::1/127 */
>>> > ++static enum name_constraint_relation compare_ip_ncs(const
>>> gnutls_datum_t *n1,
>>> > ++                                                const gnutls_datum_=
t
>>> *n2)
>>> > ++{
>>> > ++    unsigned int len, i;
>>> > ++    int r;
>>> > ++    const unsigned char *ip1, *ip2, *mask1, *mask2;
>>> > ++    unsigned char masked11[16], masked22[16], masked12[16],
>>> masked21[16];
>>> > ++
>>> > ++    if (n1->size < n2->size)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    if (n1->size > n2->size)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++    len =3D n1->size / 2; /* 4 for IPv4, 16 for IPv6 */
>>> > ++
>>> > ++    /* data is a concatenation of prefix and mask */
>>> > ++    ip1 =3D n1->data;
>>> > ++    ip2 =3D n2->data;
>>> > ++    mask1 =3D n1->data + len;
>>> > ++    mask2 =3D n2->data + len;
>>> > ++    for (i =3D 0; i < len; i++) {
>>> > ++            masked11[i] =3D ip1[i] & mask1[i];
>>> > ++            masked22[i] =3D ip2[i] & mask2[i];
>>> > ++            masked12[i] =3D ip1[i] & mask2[i];
>>> > ++            masked21[i] =3D ip2[i] & mask1[i];
>>> > ++    }
>>> > ++
>>> > ++    r =3D memcmp(mask1, mask2, len);
>>> > ++    if (r < 0 && !memcmp(masked11, masked21, len)) /* prefix1 <
>>> prefix2 */
>>> > ++            return NC_INCLUDES; /* ip1 & mask1 =3D=3D ip2 & mask1 *=
/
>>> > ++    if (r > 0 && !memcmp(masked12, masked22, len)) /* prefix1 >
>>> prefix2 */
>>> > ++            return NC_INCLUDED_BY; /* ip1 & mask2 =3D=3D ip2 & mask=
2 */
>>> > ++
>>> > ++    r =3D memcmp(masked11, masked22, len);
>>> > ++    if (r < 0)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    else if (r > 0)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++    return NC_EQUAL;
>>> > ++}
>>> > ++
>>> > ++static inline bool is_supported_type(unsigned type)
>>> > ++{
>>> > ++    return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN=
_RFC822NAME
>>> ||
>>> > ++           type =3D=3D GNUTLS_SAN_IPADDRESS;
>>> > ++}
>>> > ++
>>> > ++/* Universal comparison for name constraint nodes.
>>> > ++ * Unsupported types sort before supported types to allow early
>>> handling.
>>> > ++ * NULL represents end-of-list and sorts after everything else. */
>>> > ++static enum name_constraint_relation
>>> > ++compare_name_constraint_nodes(const struct name_constraints_node_st
>>> *n1,
>>> > ++                          const struct name_constraints_node_st *n2=
)
>>> > ++{
>>> > ++    bool n1_supported, n2_supported;
>>> > ++
>>> > ++    if (!n1 && !n2)
>>> > ++            return NC_EQUAL;
>>> > ++    if (!n1)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++    if (!n2)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++
>>> > ++    n1_supported =3D is_supported_type(n1->type);
>>> > ++    n2_supported =3D is_supported_type(n2->type);
>>> > ++
>>> > ++    /* unsupported types bubble up (sort first). intersect relies o=
n
>>> this */
>>> > ++    if (!n1_supported && n2_supported)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    if (n1_supported && !n2_supported)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++
>>> > ++    /* next, sort by type */
>>> > ++    if (n1->type < n2->type)
>>> > ++            return NC_SORTS_BEFORE;
>>> > ++    if (n1->type > n2->type)
>>> > ++            return NC_SORTS_AFTER;
>>> > ++
>>> > ++    /* now look deeper */
>>> > ++    switch (n1->type) {
>>> > ++    case GNUTLS_SAN_DNSNAME:
>>> > ++            return compare_dns_names(&n1->name, &n2->name);
>>> > ++    case GNUTLS_SAN_RFC822NAME:
>>> > ++            return compare_emails(&n1->name, &n2->name);
>>> > ++    case GNUTLS_SAN_IPADDRESS:
>>> > ++            return compare_ip_ncs(&n1->name, &n2->name);
>>> > ++    default:
>>> > ++            /* unsupported types: stable lexicographic order */
>>> > ++            return compare_strings(n1->name.data, n1->name.size,
>>> > ++                                   n2->name.data, n2->name.size);
>>> > ++    }
>>> > ++}
>>> > ++
>>> > ++/* qsort-compatible wrapper */
>>> > ++static int compare_name_constraint_nodes_qsort(const void *a, const
>>> void *b)
>>> > ++{
>>> > ++    const struct name_constraints_node_st *const *n1 =3D a;
>>> > ++    const struct name_constraints_node_st *const *n2 =3D b;
>>> > ++    enum name_constraint_relation rel;
>>> > ++
>>> > ++    rel =3D compare_name_constraint_nodes(*n1, *n2);
>>> > ++    switch (rel) {
>>> > ++    case NC_SORTS_BEFORE:
>>> > ++    case NC_INCLUDED_BY:
>>> > ++            return -1;
>>> > ++    case NC_SORTS_AFTER:
>>> > ++    case NC_INCLUDES:
>>> > ++            return 1;
>>> > ++    case NC_EQUAL:
>>> > ++    default:
>>> > ++            return 0;
>>> > ++    }
>>> > ++}
>>> > ++
>>> > + static int
>>> > + name_constraints_node_list_add(struct name_constraints_node_list_st
>>> *list,
>>> > +                            struct name_constraints_node_st *node)
>>> > +@@ -420,9 +699,7 @@ static int name_constraints_node_list_in
>>> > +                     }
>>> > +             }
>>> > +
>>> > +-            if (found !=3D NULL && (t->type =3D=3D GNUTLS_SAN_DNSNA=
ME ||
>>> > +-                                  t->type =3D=3D GNUTLS_SAN_RFC822N=
AME ||
>>> > +-                                  t->type =3D=3D GNUTLS_SAN_IPADDRE=
SS)) {
>>> > ++            if (found !=3D NULL && is_supported_type(t->type)) {
>>> > +                     /* move node from PERMITTED to REMOVED */
>>> > +                     ret =3D name_constraints_node_list_add(&removed=
, t);
>>> > +                     if (ret < 0) {
>>> > +@@ -824,61 +1101,14 @@ cleanup:
>>> > +     return ret;
>>> > + }
>>> > +
>>> > +-static unsigned ends_with(const gnutls_datum_t *str,
>>> > +-                      const gnutls_datum_t *suffix)
>>> > +-{
>>> > +-    unsigned char *tree;
>>> > +-    unsigned int treelen;
>>> > +-
>>> > +-    if (suffix->size >=3D str->size)
>>> > +-            return 0;
>>> > +-
>>> > +-    tree =3D suffix->data;
>>> > +-    treelen =3D suffix->size;
>>> > +-    if ((treelen > 0) && (tree[0] =3D=3D '.')) {
>>> > +-            tree++;
>>> > +-            treelen--;
>>> > +-    }
>>> > +-
>>> > +-    if (memcmp(str->data + str->size - treelen, tree, treelen) =3D=
=3D 0 &&
>>> > +-        str->data[str->size - treelen - 1] =3D=3D '.')
>>> > +-            return 1; /* match */
>>> > +-
>>> > +-    return 0;
>>> > +-}
>>> > +-
>>> > +-static unsigned email_ends_with(const gnutls_datum_t *str,
>>> > +-                            const gnutls_datum_t *suffix)
>>> > +-{
>>> > +-    if (suffix->size >=3D str->size) {
>>> > +-            return 0;
>>> > +-    }
>>> > +-
>>> > +-    if (suffix->size > 0 && memcmp(str->data + str->size -
>>> suffix->size,
>>> > +-                                   suffix->data, suffix->size) !=3D=
 0) {
>>> > +-            return 0;
>>> > +-    }
>>> > +-
>>> > +-    if (suffix->size > 1 && suffix->data[0] =3D=3D '.') { /* .domai=
n.com
>>> */
>>> > +-            return 1; /* match */
>>> > +-    } else if (str->data[str->size - suffix->size - 1] =3D=3D '@') =
{
>>> > +-            return 1; /* match */
>>> > +-    }
>>> > +-
>>> > +-    return 0;
>>> > +-}
>>> > +-
>>> > + static unsigned dnsname_matches(const gnutls_datum_t *name,
>>> > +                             const gnutls_datum_t *suffix)
>>> > + {
>>> > +     _gnutls_hard_log("matching %.*s with DNS constraint %.*s\n",
>>> name->size,
>>> > +                      name->data, suffix->size, suffix->data);
>>> > +
>>> > +-    if (suffix->size =3D=3D name->size &&
>>> > +-        memcmp(suffix->data, name->data, suffix->size) =3D=3D 0)
>>> > +-            return 1; /* match */
>>> > +-
>>> > +-    return ends_with(name, suffix);
>>> > ++    enum name_constraint_relation rel =3D compare_dns_names(name,
>>> suffix);
>>> > ++    return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
>>> > + }
>>> > +
>>> > + static unsigned email_matches(const gnutls_datum_t *name,
>>> > +@@ -887,11 +1117,8 @@ static unsigned email_matches(const gnut
>>> > +     _gnutls_hard_log("matching %.*s with e-mail constraint %.*s\n",
>>> > +                      name->size, name->data, suffix->size,
>>> suffix->data);
>>> > +
>>> > +-    if (suffix->size =3D=3D name->size &&
>>> > +-        memcmp(suffix->data, name->data, suffix->size) =3D=3D 0)
>>> > +-            return 1; /* match */
>>> > +-
>>> > +-    return email_ends_with(name, suffix);
>>> > ++    enum name_constraint_relation rel =3D compare_emails(name, suff=
ix);
>>> > ++    return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
>>> > + }
>>> > +
>>> > + /*-
>>> > +@@ -915,8 +1142,7 @@ static int name_constraints_intersect_no
>>> > +     // presume empty intersection
>>> > +     struct name_constraints_node_st *intersection =3D NULL;
>>> > +     const struct name_constraints_node_st *to_copy =3D NULL;
>>> > +-    unsigned iplength =3D 0;
>>> > +-    unsigned byte;
>>> > ++    enum name_constraint_relation rel;
>>> > +
>>> > +     *_intersection =3D NULL;
>>> > +
>>> > +@@ -925,32 +1151,49 @@ static int name_constraints_intersect_no
>>> > +     }
>>> > +     switch (node1->type) {
>>> > +     case GNUTLS_SAN_DNSNAME:
>>> > +-            if (!dnsname_matches(&node2->name, &node1->name))
>>> > ++            rel =3D compare_dns_names(&node1->name, &node2->name);
>>> > ++            switch (rel) {
>>> > ++            case NC_EQUAL: // equal means doesn't matter which one
>>> > ++            case NC_INCLUDES: // node2 is more specific
>>> > ++                    to_copy =3D node2;
>>> > ++                    break;
>>> > ++            case NC_INCLUDED_BY: // node1 is more specific
>>> > ++                    to_copy =3D node1;
>>> > ++                    break;
>>> > ++            case NC_SORTS_BEFORE: // no intersection
>>> > ++            case NC_SORTS_AFTER: // no intersection
>>> > +                     return GNUTLS_E_SUCCESS;
>>> > +-            to_copy =3D node2;
>>> > ++            }
>>> > +             break;
>>> > +     case GNUTLS_SAN_RFC822NAME:
>>> > +-            if (!email_matches(&node2->name, &node1->name))
>>> > ++            rel =3D compare_emails(&node1->name, &node2->name);
>>> > ++            switch (rel) {
>>> > ++            case NC_EQUAL: // equal means doesn't matter which one
>>> > ++            case NC_INCLUDES: // node2 is more specific
>>> > ++                    to_copy =3D node2;
>>> > ++                    break;
>>> > ++            case NC_INCLUDED_BY: // node1 is more specific
>>> > ++                    to_copy =3D node1;
>>> > ++                    break;
>>> > ++            case NC_SORTS_BEFORE: // no intersection
>>> > ++            case NC_SORTS_AFTER: // no intersection
>>> > +                     return GNUTLS_E_SUCCESS;
>>> > +-            to_copy =3D node2;
>>> > ++            }
>>> > +             break;
>>> > +     case GNUTLS_SAN_IPADDRESS:
>>> > +-            if (node1->name.size !=3D node2->name.size)
>>> > ++            rel =3D compare_ip_ncs(&node1->name, &node2->name);
>>> > ++            switch (rel) {
>>> > ++            case NC_EQUAL: // equal means doesn't matter which one
>>> > ++            case NC_INCLUDES: // node2 is more specific
>>> > ++                    to_copy =3D node2;
>>> > ++                    break;
>>> > ++            case NC_INCLUDED_BY: // node1 is more specific
>>> > ++                    to_copy =3D node1;
>>> > ++                    break;
>>> > ++            case NC_SORTS_BEFORE: // no intersection
>>> > ++            case NC_SORTS_AFTER: // no intersection
>>> > +                     return GNUTLS_E_SUCCESS;
>>> > +-            iplength =3D node1->name.size / 2;
>>> > +-            for (byte =3D 0; byte < iplength; byte++) {
>>> > +-                    if (((node1->name.data[byte] ^
>>> > +-                          node2->name.data[byte]) // XOR of address=
es
>>> > +-                         & node1->name.data[byte +
>>> > +-                                            iplength] // AND mask f=
rom
>>> nc1
>>> > +-                         & node2->name.data[byte +
>>> > +-                                            iplength]) // AND mask
>>> from nc2
>>> > +-                        !=3D 0) {
>>> > +-                            // CIDRS do not intersect
>>> > +-                            return GNUTLS_E_SUCCESS;
>>> > +-                    }
>>> > +             }
>>> > +-            to_copy =3D node2;
>>> > +             break;
>>> > +     default:
>>> > +             // for other types, we don't know how to do the
>>> intersection, assume empty
>>> > +@@ -967,20 +1210,6 @@ static int name_constraints_intersect_no
>>> > +             intersection =3D *_intersection;
>>> > +
>>> > +             assert(intersection->name.data !=3D NULL);
>>> > +-
>>> > +-            if (intersection->type =3D=3D GNUTLS_SAN_IPADDRESS) {
>>> > +-                    // make sure both IP addresses are correctly ma=
sked
>>> > +-                    _gnutls_mask_ip(intersection->name.data,
>>> > +-                                    intersection->name.data + iplen=
gth,
>>> > +-                                    iplength);
>>> > +-                    _gnutls_mask_ip(node1->name.data,
>>> > +-                                    node1->name.data + iplength,
>>> iplength);
>>> > +-                    // update intersection, if necessary (we alread=
y
>>> know one is subset of other)
>>> > +-                    for (byte =3D 0; byte < 2 * iplength; byte++) {
>>> > +-                            intersection->name.data[byte] |=3D
>>> > +-                                    node1->name.data[byte];
>>> > +-                    }
>>> > +-            }
>>> > +     }
>>> > +
>>> > +     return GNUTLS_E_SUCCESS;
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
>>> > new file mode 100644
>>> > index 0000000000..6dc599dd9f
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
>>> > @@ -0,0 +1,119 @@
>>> > +From bc62fbb946085527b4b1c02f337dd10c68c54690 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Wed, 4 Feb 2026 09:09:46 +0100
>>> > +Subject: [PATCH] x509/name_constraints: add sorted_view in
>>> preparation...
>>> > +
>>> > +... for actually using it later for performance gains.
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/bc62fbb946085527b4b1c02f337dd=
10c68c54690
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 62 ++++++++++++++++++++++++++++++----=
---
>>> > + 1 file changed, 51 insertions(+), 11 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -54,6 +54,9 @@ struct name_constraints_node_list_st {
>>> > +     struct name_constraints_node_st **data;
>>> > +     size_t size;
>>> > +     size_t capacity;
>>> > ++    /* sorted-on-demand view, valid only when dirty =3D=3D false */
>>> > ++    bool dirty;
>>> > ++    struct name_constraints_node_st **sorted_view;
>>> > + };
>>> > +
>>> > + struct gnutls_name_constraints_st {
>>> > +@@ -342,6 +345,37 @@ static int compare_name_constraint_nodes
>>> > +     }
>>> > + }
>>> > +
>>> > ++/* Bring the sorted view up to date with the list data; clear the
>>> dirty flag. */
>>> > ++static int ensure_sorted(struct name_constraints_node_list_st *list=
)
>>> > ++{
>>> > ++    struct name_constraints_node_st **new_data;
>>> > ++
>>> > ++    if (!list->dirty)
>>> > ++            return GNUTLS_E_SUCCESS;
>>> > ++    if (!list->size) {
>>> > ++            list->dirty =3D false;
>>> > ++            return GNUTLS_E_SUCCESS;
>>> > ++    }
>>> > ++
>>> > ++    /* reallocate sorted view to match current size */
>>> > ++    new_data =3D
>>> > ++            _gnutls_reallocarray(list->sorted_view, list->size,
>>> > ++                                 sizeof(struct
>>> name_constraints_node_st *));
>>> > ++    if (!new_data)
>>> > ++            return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
>>> > ++    list->sorted_view =3D new_data;
>>> > ++
>>> > ++    /* copy pointers and sort in-place */
>>> > ++    memcpy(list->sorted_view, list->data,
>>> > ++           list->size * sizeof(struct name_constraints_node_st *));
>>> > ++    qsort(list->sorted_view, list->size,
>>> > ++          sizeof(struct name_constraints_node_st *),
>>> > ++          compare_name_constraint_nodes_qsort);
>>> > ++
>>> > ++    list->dirty =3D false;
>>> > ++    return GNUTLS_E_SUCCESS;
>>> > ++}
>>> > ++
>>> > + static int
>>> > + name_constraints_node_list_add(struct name_constraints_node_list_st
>>> *list,
>>> > +                            struct name_constraints_node_st *node)
>>> > +@@ -361,10 +395,23 @@ name_constraints_node_list_add(struct na
>>> > +             list->capacity =3D new_capacity;
>>> > +             list->data =3D new_data;
>>> > +     }
>>> > ++    list->dirty =3D true;
>>> > +     list->data[list->size++] =3D node;
>>> > +     return 0;
>>> > + }
>>> > +
>>> > ++static void
>>> > ++name_constraints_node_list_clear(struct name_constraints_node_list_=
st
>>> *list)
>>> > ++{
>>> > ++    gnutls_free(list->data);
>>> > ++    gnutls_free(list->sorted_view);
>>> > ++    list->data =3D NULL;
>>> > ++    list->sorted_view =3D NULL;
>>> > ++    list->capacity =3D 0;
>>> > ++    list->size =3D 0;
>>> > ++    list->dirty =3D false;
>>> > ++}
>>> > ++
>>> > + static int
>>> > + name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
>>> > +                           struct name_constraints_node_list_st *lis=
t,
>>> > +@@ -711,6 +758,7 @@ static int name_constraints_node_list_in
>>> > +                             permitted->data[i] =3D
>>> > +                                     permitted->data[permitted->size=
 -
>>> 1];
>>> > +                     permitted->size--;
>>> > ++                    permitted->dirty =3D true;
>>> > +                     continue;
>>> > +             }
>>> > +             i++;
>>> > +@@ -905,17 +953,9 @@ void _gnutls_x509_name_constraints_clear
>>> > +             struct name_constraints_node_st *node =3D nc->nodes.dat=
a[i];
>>> > +             name_constraints_node_free(node);
>>> > +     }
>>> > +-    gnutls_free(nc->nodes.data);
>>> > +-    nc->nodes.capacity =3D 0;
>>> > +-    nc->nodes.size =3D 0;
>>> > +-
>>> > +-    gnutls_free(nc->permitted.data);
>>> > +-    nc->permitted.capacity =3D 0;
>>> > +-    nc->permitted.size =3D 0;
>>> > +-
>>> > +-    gnutls_free(nc->excluded.data);
>>> > +-    nc->excluded.capacity =3D 0;
>>> > +-    nc->excluded.size =3D 0;
>>> > ++    name_constraints_node_list_clear(&nc->nodes);
>>> > ++    name_constraints_node_list_clear(&nc->permitted);
>>> > ++    name_constraints_node_list_clear(&nc->excluded);
>>> > + }
>>> > +
>>> > + /**
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
>>> > new file mode 100644
>>> > index 0000000000..846862007f
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
>>> > @@ -0,0 +1,150 @@
>>> > +From 80db5e90fa18d3e34bb91dd027bdf76d31e93dcd Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Wed, 4 Feb 2026 13:30:08 +0100
>>> > +Subject: [PATCH] x509/name_constraints: implement
>>> > + name_constraints_node_list_union
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/80db5e90fa18d3e34bb91dd027bdf=
76d31e93dcd
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 98 ++++++++++++++++++++++++++++++++--=
---
>>> > + 1 file changed, 86 insertions(+), 12 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -41,6 +41,7 @@
>>> > + #include "intprops.h"
>>> > + #include "minmax.h"
>>> > +
>>> > ++#include <assert.h>
>>> > + #include <string.h>
>>> > +
>>> > + #define MAX_NC_CHECKS (1 << 20)
>>> > +@@ -867,22 +868,95 @@ cleanup:
>>> > +     return ret;
>>> > + }
>>> > +
>>> > +-static int name_constraints_node_list_concat(
>>> > +-    gnutls_x509_name_constraints_t nc,
>>> > +-    struct name_constraints_node_list_st *nodes,
>>> > +-    const struct name_constraints_node_list_st *nodes2)
>>> > ++static int
>>> > ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
>>> > ++                             struct name_constraints_node_list_st
>>> *nodes,
>>> > ++                             struct name_constraints_node_list_st
>>> *nodes2)
>>> > + {
>>> > +     int ret;
>>> > ++    size_t i =3D 0, j =3D 0;
>>> > ++    struct name_constraints_node_st *nc1;
>>> > ++    const struct name_constraints_node_st *nc2;
>>> > ++    enum name_constraint_relation rel;
>>> > ++    struct name_constraints_node_list_st result =3D { 0 };
>>> > ++
>>> > ++    if (nodes2->size =3D=3D 0) /* nothing to do */
>>> > ++            return GNUTLS_E_SUCCESS;
>>> > ++
>>> > ++    ret =3D ensure_sorted(nodes);
>>> > ++    if (ret < 0) {
>>> > ++            gnutls_assert();
>>> > ++            goto cleanup;
>>> > ++    }
>>> > ++    ret =3D ensure_sorted(nodes2);
>>> > ++    if (ret < 0) {
>>> > ++            gnutls_assert();
>>> > ++            goto cleanup;
>>> > ++    }
>>> > ++
>>> > ++    /* traverse both lists in a single pass and merge them w/o
>>> duplicates */
>>> > ++    while (i < nodes->size || j < nodes2->size) {
>>> > ++            nc1 =3D (i < nodes->size) ? nodes->sorted_view[i] : NUL=
L;
>>> > ++            nc2 =3D (j < nodes2->size) ? nodes2->sorted_view[j] : N=
ULL;
>>> > +
>>> > +-    for (size_t i =3D 0; i < nodes2->size; i++) {
>>> > +-            ret =3D name_constraints_node_add_copy(nc, nodes,
>>> > +-                                                 nodes2->data[i]);
>>> > ++            rel =3D compare_name_constraint_nodes(nc1, nc2);
>>> > ++            switch (rel) {
>>> > ++            case NC_SORTS_BEFORE:
>>> > ++                    assert(nc1 !=3D NULL); /* comparator-guaranteed=
 */
>>> > ++                    ret =3D name_constraints_node_list_add(&result,=
 nc1);
>>> > ++                    i++;
>>> > ++                    break;
>>> > ++            case NC_SORTS_AFTER:
>>> > ++                    assert(nc2 !=3D NULL); /* comparator-guaranteed=
 */
>>> > ++                    ret =3D name_constraints_node_add_copy(nc, &res=
ult,
>>> nc2);
>>> > ++                    j++;
>>> > ++                    break;
>>> > ++            case NC_INCLUDES: /* nc1 is broader, shallow-copy it */
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* comp=
arator
>>> */
>>> > ++                    ret =3D name_constraints_node_list_add(&result,=
 nc1);
>>> > ++                    i++;
>>> > ++                    j++;
>>> > ++                    break;
>>> > ++            case NC_INCLUDED_BY: /* nc2 is broader, deep-copy it */
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* comp=
arator
>>> */
>>> > ++                    ret =3D name_constraints_node_add_copy(nc, &res=
ult,
>>> nc2);
>>> > ++                    i++;
>>> > ++                    j++;
>>> > ++                    break;
>>> > ++            case NC_EQUAL:
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* loop
>>> condition */
>>> > ++                    ret =3D name_constraints_node_list_add(&result,=
 nc1);
>>> > ++                    i++;
>>> > ++                    j++;
>>> > ++                    break;
>>> > ++            }
>>> > +             if (ret < 0) {
>>> > +-                    return gnutls_assert_val(ret);
>>> > ++                    gnutls_assert();
>>> > ++                    goto cleanup;
>>> > +             }
>>> > +     }
>>> > +
>>> > +-    return 0;
>>> > ++    gnutls_free(nodes->data);
>>> > ++    gnutls_free(nodes->sorted_view);
>>> > ++    nodes->data =3D result.data;
>>> > ++    nodes->sorted_view =3D NULL;
>>> > ++    nodes->size =3D result.size;
>>> > ++    nodes->capacity =3D result.capacity;
>>> > ++    nodes->dirty =3D true;
>>> > ++    /* since we know it's sorted, populate sorted_view almost for f=
ree
>>> */
>>> > ++    nodes->sorted_view =3D gnutls_calloc(
>>> > ++            nodes->size, sizeof(struct name_constraints_node_st *))=
;
>>> > ++    if (!nodes->sorted_view)
>>> > ++            return GNUTLS_E_SUCCESS; /* we tried, no harm done */
>>> > ++    memcpy(nodes->sorted_view, nodes->data,
>>> > ++           nodes->size * sizeof(struct name_constraints_node_st *))=
;
>>> > ++    nodes->dirty =3D false;
>>> > ++
>>> > ++    result.data =3D NULL;
>>> > ++    return GNUTLS_E_SUCCESS;
>>> > ++cleanup:
>>> > ++    name_constraints_node_list_clear(&result);
>>> > ++    return gnutls_assert_val(ret);
>>> > + }
>>> > +
>>> > + /**
>>> > +@@ -1023,7 +1097,7 @@ static int name_constraints_add(gnutls_x
>>> > +  * @nc2: The name constraints to be merged with
>>> > +  *
>>> > +  * This function will merge the provided name constraints structure=
s
>>> > +- * as per RFC5280 p6.1.4. That is, the excluded constraints will be
>>> appended,
>>> > ++ * as per RFC5280 p6.1.4. That is, the excluded constraints will be
>>> unioned,
>>> > +  * and permitted will be intersected. The intersection assumes that=
 @nc
>>> > +  * is the root CA constraints.
>>> > +  *
>>> > +@@ -1045,8 +1119,8 @@ int _gnutls_x509_name_constraints_merge(
>>> > +             return ret;
>>> > +     }
>>> > +
>>> > +-    ret =3D name_constraints_node_list_concat(nc, &nc->excluded,
>>> > +-                                            &nc2->excluded);
>>> > ++    ret =3D name_constraints_node_list_union(nc, &nc->excluded,
>>> > ++                                           &nc2->excluded);
>>> > +     if (ret < 0) {
>>> > +             gnutls_assert();
>>> > +             return ret;
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
>>> > new file mode 100644
>>> > index 0000000000..9beca76a35
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
>>> > @@ -0,0 +1,105 @@
>>> > +From d0ac999620c8c0aeb6939e1e92d884ca8e40b759 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Wed, 4 Feb 2026 18:31:37 +0100
>>> > +Subject: [PATCH] x509/name_constraints: make
>>> types_with_empty_intersection a
>>> > + bitmask
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/d0ac999620c8c0aeb6939e1e92d88=
4ca8e40b759
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + lib/x509/name_constraints.c | 39 +++++++++++++++++++++++++++-------=
---
>>> > + 1 file changed, 29 insertions(+), 10 deletions(-)
>>> > +
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -275,6 +275,7 @@ static enum name_constraint_relation com
>>> > +
>>> > + static inline bool is_supported_type(unsigned type)
>>> > + {
>>> > ++    /* all of these should be under GNUTLS_SAN_MAX (intersect
>>> bitmasks) */
>>> > +     return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN=
_RFC822NAME
>>> ||
>>> > +            type =3D=3D GNUTLS_SAN_IPADDRESS;
>>> > + }
>>> > +@@ -683,6 +684,21 @@ name_constraints_node_new(gnutls_x509_na
>>> > +     return tmp;
>>> > + }
>>> > +
>>> > ++static int
>>> > ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
>>> > ++                             struct name_constraints_node_list_st
>>> *nodes,
>>> > ++                             struct name_constraints_node_list_st
>>> *nodes2);
>>> > ++
>>> > ++#define type_bitmask_t uint8_t /* increase if GNUTLS_SAN_MAX grows =
*/
>>> > ++#define type_bitmask_set(mask, t) ((mask) |=3D (1u << (t)))
>>> > ++#define type_bitmask_clr(mask, t) ((mask) &=3D ~(1u << (t)))
>>> > ++#define type_bitmask_in(mask, t) ((mask) & (1u << (t)))
>>> > ++/* C99-compatible compile-time assertions; gnutls_int.h undefines
>>> verify */
>>> > ++typedef char assert_san_max[(GNUTLS_SAN_MAX < 8) ? 1 : -1];
>>> > ++typedef char assert_dnsname[(GNUTLS_SAN_DNSNAME <=3D GNUTLS_SAN_MAX=
) ? 1
>>> : -1];
>>> > ++typedef char assert_rfc822[(GNUTLS_SAN_RFC822NAME <=3D GNUTLS_SAN_M=
AX) ?
>>> 1 : -1];
>>> > ++typedef char assert_ipaddr[(GNUTLS_SAN_IPADDRESS <=3D GNUTLS_SAN_MA=
X) ?
>>> 1 : -1];
>>> > ++
>>> > + /*-
>>> > +  * @brief name_constraints_node_list_intersect:
>>> > +  * @nc: %gnutls_x509_name_constraints_t
>>> > +@@ -710,12 +726,9 @@ static int name_constraints_node_list_in
>>> > +                                                      .capacity =3D =
0 };
>>> > +     static const unsigned char universal_ip[32] =3D { 0 };
>>> > +
>>> > +-    /* temporary array to see, if we need to add universal excluded
>>> constraints
>>> > +-     * (see phase 3 for details)
>>> > +-     * indexed directly by (gnutls_x509_subject_alt_name_t enum - 1=
) */
>>> > +-    unsigned char types_with_empty_intersection[GNUTLS_SAN_MAX];
>>> > +-    memset(types_with_empty_intersection, 0,
>>> > +-           sizeof(types_with_empty_intersection));
>>> > ++    /* bitmask to see if we need to add universal excluded constrai=
nts
>>> > ++     * (see phase 3 for details) */
>>> > ++    type_bitmask_t types_with_empty_intersection =3D 0;
>>> > +
>>> > +     if (permitted->size =3D=3D 0 || permitted2->size =3D=3D 0)
>>> > +             return 0;
>>> > +@@ -741,7 +754,8 @@ static int name_constraints_node_list_in
>>> > +                             // note the possibility of empty
>>> intersection for this type
>>> > +                             // if we add something to the intersect=
ion
>>> in phase 2,
>>> > +                             // we will reset this flag back to 0 th=
en
>>> > +-                            types_with_empty_intersection[t->type -=
 1]
>>> =3D 1;
>>> > ++
>>> type_bitmask_set(types_with_empty_intersection,
>>> > ++                                             t->type);
>>> > +                             found =3D t2;
>>> > +                             break;
>>> > +                     }
>>> > +@@ -795,8 +809,8 @@ static int name_constraints_node_list_in
>>> > +                                             GNUTLS_E_INTERNAL_ERROR=
);
>>> > +                             }
>>> > +                             // we will not add universal excluded
>>> constraint for this type
>>> > +-                            types_with_empty_intersection[tmp->type=
 -
>>> 1] =3D
>>> > +-                                    0;
>>> > ++
>>> type_bitmask_clr(types_with_empty_intersection,
>>> > ++                                             tmp->type);
>>> > +                             // add intersection node to PERMITTED
>>> > +                             ret =3D
>>> name_constraints_node_list_add(permitted,
>>> > +                                                                  tm=
p);
>>> > +@@ -824,7 +838,7 @@ static int name_constraints_node_list_in
>>> > +      * excluded constraint with universal wildcard
>>> > +      * (since the intersection of permitted is now empty). */
>>> > +     for (type =3D 1; type <=3D GNUTLS_SAN_MAX; type++) {
>>> > +-            if (types_with_empty_intersection[type - 1] =3D=3D 0)
>>> > ++            if (!type_bitmask_in(types_with_empty_intersection, typ=
e))
>>> > +                     continue;
>>> > +             _gnutls_hard_log(
>>> > +                     "Adding universal excluded name constraint for
>>> type %d.\n",
>>> > +@@ -868,6 +882,11 @@ cleanup:
>>> > +     return ret;
>>> > + }
>>> > +
>>> > ++#undef type_bitmask_t
>>> > ++#undef type_bitmask_set
>>> > ++#undef type_bitmask_clr
>>> > ++#undef type_bitmask_in
>>> > ++
>>> > + static int
>>> > + name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
>>> > +                              struct name_constraints_node_list_st
>>> *nodes,
>>> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patc=
h
>>> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
>>> > new file mode 100644
>>> > index 0000000000..27ed995d8d
>>> > --- /dev/null
>>> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
>>> > @@ -0,0 +1,437 @@
>>> > +Backport of:
>>> > +
>>> > +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 20=
01
>>> > +From: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +Date: Wed, 4 Feb 2026 20:03:49 +0100
>>> > +Subject: [PATCH] x509/name_constraints:
>>> name_constraints_node_list_intersect
>>> > + over sorted
>>> > +
>>> > +Fixes: #1773
>>> > +Fixes: GNUTLS-SA-2026-02-09-2
>>> > +Fixes: CVE-2025-14831
>>> > +
>>> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>>> > +
>>> > +Upstream-Status: Backport [
>>> https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c82177ddbd0a=
4e8331059a1
>>> ]
>>> > +CVE: CVE-2025-14831
>>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> > +---
>>> > + NEWS                        |   7 +
>>> > + lib/x509/name_constraints.c | 350 ++++++++++++++-------------------=
---
>>> > + 2 files changed, 142 insertions(+), 215 deletions(-)
>>> > +
>>> > +#diff --git a/NEWS b/NEWS
>>> > +#index e506db547a..96b7484fdf 100644
>>> > +#--- a/NEWS
>>> > +#+++ b/NEWS
>>> > +#@@ -14,6 +14,13 @@ See the end for copying conditions.
>>> > +#    Reported by Jaehun Lee.
>>> > +#    [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-1584]
>>> > +#
>>> > +#+** libgnutls: Fix name constraint processing performance issue
>>> > +#+   Verifying certificates with pathological amounts of name
>>> constraints
>>> > +#+   could lead to a denial of service attack via resource exhaustio=
n.
>>> > +#+   Reworked processing algorithms exhibit better performance
>>> characteristics.
>>> > +#+   Reported by Tim Scheckenbach.
>>> > +#+   [Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-2025-14831]
>>> > +#+
>>> > +# ** libgnutls: Fix multiple unexploitable overflows
>>> > +#    Reported by Tim R=C3=BChsen (#1783, #1786).
>>> > +#
>>> > +--- a/lib/x509/name_constraints.c
>>> > ++++ b/lib/x509/name_constraints.c
>>> > +@@ -446,13 +446,6 @@ name_constraints_node_add_copy(gnutls_x5
>>> > +                                          src->name.data,
>>> src->name.size);
>>> > + }
>>> > +
>>> > +-// for documentation see the implementation
>>> > +-static int name_constraints_intersect_nodes(
>>> > +-    gnutls_x509_name_constraints_t nc,
>>> > +-    const struct name_constraints_node_st *node1,
>>> > +-    const struct name_constraints_node_st *node2,
>>> > +-    struct name_constraints_node_st **intersection);
>>> > +-
>>> > + /*-
>>> > +  * _gnutls_x509_name_constraints_is_empty:
>>> > +  * @nc: name constraints structure
>>> > +@@ -716,129 +709,143 @@ typedef char assert_ipaddr[(GNUTLS_SAN_I
>>> > + static int name_constraints_node_list_intersect(
>>> > +     gnutls_x509_name_constraints_t nc,
>>> > +     struct name_constraints_node_list_st *permitted,
>>> > +-    const struct name_constraints_node_list_st *permitted2,
>>> > ++    struct name_constraints_node_list_st *permitted2,
>>> > +     struct name_constraints_node_list_st *excluded)
>>> > + {
>>> > +-    struct name_constraints_node_st *tmp;
>>> > +-    int ret, type, used;
>>> > +-    struct name_constraints_node_list_st removed =3D { .data =3D NU=
LL,
>>> > +-                                                     .size =3D 0,
>>> > +-                                                     .capacity =3D =
0 };
>>> > ++    struct name_constraints_node_st *nc1, *nc2;
>>> > ++    struct name_constraints_node_list_st result =3D { 0 };
>>> > ++    struct name_constraints_node_list_st unsupp2 =3D { 0 };
>>> > ++    enum name_constraint_relation rel;
>>> > ++    unsigned type;
>>> > ++    int ret =3D GNUTLS_E_SUCCESS;
>>> > ++    size_t i, j, p1_unsupp =3D 0, p2_unsupp =3D 0;
>>> > ++    type_bitmask_t universal_exclude_needed =3D 0;
>>> > ++    type_bitmask_t types_in_p1 =3D 0, types_in_p2 =3D 0;
>>> > +     static const unsigned char universal_ip[32] =3D { 0 };
>>> > +
>>> > +-    /* bitmask to see if we need to add universal excluded constrai=
nts
>>> > +-     * (see phase 3 for details) */
>>> > +-    type_bitmask_t types_with_empty_intersection =3D 0;
>>> > +-
>>> > +     if (permitted->size =3D=3D 0 || permitted2->size =3D=3D 0)
>>> > +-            return 0;
>>> > ++            return GNUTLS_E_SUCCESS;
>>> > +
>>> > +-    /* Phase 1
>>> > +-     * For each name in PERMITTED, if a PERMITTED2 does not contain=
 a
>>> name
>>> > +-     * with the same type, move the original name to REMOVED.
>>> > +-     * Do this also for node of unknown type (not DNS, email, IP) *=
/
>>> > +-    for (size_t i =3D 0; i < permitted->size;) {
>>> > +-            struct name_constraints_node_st *t =3D permitted->data[=
i];
>>> > +-            const struct name_constraints_node_st *found =3D NULL;
>>> > +-
>>> > +-            for (size_t j =3D 0; j < permitted2->size; j++) {
>>> > +-                    const struct name_constraints_node_st *t2 =3D
>>> > +-                            permitted2->data[j];
>>> > +-                    if (t->type =3D=3D t2->type) {
>>> > +-                            // check bounds (we will use 't->type' =
as
>>> index)
>>> > +-                            if (t->type > GNUTLS_SAN_MAX || t->type=
 =3D=3D
>>> 0) {
>>> > +-                                    gnutls_assert();
>>> > +-                                    ret =3D GNUTLS_E_INTERNAL_ERROR=
;
>>> > +-                                    goto cleanup;
>>> > +-                            }
>>> > +-                            // note the possibility of empty
>>> intersection for this type
>>> > +-                            // if we add something to the intersect=
ion
>>> in phase 2,
>>> > +-                            // we will reset this flag back to 0 th=
en
>>> > +-
>>> type_bitmask_set(types_with_empty_intersection,
>>> > +-                                             t->type);
>>> > +-                            found =3D t2;
>>> > +-                            break;
>>> > +-                    }
>>> > ++    /* make sorted views of the arrays */
>>> > ++    ret =3D ensure_sorted(permitted);
>>> > ++    if (ret < 0) {
>>> > ++            gnutls_assert();
>>> > ++            goto cleanup;
>>> > ++    }
>>> > ++    ret =3D ensure_sorted(permitted2);
>>> > ++    if (ret < 0) {
>>> > ++            gnutls_assert();
>>> > ++            goto cleanup;
>>> > ++    }
>>> > ++
>>> > ++    /* deal with the leading unsupported types first: count, then
>>> union */
>>> > ++    while (p1_unsupp < permitted->size &&
>>> > ++           !is_supported_type(permitted->sorted_view[p1_unsupp]->ty=
pe))
>>> > ++            p1_unsupp++;
>>> > ++    while (p2_unsupp < permitted2->size &&
>>> > ++
>>>  !is_supported_type(permitted2->sorted_view[p2_unsupp]->type))
>>> > ++            p2_unsupp++;
>>> > ++    if (p1_unsupp) { /* copy p1 unsupported type pointers into resu=
lt
>>> */
>>> > ++            result.data =3D gnutls_calloc(
>>> > ++                    p1_unsupp, sizeof(struct name_constraints_node_=
st
>>> *));
>>> > ++            if (!result.data) {
>>> > ++                    ret =3D GNUTLS_E_MEMORY_ERROR;
>>> > ++                    gnutls_assert();
>>> > ++                    goto cleanup;
>>> > ++            }
>>> > ++            memcpy(result.data, permitted->sorted_view,
>>> > ++                   p1_unsupp * sizeof(struct name_constraints_node_=
st
>>> *));
>>> > ++            result.size =3D result.capacity =3D p1_unsupp;
>>> > ++            result.dirty =3D true;
>>> > ++    }
>>> > ++    if (p2_unsupp) { /* union will make deep copies from p2 */
>>> > ++            unsupp2.data =3D permitted2->sorted_view; /* so, just a=
lias
>>> */
>>> > ++            unsupp2.size =3D unsupp2.capacity =3D p2_unsupp;
>>> > ++            unsupp2.dirty =3D false; /* we know it's sorted */
>>> > ++            unsupp2.sorted_view =3D permitted2->sorted_view;
>>> > ++            ret =3D name_constraints_node_list_union(nc, &result,
>>> &unsupp2);
>>> > ++            if (ret < 0) {
>>> > ++                    gnutls_assert();
>>> > ++                    goto cleanup;
>>> > +             }
>>> > ++    }
>>> > +
>>> > +-            if (found !=3D NULL && is_supported_type(t->type)) {
>>> > +-                    /* move node from PERMITTED to REMOVED */
>>> > +-                    ret =3D name_constraints_node_list_add(&removed=
, t);
>>> > +-                    if (ret < 0) {
>>> > +-                            gnutls_assert();
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    /* remove node by swapping */
>>> > +-                    if (i < permitted->size - 1)
>>> > +-                            permitted->data[i] =3D
>>> > +-                                    permitted->data[permitted->size=
 -
>>> 1];
>>> > +-                    permitted->size--;
>>> > +-                    permitted->dirty =3D true;
>>> > +-                    continue;
>>> > ++    /* with that out of the way, pre-compute the supported types we
>>> have */
>>> > ++    for (i =3D p1_unsupp; i < permitted->size; i++) {
>>> > ++            type =3D permitted->sorted_view[i]->type;
>>> > ++            if (type < 1 || type > GNUTLS_SAN_MAX) {
>>> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERR=
OR);
>>> > ++                    goto cleanup;
>>> > +             }
>>> > +-            i++;
>>> > ++            type_bitmask_set(types_in_p1, type);
>>> > +     }
>>> > ++    for (j =3D p2_unsupp; j < permitted2->size; j++) {
>>> > ++            type =3D permitted2->sorted_view[j]->type;
>>> > ++            if (type < 1 || type > GNUTLS_SAN_MAX) {
>>> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERR=
OR);
>>> > ++                    goto cleanup;
>>> > ++            }
>>> > ++            type_bitmask_set(types_in_p2, type);
>>> > ++    }
>>> > ++    /* universal excludes might be needed for types intersecting to
>>> empty */
>>> > ++    universal_exclude_needed =3D types_in_p1 & types_in_p2;
>>> > +
>>> > +-    /* Phase 2
>>> > +-     * iterate through all combinations from PERMITTED2 and PERMITT=
ED
>>> > +-     * and create intersections of nodes with same type */
>>> > +-    for (size_t i =3D 0; i < permitted2->size; i++) {
>>> > +-            const struct name_constraints_node_st *t2 =3D
>>> permitted2->data[i];
>>> > +-
>>> > +-            // current PERMITTED2 node has not yet been used for an=
y
>>> intersection
>>> > +-            // (and is not in REMOVED either)
>>> > +-            used =3D 0;
>>> > +-            for (size_t j =3D 0; j < removed.size; j++) {
>>> > +-                    const struct name_constraints_node_st *t =3D
>>> > +-                            removed.data[j];
>>> > +-                    // save intersection of name constraints into t=
mp
>>> > +-                    ret =3D name_constraints_intersect_nodes(nc, t,=
 t2,
>>> &tmp);
>>> > +-                    if (ret < 0) {
>>> > +-                            gnutls_assert();
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > +-                    used =3D 1;
>>> > +-                    // if intersection is not empty
>>> > +-                    if (tmp !=3D
>>> > +-                        NULL) { // intersection for this type is no=
t
>>> empty
>>> > +-                            // check bounds
>>> > +-                            if (tmp->type > GNUTLS_SAN_MAX ||
>>> > +-                                tmp->type =3D=3D 0) {
>>> > +-                                    gnutls_free(tmp);
>>> > +-                                    return gnutls_assert_val(
>>> > +-                                            GNUTLS_E_INTERNAL_ERROR=
);
>>> > +-                            }
>>> > +-                            // we will not add universal excluded
>>> constraint for this type
>>> > +-
>>> type_bitmask_clr(types_with_empty_intersection,
>>> > +-                                             tmp->type);
>>> > +-                            // add intersection node to PERMITTED
>>> > +-                            ret =3D
>>> name_constraints_node_list_add(permitted,
>>> > +-                                                                 tm=
p);
>>> > +-                            if (ret < 0) {
>>> > +-                                    gnutls_assert();
>>> > +-                                    goto cleanup;
>>> > +-                            }
>>> > +-                    }
>>> > ++    /* go through supported type NCs and intersect in a single pass=
 */
>>> > ++    i =3D p1_unsupp;
>>> > ++    j =3D p2_unsupp;
>>> > ++    while (i < permitted->size || j < permitted2->size) {
>>> > ++            nc1 =3D (i < permitted->size) ? permitted->sorted_view[=
i] :
>>> NULL;
>>> > ++            nc2 =3D (j < permitted2->size) ? permitted2->sorted_vie=
w[j] :
>>> > ++                                           NULL;
>>> > ++            rel =3D compare_name_constraint_nodes(nc1, nc2);
>>> > ++
>>> > ++            switch (rel) {
>>> > ++            case NC_SORTS_BEFORE:
>>> > ++                    assert(nc1 !=3D NULL); /* comparator-guaranteed=
 */
>>> > ++                    /* if nothing to intersect with, shallow-copy n=
c1
>>> */
>>> > ++                    if (!type_bitmask_in(types_in_p2, nc1->type))
>>> > ++                            ret =3D
>>> name_constraints_node_list_add(&result,
>>> > ++                                                                 nc=
1);
>>> > ++                    i++; /* otherwise skip nc1 */
>>> > ++                    break;
>>> > ++            case NC_SORTS_AFTER:
>>> > ++                    assert(nc2 !=3D NULL); /* comparator-guaranteed=
 */
>>> > ++                    /* if nothing to intersect with, deep-copy nc2 =
*/
>>> > ++                    if (!type_bitmask_in(types_in_p1, nc2->type))
>>> > ++                            ret =3D name_constraints_node_add_copy(
>>> > ++                                    nc, &result, nc2);
>>> > ++                    j++; /* otherwise skip nc2 */
>>> > ++                    break;
>>> > ++            case NC_INCLUDED_BY: /* add nc1, shallow-copy */
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* comp=
arator
>>> */
>>> > ++                    type_bitmask_clr(universal_exclude_needed,
>>> nc1->type);
>>> > ++                    ret =3D name_constraints_node_list_add(&result,=
 nc1);
>>> > ++                    i++;
>>> > ++                    break;
>>> > ++            case NC_INCLUDES: /* pick nc2, deep-copy */
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* comp=
arator
>>> */
>>> > ++                    type_bitmask_clr(universal_exclude_needed,
>>> nc2->type);
>>> > ++                    ret =3D name_constraints_node_add_copy(nc, &res=
ult,
>>> nc2);
>>> > ++                    j++;
>>> > ++                    break;
>>> > ++            case NC_EQUAL: /* pick whichever: nc1, shallow-copy */
>>> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* loop
>>> condition */
>>> > ++                    type_bitmask_clr(universal_exclude_needed,
>>> nc1->type);
>>> > ++                    ret =3D name_constraints_node_list_add(&result,=
 nc1);
>>> > ++                    i++;
>>> > ++                    j++;
>>> > ++                    break;
>>> > +             }
>>> > +-            // if the node from PERMITTED2 was not used for
>>> intersection, copy it to DEST
>>> > +-            // Beware: also copies nodes other than DNS, email, IP,
>>> > +-            //       since their counterpart may have been moved in
>>> phase 1.
>>> > +-            if (!used) {
>>> > +-                    ret =3D name_constraints_node_add_copy(nc,
>>> permitted, t2);
>>> > +-                    if (ret < 0) {
>>> > +-                            gnutls_assert();
>>> > +-                            goto cleanup;
>>> > +-                    }
>>> > ++            if (ret < 0) {
>>> > ++                    gnutls_assert();
>>> > ++                    goto cleanup;
>>> > +             }
>>> > +     }
>>> > +
>>> > +-    /* Phase 3
>>> > +-     * For each type: If we have empty permitted name constraints n=
ow
>>> > +-     * and we didn't have at the beginning, we have to add a new
>>> > +-     * excluded constraint with universal wildcard
>>> > +-     * (since the intersection of permitted is now empty). */
>>> > ++    /* finishing touch: add universal excluded constraints for type=
s
>>> where
>>> > ++     * both lists had constraints, but all intersections ended up
>>> empty */
>>> > +     for (type =3D 1; type <=3D GNUTLS_SAN_MAX; type++) {
>>> > +-            if (!type_bitmask_in(types_with_empty_intersection, typ=
e))
>>> > ++            if (!type_bitmask_in(universal_exclude_needed, type))
>>> > +                     continue;
>>> > +             _gnutls_hard_log(
>>> > +                     "Adding universal excluded name constraint for
>>> type %d.\n",
>>> > +@@ -871,14 +878,24 @@ static int name_constraints_node_list_in
>>> > +                             goto cleanup;
>>> > +                     }
>>> > +                     break;
>>> > +-            default: // do nothing, at least one node was already
>>> moved in phase 1
>>> > +-                    break;
>>> > ++            default: /* unsupported type; should be unreacheable */
>>> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERR=
OR);
>>> > ++                    goto cleanup;
>>> > +             }
>>> > +     }
>>> > +-    ret =3D GNUTLS_E_SUCCESS;
>>> > +
>>> > ++    gnutls_free(permitted->data);
>>> > ++    gnutls_free(permitted->sorted_view);
>>> > ++    permitted->data =3D result.data;
>>> > ++    permitted->sorted_view =3D NULL;
>>> > ++    permitted->size =3D result.size;
>>> > ++    permitted->capacity =3D result.capacity;
>>> > ++    permitted->dirty =3D true;
>>> > ++
>>> > ++    result.data =3D NULL;
>>> > ++    ret =3D GNUTLS_E_SUCCESS;
>>> > + cleanup:
>>> > +-    gnutls_free(removed.data);
>>> > ++    name_constraints_node_list_clear(&result);
>>> > +     return ret;
>>> > + }
>>> > +
>>> > +@@ -1254,100 +1271,6 @@ static unsigned email_matches(const gnut
>>> > +     return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
>>> > + }
>>> > +
>>> > +-/*-
>>> > +- * name_constraints_intersect_nodes:
>>> > +- * @nc1: name constraints node 1
>>> > +- * @nc2: name constraints node 2
>>> > +- * @_intersection: newly allocated node with intersected constraint=
s,
>>> > +- *           NULL if the intersection is empty
>>> > +- *
>>> > +- * Inspect 2 name constraints nodes (of possibly different types) a=
nd
>>> allocate
>>> > +- * a new node with intersection of given constraints.
>>> > +- *
>>> > +- * Returns: On success, %GNUTLS_E_SUCCESS (0) is returned, otherwis=
e a
>>> negative error value.
>>> > +- -*/
>>> > +-static int name_constraints_intersect_nodes(
>>> > +-    gnutls_x509_name_constraints_t nc,
>>> > +-    const struct name_constraints_node_st *node1,
>>> > +-    const struct name_constraints_node_st *node2,
>>> > +-    struct name_constraints_node_st **_intersection)
>>> > +-{
>>> > +-    // presume empty intersection
>>> > +-    struct name_constraints_node_st *intersection =3D NULL;
>>> > +-    const struct name_constraints_node_st *to_copy =3D NULL;
>>> > +-    enum name_constraint_relation rel;
>>> > +-
>>> > +-    *_intersection =3D NULL;
>>> > +-
>>> > +-    if (node1->type !=3D node2->type) {
>>> > +-            return GNUTLS_E_SUCCESS;
>>> > +-    }
>>> > +-    switch (node1->type) {
>>> > +-    case GNUTLS_SAN_DNSNAME:
>>> > +-            rel =3D compare_dns_names(&node1->name, &node2->name);
>>> > +-            switch (rel) {
>>> > +-            case NC_EQUAL: // equal means doesn't matter which one
>>> > +-            case NC_INCLUDES: // node2 is more specific
>>> > +-                    to_copy =3D node2;
>>> > +-                    break;
>>> > +-            case NC_INCLUDED_BY: // node1 is more specific
>>> > +-                    to_copy =3D node1;
>>> > +-                    break;
>>> > +-            case NC_SORTS_BEFORE: // no intersection
>>> > +-            case NC_SORTS_AFTER: // no intersection
>>> > +-                    return GNUTLS_E_SUCCESS;
>>> > +-            }
>>> > +-            break;
>>> > +-    case GNUTLS_SAN_RFC822NAME:
>>> > +-            rel =3D compare_emails(&node1->name, &node2->name);
>>> > +-            switch (rel) {
>>> > +-            case NC_EQUAL: // equal means doesn't matter which one
>>> > +-            case NC_INCLUDES: // node2 is more specific
>>> > +-                    to_copy =3D node2;
>>> > +-                    break;
>>> > +-            case NC_INCLUDED_BY: // node1 is more specific
>>> > +-                    to_copy =3D node1;
>>> > +-                    break;
>>> > +-            case NC_SORTS_BEFORE: // no intersection
>>> > +-            case NC_SORTS_AFTER: // no intersection
>>> > +-                    return GNUTLS_E_SUCCESS;
>>> > +-            }
>>> > +-            break;
>>> > +-    case GNUTLS_SAN_IPADDRESS:
>>> > +-            rel =3D compare_ip_ncs(&node1->name, &node2->name);
>>> > +-            switch (rel) {
>>> > +-            case NC_EQUAL: // equal means doesn't matter which one
>>> > +-            case NC_INCLUDES: // node2 is more specific
>>> > +-                    to_copy =3D node2;
>>> > +-                    break;
>>> > +-            case NC_INCLUDED_BY: // node1 is more specific
>>> > +-                    to_copy =3D node1;
>>> > +-                    break;
>>> > +-            case NC_SORTS_BEFORE: // no intersection
>>> > +-            case NC_SORTS_AFTER: // no intersection
>>> > +-                    return GNUTLS_E_SUCCESS;
>>> > +-            }
>>> > +-            break;
>>> > +-    default:
>>> > +-            // for other types, we don't know how to do the
>>> intersection, assume empty
>>> > +-            return GNUTLS_E_SUCCESS;
>>> > +-    }
>>> > +-
>>> > +-    // copy existing node if applicable
>>> > +-    if (to_copy !=3D NULL) {
>>> > +-            *_intersection =3D name_constraints_node_new(nc,
>>> to_copy->type,
>>> > +-
>>>  to_copy->name.data,
>>> > +-
>>>  to_copy->name.size);
>>> > +-            if (*_intersection =3D=3D NULL)
>>> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR)=
;
>>> > +-            intersection =3D *_intersection;
>>> > +-
>>> > +-            assert(intersection->name.data !=3D NULL);
>>> > +-    }
>>> > +-
>>> > +-    return GNUTLS_E_SUCCESS;
>>> > +-}
>>> > +-
>>> > + /*
>>> > +  * Returns: true if the certification is acceptable, and false
>>> otherwise.
>>> > +  */
>>> > diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>>> b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>>> > index 026ae650f6..ccb6a2b4b2 100644
>>> > --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>>> > +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>>> > @@ -34,6 +34,15 @@ SRC_URI =3D "
>>> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>>> >             file://CVE-2025-32990.patch \
>>> >             file://CVE-2025-6395.patch \
>>> >             file://CVE-2025-9820.patch \
>>> > +           file://CVE-2025-14831-1.patch \
>>> > +           file://CVE-2025-14831-2.patch \
>>> > +           file://CVE-2025-14831-3.patch \
>>> > +           file://CVE-2025-14831-4.patch \
>>> > +           file://CVE-2025-14831-5.patch \
>>> > +           file://CVE-2025-14831-6.patch \
>>> > +           file://CVE-2025-14831-7.patch \
>>> > +           file://CVE-2025-14831-8.patch \
>>> > +           file://CVE-2025-14831-9.patch \
>>> >             "
>>> >
>>> >  SRC_URI[sha256sum] =3D
>>> "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
>>>
>>>
>>> --
>>> Yoann Congal
>>> Smile ECS
>>>
>>>
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


