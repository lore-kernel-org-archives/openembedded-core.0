Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2158EFB7F7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 04:26:17 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13504.1771907170492513669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 20:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aG93T2xE;
 spf=pass (domain: mvista.com, ip: 209.85.218.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8d7f22d405so798534966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 20:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771907169; cv=none;
        d=google.com; s=arc-20240605;
        b=UgbQ955TB1duGQNjqebBT/W8SD+0QqRFDvi1ndCjdrO2X/sjJzejo7O14/l8GvvsY/
         csKTlB53iGMvRW08RqoTM4eOmpSi47m9cEUHSQXuim5TyDIKQWqyODxomp3jIWMzAZEa
         lUL0vD5sXT1g5d6EA6A6KDknZNZ+0DdiARLtGCjSfrszOgZuj6iCKBSyQXRxwWV2noEe
         ojg+DehhDhWyPrgx27W0+lKunicpFip9wvz8MrLTV1FnFlnWKPTC/faf0ukGkvfSBc7a
         HnzVZXJbJSMzudMXzjiavxCWHwLXVFjoHh+g/JqtXDd/23uQn+RG9HTg+9zK9fGBrSbW
         +B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8LI5OjQMnGdYM2UoJ1G85NUwyNz1ZA7uSMoR1YKsbPQ=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=hkF0DdiMHhnA/UGToU+CT0idPViHr4Fazw+t48Z2tIXkf5zJUOcXbkoVdEq061OQn7
         sOMuqMon33ColhMjVfQvASjnpIE3kPJIzFmIv7h9We5Bi9Q6XJFzCAfdV+I/n5EDBDUj
         hWcdMjh5MllDZxDs5zwv2sxTeY877QQAlAv9aX2Goj7chefJMTRPgcmBcUoJmvnQYnrZ
         AOTOa2CCfWcZqndMZYunftsbdVvcP+Q+WaJoV5Mr3wnRQFoxMHrf426VOLrrdPe/1eHR
         iy1MvoM9WUv1AMfa8a7xHwpWgfOLU210CV07YhFXIZ61ez5BigVbqKHAf80uV0UcQ20m
         a3Kg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771907169; x=1772511969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8LI5OjQMnGdYM2UoJ1G85NUwyNz1ZA7uSMoR1YKsbPQ=;
        b=aG93T2xE5M5Ot2oi8GI2cwJ4U53Ru9Qm7q3qv9H+XefHbRNog0LzehGTNyVb/rTtXT
         iEhpqSsnzIPwymJG8wxwV0afR64BHTNH585ezChcRrq0c6ie8cxGT+Ttu5V0gCn7m+6X
         dMlqN8k8JxLqABcZqe5qWZT55LEORawxSWi2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907169; x=1772511969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LI5OjQMnGdYM2UoJ1G85NUwyNz1ZA7uSMoR1YKsbPQ=;
        b=Zhm+kxWDBTfsrueqChwbEj83vfePHVqO4YsfUIOl7d1MGdC9IpB3qKBVfUTiL1dh+v
         yOSDvlHNlkbLEXhsoqEPs+RATNPbcPydZgKJO2QXXXsWZZ7LtkEVmXOy0A/irp34fXE8
         bIhqMneG0r8vRLLTOu8TiUVEXSV6wGpm14E2tLfQ/xQVXRVclMiusMHtiKMF4G1TqHb3
         c8EgkVPZhMwcQzfVLJcU0yNhVpDcFHWU0R3h2mnHOX8VYiUkfqu0mdGcOHUa+vP7OGuk
         gLobHmC4KZgBiGDb2Rddnm4Mq8kVLIT6L5PopXvzWXWlAzsPAs4Tgv8E0trEnsd1d/08
         H35g==
X-Gm-Message-State: AOJu0Yzk4vNg7tI+VcjWVPpjT2H0gQA55bOJjpe4LXGw3OhqQzVbg6ZL
	j+P7EKwIIW1zdWilSD/tXSD0cWhnrsl1WOKlUlatkaowGP47dCSZCR2WVxOBquffrdbhRZs9vYD
	X8zBQ0gZMOFFhiMmcSidz6zbUG/x9UangVzOLRkv+eg==
X-Gm-Gg: AZuq6aIIHY9DWU1L8I93qWt//wYgL1M9WPyvxR+pcnEtDD8moFwpSVjxjvajuQmcNeG
	Mz9qIJ1WK3IcAMs0C1Sm/aUL5I5yuDllBue/EmgLeURRed5e08gdCluTbBY98KPD0debS2cUXWs
	i5I1gHub/NgQf57SmAtf0EM6AMos7e+Nck1aGS8NJuxjv2rS9PWc79LEZWvzbkVoP3oXW3FYKqu
	/yY0HvPIzbjc+avRz4Ky0WuV42MpMz+HRbTKjRCJKN5fGwaLwesMTwRmFO0rDbM08Y5+tg8vQ4l
	zjEO0dalTXYvlaciGP0YSw7e0I2A/FdIE+f11y+CxYGhCiyGcw==
X-Received: by 2002:a17:907:7f9e:b0:b8e:d4ed:5ee8 with SMTP id
 a640c23a62f3a-b9081972e42mr606441166b.12.1771907168109; Mon, 23 Feb 2026
 20:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20260217081454.864791-1-vanusuri@mvista.com> <DGH47ONU1OJ3.289ICU6CP597J@smile.fr>
In-Reply-To: <DGH47ONU1OJ3.289ICU6CP597J@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 24 Feb 2026 09:55:55 +0530
X-Gm-Features: AaiRm51JNBk9xwvnLUwR3lGuXYOapYu7ecIfJatzSMLYxAkTKkJx7EJolxCQ1eA
Message-ID: <CANQUz185OOq3hJoDsOgdj326DeTg85BHJcmo_Qp1okJEZbKTxA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] gnutls: Fix CVE-2025-14831
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000549c6a064b8a496e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 04:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231741

--000000000000549c6a064b8a496e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I will send it for Whinlatter soon.
I couldn't see this patch in scarthgap-nut. Any update on this?

Thanks & Regards,
Vijay



On Tue, Feb 17, 2026 at 2:34=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Tue Feb 17, 2026 at 9:14 AM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Picked commits which mentions this CVE per [1].
> >
> > [1] https://ubuntu.com/security/CVE-2025-14831
> > [2] https://security-tracker.debian.org/tracker/CVE-2025-14831
> > [3] https://gitlab.com/gnutls/gnutls/-/issues/1773
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../gnutls/gnutls/CVE-2025-14831-1.patch      |  61 +++
> >  .../gnutls/gnutls/CVE-2025-14831-2.patch      |  30 ++
> >  .../gnutls/gnutls/CVE-2025-14831-3.patch      |  45 ++
> >  .../gnutls/gnutls/CVE-2025-14831-4.patch      | 200 +++++++
> >  .../gnutls/gnutls/CVE-2025-14831-5.patch      | 500 ++++++++++++++++++
> >  .../gnutls/gnutls/CVE-2025-14831-6.patch      | 119 +++++
> >  .../gnutls/gnutls/CVE-2025-14831-7.patch      | 150 ++++++
> >  .../gnutls/gnutls/CVE-2025-14831-8.patch      | 105 ++++
> >  .../gnutls/gnutls/CVE-2025-14831-9.patch      | 437 +++++++++++++++
> >  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   9 +
> >  10 files changed, 1656 insertions(+)
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
>
> Hello,
>
> It looks like these patches are also needed for whinlatter.
> Can you send this fix for whinlatter?
>
> Thanks!
>
> >
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
> > new file mode 100644
> > index 0000000000..ae52a43a2c
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
> > @@ -0,0 +1,61 @@
> > +From 0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Mon, 26 Jan 2026 19:02:27 +0100
> > +Subject: [PATCH] x509/name_constraints: use actual zeroes in universal
> exclude
> > + IP NC
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/0b2377dfccd99be641bf3f1a0de9f0d=
c8dc0d4b1
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 9 +++++----
> > + 1 file changed, 5 insertions(+), 4 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -61,7 +61,7 @@ struct gnutls_name_constraints_st {
> > +
> > + static struct name_constraints_node_st *
> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned
> type,
> > +-                      unsigned char *data, unsigned int size);
> > ++                      const unsigned char *data, unsigned int size);
> > +
> > + static int
> > + name_constraints_node_list_add(struct name_constraints_node_list_st
> *list,
> > +@@ -285,7 +285,7 @@ static void name_constraints_node_free(s
> > +  -*/
> > + static struct name_constraints_node_st *
> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned
> type,
> > +-                      unsigned char *data, unsigned int size)
> > ++                      const unsigned char *data, unsigned int size)
> > + {
> > +     struct name_constraints_node_st *tmp;
> > +     int ret;
> > +@@ -339,6 +339,7 @@ static int name_constraints_node_list_in
> > +     struct name_constraints_node_list_st removed =3D { .data =3D NULL=
,
> > +                                                      .size =3D 0,
> > +                                                      .capacity =3D 0 =
};
> > ++    static const unsigned char universal_ip[32] =3D { 0 };
> > +
> > +     /* temporary array to see, if we need to add universal excluded
> constraints
> > +      * (see phase 3 for details)
> > +@@ -471,7 +472,7 @@ static int name_constraints_node_list_in
> > +             case GNUTLS_SAN_IPADDRESS:
> > +                     // add universal restricted range for IPv4
> > +                     tmp =3D name_constraints_node_new(
> > +-                            nc, GNUTLS_SAN_IPADDRESS, NULL, 8);
> > ++                            nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8=
);
> > +                     if (tmp =3D=3D NULL) {
> > +                             gnutls_assert();
> > +                             ret =3D GNUTLS_E_MEMORY_ERROR;
> > +@@ -484,7 +485,7 @@ static int name_constraints_node_list_in
> > +                     }
> > +                     // add universal restricted range for IPv6
> > +                     tmp =3D name_constraints_node_new(
> > +-                            nc, GNUTLS_SAN_IPADDRESS, NULL, 32);
> > ++                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,
> 32);
> > +                     if (tmp =3D=3D NULL) {
> > +                             gnutls_assert();
> > +                             ret =3D GNUTLS_E_MEMORY_ERROR;
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
> > new file mode 100644
> > index 0000000000..0d34032554
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
> > @@ -0,0 +1,30 @@
> > +From 85d6348a30c74d4ee3710e0f4652f634eaad6914 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Mon, 26 Jan 2026 19:10:58 +0100
> > +Subject: [PATCH] tests/name-constraints-ip: stop swallowing errors...
> > +
> > +... now when it started to pass
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/85d6348a30c74d4ee3710e0f4652f63=
4eaad6914
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + tests/name-constraints-ip.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/tests/name-constraints-ip.c b/tests/name-constraints-ip.c
> > +index 7a196088dc..a0cf172b7f 100644
> > +--- a/tests/name-constraints-ip.c
> > ++++ b/tests/name-constraints-ip.c
> > +@@ -772,5 +772,5 @@ int main(int argc, char **argv)
> > +             cmocka_unit_test_setup_teardown(
> > +                     check_ipv4v6_single_constraint_each, setup,
> teardown)
> > +     };
> > +-    cmocka_run_group_tests(tests, NULL, NULL);
> > ++    return cmocka_run_group_tests(tests, NULL, NULL);
> > + }
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
> > new file mode 100644
> > index 0000000000..ed4a7da3c7
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
> > @@ -0,0 +1,45 @@
> > +From c28475413f82e1f34295d5c039f0c0a4ca2ee526 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Mon, 26 Jan 2026 20:14:33 +0100
> > +Subject: [PATCH] x509/name_constraints: reject some malformed domain
> names
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/c28475413f82e1f34295d5c039f0c0a=
4ca2ee526
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 17 +++++++++++++++++
> > + 1 file changed, 17 insertions(+)
> > +
> > +diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
> > +index d07482e3c9..9783d92851 100644
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -159,6 +159,23 @@ static int
> validate_name_constraints_node(gnutls_x509_subject_alt_name_t type,
> > +                     return gnutls_assert_val(GNUTLS_E_MALFORMED_CIDR)=
;
> > +     }
> > +
> > ++    /* Validate DNS names and email addresses for malformed input */
> > ++    if (type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_RFC8=
22NAME) {
> > ++            unsigned int i;
> > ++            if (name->size =3D=3D 0)
> > ++                    return GNUTLS_E_SUCCESS;
> > ++
> > ++            /* reject names with consecutive dots... */
> > ++            for (i =3D 0; i + 1 < name->size; i++) {
> > ++                    if (name->data[i] =3D=3D '.' && name->data[i + 1]=
 =3D=3D
> '.')
> > ++                            return gnutls_assert_val(
> > ++                                    GNUTLS_E_ILLEGAL_PARAMETER);
> > ++            }
> > ++            /* ... or names consisting exclusively of dots */
> > ++            if (name->size =3D=3D 1 && name->data[0] =3D=3D '.')
> > ++                    return
> gnutls_assert_val(GNUTLS_E_ILLEGAL_PARAMETER);
> > ++    }
> > ++
> > +     return GNUTLS_E_SUCCESS;
> > + }
> > +
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
> > new file mode 100644
> > index 0000000000..99ec9c5e9a
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
> > @@ -0,0 +1,200 @@
> > +From 6db7da7fcfe230f445b1edbb56e2a8346120c891 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Thu, 5 Feb 2026 13:22:10 +0100
> > +Subject: [PATCH] x509/name_constraints:
> name_constraints_node_add_{new,copy}
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/6db7da7fcfe230f445b1edbb56e2a83=
46120c891
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 112 ++++++++++++++++-------------------=
-
> > + 1 file changed, 51 insertions(+), 61 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -86,6 +86,38 @@ name_constraints_node_list_add(struct na
> > +     return 0;
> > + }
> > +
> > ++static int
> > ++name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
> > ++                          struct name_constraints_node_list_st *list,
> > ++                          unsigned type, const unsigned char *data,
> > ++                          unsigned int size)
> > ++{
> > ++    struct name_constraints_node_st *node;
> > ++    int ret;
> > ++    node =3D name_constraints_node_new(nc, type, data, size);
> > ++    if (node =3D=3D NULL) {
> > ++            gnutls_assert();
> > ++            return GNUTLS_E_MEMORY_ERROR;
> > ++    }
> > ++    ret =3D name_constraints_node_list_add(list, node);
> > ++    if (ret < 0) {
> > ++            gnutls_assert();
> > ++            return ret;
> > ++    }
> > ++    return GNUTLS_E_SUCCESS;
> > ++}
> > ++
> > ++static int
> > ++name_constraints_node_add_copy(gnutls_x509_name_constraints_t nc,
> > ++                           struct name_constraints_node_list_st *dest=
,
> > ++                           const struct name_constraints_node_st *src=
)
> > ++{
> > ++    if (!src)
> > ++            return gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
> > ++    return name_constraints_node_add_new(nc, dest, src->type,
> > ++                                         src->name.data,
> src->name.size);
> > ++}
> > ++
> > + // for documentation see the implementation
> > + static int name_constraints_intersect_nodes(
> > +     gnutls_x509_name_constraints_t nc,
> > +@@ -188,7 +220,6 @@ static int extract_name_constraints(gnut
> > +     unsigned indx;
> > +     gnutls_datum_t tmp =3D { NULL, 0 };
> > +     unsigned int type;
> > +-    struct name_constraints_node_st *node;
> > +
> > +     for (indx =3D 1;; indx++) {
> > +             snprintf(tmpstr, sizeof(tmpstr), "%s.?%u.base", vstr,
> indx);
> > +@@ -231,15 +262,9 @@ static int extract_name_constraints(gnut
> > +                     goto cleanup;
> > +             }
> > +
> > +-            node =3D name_constraints_node_new(nc, type, tmp.data,
> tmp.size);
> > ++            ret =3D name_constraints_node_add_new(nc, nodes, type,
> tmp.data,
> > ++                                                tmp.size);
> > +             _gnutls_free_datum(&tmp);
> > +-            if (node =3D=3D NULL) {
> > +-                    gnutls_assert();
> > +-                    ret =3D GNUTLS_E_MEMORY_ERROR;
> > +-                    goto cleanup;
> > +-            }
> > +-
> > +-            ret =3D name_constraints_node_list_add(nodes, node);
> > +             if (ret < 0) {
> > +                     gnutls_assert();
> > +                     goto cleanup;
> > +@@ -459,14 +484,7 @@ static int name_constraints_node_list_in
> > +             // Beware: also copies nodes other than DNS, email, IP,
> > +             //       since their counterpart may have been moved in
> phase 1.
> > +             if (!used) {
> > +-                    tmp =3D name_constraints_node_new(
> > +-                            nc, t2->type, t2->name.data,
> t2->name.size);
> > +-                    if (tmp =3D=3D NULL) {
> > +-                            gnutls_assert();
> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
> > +-                            goto cleanup;
> > +-                    }
> > +-                    ret =3D name_constraints_node_list_add(permitted,
> tmp);
> > ++                    ret =3D name_constraints_node_add_copy(nc,
> permitted, t2);
> > +                     if (ret < 0) {
> > +                             gnutls_assert();
> > +                             goto cleanup;
> > +@@ -488,27 +506,17 @@ static int name_constraints_node_list_in
> > +             switch (type) {
> > +             case GNUTLS_SAN_IPADDRESS:
> > +                     // add universal restricted range for IPv4
> > +-                    tmp =3D name_constraints_node_new(
> > +-                            nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8=
);
> > +-                    if (tmp =3D=3D NULL) {
> > +-                            gnutls_assert();
> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
> > +-                            goto cleanup;
> > +-                    }
> > +-                    ret =3D name_constraints_node_list_add(excluded,
> tmp);
> > ++                    ret =3D name_constraints_node_add_new(
> > ++                            nc, excluded, GNUTLS_SAN_IPADDRESS,
> > ++                            universal_ip, 8);
> > +                     if (ret < 0) {
> > +                             gnutls_assert();
> > +                             goto cleanup;
> > +                     }
> > +                     // add universal restricted range for IPv6
> > +-                    tmp =3D name_constraints_node_new(
> > +-                            nc, GNUTLS_SAN_IPADDRESS, universal_ip,
> 32);
> > +-                    if (tmp =3D=3D NULL) {
> > +-                            gnutls_assert();
> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
> > +-                            goto cleanup;
> > +-                    }
> > +-                    ret =3D name_constraints_node_list_add(excluded,
> tmp);
> > ++                    ret =3D name_constraints_node_add_new(
> > ++                            nc, excluded, GNUTLS_SAN_IPADDRESS,
> > ++                            universal_ip, 32);
> > +                     if (ret < 0) {
> > +                             gnutls_assert();
> > +                             goto cleanup;
> > +@@ -516,13 +524,8 @@ static int name_constraints_node_list_in
> > +                     break;
> > +             case GNUTLS_SAN_DNSNAME:
> > +             case GNUTLS_SAN_RFC822NAME:
> > +-                    tmp =3D name_constraints_node_new(nc, type, NULL,=
 0);
> > +-                    if (tmp =3D=3D NULL) {
> > +-                            gnutls_assert();
> > +-                            ret =3D GNUTLS_E_MEMORY_ERROR;
> > +-                            goto cleanup;
> > +-                    }
> > +-                    ret =3D name_constraints_node_list_add(excluded,
> tmp);
> > ++                    ret =3D name_constraints_node_add_new(nc, exclude=
d,
> type,
> > ++                                                        NULL, 0);
> > +                     if (ret < 0) {
> > +                             gnutls_assert();
> > +                             goto cleanup;
> > +@@ -544,20 +547,13 @@ static int name_constraints_node_list_co
> > +     struct name_constraints_node_list_st *nodes,
> > +     const struct name_constraints_node_list_st *nodes2)
> > + {
> > ++    int ret;
> > ++
> > +     for (size_t i =3D 0; i < nodes2->size; i++) {
> > +-            const struct name_constraints_node_st *node =3D
> nodes2->data[i];
> > +-            struct name_constraints_node_st *tmp;
> > +-            int ret;
> > +-
> > +-            tmp =3D name_constraints_node_new(nc, node->type,
> node->name.data,
> > +-                                            node->name.size);
> > +-            if (tmp =3D=3D NULL) {
> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
> > +-            }
> > +-            ret =3D name_constraints_node_list_add(nodes, tmp);
> > ++            ret =3D name_constraints_node_add_copy(nc, nodes,
> > ++                                                 nodes2->data[i]);
> > +             if (ret < 0) {
> > +-                    name_constraints_node_free(tmp);
> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
> > ++                    return gnutls_assert_val(ret);
> > +             }
> > +     }
> > +
> > +@@ -687,7 +683,6 @@ static int name_constraints_add(gnutls_x
> > +                             gnutls_x509_subject_alt_name_t type,
> > +                             const gnutls_datum_t *name, unsigned
> permitted)
> > + {
> > +-    struct name_constraints_node_st *tmp;
> > +     struct name_constraints_node_list_st *nodes;
> > +     int ret;
> > +
> > +@@ -697,15 +692,10 @@ static int name_constraints_add(gnutls_x
> > +
> > +     nodes =3D permitted ? &nc->permitted : &nc->excluded;
> > +
> > +-    tmp =3D name_constraints_node_new(nc, type, name->data, name->siz=
e);
> > +-    if (tmp =3D=3D NULL)
> > +-            return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
> > +-
> > +-    ret =3D name_constraints_node_list_add(nodes, tmp);
> > +-    if (ret < 0) {
> > +-            name_constraints_node_free(tmp);
> > ++    ret =3D name_constraints_node_add_new(nc, nodes, type, name->data=
,
> > ++                                        name->size);
> > ++    if (ret < 0)
> > +             return gnutls_assert_val(ret);
> > +-    }
> > +
> > +     return 0;
> > + }
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
> > new file mode 100644
> > index 0000000000..7c5ffdf6d8
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
> > @@ -0,0 +1,500 @@
> > +From 094accd3ebec17ead6c391757eaa18763b72d83f Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Mon, 26 Jan 2026 20:16:36 +0100
> > +Subject: [PATCH] x509/name_constraints: introduce a rich comparator
> > +
> > +These are preparatory changes before implementing N * log N intersecti=
on
> > +over sorted lists of constraints.
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/094accd3ebec17ead6c391757eaa187=
63b72d83f
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 411 ++++++++++++++++++++++++++++-------=
-
> > + 1 file changed, 320 insertions(+), 91 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -39,6 +39,9 @@
> > + #include "ip.h"
> > + #include "ip-in-cidr.h"
> > + #include "intprops.h"
> > ++#include "minmax.h"
> > ++
> > ++#include <string.h>
> > +
> > + #define MAX_NC_CHECKS (1 << 20)
> > +
> > +@@ -63,6 +66,282 @@ static struct name_constraints_node_st *
> > + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigned
> type,
> > +                       const unsigned char *data, unsigned int size);
> > +
> > ++/* An enum for "rich" comparisons that not only let us sort name
> constraints,
> > ++ * children-before-parent, but also subsume them during intersection.
> */
> > ++enum name_constraint_relation {
> > ++    NC_SORTS_BEFORE =3D -2, /* unrelated constraints */
> > ++    NC_INCLUDED_BY =3D -1, /* nc1 is included by nc2 / children sort
> first */
> > ++    NC_EQUAL =3D 0, /* exact match */
> > ++    NC_INCLUDES =3D 1, /* nc1 includes nc2 / parents sort last */
> > ++    NC_SORTS_AFTER =3D 2 /* unrelated constraints */
> > ++};
> > ++
> > ++/* A helper to compare just a pair of strings with this rich
> comparison */
> > ++static enum name_constraint_relation
> > ++compare_strings(const void *n1, size_t n1_len, const void *n2, size_t
> n2_len)
> > ++{
> > ++    int r =3D memcmp(n1, n2, MIN(n1_len, n2_len));
> > ++    if (r < 0)
> > ++            return NC_SORTS_BEFORE;
> > ++    if (r > 0)
> > ++            return NC_SORTS_AFTER;
> > ++    if (n1_len < n2_len)
> > ++            return NC_SORTS_BEFORE;
> > ++    if (n1_len > n2_len)
> > ++            return NC_SORTS_AFTER;
> > ++    return NC_EQUAL;
> > ++}
> > ++
> > ++/* Rich-compare DNS names. Example order/relationships:
> > ++ * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE
> y.b */
> > ++static enum name_constraint_relation compare_dns_names(const
> gnutls_datum_t *n1,
> > ++                                                   const
> gnutls_datum_t *n2)
> > ++{
> > ++    enum name_constraint_relation rel;
> > ++    unsigned int i, j, i_end, j_end;
> > ++
> > ++    /* start from the end of each name */
> > ++    i =3D i_end =3D n1->size;
> > ++    j =3D j_end =3D n2->size;
> > ++
> > ++    /* skip the trailing dots for the comparison */
> > ++    while (i && n1->data[i - 1] =3D=3D '.')
> > ++            i_end =3D i =3D i - 1;
> > ++    while (j && n2->data[j - 1] =3D=3D '.')
> > ++            j_end =3D j =3D j - 1;
> > ++
> > ++    while (1) {
> > ++            // rewind back to beginning or an after-dot position
> > ++            while (i && n1->data[i - 1] !=3D '.')
> > ++                    i--;
> > ++            while (j && n2->data[j - 1] !=3D '.')
> > ++                    j--;
> > ++
> > ++            rel =3D compare_strings(&n1->data[i], i_end - i,
> &n2->data[j],
> > ++                                  j_end - j);
> > ++            if (rel =3D=3D NC_SORTS_BEFORE) /* x.a BEFORE y.a */
> > ++                    return NC_SORTS_BEFORE;
> > ++            if (rel =3D=3D NC_SORTS_AFTER) /* y.a AFTER x.a */
> > ++                    return NC_SORTS_AFTER;
> > ++            if (!i && j) /* x.a INCLUDES z.x.a */
> > ++                    return NC_INCLUDES;
> > ++            if (i && !j) /* z.x.a INCLUDED_BY x.a */
> > ++                    return NC_INCLUDED_BY;
> > ++
> > ++            if (!i && !j) /* r =3D=3D 0, we ran out of components to
> compare */
> > ++                    return NC_EQUAL;
> > ++            /* r =3D=3D 0, i && j: step back past a dot and keep comp=
aring
> */
> > ++            i_end =3D i =3D i - 1;
> > ++            j_end =3D j =3D j - 1;
> > ++
> > ++            /* support for non-standard ".gr INCLUDES example.gr" [1]
> */
> > ++            if (!i && j) /* .a INCLUDES x.a */
> > ++                    return NC_INCLUDES;
> > ++            if (i && !j) /* x.a INCLUDED_BY .a */
> > ++                    return NC_INCLUDED_BY;
> > ++    }
> > ++}
> > ++/* [1]
> https://mailarchive.ietf.org/arch/msg/saag/Bw6PtreW0G7aEG7SikfzKHES4VA */
> > ++
> > ++/* Rich-compare email name constraints. Example order/relationships:
> > ++ * z@x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x@b BEFORE
> y@b */
> > ++static enum name_constraint_relation compare_emails(const
> gnutls_datum_t *n1,
> > ++                                                const gnutls_datum_t
> *n2)
> > ++{
> > ++    enum name_constraint_relation domains_rel;
> > ++    unsigned int i, j, i_end, j_end;
> > ++    gnutls_datum_t d1, d2; /* borrow from n1 and n2 */
> > ++
> > ++    /* start from the end of each name */
> > ++    i =3D i_end =3D n1->size;
> > ++    j =3D j_end =3D n2->size;
> > ++
> > ++    /* rewind to @s to look for domains */
> > ++    while (i && n1->data[i - 1] !=3D '@')
> > ++            i--;
> > ++    d1.size =3D i_end - i;
> > ++    d1.data =3D &n1->data[i];
> > ++    while (j && n2->data[j - 1] !=3D '@')
> > ++            j--;
> > ++    d2.size =3D j_end - j;
> > ++    d2.data =3D &n2->data[j];
> > ++
> > ++    domains_rel =3D compare_dns_names(&d1, &d2);
> > ++
> > ++    /* email constraint semantics differ from DNS
> > ++     * DNS: x.a INCLUDED_BY a
> > ++     * Email: x.a INCLUDED_BY .a BEFORE a */
> > ++    if (domains_rel =3D=3D NC_INCLUDED_BY || domains_rel =3D=3D NC_IN=
CLUDES) {
> > ++            bool d1_has_dot =3D (d1.size > 0 && d1.data[0] =3D=3D '.'=
);
> > ++            bool d2_has_dot =3D (d2.size > 0 && d2.data[0] =3D=3D '.'=
);
> > ++            /* a constraint without a dot is exact, excluding
> subdomains */
> > ++            if (!d2_has_dot && domains_rel =3D=3D NC_INCLUDED_BY)
> > ++                    domains_rel =3D NC_SORTS_BEFORE; /* x.a BEFORE a =
*/
> > ++            if (!d1_has_dot && domains_rel =3D=3D NC_INCLUDES)
> > ++                    domains_rel =3D NC_SORTS_AFTER; /* a AFTER x.a */
> > ++    }
> > ++
> > ++    if (!i && !j) { /* both are domains-only */
> > ++            return domains_rel;
> > ++    } else if (i && !j) { /* n1 is email, n2 is domain */
> > ++            switch (domains_rel) {
> > ++            case NC_SORTS_AFTER:
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_SORTS_BEFORE:
> > ++                    return NC_SORTS_BEFORE;
> > ++            case NC_INCLUDES: /* n2 is more specific, a@x.a AFTER
> z.x.a */
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_EQUAL: /* subdomains match, z@x.a INCLUDED_BY x.a
> */
> > ++            case NC_INCLUDED_BY: /* n1 is more specific */
> > ++                    return NC_INCLUDED_BY;
> > ++            }
> > ++    } else if (!i && j) { /* n1 is domain, n2 is email */
> > ++            switch (domains_rel) {
> > ++            case NC_SORTS_AFTER:
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_SORTS_BEFORE:
> > ++                    return NC_SORTS_BEFORE;
> > ++            case NC_INCLUDES: /* n2 is more specific, a AFTER z@x.a *=
/
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_EQUAL: /* subdomains match, x.a INCLUDES z@x.a */
> > ++                    return NC_INCLUDES;
> > ++            case NC_INCLUDED_BY: /* n1 is more specific, x.a BEFORE z=
@a
> */
> > ++                    return NC_SORTS_BEFORE;
> > ++            }
> > ++    } else if (i && j) { /* both are emails */
> > ++            switch (domains_rel) {
> > ++            case NC_SORTS_AFTER:
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_SORTS_BEFORE:
> > ++                    return NC_SORTS_BEFORE;
> > ++            case NC_INCLUDES: // n2 is more specific
> > ++                    return NC_SORTS_AFTER;
> > ++            case NC_INCLUDED_BY: // n1 is more specific
> > ++                    return NC_SORTS_BEFORE;
> > ++            case NC_EQUAL: // only case when we need to look before
> the @
> > ++                    break; // see below for readability
> > ++            }
> > ++    }
> > ++
> > ++    /* i && j, both are emails, domain names match, compare up to @ *=
/
> > ++    return compare_strings(n1->data, i - 1, n2->data, j - 1);
> > ++}
> > ++
> > ++/* Rich-compare IP address constraints. Example order/relationships:
> > ++ * 10.0.0.0/24 INCLUDED_BY 10.0.0.0/16 BEFORE 1::1/128 INCLUDED_BY
> 1::1/127 */
> > ++static enum name_constraint_relation compare_ip_ncs(const
> gnutls_datum_t *n1,
> > ++                                                const gnutls_datum_t
> *n2)
> > ++{
> > ++    unsigned int len, i;
> > ++    int r;
> > ++    const unsigned char *ip1, *ip2, *mask1, *mask2;
> > ++    unsigned char masked11[16], masked22[16], masked12[16],
> masked21[16];
> > ++
> > ++    if (n1->size < n2->size)
> > ++            return NC_SORTS_BEFORE;
> > ++    if (n1->size > n2->size)
> > ++            return NC_SORTS_AFTER;
> > ++    len =3D n1->size / 2; /* 4 for IPv4, 16 for IPv6 */
> > ++
> > ++    /* data is a concatenation of prefix and mask */
> > ++    ip1 =3D n1->data;
> > ++    ip2 =3D n2->data;
> > ++    mask1 =3D n1->data + len;
> > ++    mask2 =3D n2->data + len;
> > ++    for (i =3D 0; i < len; i++) {
> > ++            masked11[i] =3D ip1[i] & mask1[i];
> > ++            masked22[i] =3D ip2[i] & mask2[i];
> > ++            masked12[i] =3D ip1[i] & mask2[i];
> > ++            masked21[i] =3D ip2[i] & mask1[i];
> > ++    }
> > ++
> > ++    r =3D memcmp(mask1, mask2, len);
> > ++    if (r < 0 && !memcmp(masked11, masked21, len)) /* prefix1 <
> prefix2 */
> > ++            return NC_INCLUDES; /* ip1 & mask1 =3D=3D ip2 & mask1 */
> > ++    if (r > 0 && !memcmp(masked12, masked22, len)) /* prefix1 >
> prefix2 */
> > ++            return NC_INCLUDED_BY; /* ip1 & mask2 =3D=3D ip2 & mask2 =
*/
> > ++
> > ++    r =3D memcmp(masked11, masked22, len);
> > ++    if (r < 0)
> > ++            return NC_SORTS_BEFORE;
> > ++    else if (r > 0)
> > ++            return NC_SORTS_AFTER;
> > ++    return NC_EQUAL;
> > ++}
> > ++
> > ++static inline bool is_supported_type(unsigned type)
> > ++{
> > ++    return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_R=
FC822NAME
> ||
> > ++           type =3D=3D GNUTLS_SAN_IPADDRESS;
> > ++}
> > ++
> > ++/* Universal comparison for name constraint nodes.
> > ++ * Unsupported types sort before supported types to allow early
> handling.
> > ++ * NULL represents end-of-list and sorts after everything else. */
> > ++static enum name_constraint_relation
> > ++compare_name_constraint_nodes(const struct name_constraints_node_st
> *n1,
> > ++                          const struct name_constraints_node_st *n2)
> > ++{
> > ++    bool n1_supported, n2_supported;
> > ++
> > ++    if (!n1 && !n2)
> > ++            return NC_EQUAL;
> > ++    if (!n1)
> > ++            return NC_SORTS_AFTER;
> > ++    if (!n2)
> > ++            return NC_SORTS_BEFORE;
> > ++
> > ++    n1_supported =3D is_supported_type(n1->type);
> > ++    n2_supported =3D is_supported_type(n2->type);
> > ++
> > ++    /* unsupported types bubble up (sort first). intersect relies on
> this */
> > ++    if (!n1_supported && n2_supported)
> > ++            return NC_SORTS_BEFORE;
> > ++    if (n1_supported && !n2_supported)
> > ++            return NC_SORTS_AFTER;
> > ++
> > ++    /* next, sort by type */
> > ++    if (n1->type < n2->type)
> > ++            return NC_SORTS_BEFORE;
> > ++    if (n1->type > n2->type)
> > ++            return NC_SORTS_AFTER;
> > ++
> > ++    /* now look deeper */
> > ++    switch (n1->type) {
> > ++    case GNUTLS_SAN_DNSNAME:
> > ++            return compare_dns_names(&n1->name, &n2->name);
> > ++    case GNUTLS_SAN_RFC822NAME:
> > ++            return compare_emails(&n1->name, &n2->name);
> > ++    case GNUTLS_SAN_IPADDRESS:
> > ++            return compare_ip_ncs(&n1->name, &n2->name);
> > ++    default:
> > ++            /* unsupported types: stable lexicographic order */
> > ++            return compare_strings(n1->name.data, n1->name.size,
> > ++                                   n2->name.data, n2->name.size);
> > ++    }
> > ++}
> > ++
> > ++/* qsort-compatible wrapper */
> > ++static int compare_name_constraint_nodes_qsort(const void *a, const
> void *b)
> > ++{
> > ++    const struct name_constraints_node_st *const *n1 =3D a;
> > ++    const struct name_constraints_node_st *const *n2 =3D b;
> > ++    enum name_constraint_relation rel;
> > ++
> > ++    rel =3D compare_name_constraint_nodes(*n1, *n2);
> > ++    switch (rel) {
> > ++    case NC_SORTS_BEFORE:
> > ++    case NC_INCLUDED_BY:
> > ++            return -1;
> > ++    case NC_SORTS_AFTER:
> > ++    case NC_INCLUDES:
> > ++            return 1;
> > ++    case NC_EQUAL:
> > ++    default:
> > ++            return 0;
> > ++    }
> > ++}
> > ++
> > + static int
> > + name_constraints_node_list_add(struct name_constraints_node_list_st
> *list,
> > +                            struct name_constraints_node_st *node)
> > +@@ -420,9 +699,7 @@ static int name_constraints_node_list_in
> > +                     }
> > +             }
> > +
> > +-            if (found !=3D NULL && (t->type =3D=3D GNUTLS_SAN_DNSNAME=
 ||
> > +-                                  t->type =3D=3D GNUTLS_SAN_RFC822NAM=
E ||
> > +-                                  t->type =3D=3D GNUTLS_SAN_IPADDRESS=
)) {
> > ++            if (found !=3D NULL && is_supported_type(t->type)) {
> > +                     /* move node from PERMITTED to REMOVED */
> > +                     ret =3D name_constraints_node_list_add(&removed, =
t);
> > +                     if (ret < 0) {
> > +@@ -824,61 +1101,14 @@ cleanup:
> > +     return ret;
> > + }
> > +
> > +-static unsigned ends_with(const gnutls_datum_t *str,
> > +-                      const gnutls_datum_t *suffix)
> > +-{
> > +-    unsigned char *tree;
> > +-    unsigned int treelen;
> > +-
> > +-    if (suffix->size >=3D str->size)
> > +-            return 0;
> > +-
> > +-    tree =3D suffix->data;
> > +-    treelen =3D suffix->size;
> > +-    if ((treelen > 0) && (tree[0] =3D=3D '.')) {
> > +-            tree++;
> > +-            treelen--;
> > +-    }
> > +-
> > +-    if (memcmp(str->data + str->size - treelen, tree, treelen) =3D=3D=
 0 &&
> > +-        str->data[str->size - treelen - 1] =3D=3D '.')
> > +-            return 1; /* match */
> > +-
> > +-    return 0;
> > +-}
> > +-
> > +-static unsigned email_ends_with(const gnutls_datum_t *str,
> > +-                            const gnutls_datum_t *suffix)
> > +-{
> > +-    if (suffix->size >=3D str->size) {
> > +-            return 0;
> > +-    }
> > +-
> > +-    if (suffix->size > 0 && memcmp(str->data + str->size -
> suffix->size,
> > +-                                   suffix->data, suffix->size) !=3D 0=
) {
> > +-            return 0;
> > +-    }
> > +-
> > +-    if (suffix->size > 1 && suffix->data[0] =3D=3D '.') { /* .domain.=
com
> */
> > +-            return 1; /* match */
> > +-    } else if (str->data[str->size - suffix->size - 1] =3D=3D '@') {
> > +-            return 1; /* match */
> > +-    }
> > +-
> > +-    return 0;
> > +-}
> > +-
> > + static unsigned dnsname_matches(const gnutls_datum_t *name,
> > +                             const gnutls_datum_t *suffix)
> > + {
> > +     _gnutls_hard_log("matching %.*s with DNS constraint %.*s\n",
> name->size,
> > +                      name->data, suffix->size, suffix->data);
> > +
> > +-    if (suffix->size =3D=3D name->size &&
> > +-        memcmp(suffix->data, name->data, suffix->size) =3D=3D 0)
> > +-            return 1; /* match */
> > +-
> > +-    return ends_with(name, suffix);
> > ++    enum name_constraint_relation rel =3D compare_dns_names(name,
> suffix);
> > ++    return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
> > + }
> > +
> > + static unsigned email_matches(const gnutls_datum_t *name,
> > +@@ -887,11 +1117,8 @@ static unsigned email_matches(const gnut
> > +     _gnutls_hard_log("matching %.*s with e-mail constraint %.*s\n",
> > +                      name->size, name->data, suffix->size,
> suffix->data);
> > +
> > +-    if (suffix->size =3D=3D name->size &&
> > +-        memcmp(suffix->data, name->data, suffix->size) =3D=3D 0)
> > +-            return 1; /* match */
> > +-
> > +-    return email_ends_with(name, suffix);
> > ++    enum name_constraint_relation rel =3D compare_emails(name, suffix=
);
> > ++    return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
> > + }
> > +
> > + /*-
> > +@@ -915,8 +1142,7 @@ static int name_constraints_intersect_no
> > +     // presume empty intersection
> > +     struct name_constraints_node_st *intersection =3D NULL;
> > +     const struct name_constraints_node_st *to_copy =3D NULL;
> > +-    unsigned iplength =3D 0;
> > +-    unsigned byte;
> > ++    enum name_constraint_relation rel;
> > +
> > +     *_intersection =3D NULL;
> > +
> > +@@ -925,32 +1151,49 @@ static int name_constraints_intersect_no
> > +     }
> > +     switch (node1->type) {
> > +     case GNUTLS_SAN_DNSNAME:
> > +-            if (!dnsname_matches(&node2->name, &node1->name))
> > ++            rel =3D compare_dns_names(&node1->name, &node2->name);
> > ++            switch (rel) {
> > ++            case NC_EQUAL: // equal means doesn't matter which one
> > ++            case NC_INCLUDES: // node2 is more specific
> > ++                    to_copy =3D node2;
> > ++                    break;
> > ++            case NC_INCLUDED_BY: // node1 is more specific
> > ++                    to_copy =3D node1;
> > ++                    break;
> > ++            case NC_SORTS_BEFORE: // no intersection
> > ++            case NC_SORTS_AFTER: // no intersection
> > +                     return GNUTLS_E_SUCCESS;
> > +-            to_copy =3D node2;
> > ++            }
> > +             break;
> > +     case GNUTLS_SAN_RFC822NAME:
> > +-            if (!email_matches(&node2->name, &node1->name))
> > ++            rel =3D compare_emails(&node1->name, &node2->name);
> > ++            switch (rel) {
> > ++            case NC_EQUAL: // equal means doesn't matter which one
> > ++            case NC_INCLUDES: // node2 is more specific
> > ++                    to_copy =3D node2;
> > ++                    break;
> > ++            case NC_INCLUDED_BY: // node1 is more specific
> > ++                    to_copy =3D node1;
> > ++                    break;
> > ++            case NC_SORTS_BEFORE: // no intersection
> > ++            case NC_SORTS_AFTER: // no intersection
> > +                     return GNUTLS_E_SUCCESS;
> > +-            to_copy =3D node2;
> > ++            }
> > +             break;
> > +     case GNUTLS_SAN_IPADDRESS:
> > +-            if (node1->name.size !=3D node2->name.size)
> > ++            rel =3D compare_ip_ncs(&node1->name, &node2->name);
> > ++            switch (rel) {
> > ++            case NC_EQUAL: // equal means doesn't matter which one
> > ++            case NC_INCLUDES: // node2 is more specific
> > ++                    to_copy =3D node2;
> > ++                    break;
> > ++            case NC_INCLUDED_BY: // node1 is more specific
> > ++                    to_copy =3D node1;
> > ++                    break;
> > ++            case NC_SORTS_BEFORE: // no intersection
> > ++            case NC_SORTS_AFTER: // no intersection
> > +                     return GNUTLS_E_SUCCESS;
> > +-            iplength =3D node1->name.size / 2;
> > +-            for (byte =3D 0; byte < iplength; byte++) {
> > +-                    if (((node1->name.data[byte] ^
> > +-                          node2->name.data[byte]) // XOR of addresses
> > +-                         & node1->name.data[byte +
> > +-                                            iplength] // AND mask fro=
m
> nc1
> > +-                         & node2->name.data[byte +
> > +-                                            iplength]) // AND mask
> from nc2
> > +-                        !=3D 0) {
> > +-                            // CIDRS do not intersect
> > +-                            return GNUTLS_E_SUCCESS;
> > +-                    }
> > +             }
> > +-            to_copy =3D node2;
> > +             break;
> > +     default:
> > +             // for other types, we don't know how to do the
> intersection, assume empty
> > +@@ -967,20 +1210,6 @@ static int name_constraints_intersect_no
> > +             intersection =3D *_intersection;
> > +
> > +             assert(intersection->name.data !=3D NULL);
> > +-
> > +-            if (intersection->type =3D=3D GNUTLS_SAN_IPADDRESS) {
> > +-                    // make sure both IP addresses are correctly mask=
ed
> > +-                    _gnutls_mask_ip(intersection->name.data,
> > +-                                    intersection->name.data + iplengt=
h,
> > +-                                    iplength);
> > +-                    _gnutls_mask_ip(node1->name.data,
> > +-                                    node1->name.data + iplength,
> iplength);
> > +-                    // update intersection, if necessary (we already
> know one is subset of other)
> > +-                    for (byte =3D 0; byte < 2 * iplength; byte++) {
> > +-                            intersection->name.data[byte] |=3D
> > +-                                    node1->name.data[byte];
> > +-                    }
> > +-            }
> > +     }
> > +
> > +     return GNUTLS_E_SUCCESS;
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
> > new file mode 100644
> > index 0000000000..6dc599dd9f
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
> > @@ -0,0 +1,119 @@
> > +From bc62fbb946085527b4b1c02f337dd10c68c54690 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Wed, 4 Feb 2026 09:09:46 +0100
> > +Subject: [PATCH] x509/name_constraints: add sorted_view in
> preparation...
> > +
> > +... for actually using it later for performance gains.
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/bc62fbb946085527b4b1c02f337dd10=
c68c54690
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 62 ++++++++++++++++++++++++++++++------=
-
> > + 1 file changed, 51 insertions(+), 11 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -54,6 +54,9 @@ struct name_constraints_node_list_st {
> > +     struct name_constraints_node_st **data;
> > +     size_t size;
> > +     size_t capacity;
> > ++    /* sorted-on-demand view, valid only when dirty =3D=3D false */
> > ++    bool dirty;
> > ++    struct name_constraints_node_st **sorted_view;
> > + };
> > +
> > + struct gnutls_name_constraints_st {
> > +@@ -342,6 +345,37 @@ static int compare_name_constraint_nodes
> > +     }
> > + }
> > +
> > ++/* Bring the sorted view up to date with the list data; clear the
> dirty flag. */
> > ++static int ensure_sorted(struct name_constraints_node_list_st *list)
> > ++{
> > ++    struct name_constraints_node_st **new_data;
> > ++
> > ++    if (!list->dirty)
> > ++            return GNUTLS_E_SUCCESS;
> > ++    if (!list->size) {
> > ++            list->dirty =3D false;
> > ++            return GNUTLS_E_SUCCESS;
> > ++    }
> > ++
> > ++    /* reallocate sorted view to match current size */
> > ++    new_data =3D
> > ++            _gnutls_reallocarray(list->sorted_view, list->size,
> > ++                                 sizeof(struct
> name_constraints_node_st *));
> > ++    if (!new_data)
> > ++            return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
> > ++    list->sorted_view =3D new_data;
> > ++
> > ++    /* copy pointers and sort in-place */
> > ++    memcpy(list->sorted_view, list->data,
> > ++           list->size * sizeof(struct name_constraints_node_st *));
> > ++    qsort(list->sorted_view, list->size,
> > ++          sizeof(struct name_constraints_node_st *),
> > ++          compare_name_constraint_nodes_qsort);
> > ++
> > ++    list->dirty =3D false;
> > ++    return GNUTLS_E_SUCCESS;
> > ++}
> > ++
> > + static int
> > + name_constraints_node_list_add(struct name_constraints_node_list_st
> *list,
> > +                            struct name_constraints_node_st *node)
> > +@@ -361,10 +395,23 @@ name_constraints_node_list_add(struct na
> > +             list->capacity =3D new_capacity;
> > +             list->data =3D new_data;
> > +     }
> > ++    list->dirty =3D true;
> > +     list->data[list->size++] =3D node;
> > +     return 0;
> > + }
> > +
> > ++static void
> > ++name_constraints_node_list_clear(struct name_constraints_node_list_st
> *list)
> > ++{
> > ++    gnutls_free(list->data);
> > ++    gnutls_free(list->sorted_view);
> > ++    list->data =3D NULL;
> > ++    list->sorted_view =3D NULL;
> > ++    list->capacity =3D 0;
> > ++    list->size =3D 0;
> > ++    list->dirty =3D false;
> > ++}
> > ++
> > + static int
> > + name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,
> > +                           struct name_constraints_node_list_st *list,
> > +@@ -711,6 +758,7 @@ static int name_constraints_node_list_in
> > +                             permitted->data[i] =3D
> > +                                     permitted->data[permitted->size -
> 1];
> > +                     permitted->size--;
> > ++                    permitted->dirty =3D true;
> > +                     continue;
> > +             }
> > +             i++;
> > +@@ -905,17 +953,9 @@ void _gnutls_x509_name_constraints_clear
> > +             struct name_constraints_node_st *node =3D nc->nodes.data[=
i];
> > +             name_constraints_node_free(node);
> > +     }
> > +-    gnutls_free(nc->nodes.data);
> > +-    nc->nodes.capacity =3D 0;
> > +-    nc->nodes.size =3D 0;
> > +-
> > +-    gnutls_free(nc->permitted.data);
> > +-    nc->permitted.capacity =3D 0;
> > +-    nc->permitted.size =3D 0;
> > +-
> > +-    gnutls_free(nc->excluded.data);
> > +-    nc->excluded.capacity =3D 0;
> > +-    nc->excluded.size =3D 0;
> > ++    name_constraints_node_list_clear(&nc->nodes);
> > ++    name_constraints_node_list_clear(&nc->permitted);
> > ++    name_constraints_node_list_clear(&nc->excluded);
> > + }
> > +
> > + /**
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
> > new file mode 100644
> > index 0000000000..846862007f
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
> > @@ -0,0 +1,150 @@
> > +From 80db5e90fa18d3e34bb91dd027bdf76d31e93dcd Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Wed, 4 Feb 2026 13:30:08 +0100
> > +Subject: [PATCH] x509/name_constraints: implement
> > + name_constraints_node_list_union
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/80db5e90fa18d3e34bb91dd027bdf76=
d31e93dcd
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 98 ++++++++++++++++++++++++++++++++----=
-
> > + 1 file changed, 86 insertions(+), 12 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -41,6 +41,7 @@
> > + #include "intprops.h"
> > + #include "minmax.h"
> > +
> > ++#include <assert.h>
> > + #include <string.h>
> > +
> > + #define MAX_NC_CHECKS (1 << 20)
> > +@@ -867,22 +868,95 @@ cleanup:
> > +     return ret;
> > + }
> > +
> > +-static int name_constraints_node_list_concat(
> > +-    gnutls_x509_name_constraints_t nc,
> > +-    struct name_constraints_node_list_st *nodes,
> > +-    const struct name_constraints_node_list_st *nodes2)
> > ++static int
> > ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
> > ++                             struct name_constraints_node_list_st
> *nodes,
> > ++                             struct name_constraints_node_list_st
> *nodes2)
> > + {
> > +     int ret;
> > ++    size_t i =3D 0, j =3D 0;
> > ++    struct name_constraints_node_st *nc1;
> > ++    const struct name_constraints_node_st *nc2;
> > ++    enum name_constraint_relation rel;
> > ++    struct name_constraints_node_list_st result =3D { 0 };
> > ++
> > ++    if (nodes2->size =3D=3D 0) /* nothing to do */
> > ++            return GNUTLS_E_SUCCESS;
> > ++
> > ++    ret =3D ensure_sorted(nodes);
> > ++    if (ret < 0) {
> > ++            gnutls_assert();
> > ++            goto cleanup;
> > ++    }
> > ++    ret =3D ensure_sorted(nodes2);
> > ++    if (ret < 0) {
> > ++            gnutls_assert();
> > ++            goto cleanup;
> > ++    }
> > ++
> > ++    /* traverse both lists in a single pass and merge them w/o
> duplicates */
> > ++    while (i < nodes->size || j < nodes2->size) {
> > ++            nc1 =3D (i < nodes->size) ? nodes->sorted_view[i] : NULL;
> > ++            nc2 =3D (j < nodes2->size) ? nodes2->sorted_view[j] : NUL=
L;
> > +
> > +-    for (size_t i =3D 0; i < nodes2->size; i++) {
> > +-            ret =3D name_constraints_node_add_copy(nc, nodes,
> > +-                                                 nodes2->data[i]);
> > ++            rel =3D compare_name_constraint_nodes(nc1, nc2);
> > ++            switch (rel) {
> > ++            case NC_SORTS_BEFORE:
> > ++                    assert(nc1 !=3D NULL); /* comparator-guaranteed *=
/
> > ++                    ret =3D name_constraints_node_list_add(&result, n=
c1);
> > ++                    i++;
> > ++                    break;
> > ++            case NC_SORTS_AFTER:
> > ++                    assert(nc2 !=3D NULL); /* comparator-guaranteed *=
/
> > ++                    ret =3D name_constraints_node_add_copy(nc, &resul=
t,
> nc2);
> > ++                    j++;
> > ++                    break;
> > ++            case NC_INCLUDES: /* nc1 is broader, shallow-copy it */
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* compar=
ator
> */
> > ++                    ret =3D name_constraints_node_list_add(&result, n=
c1);
> > ++                    i++;
> > ++                    j++;
> > ++                    break;
> > ++            case NC_INCLUDED_BY: /* nc2 is broader, deep-copy it */
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* compar=
ator
> */
> > ++                    ret =3D name_constraints_node_add_copy(nc, &resul=
t,
> nc2);
> > ++                    i++;
> > ++                    j++;
> > ++                    break;
> > ++            case NC_EQUAL:
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* loop
> condition */
> > ++                    ret =3D name_constraints_node_list_add(&result, n=
c1);
> > ++                    i++;
> > ++                    j++;
> > ++                    break;
> > ++            }
> > +             if (ret < 0) {
> > +-                    return gnutls_assert_val(ret);
> > ++                    gnutls_assert();
> > ++                    goto cleanup;
> > +             }
> > +     }
> > +
> > +-    return 0;
> > ++    gnutls_free(nodes->data);
> > ++    gnutls_free(nodes->sorted_view);
> > ++    nodes->data =3D result.data;
> > ++    nodes->sorted_view =3D NULL;
> > ++    nodes->size =3D result.size;
> > ++    nodes->capacity =3D result.capacity;
> > ++    nodes->dirty =3D true;
> > ++    /* since we know it's sorted, populate sorted_view almost for fre=
e
> */
> > ++    nodes->sorted_view =3D gnutls_calloc(
> > ++            nodes->size, sizeof(struct name_constraints_node_st *));
> > ++    if (!nodes->sorted_view)
> > ++            return GNUTLS_E_SUCCESS; /* we tried, no harm done */
> > ++    memcpy(nodes->sorted_view, nodes->data,
> > ++           nodes->size * sizeof(struct name_constraints_node_st *));
> > ++    nodes->dirty =3D false;
> > ++
> > ++    result.data =3D NULL;
> > ++    return GNUTLS_E_SUCCESS;
> > ++cleanup:
> > ++    name_constraints_node_list_clear(&result);
> > ++    return gnutls_assert_val(ret);
> > + }
> > +
> > + /**
> > +@@ -1023,7 +1097,7 @@ static int name_constraints_add(gnutls_x
> > +  * @nc2: The name constraints to be merged with
> > +  *
> > +  * This function will merge the provided name constraints structures
> > +- * as per RFC5280 p6.1.4. That is, the excluded constraints will be
> appended,
> > ++ * as per RFC5280 p6.1.4. That is, the excluded constraints will be
> unioned,
> > +  * and permitted will be intersected. The intersection assumes that @=
nc
> > +  * is the root CA constraints.
> > +  *
> > +@@ -1045,8 +1119,8 @@ int _gnutls_x509_name_constraints_merge(
> > +             return ret;
> > +     }
> > +
> > +-    ret =3D name_constraints_node_list_concat(nc, &nc->excluded,
> > +-                                            &nc2->excluded);
> > ++    ret =3D name_constraints_node_list_union(nc, &nc->excluded,
> > ++                                           &nc2->excluded);
> > +     if (ret < 0) {
> > +             gnutls_assert();
> > +             return ret;
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
> > new file mode 100644
> > index 0000000000..9beca76a35
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
> > @@ -0,0 +1,105 @@
> > +From d0ac999620c8c0aeb6939e1e92d884ca8e40b759 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Wed, 4 Feb 2026 18:31:37 +0100
> > +Subject: [PATCH] x509/name_constraints: make
> types_with_empty_intersection a
> > + bitmask
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/d0ac999620c8c0aeb6939e1e92d884c=
a8e40b759
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/x509/name_constraints.c | 39 +++++++++++++++++++++++++++---------=
-
> > + 1 file changed, 29 insertions(+), 10 deletions(-)
> > +
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -275,6 +275,7 @@ static enum name_constraint_relation com
> > +
> > + static inline bool is_supported_type(unsigned type)
> > + {
> > ++    /* all of these should be under GNUTLS_SAN_MAX (intersect
> bitmasks) */
> > +     return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_R=
FC822NAME
> ||
> > +            type =3D=3D GNUTLS_SAN_IPADDRESS;
> > + }
> > +@@ -683,6 +684,21 @@ name_constraints_node_new(gnutls_x509_na
> > +     return tmp;
> > + }
> > +
> > ++static int
> > ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
> > ++                             struct name_constraints_node_list_st
> *nodes,
> > ++                             struct name_constraints_node_list_st
> *nodes2);
> > ++
> > ++#define type_bitmask_t uint8_t /* increase if GNUTLS_SAN_MAX grows */
> > ++#define type_bitmask_set(mask, t) ((mask) |=3D (1u << (t)))
> > ++#define type_bitmask_clr(mask, t) ((mask) &=3D ~(1u << (t)))
> > ++#define type_bitmask_in(mask, t) ((mask) & (1u << (t)))
> > ++/* C99-compatible compile-time assertions; gnutls_int.h undefines
> verify */
> > ++typedef char assert_san_max[(GNUTLS_SAN_MAX < 8) ? 1 : -1];
> > ++typedef char assert_dnsname[(GNUTLS_SAN_DNSNAME <=3D GNUTLS_SAN_MAX) =
? 1
> : -1];
> > ++typedef char assert_rfc822[(GNUTLS_SAN_RFC822NAME <=3D GNUTLS_SAN_MAX=
) ?
> 1 : -1];
> > ++typedef char assert_ipaddr[(GNUTLS_SAN_IPADDRESS <=3D GNUTLS_SAN_MAX)=
 ?
> 1 : -1];
> > ++
> > + /*-
> > +  * @brief name_constraints_node_list_intersect:
> > +  * @nc: %gnutls_x509_name_constraints_t
> > +@@ -710,12 +726,9 @@ static int name_constraints_node_list_in
> > +                                                      .capacity =3D 0 =
};
> > +     static const unsigned char universal_ip[32] =3D { 0 };
> > +
> > +-    /* temporary array to see, if we need to add universal excluded
> constraints
> > +-     * (see phase 3 for details)
> > +-     * indexed directly by (gnutls_x509_subject_alt_name_t enum - 1) =
*/
> > +-    unsigned char types_with_empty_intersection[GNUTLS_SAN_MAX];
> > +-    memset(types_with_empty_intersection, 0,
> > +-           sizeof(types_with_empty_intersection));
> > ++    /* bitmask to see if we need to add universal excluded constraint=
s
> > ++     * (see phase 3 for details) */
> > ++    type_bitmask_t types_with_empty_intersection =3D 0;
> > +
> > +     if (permitted->size =3D=3D 0 || permitted2->size =3D=3D 0)
> > +             return 0;
> > +@@ -741,7 +754,8 @@ static int name_constraints_node_list_in
> > +                             // note the possibility of empty
> intersection for this type
> > +                             // if we add something to the intersectio=
n
> in phase 2,
> > +                             // we will reset this flag back to 0 then
> > +-                            types_with_empty_intersection[t->type - 1=
]
> =3D 1;
> > ++
> type_bitmask_set(types_with_empty_intersection,
> > ++                                             t->type);
> > +                             found =3D t2;
> > +                             break;
> > +                     }
> > +@@ -795,8 +809,8 @@ static int name_constraints_node_list_in
> > +                                             GNUTLS_E_INTERNAL_ERROR);
> > +                             }
> > +                             // we will not add universal excluded
> constraint for this type
> > +-                            types_with_empty_intersection[tmp->type -
> 1] =3D
> > +-                                    0;
> > ++
> type_bitmask_clr(types_with_empty_intersection,
> > ++                                             tmp->type);
> > +                             // add intersection node to PERMITTED
> > +                             ret =3D
> name_constraints_node_list_add(permitted,
> > +                                                                  tmp)=
;
> > +@@ -824,7 +838,7 @@ static int name_constraints_node_list_in
> > +      * excluded constraint with universal wildcard
> > +      * (since the intersection of permitted is now empty). */
> > +     for (type =3D 1; type <=3D GNUTLS_SAN_MAX; type++) {
> > +-            if (types_with_empty_intersection[type - 1] =3D=3D 0)
> > ++            if (!type_bitmask_in(types_with_empty_intersection, type)=
)
> > +                     continue;
> > +             _gnutls_hard_log(
> > +                     "Adding universal excluded name constraint for
> type %d.\n",
> > +@@ -868,6 +882,11 @@ cleanup:
> > +     return ret;
> > + }
> > +
> > ++#undef type_bitmask_t
> > ++#undef type_bitmask_set
> > ++#undef type_bitmask_clr
> > ++#undef type_bitmask_in
> > ++
> > + static int
> > + name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,
> > +                              struct name_constraints_node_list_st
> *nodes,
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> > new file mode 100644
> > index 0000000000..27ed995d8d
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
> > @@ -0,0 +1,437 @@
> > +Backport of:
> > +
> > +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Wed, 4 Feb 2026 20:03:49 +0100
> > +Subject: [PATCH] x509/name_constraints:
> name_constraints_node_list_intersect
> > + over sorted
> > +
> > +Fixes: #1773
> > +Fixes: GNUTLS-SA-2026-02-09-2
> > +Fixes: CVE-2025-14831
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c82177ddbd0a4e=
8331059a1
> ]
> > +CVE: CVE-2025-14831
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + NEWS                        |   7 +
> > + lib/x509/name_constraints.c | 350 ++++++++++++++---------------------=
-
> > + 2 files changed, 142 insertions(+), 215 deletions(-)
> > +
> > +#diff --git a/NEWS b/NEWS
> > +#index e506db547a..96b7484fdf 100644
> > +#--- a/NEWS
> > +#+++ b/NEWS
> > +#@@ -14,6 +14,13 @@ See the end for copying conditions.
> > +#    Reported by Jaehun Lee.
> > +#    [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-1584]
> > +#
> > +#+** libgnutls: Fix name constraint processing performance issue
> > +#+   Verifying certificates with pathological amounts of name
> constraints
> > +#+   could lead to a denial of service attack via resource exhaustion.
> > +#+   Reworked processing algorithms exhibit better performance
> characteristics.
> > +#+   Reported by Tim Scheckenbach.
> > +#+   [Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-2025-14831]
> > +#+
> > +# ** libgnutls: Fix multiple unexploitable overflows
> > +#    Reported by Tim R=C3=BChsen (#1783, #1786).
> > +#
> > +--- a/lib/x509/name_constraints.c
> > ++++ b/lib/x509/name_constraints.c
> > +@@ -446,13 +446,6 @@ name_constraints_node_add_copy(gnutls_x5
> > +                                          src->name.data,
> src->name.size);
> > + }
> > +
> > +-// for documentation see the implementation
> > +-static int name_constraints_intersect_nodes(
> > +-    gnutls_x509_name_constraints_t nc,
> > +-    const struct name_constraints_node_st *node1,
> > +-    const struct name_constraints_node_st *node2,
> > +-    struct name_constraints_node_st **intersection);
> > +-
> > + /*-
> > +  * _gnutls_x509_name_constraints_is_empty:
> > +  * @nc: name constraints structure
> > +@@ -716,129 +709,143 @@ typedef char assert_ipaddr[(GNUTLS_SAN_I
> > + static int name_constraints_node_list_intersect(
> > +     gnutls_x509_name_constraints_t nc,
> > +     struct name_constraints_node_list_st *permitted,
> > +-    const struct name_constraints_node_list_st *permitted2,
> > ++    struct name_constraints_node_list_st *permitted2,
> > +     struct name_constraints_node_list_st *excluded)
> > + {
> > +-    struct name_constraints_node_st *tmp;
> > +-    int ret, type, used;
> > +-    struct name_constraints_node_list_st removed =3D { .data =3D NULL=
,
> > +-                                                     .size =3D 0,
> > +-                                                     .capacity =3D 0 =
};
> > ++    struct name_constraints_node_st *nc1, *nc2;
> > ++    struct name_constraints_node_list_st result =3D { 0 };
> > ++    struct name_constraints_node_list_st unsupp2 =3D { 0 };
> > ++    enum name_constraint_relation rel;
> > ++    unsigned type;
> > ++    int ret =3D GNUTLS_E_SUCCESS;
> > ++    size_t i, j, p1_unsupp =3D 0, p2_unsupp =3D 0;
> > ++    type_bitmask_t universal_exclude_needed =3D 0;
> > ++    type_bitmask_t types_in_p1 =3D 0, types_in_p2 =3D 0;
> > +     static const unsigned char universal_ip[32] =3D { 0 };
> > +
> > +-    /* bitmask to see if we need to add universal excluded constraint=
s
> > +-     * (see phase 3 for details) */
> > +-    type_bitmask_t types_with_empty_intersection =3D 0;
> > +-
> > +     if (permitted->size =3D=3D 0 || permitted2->size =3D=3D 0)
> > +-            return 0;
> > ++            return GNUTLS_E_SUCCESS;
> > +
> > +-    /* Phase 1
> > +-     * For each name in PERMITTED, if a PERMITTED2 does not contain a
> name
> > +-     * with the same type, move the original name to REMOVED.
> > +-     * Do this also for node of unknown type (not DNS, email, IP) */
> > +-    for (size_t i =3D 0; i < permitted->size;) {
> > +-            struct name_constraints_node_st *t =3D permitted->data[i]=
;
> > +-            const struct name_constraints_node_st *found =3D NULL;
> > +-
> > +-            for (size_t j =3D 0; j < permitted2->size; j++) {
> > +-                    const struct name_constraints_node_st *t2 =3D
> > +-                            permitted2->data[j];
> > +-                    if (t->type =3D=3D t2->type) {
> > +-                            // check bounds (we will use 't->type' as
> index)
> > +-                            if (t->type > GNUTLS_SAN_MAX || t->type =
=3D=3D
> 0) {
> > +-                                    gnutls_assert();
> > +-                                    ret =3D GNUTLS_E_INTERNAL_ERROR;
> > +-                                    goto cleanup;
> > +-                            }
> > +-                            // note the possibility of empty
> intersection for this type
> > +-                            // if we add something to the intersectio=
n
> in phase 2,
> > +-                            // we will reset this flag back to 0 then
> > +-
> type_bitmask_set(types_with_empty_intersection,
> > +-                                             t->type);
> > +-                            found =3D t2;
> > +-                            break;
> > +-                    }
> > ++    /* make sorted views of the arrays */
> > ++    ret =3D ensure_sorted(permitted);
> > ++    if (ret < 0) {
> > ++            gnutls_assert();
> > ++            goto cleanup;
> > ++    }
> > ++    ret =3D ensure_sorted(permitted2);
> > ++    if (ret < 0) {
> > ++            gnutls_assert();
> > ++            goto cleanup;
> > ++    }
> > ++
> > ++    /* deal with the leading unsupported types first: count, then
> union */
> > ++    while (p1_unsupp < permitted->size &&
> > ++           !is_supported_type(permitted->sorted_view[p1_unsupp]->type=
))
> > ++            p1_unsupp++;
> > ++    while (p2_unsupp < permitted2->size &&
> > ++
>  !is_supported_type(permitted2->sorted_view[p2_unsupp]->type))
> > ++            p2_unsupp++;
> > ++    if (p1_unsupp) { /* copy p1 unsupported type pointers into result
> */
> > ++            result.data =3D gnutls_calloc(
> > ++                    p1_unsupp, sizeof(struct name_constraints_node_st
> *));
> > ++            if (!result.data) {
> > ++                    ret =3D GNUTLS_E_MEMORY_ERROR;
> > ++                    gnutls_assert();
> > ++                    goto cleanup;
> > ++            }
> > ++            memcpy(result.data, permitted->sorted_view,
> > ++                   p1_unsupp * sizeof(struct name_constraints_node_st
> *));
> > ++            result.size =3D result.capacity =3D p1_unsupp;
> > ++            result.dirty =3D true;
> > ++    }
> > ++    if (p2_unsupp) { /* union will make deep copies from p2 */
> > ++            unsupp2.data =3D permitted2->sorted_view; /* so, just ali=
as
> */
> > ++            unsupp2.size =3D unsupp2.capacity =3D p2_unsupp;
> > ++            unsupp2.dirty =3D false; /* we know it's sorted */
> > ++            unsupp2.sorted_view =3D permitted2->sorted_view;
> > ++            ret =3D name_constraints_node_list_union(nc, &result,
> &unsupp2);
> > ++            if (ret < 0) {
> > ++                    gnutls_assert();
> > ++                    goto cleanup;
> > +             }
> > ++    }
> > +
> > +-            if (found !=3D NULL && is_supported_type(t->type)) {
> > +-                    /* move node from PERMITTED to REMOVED */
> > +-                    ret =3D name_constraints_node_list_add(&removed, =
t);
> > +-                    if (ret < 0) {
> > +-                            gnutls_assert();
> > +-                            goto cleanup;
> > +-                    }
> > +-                    /* remove node by swapping */
> > +-                    if (i < permitted->size - 1)
> > +-                            permitted->data[i] =3D
> > +-                                    permitted->data[permitted->size -
> 1];
> > +-                    permitted->size--;
> > +-                    permitted->dirty =3D true;
> > +-                    continue;
> > ++    /* with that out of the way, pre-compute the supported types we
> have */
> > ++    for (i =3D p1_unsupp; i < permitted->size; i++) {
> > ++            type =3D permitted->sorted_view[i]->type;
> > ++            if (type < 1 || type > GNUTLS_SAN_MAX) {
> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR=
);
> > ++                    goto cleanup;
> > +             }
> > +-            i++;
> > ++            type_bitmask_set(types_in_p1, type);
> > +     }
> > ++    for (j =3D p2_unsupp; j < permitted2->size; j++) {
> > ++            type =3D permitted2->sorted_view[j]->type;
> > ++            if (type < 1 || type > GNUTLS_SAN_MAX) {
> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR=
);
> > ++                    goto cleanup;
> > ++            }
> > ++            type_bitmask_set(types_in_p2, type);
> > ++    }
> > ++    /* universal excludes might be needed for types intersecting to
> empty */
> > ++    universal_exclude_needed =3D types_in_p1 & types_in_p2;
> > +
> > +-    /* Phase 2
> > +-     * iterate through all combinations from PERMITTED2 and PERMITTED
> > +-     * and create intersections of nodes with same type */
> > +-    for (size_t i =3D 0; i < permitted2->size; i++) {
> > +-            const struct name_constraints_node_st *t2 =3D
> permitted2->data[i];
> > +-
> > +-            // current PERMITTED2 node has not yet been used for any
> intersection
> > +-            // (and is not in REMOVED either)
> > +-            used =3D 0;
> > +-            for (size_t j =3D 0; j < removed.size; j++) {
> > +-                    const struct name_constraints_node_st *t =3D
> > +-                            removed.data[j];
> > +-                    // save intersection of name constraints into tmp
> > +-                    ret =3D name_constraints_intersect_nodes(nc, t, t=
2,
> &tmp);
> > +-                    if (ret < 0) {
> > +-                            gnutls_assert();
> > +-                            goto cleanup;
> > +-                    }
> > +-                    used =3D 1;
> > +-                    // if intersection is not empty
> > +-                    if (tmp !=3D
> > +-                        NULL) { // intersection for this type is not
> empty
> > +-                            // check bounds
> > +-                            if (tmp->type > GNUTLS_SAN_MAX ||
> > +-                                tmp->type =3D=3D 0) {
> > +-                                    gnutls_free(tmp);
> > +-                                    return gnutls_assert_val(
> > +-                                            GNUTLS_E_INTERNAL_ERROR);
> > +-                            }
> > +-                            // we will not add universal excluded
> constraint for this type
> > +-
> type_bitmask_clr(types_with_empty_intersection,
> > +-                                             tmp->type);
> > +-                            // add intersection node to PERMITTED
> > +-                            ret =3D
> name_constraints_node_list_add(permitted,
> > +-                                                                 tmp)=
;
> > +-                            if (ret < 0) {
> > +-                                    gnutls_assert();
> > +-                                    goto cleanup;
> > +-                            }
> > +-                    }
> > ++    /* go through supported type NCs and intersect in a single pass *=
/
> > ++    i =3D p1_unsupp;
> > ++    j =3D p2_unsupp;
> > ++    while (i < permitted->size || j < permitted2->size) {
> > ++            nc1 =3D (i < permitted->size) ? permitted->sorted_view[i]=
 :
> NULL;
> > ++            nc2 =3D (j < permitted2->size) ? permitted2->sorted_view[=
j] :
> > ++                                           NULL;
> > ++            rel =3D compare_name_constraint_nodes(nc1, nc2);
> > ++
> > ++            switch (rel) {
> > ++            case NC_SORTS_BEFORE:
> > ++                    assert(nc1 !=3D NULL); /* comparator-guaranteed *=
/
> > ++                    /* if nothing to intersect with, shallow-copy nc1
> */
> > ++                    if (!type_bitmask_in(types_in_p2, nc1->type))
> > ++                            ret =3D
> name_constraints_node_list_add(&result,
> > ++                                                                 nc1)=
;
> > ++                    i++; /* otherwise skip nc1 */
> > ++                    break;
> > ++            case NC_SORTS_AFTER:
> > ++                    assert(nc2 !=3D NULL); /* comparator-guaranteed *=
/
> > ++                    /* if nothing to intersect with, deep-copy nc2 */
> > ++                    if (!type_bitmask_in(types_in_p1, nc2->type))
> > ++                            ret =3D name_constraints_node_add_copy(
> > ++                                    nc, &result, nc2);
> > ++                    j++; /* otherwise skip nc2 */
> > ++                    break;
> > ++            case NC_INCLUDED_BY: /* add nc1, shallow-copy */
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* compar=
ator
> */
> > ++                    type_bitmask_clr(universal_exclude_needed,
> nc1->type);
> > ++                    ret =3D name_constraints_node_list_add(&result, n=
c1);
> > ++                    i++;
> > ++                    break;
> > ++            case NC_INCLUDES: /* pick nc2, deep-copy */
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* compar=
ator
> */
> > ++                    type_bitmask_clr(universal_exclude_needed,
> nc2->type);
> > ++                    ret =3D name_constraints_node_add_copy(nc, &resul=
t,
> nc2);
> > ++                    j++;
> > ++                    break;
> > ++            case NC_EQUAL: /* pick whichever: nc1, shallow-copy */
> > ++                    assert(nc1 !=3D NULL && nc2 !=3D NULL); /* loop
> condition */
> > ++                    type_bitmask_clr(universal_exclude_needed,
> nc1->type);
> > ++                    ret =3D name_constraints_node_list_add(&result, n=
c1);
> > ++                    i++;
> > ++                    j++;
> > ++                    break;
> > +             }
> > +-            // if the node from PERMITTED2 was not used for
> intersection, copy it to DEST
> > +-            // Beware: also copies nodes other than DNS, email, IP,
> > +-            //       since their counterpart may have been moved in
> phase 1.
> > +-            if (!used) {
> > +-                    ret =3D name_constraints_node_add_copy(nc,
> permitted, t2);
> > +-                    if (ret < 0) {
> > +-                            gnutls_assert();
> > +-                            goto cleanup;
> > +-                    }
> > ++            if (ret < 0) {
> > ++                    gnutls_assert();
> > ++                    goto cleanup;
> > +             }
> > +     }
> > +
> > +-    /* Phase 3
> > +-     * For each type: If we have empty permitted name constraints now
> > +-     * and we didn't have at the beginning, we have to add a new
> > +-     * excluded constraint with universal wildcard
> > +-     * (since the intersection of permitted is now empty). */
> > ++    /* finishing touch: add universal excluded constraints for types
> where
> > ++     * both lists had constraints, but all intersections ended up
> empty */
> > +     for (type =3D 1; type <=3D GNUTLS_SAN_MAX; type++) {
> > +-            if (!type_bitmask_in(types_with_empty_intersection, type)=
)
> > ++            if (!type_bitmask_in(universal_exclude_needed, type))
> > +                     continue;
> > +             _gnutls_hard_log(
> > +                     "Adding universal excluded name constraint for
> type %d.\n",
> > +@@ -871,14 +878,24 @@ static int name_constraints_node_list_in
> > +                             goto cleanup;
> > +                     }
> > +                     break;
> > +-            default: // do nothing, at least one node was already
> moved in phase 1
> > +-                    break;
> > ++            default: /* unsupported type; should be unreacheable */
> > ++                    ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR=
);
> > ++                    goto cleanup;
> > +             }
> > +     }
> > +-    ret =3D GNUTLS_E_SUCCESS;
> > +
> > ++    gnutls_free(permitted->data);
> > ++    gnutls_free(permitted->sorted_view);
> > ++    permitted->data =3D result.data;
> > ++    permitted->sorted_view =3D NULL;
> > ++    permitted->size =3D result.size;
> > ++    permitted->capacity =3D result.capacity;
> > ++    permitted->dirty =3D true;
> > ++
> > ++    result.data =3D NULL;
> > ++    ret =3D GNUTLS_E_SUCCESS;
> > + cleanup:
> > +-    gnutls_free(removed.data);
> > ++    name_constraints_node_list_clear(&result);
> > +     return ret;
> > + }
> > +
> > +@@ -1254,100 +1271,6 @@ static unsigned email_matches(const gnut
> > +     return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_BY;
> > + }
> > +
> > +-/*-
> > +- * name_constraints_intersect_nodes:
> > +- * @nc1: name constraints node 1
> > +- * @nc2: name constraints node 2
> > +- * @_intersection: newly allocated node with intersected constraints,
> > +- *           NULL if the intersection is empty
> > +- *
> > +- * Inspect 2 name constraints nodes (of possibly different types) and
> allocate
> > +- * a new node with intersection of given constraints.
> > +- *
> > +- * Returns: On success, %GNUTLS_E_SUCCESS (0) is returned, otherwise =
a
> negative error value.
> > +- -*/
> > +-static int name_constraints_intersect_nodes(
> > +-    gnutls_x509_name_constraints_t nc,
> > +-    const struct name_constraints_node_st *node1,
> > +-    const struct name_constraints_node_st *node2,
> > +-    struct name_constraints_node_st **_intersection)
> > +-{
> > +-    // presume empty intersection
> > +-    struct name_constraints_node_st *intersection =3D NULL;
> > +-    const struct name_constraints_node_st *to_copy =3D NULL;
> > +-    enum name_constraint_relation rel;
> > +-
> > +-    *_intersection =3D NULL;
> > +-
> > +-    if (node1->type !=3D node2->type) {
> > +-            return GNUTLS_E_SUCCESS;
> > +-    }
> > +-    switch (node1->type) {
> > +-    case GNUTLS_SAN_DNSNAME:
> > +-            rel =3D compare_dns_names(&node1->name, &node2->name);
> > +-            switch (rel) {
> > +-            case NC_EQUAL: // equal means doesn't matter which one
> > +-            case NC_INCLUDES: // node2 is more specific
> > +-                    to_copy =3D node2;
> > +-                    break;
> > +-            case NC_INCLUDED_BY: // node1 is more specific
> > +-                    to_copy =3D node1;
> > +-                    break;
> > +-            case NC_SORTS_BEFORE: // no intersection
> > +-            case NC_SORTS_AFTER: // no intersection
> > +-                    return GNUTLS_E_SUCCESS;
> > +-            }
> > +-            break;
> > +-    case GNUTLS_SAN_RFC822NAME:
> > +-            rel =3D compare_emails(&node1->name, &node2->name);
> > +-            switch (rel) {
> > +-            case NC_EQUAL: // equal means doesn't matter which one
> > +-            case NC_INCLUDES: // node2 is more specific
> > +-                    to_copy =3D node2;
> > +-                    break;
> > +-            case NC_INCLUDED_BY: // node1 is more specific
> > +-                    to_copy =3D node1;
> > +-                    break;
> > +-            case NC_SORTS_BEFORE: // no intersection
> > +-            case NC_SORTS_AFTER: // no intersection
> > +-                    return GNUTLS_E_SUCCESS;
> > +-            }
> > +-            break;
> > +-    case GNUTLS_SAN_IPADDRESS:
> > +-            rel =3D compare_ip_ncs(&node1->name, &node2->name);
> > +-            switch (rel) {
> > +-            case NC_EQUAL: // equal means doesn't matter which one
> > +-            case NC_INCLUDES: // node2 is more specific
> > +-                    to_copy =3D node2;
> > +-                    break;
> > +-            case NC_INCLUDED_BY: // node1 is more specific
> > +-                    to_copy =3D node1;
> > +-                    break;
> > +-            case NC_SORTS_BEFORE: // no intersection
> > +-            case NC_SORTS_AFTER: // no intersection
> > +-                    return GNUTLS_E_SUCCESS;
> > +-            }
> > +-            break;
> > +-    default:
> > +-            // for other types, we don't know how to do the
> intersection, assume empty
> > +-            return GNUTLS_E_SUCCESS;
> > +-    }
> > +-
> > +-    // copy existing node if applicable
> > +-    if (to_copy !=3D NULL) {
> > +-            *_intersection =3D name_constraints_node_new(nc,
> to_copy->type,
> > +-
>  to_copy->name.data,
> > +-
>  to_copy->name.size);
> > +-            if (*_intersection =3D=3D NULL)
> > +-                    return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);
> > +-            intersection =3D *_intersection;
> > +-
> > +-            assert(intersection->name.data !=3D NULL);
> > +-    }
> > +-
> > +-    return GNUTLS_E_SUCCESS;
> > +-}
> > +-
> > + /*
> > +  * Returns: true if the certification is acceptable, and false
> otherwise.
> > +  */
> > diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > index 026ae650f6..ccb6a2b4b2 100644
> > --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > @@ -34,6 +34,15 @@ SRC_URI =3D "
> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
> >             file://CVE-2025-32990.patch \
> >             file://CVE-2025-6395.patch \
> >             file://CVE-2025-9820.patch \
> > +           file://CVE-2025-14831-1.patch \
> > +           file://CVE-2025-14831-2.patch \
> > +           file://CVE-2025-14831-3.patch \
> > +           file://CVE-2025-14831-4.patch \
> > +           file://CVE-2025-14831-5.patch \
> > +           file://CVE-2025-14831-6.patch \
> > +           file://CVE-2025-14831-7.patch \
> > +           file://CVE-2025-14831-8.patch \
> > +           file://CVE-2025-14831-9.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000549c6a064b8a496e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Yoann,<br><div><br></div><div>I will send it for Whinla=
tter soon.<br></div><div>I couldn&#39;t see this patch in scarthgap-nut. An=
y update on this?<br><br></div><div>Thanks &amp; Regards,<br></div><div>Vij=
ay</div><div><br><br></div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 17, 2026 at 2:=
34=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoa=
nn.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue Feb 17, 2026 at 9:14 AM CET, Vijay Anusuri via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> wrote:<br>
&gt; Picked commits which mentions this CVE per [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://ubuntu.com/security/CVE-2025-14831" rel=3D"nore=
ferrer" target=3D"_blank">https://ubuntu.com/security/CVE-2025-14831</a><br=
>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-14=
831" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2025-14831</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1773" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/gnutls/gnutls/-/issues/177=
3</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-1.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 61 +++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-2.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 30 ++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-3.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 45 ++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-4.patch=C2=A0 =C2=A0 =C2=A0 | 2=
00 +++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-5.patch=C2=A0 =C2=A0 =C2=A0 | 5=
00 ++++++++++++++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-6.patch=C2=A0 =C2=A0 =C2=A0 | 1=
19 +++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-7.patch=C2=A0 =C2=A0 =C2=A0 | 1=
50 ++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-8.patch=C2=A0 =C2=A0 =C2=A0 | 1=
05 ++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-14831-9.patch=C2=A0 =C2=A0 =C2=A0 | 4=
37 +++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A09 +<br>
&gt;=C2=A0 10 files changed, 1656 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-2.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-3.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-4.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-5.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-6.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-7.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-8.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-1=
4831-9.patch<br>
<br>
Hello,<br>
<br>
It looks like these patches are also needed for whinlatter.<br>
Can you send this fix for whinlatter?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ae52a43a2c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From 0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 26 Jan 2026 19:02:27 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: use actual zeroes in universa=
l exclude<br>
&gt; + IP NC<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/0b2377dfccd99be641bf3f1a0de9f0dc8dc0d4b1" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/0b2377dfccd99be641=
bf3f1a0de9f0dc8dc0d4b1</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 9 +++++----<br>
&gt; + 1 file changed, 5 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -61,7 +61,7 @@ struct gnutls_name_constraints_st {<br>
&gt; + <br>
&gt; + static struct name_constraints_node_st *<br>
&gt; + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigne=
d type,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned char *data, unsigned int size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const unsigned char *data, unsigned int size);<br>
&gt; + <br>
&gt; + static int<br>
&gt; + name_constraints_node_list_add(struct name_constraints_node_list_st =
*list,<br>
&gt; +@@ -285,7 +285,7 @@ static void name_constraints_node_free(s<br>
&gt; +=C2=A0 -*/<br>
&gt; + static struct name_constraints_node_st *<br>
&gt; + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigne=
d type,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned char *data, unsigned int size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const unsigned char *data, unsigned int size)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_st *tmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +@@ -339,6 +339,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st removed =3D =
{ .data =3D NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .capacity =3D 0 };<br>
&gt; ++=C2=A0 =C2=A0 static const unsigned char universal_ip[32] =3D { 0 };=
<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* temporary array to see, if we need to add univ=
ersal excluded constraints<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * (see phase 3 for details)<br>
&gt; +@@ -471,7 +472,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_IPADD=
RESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// add universal restricted range for IPv4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tmp =3D name_constraints_node_new(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, NULL, 8);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (tmp =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +@@ -484,7 +485,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// add universal restricted range for IPv6<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tmp =3D name_constraints_node_new(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, NULL, 32);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, universal_ip, 32)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (tmp =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0d34032554<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +From 85d6348a30c74d4ee3710e0f4652f634eaad6914 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 26 Jan 2026 19:10:58 +0100<br>
&gt; +Subject: [PATCH] tests/name-constraints-ip: stop swallowing errors...=
<br>
&gt; +<br>
&gt; +... now when it started to pass<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/85d6348a30c74d4ee3710e0f4652f634eaad6914" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/85d6348a30c74d4ee3=
710e0f4652f634eaad6914</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + tests/name-constraints-ip.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/tests/name-constraints-ip.c b/tests/name-constraints-ip.=
c<br>
&gt; +index 7a196088dc..a0cf172b7f 100644<br>
&gt; +--- a/tests/name-constraints-ip.c<br>
&gt; ++++ b/tests/name-constraints-ip.c<br>
&gt; +@@ -772,5 +772,5 @@ int main(int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmocka_unit_test_setu=
p_teardown(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0check_ipv4v6_single_constraint_each, setup, teardown)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +-=C2=A0 =C2=A0 cmocka_run_group_tests(tests, NULL, NULL);<br>
&gt; ++=C2=A0 =C2=A0 return cmocka_run_group_tests(tests, NULL, NULL);<br>
&gt; + }<br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ed4a7da3c7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +From c28475413f82e1f34295d5c039f0c0a4ca2ee526 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 26 Jan 2026 20:14:33 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: reject some malformed domain =
names<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/c28475413f82e1f34295d5c039f0c0a4ca2ee526" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/c28475413f82e1f342=
95d5c039f0c0a4ca2ee526</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 17 +++++++++++++++++<br>
&gt; + 1 file changed, 17 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.=
c<br>
&gt; +index d07482e3c9..9783d92851 100644<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -159,6 +159,23 @@ static int validate_name_constraints_node(gnutls=
_x509_subject_alt_name_t type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return gnutls_assert_val(GNUTLS_E_MALFORMED_CIDR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 /* Validate DNS names and email addresses for malforme=
d input */<br>
&gt; ++=C2=A0 =C2=A0 if (type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUT=
LS_SAN_RFC822NAME) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name-&gt;size =3D=3D 0=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return GNUTLS_E_SUCCESS;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reject names with conse=
cutive dots... */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i + 1 &lt; n=
ame-&gt;size; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (name-&gt;data[i] =3D=3D &#39;.&#39; &amp;&amp; name-&gt;data[i + 1]=
 =3D=3D &#39;.&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gnutls_assert_val(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNUTLS_E_ILLEGA=
L_PARAMETER);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ... or names consisting=
 exclusively of dots */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (name-&gt;size =3D=3D 1=
 &amp;&amp; name-&gt;data[0] =3D=3D &#39;.&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(GNUTLS_E_ILLEGAL_PARAMETER);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return GNUTLS_E_SUCCESS;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..99ec9c5e9a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch<br>
&gt; @@ -0,0 +1,200 @@<br>
&gt; +From 6db7da7fcfe230f445b1edbb56e2a8346120c891 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Thu, 5 Feb 2026 13:22:10 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: name_constraints_node_add_{ne=
w,copy}<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/6db7da7fcfe230f445b1edbb56e2a8346120c891" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/6db7da7fcfe230f445=
b1edbb56e2a8346120c891</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 112 ++++++++++++++++------------------=
--<br>
&gt; + 1 file changed, 51 insertions(+), 61 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -86,6 +86,38 @@ name_constraints_node_list_add(struct na<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; + }<br>
&gt; + <br>
&gt; ++static int<br>
&gt; ++name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_node_list_st *list,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned type, const unsigned char *data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int size)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_st *node;<br>
&gt; ++=C2=A0 =C2=A0 int ret;<br>
&gt; ++=C2=A0 =C2=A0 node =3D name_constraints_node_new(nc, type, data, siz=
e);<br>
&gt; ++=C2=A0 =C2=A0 if (node =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_MEMORY_ERR=
OR;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 ret =3D name_constraints_node_list_add(list, node);<br=
>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int<br>
&gt; ++name_constraints_node_add_copy(gnutls_x509_name_constraints_t nc,<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *dest,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct name_constraints_node_st *src)<=
br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 if (!src)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gnutls_assert_val(G=
NUTLS_E_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 return name_constraints_node_add_new(nc, dest, src-&gt=
;type,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0src-&gt;name.data, src-&gt;name.size);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // for documentation see the implementation<br>
&gt; + static int name_constraints_intersect_nodes(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gnutls_x509_name_constraints_t nc,<br>
&gt; +@@ -188,7 +220,6 @@ static int extract_name_constraints(gnut<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned indx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gnutls_datum_t tmp =3D { NULL, 0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int type;<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st *node;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (indx =3D 1;; indx++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tmpstr, size=
of(tmpstr), &quot;%s.?%u.base&quot;, vstr, indx);<br>
&gt; +@@ -231,15 +262,9 @@ static int extract_name_constraints(gnut<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node =3D name_constraints_=
node_new(nc, type, tmp.data, tmp.size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_add_new(nc, nodes, type, tmp.data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp.size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_free_datum(&a=
mp;tmp);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node =3D=3D NULL) {<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_list_add(nodes, node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto cleanup;<br>
&gt; +@@ -459,14 +484,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Beware: also copie=
s nodes other than DNS, email, IP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=
=A0 =C2=A0since their counterpart may have been moved in phase 1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!used) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp =3D name_constraints_node_new(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, t2-&gt;type, t2-&gt;name.data, t2-&gt;n=
ame.size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tmp =3D=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(permitted, tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_copy(nc, permitted, t2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; +@@ -488,27 +506,17 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_IPADD=
RESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// add universal restricted range for IPv4<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp =3D name_constraints_node_new(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, universal_ip, 8);=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tmp =3D=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(excluded, tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_new(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, excluded, GNUTLS_SAN_IPADDRESS,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_ip, 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// add universal restricted range for IPv6<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp =3D name_constraints_node_new(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, GNUTLS_SAN_IPADDRESS, universal_ip, 32)=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tmp =3D=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(excluded, tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_new(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, excluded, GNUTLS_SAN_IPADDRESS,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_ip, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; +@@ -516,13 +524,8 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_DNSNA=
ME:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_RFC82=
2NAME:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tmp =3D name_constraints_node_new(nc, type, NULL, 0);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tmp =3D=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(excluded, tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_new(nc, excluded, type,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; +@@ -544,20 +547,13 @@ static int name_constraints_node_list_co<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *nodes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct name_constraints_node_list_st *nodes=
2)<br>
&gt; + {<br>
&gt; ++=C2=A0 =C2=A0 int ret;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (size_t i =3D 0; i &lt; nodes2-&gt;size; i++)=
 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct name_constrai=
nts_node_st *node =3D nodes2-&gt;data[i];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_no=
de_st *tmp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D name_constraints_n=
ode_new(nc, node-&gt;type, node-&gt;name.data,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 node-&gt;name.size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp =3D=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_list_add(nodes, tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_add_copy(nc, nodes,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes2-&gt;data[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 name_constraints_node_free(tmp);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +@@ -687,7 +683,6 @@ static int name_constraints_add(gnutls_x<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_x509_subject_alt_name_t type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gnutls_datum_t *name, unsigned per=
mitted)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st *tmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *nodes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; + <br>
&gt; +@@ -697,15 +692,10 @@ static int name_constraints_add(gnutls_x<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0nodes =3D permitted ? &amp;nc-&gt;permitted : &am=
p;nc-&gt;excluded;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 tmp =3D name_constraints_node_new(nc, type, name-&gt;d=
ata, name-&gt;size);<br>
&gt; +-=C2=A0 =C2=A0 if (tmp =3D=3D NULL)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gnutls_assert_val(G=
NUTLS_E_MEMORY_ERROR);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 ret =3D name_constraints_node_list_add(nodes, tmp);<br=
>
&gt; +-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name_constraints_node_free=
(tmp);<br>
&gt; ++=C2=A0 =C2=A0 ret =3D name_constraints_node_add_new(nc, nodes, type,=
 name-&gt;data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n=
ame-&gt;size);<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gnutls_assert_=
val(ret);<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; + }<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7c5ffdf6d8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch<br>
&gt; @@ -0,0 +1,500 @@<br>
&gt; +From 094accd3ebec17ead6c391757eaa18763b72d83f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Mon, 26 Jan 2026 20:16:36 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: introduce a rich comparator<b=
r>
&gt; +<br>
&gt; +These are preparatory changes before implementing N * log N intersect=
ion<br>
&gt; +over sorted lists of constraints.<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/094accd3ebec17ead6c391757eaa18763b72d83f" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/094accd3ebec17ead6=
c391757eaa18763b72d83f</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 411 ++++++++++++++++++++++++++++------=
--<br>
&gt; + 1 file changed, 320 insertions(+), 91 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -39,6 +39,9 @@<br>
&gt; + #include &quot;ip.h&quot;<br>
&gt; + #include &quot;ip-in-cidr.h&quot;<br>
&gt; + #include &quot;intprops.h&quot;<br>
&gt; ++#include &quot;minmax.h&quot;<br>
&gt; ++<br>
&gt; ++#include &lt;string.h&gt;<br>
&gt; + <br>
&gt; + #define MAX_NC_CHECKS (1 &lt;&lt; 20)<br>
&gt; + <br>
&gt; +@@ -63,6 +66,282 @@ static struct name_constraints_node_st *<br>
&gt; + name_constraints_node_new(gnutls_x509_name_constraints_t nc, unsigne=
d type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0const unsigned char *data, unsigned int size);<br>
&gt; + <br>
&gt; ++/* An enum for &quot;rich&quot; comparisons that not only let us sor=
t name constraints,<br>
&gt; ++ * children-before-parent, but also subsume them during intersection=
. */<br>
&gt; ++enum name_constraint_relation {<br>
&gt; ++=C2=A0 =C2=A0 NC_SORTS_BEFORE =3D -2, /* unrelated constraints */<br=
>
&gt; ++=C2=A0 =C2=A0 NC_INCLUDED_BY =3D -1, /* nc1 is included by nc2 / chi=
ldren sort first */<br>
&gt; ++=C2=A0 =C2=A0 NC_EQUAL =3D 0, /* exact match */<br>
&gt; ++=C2=A0 =C2=A0 NC_INCLUDES =3D 1, /* nc1 includes nc2 / parents sort =
last */<br>
&gt; ++=C2=A0 =C2=A0 NC_SORTS_AFTER =3D 2 /* unrelated constraints */<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++/* A helper to compare just a pair of strings with this rich compari=
son */<br>
&gt; ++static enum name_constraint_relation<br>
&gt; ++compare_strings(const void *n1, size_t n1_len, const void *n2, size_=
t n2_len)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 int r =3D memcmp(n1, n2, MIN(n1_len, n2_len));<br>
&gt; ++=C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 if (r &gt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 if (n1_len &lt; n2_len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 if (n1_len &gt; n2_len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 return NC_EQUAL;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Rich-compare DNS names. Example order/relationships:<br>
&gt; ++ * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE =
y.b */<br>
&gt; ++static enum name_constraint_relation compare_dns_names(const gnutls_=
datum_t *n1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gnutls_datum_t *n2)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; ++=C2=A0 =C2=A0 unsigned int i, j, i_end, j_end;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* start from the end of each name */<br>
&gt; ++=C2=A0 =C2=A0 i =3D i_end =3D n1-&gt;size;<br>
&gt; ++=C2=A0 =C2=A0 j =3D j_end =3D n2-&gt;size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* skip the trailing dots for the comparison */<br>
&gt; ++=C2=A0 =C2=A0 while (i &amp;&amp; n1-&gt;data[i - 1] =3D=3D &#39;.&#=
39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_end =3D i =3D i - 1;<br>
&gt; ++=C2=A0 =C2=A0 while (j &amp;&amp; n2-&gt;data[j - 1] =3D=3D &#39;.&#=
39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j_end =3D j =3D j - 1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 while (1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // rewind back to beginnin=
g or an after-dot position<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (i &amp;&amp; n1-&gt=
;data[i - 1] !=3D &#39;.&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i--;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (j &amp;&amp; n2-&gt=
;data[j - 1] !=3D &#39;.&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j--;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_strings(&a=
mp;n1-&gt;data[i], i_end - i, &amp;n2-&gt;data[j],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j_end - j);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rel =3D=3D NC_SORTS_BE=
FORE) /* x.a BEFORE y.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rel =3D=3D NC_SORTS_AF=
TER) /* y.a AFTER x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!i &amp;&amp; j) /* x.=
a INCLUDES z.x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDES;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &amp;&amp; !j) /* z.=
x.a INCLUDED_BY x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDED_BY;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!i &amp;&amp; !j) /* r=
 =3D=3D 0, we ran out of components to compare */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_EQUAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* r =3D=3D 0, i &amp;&amp=
; j: step back past a dot and keep comparing */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i_end =3D i =3D i - 1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j_end =3D j =3D j - 1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* support for non-standar=
d &quot;.gr INCLUDES <a href=3D"http://example.gr" rel=3D"noreferrer" targe=
t=3D"_blank">example.gr</a>&quot; [1] */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!i &amp;&amp; j) /* .a=
 INCLUDES x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDES;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &amp;&amp; !j) /* x.=
a INCLUDED_BY .a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDED_BY;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++/* [1] <a href=3D"https://mailarchive.ietf.org/arch/msg/saag/Bw6Ptre=
W0G7aEG7SikfzKHES4VA" rel=3D"noreferrer" target=3D"_blank">https://mailarch=
ive.ietf.org/arch/msg/saag/Bw6PtreW0G7aEG7SikfzKHES4VA</a> */<br>
&gt; ++<br>
&gt; ++/* Rich-compare email name constraints. Example order/relationships:=
<br>
&gt; ++ * z@x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x@b BEFORE =
y@b */<br>
&gt; ++static enum name_constraint_relation compare_emails(const gnutls_dat=
um_t *n1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const gnutls_datum_t *n2)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation domains_rel;<br>
&gt; ++=C2=A0 =C2=A0 unsigned int i, j, i_end, j_end;<br>
&gt; ++=C2=A0 =C2=A0 gnutls_datum_t d1, d2; /* borrow from n1 and n2 */<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* start from the end of each name */<br>
&gt; ++=C2=A0 =C2=A0 i =3D i_end =3D n1-&gt;size;<br>
&gt; ++=C2=A0 =C2=A0 j =3D j_end =3D n2-&gt;size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* rewind to @s to look for domains */<br>
&gt; ++=C2=A0 =C2=A0 while (i &amp;&amp; n1-&gt;data[i - 1] !=3D &#39;@&#39=
;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i--;<br>
&gt; ++=C2=A0 =C2=A0 d1.size =3D i_end - i;<br>
&gt; ++=C2=A0 =C2=A0 d1.data =3D &amp;n1-&gt;data[i];<br>
&gt; ++=C2=A0 =C2=A0 while (j &amp;&amp; n2-&gt;data[j - 1] !=3D &#39;@&#39=
;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j--;<br>
&gt; ++=C2=A0 =C2=A0 d2.size =3D j_end - j;<br>
&gt; ++=C2=A0 =C2=A0 d2.data =3D &amp;n2-&gt;data[j];<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 domains_rel =3D compare_dns_names(&amp;d1, &amp;d2);<b=
r>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* email constraint semantics differ from DNS<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* DNS: x.a INCLUDED_BY a<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Email: x.a INCLUDED_BY .a BEFORE a */<br>
&gt; ++=C2=A0 =C2=A0 if (domains_rel =3D=3D NC_INCLUDED_BY || domains_rel =
=3D=3D NC_INCLUDES) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool d1_has_dot =3D (d1.si=
ze &gt; 0 &amp;&amp; d1.data[0] =3D=3D &#39;.&#39;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool d2_has_dot =3D (d2.si=
ze &gt; 0 &amp;&amp; d2.data[0] =3D=3D &#39;.&#39;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* a constraint without a =
dot is exact, excluding subdomains */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!d2_has_dot &amp;&amp;=
 domains_rel =3D=3D NC_INCLUDED_BY)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 domains_rel =3D NC_SORTS_BEFORE; /* x.a BEFORE a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!d1_has_dot &amp;&amp;=
 domains_rel =3D=3D NC_INCLUDES)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 domains_rel =3D NC_SORTS_AFTER; /* a AFTER x.a */<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!i &amp;&amp; !j) { /* both are domains-only */<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return domains_rel;<br>
&gt; ++=C2=A0 =C2=A0 } else if (i &amp;&amp; !j) { /* n1 is email, n2 is do=
main */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (domains_rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: /* n2 is=
 more specific, a@x.a AFTER z.x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: /* subdomai=
ns match, z@x.a INCLUDED_BY x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: /* n1=
 is more specific */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDED_BY;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 } else if (!i &amp;&amp; j) { /* n1 is domain, n2 is e=
mail */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (domains_rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: /* n2 is=
 more specific, a AFTER z@x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: /* subdomai=
ns match, x.a INCLUDES z@x.a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_INCLUDES;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: /* n1=
 is more specific, x.a BEFORE z@a */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 } else if (i &amp;&amp; j) { /* both are emails */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (domains_rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // n2 is=
 more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // n1=
 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NC_SORTS_BEFORE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // only cas=
e when we need to look before the @<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break; // see below for readability<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* i &amp;&amp; j, both are emails, domain names match=
, compare up to @ */<br>
&gt; ++=C2=A0 =C2=A0 return compare_strings(n1-&gt;data, i - 1, n2-&gt;data=
, j - 1);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Rich-compare IP address constraints. Example order/relationships:=
<br>
&gt; ++ * <a href=3D"http://10.0.0.0/24" rel=3D"noreferrer" target=3D"_blan=
k">10.0.0.0/24</a> INCLUDED_BY <a href=3D"http://10.0.0.0/16" rel=3D"norefe=
rrer" target=3D"_blank">10.0.0.0/16</a> BEFORE 1::1/128 INCLUDED_BY 1::1/12=
7 */<br>
&gt; ++static enum name_constraint_relation compare_ip_ncs(const gnutls_dat=
um_t *n1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const gnutls_datum_t *n2)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 unsigned int len, i;<br>
&gt; ++=C2=A0 =C2=A0 int r;<br>
&gt; ++=C2=A0 =C2=A0 const unsigned char *ip1, *ip2, *mask1, *mask2;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char masked11[16], masked22[16], masked12[16]=
, masked21[16];<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (n1-&gt;size &lt; n2-&gt;size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 if (n1-&gt;size &gt; n2-&gt;size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 len =3D n1-&gt;size / 2; /* 4 for IPv4, 16 for IPv6 */=
<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* data is a concatenation of prefix and mask */<br>
&gt; ++=C2=A0 =C2=A0 ip1 =3D n1-&gt;data;<br>
&gt; ++=C2=A0 =C2=A0 ip2 =3D n2-&gt;data;<br>
&gt; ++=C2=A0 =C2=A0 mask1 =3D n1-&gt;data + len;<br>
&gt; ++=C2=A0 =C2=A0 mask2 =3D n2-&gt;data + len;<br>
&gt; ++=C2=A0 =C2=A0 for (i =3D 0; i &lt; len; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 masked11[i] =3D ip1[i] &am=
p; mask1[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 masked22[i] =3D ip2[i] &am=
p; mask2[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 masked12[i] =3D ip1[i] &am=
p; mask2[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 masked21[i] =3D ip2[i] &am=
p; mask1[i];<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 r =3D memcmp(mask1, mask2, len);<br>
&gt; ++=C2=A0 =C2=A0 if (r &lt; 0 &amp;&amp; !memcmp(masked11, masked21, le=
n)) /* prefix1 &lt; prefix2 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_INCLUDES; /* ip1=
 &amp; mask1 =3D=3D ip2 &amp; mask1 */<br>
&gt; ++=C2=A0 =C2=A0 if (r &gt; 0 &amp;&amp; !memcmp(masked12, masked22, le=
n)) /* prefix1 &gt; prefix2 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_INCLUDED_BY; /* =
ip1 &amp; mask2 =3D=3D ip2 &amp; mask2 */<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 r =3D memcmp(masked11, masked22, len);<br>
&gt; ++=C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 else if (r &gt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 return NC_EQUAL;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static inline bool is_supported_type(unsigned type)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D G=
NUTLS_SAN_RFC822NAME ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D=3D GNUTLS_SAN_IPAD=
DRESS;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Universal comparison for name constraint nodes.<br>
&gt; ++ * Unsupported types sort before supported types to allow early hand=
ling.<br>
&gt; ++ * NULL represents end-of-list and sorts after everything else. */<b=
r>
&gt; ++static enum name_constraint_relation<br>
&gt; ++compare_name_constraint_nodes(const struct name_constraints_node_st =
*n1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const struct name_constraints_node_st *n2)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 bool n1_supported, n2_supported;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!n1 &amp;&amp; !n2)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_EQUAL;<br>
&gt; ++=C2=A0 =C2=A0 if (!n1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++=C2=A0 =C2=A0 if (!n2)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 n1_supported =3D is_supported_type(n1-&gt;type);<br>
&gt; ++=C2=A0 =C2=A0 n2_supported =3D is_supported_type(n2-&gt;type);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* unsupported types bubble up (sort first). intersect=
 relies on this */<br>
&gt; ++=C2=A0 =C2=A0 if (!n1_supported &amp;&amp; n2_supported)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 if (n1_supported &amp;&amp; !n2_supported)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* next, sort by type */<br>
&gt; ++=C2=A0 =C2=A0 if (n1-&gt;type &lt; n2-&gt;type)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_BEFORE;<br=
>
&gt; ++=C2=A0 =C2=A0 if (n1-&gt;type &gt; n2-&gt;type)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NC_SORTS_AFTER;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* now look deeper */<br>
&gt; ++=C2=A0 =C2=A0 switch (n1-&gt;type) {<br>
&gt; ++=C2=A0 =C2=A0 case GNUTLS_SAN_DNSNAME:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return compare_dns_names(&=
amp;n1-&gt;name, &amp;n2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 case GNUTLS_SAN_RFC822NAME:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return compare_emails(&amp=
;n1-&gt;name, &amp;n2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 case GNUTLS_SAN_IPADDRESS:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return compare_ip_ncs(&amp=
;n1-&gt;name, &amp;n2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unsupported types: stab=
le lexicographic order */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return compare_strings(n1-=
&gt;name.data, n1-&gt;name.size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n2-&gt;name.data=
, n2-&gt;name.size);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* qsort-compatible wrapper */<br>
&gt; ++static int compare_name_constraint_nodes_qsort(const void *a, const =
void *b)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 const struct name_constraints_node_st *const *n1 =3D a=
;<br>
&gt; ++=C2=A0 =C2=A0 const struct name_constraints_node_st *const *n2 =3D b=
;<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 rel =3D compare_name_constraint_nodes(*n1, *n2);<br>
&gt; ++=C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 case NC_INCLUDED_BY:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++=C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 case NC_INCLUDES:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; ++=C2=A0 =C2=A0 case NC_EQUAL:<br>
&gt; ++=C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static int<br>
&gt; + name_constraints_node_list_add(struct name_constraints_node_list_st =
*list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_node_st *node)<br>
&gt; +@@ -420,9 +699,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (found !=3D NULL &amp;&=
amp; (t-&gt;type =3D=3D GNUTLS_SAN_DNSNAME ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;type =3D=3D GNUT=
LS_SAN_RFC822NAME ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;type =3D=3D GNUT=
LS_SAN_IPADDRESS)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (found !=3D NULL &amp;&=
amp; is_supported_type(t-&gt;type)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* move node from PERMITTED to REMOVED */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D name_constraints_node_list_add(&amp;removed, t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0) {<br>
&gt; +@@ -824,61 +1101,14 @@ cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-static unsigned ends_with(const gnutls_datum_t *str,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const gnutls_datum_t *suffix)<br>
&gt; +-{<br>
&gt; +-=C2=A0 =C2=A0 unsigned char *tree;<br>
&gt; +-=C2=A0 =C2=A0 unsigned int treelen;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size &gt;=3D str-&gt;size)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 tree =3D suffix-&gt;data;<br>
&gt; +-=C2=A0 =C2=A0 treelen =3D suffix-&gt;size;<br>
&gt; +-=C2=A0 =C2=A0 if ((treelen &gt; 0) &amp;&amp; (tree[0] =3D=3D &#39;.=
&#39;)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tree++;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 treelen--;<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 if (memcmp(str-&gt;data + str-&gt;size - treelen, tree=
, treelen) =3D=3D 0 &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 str-&gt;data[str-&gt;size - treelen - 1]=
 =3D=3D &#39;.&#39;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* match */<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-static unsigned email_ends_with(const gnutls_datum_t *str,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gnutls_datum_t *suffix)<br>
&gt; +-{<br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size &gt;=3D str-&gt;size) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size &gt; 0 &amp;&amp; memcmp(str-&gt;d=
ata + str-&gt;size - suffix-&gt;size,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix-&gt;data,=
 suffix-&gt;size) !=3D 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size &gt; 1 &amp;&amp; suffix-&gt;data[=
0] =3D=3D &#39;.&#39;) { /* .<a href=3D"http://domain.com" rel=3D"noreferre=
r" target=3D"_blank">domain.com</a> */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* match */<br>
&gt; +-=C2=A0 =C2=A0 } else if (str-&gt;data[str-&gt;size - suffix-&gt;size=
 - 1] =3D=3D &#39;@&#39;) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* match */<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + static unsigned dnsname_matches(const gnutls_datum_t *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gnutls_datum_t *suffix)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_gnutls_hard_log(&quot;matching %.*s with DNS con=
straint %.*s\n&quot;, name-&gt;size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 name-&gt;data, suffix-&gt;size, suffix-&gt;data);<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size =3D=3D name-&gt;size &amp;&amp;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcmp(suffix-&gt;data, name-&gt;data, s=
uffix-&gt;size) =3D=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* match */<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return ends_with(name, suffix);<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel =3D compare_dns_name=
s(name, suffix);<br>
&gt; ++=C2=A0 =C2=A0 return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_B=
Y;<br>
&gt; + }<br>
&gt; + <br>
&gt; + static unsigned email_matches(const gnutls_datum_t *name,<br>
&gt; +@@ -887,11 +1117,8 @@ static unsigned email_matches(const gnut<br>
&gt; +=C2=A0 =C2=A0 =C2=A0_gnutls_hard_log(&quot;matching %.*s with e-mail =
constraint %.*s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 name-&gt;size, name-&gt;data, suffix-&gt;size, suffix-&gt;data);<br=
>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 if (suffix-&gt;size =3D=3D name-&gt;size &amp;&amp;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcmp(suffix-&gt;data, name-&gt;data, s=
uffix-&gt;size) =3D=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* match */<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return email_ends_with(name, suffix);<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel =3D compare_emails(n=
ame, suffix);<br>
&gt; ++=C2=A0 =C2=A0 return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLUDED_B=
Y;<br>
&gt; + }<br>
&gt; + <br>
&gt; + /*-<br>
&gt; +@@ -915,8 +1142,7 @@ static int name_constraints_intersect_no<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// presume empty intersection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_st *intersection =3D=
 NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct name_constraints_node_st *to_copy =
=3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 unsigned iplength =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 unsigned byte;<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0*_intersection =3D NULL;<br>
&gt; + <br>
&gt; +@@ -925,32 +1151,49 @@ static int name_constraints_intersect_no<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (node1-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_DNSNAME:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dnsname_matches(&amp;=
node2-&gt;name, &amp;node1-&gt;name))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_dns_names(=
&amp;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_copy =3D node2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_RFC822NAME:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!email_matches(&amp;no=
de2-&gt;name, &amp;node1-&gt;name))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_emails(&am=
p;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_copy =3D node2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GNUTLS_SAN_IPADDRESS:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (node1-&gt;name.size !=
=3D node2-&gt;name.size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_ip_ncs(&am=
p;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iplength =3D node1-&gt;nam=
e.size / 2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (byte =3D 0; byte &lt;=
 iplength; byte++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (((node1-&gt;name.data[byte] ^<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 node2-&gt;name.data[byte]) // XOR of addresses<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp; node1-&gt;name.data[byte +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 iplength] // AND mask from nc1<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp; node2-&gt;name.data[byte +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 iplength]) // AND mask from nc2<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 !=3D 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // CIDRS do not intersect<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_copy =3D node2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// for other types, w=
e don&#39;t know how to do the intersection, assume empty<br>
&gt; +@@ -967,20 +1210,6 @@ static int name_constraints_intersect_no<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intersection =3D *_in=
tersection;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(intersection-&=
gt;name.data !=3D NULL);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (intersection-&gt;type =
=3D=3D GNUTLS_SAN_IPADDRESS) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // make sure both IP addresses are correctly masked<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _gnutls_mask_ip(intersection-&gt;name.data,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intersection-&g=
t;name.data + iplength,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iplength);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _gnutls_mask_ip(node1-&gt;name.data,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node1-&gt;name.=
data + iplength, iplength);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // update intersection, if necessary (we already know one is subset of =
other)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for (byte =3D 0; byte &lt; 2 * iplength; byte++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intersection-&gt;name.data[byte] |=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node1-&gt;name.=
data[byte];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0return GNUTLS_E_SUCCESS;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6dc599dd9f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch<br>
&gt; @@ -0,0 +1,119 @@<br>
&gt; +From bc62fbb946085527b4b1c02f337dd10c68c54690 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 09:09:46 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: add sorted_view in preparatio=
n...<br>
&gt; +<br>
&gt; +... for actually using it later for performance gains.<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/bc62fbb946085527b4b1c02f337dd10c68c54690" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/bc62fbb946085527b4=
b1c02f337dd10c68c54690</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 62 ++++++++++++++++++++++++++++++-----=
--<br>
&gt; + 1 file changed, 51 insertions(+), 11 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -54,6 +54,9 @@ struct name_constraints_node_list_st {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_st **data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t capacity;<br>
&gt; ++=C2=A0 =C2=A0 /* sorted-on-demand view, valid only when dirty =3D=3D=
 false */<br>
&gt; ++=C2=A0 =C2=A0 bool dirty;<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_st **sorted_view;<br>
&gt; + };<br>
&gt; + <br>
&gt; + struct gnutls_name_constraints_st {<br>
&gt; +@@ -342,6 +345,37 @@ static int compare_name_constraint_nodes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; + <br>
&gt; ++/* Bring the sorted view up to date with the list data; clear the di=
rty flag. */<br>
&gt; ++static int ensure_sorted(struct name_constraints_node_list_st *list)=
<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_st **new_data;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!list-&gt;dirty)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; ++=C2=A0 =C2=A0 if (!list-&gt;size) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list-&gt;dirty =3D false;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* reallocate sorted view to match current size */<br>
&gt; ++=C2=A0 =C2=A0 new_data =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _gnutls_reallocarray(list-=
&gt;sorted_view, list-&gt;size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct name_cons=
traints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 if (!new_data)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gnutls_assert_val(G=
NUTLS_E_MEMORY_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;sorted_view =3D new_data;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* copy pointers and sort in-place */<br>
&gt; ++=C2=A0 =C2=A0 memcpy(list-&gt;sorted_view, list-&gt;data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;size * sizeof(stru=
ct name_constraints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 qsort(list-&gt;sorted_view, list-&gt;size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct name_constraints_no=
de_st *),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compare_name_constraint_nodes_qso=
rt);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;dirty =3D false;<br>
&gt; ++=C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static int<br>
&gt; + name_constraints_node_list_add(struct name_constraints_node_list_st =
*list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_node_st *node)<br>
&gt; +@@ -361,10 +395,23 @@ name_constraints_node_list_add(struct na<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;capacity =3D=
 new_capacity;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;data =3D new=
_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;dirty =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list-&gt;data[list-&gt;size++] =3D node;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; + }<br>
&gt; + <br>
&gt; ++static void<br>
&gt; ++name_constraints_node_list_clear(struct name_constraints_node_list_s=
t *list)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(list-&gt;data);<br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(list-&gt;sorted_view);<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;data =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;sorted_view =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;capacity =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 list-&gt;dirty =3D false;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static int<br>
&gt; + name_constraints_node_add_new(gnutls_x509_name_constraints_t nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *list,<br>
&gt; +@@ -711,6 +758,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0permitted-&gt;data[i] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0permitted-&g=
t;data[permitted-&gt;size - 1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0permitted-&gt;size--;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 permitted-&gt;dirty =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
&gt; +@@ -905,17 +953,9 @@ void _gnutls_x509_name_constraints_clear<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constrain=
ts_node_st *node =3D nc-&gt;nodes.data[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_constraints_node=
_free(node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 gnutls_free(nc-&gt;nodes.data);<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;nodes.capacity =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;nodes.size =3D 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 gnutls_free(nc-&gt;permitted.data);<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;permitted.capacity =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;permitted.size =3D 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 gnutls_free(nc-&gt;excluded.data);<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;excluded.capacity =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 nc-&gt;excluded.size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 name_constraints_node_list_clear(&amp;nc-&gt;nodes);<b=
r>
&gt; ++=C2=A0 =C2=A0 name_constraints_node_list_clear(&amp;nc-&gt;permitted=
);<br>
&gt; ++=C2=A0 =C2=A0 name_constraints_node_list_clear(&amp;nc-&gt;excluded)=
;<br>
&gt; + }<br>
&gt; + <br>
&gt; + /**<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..846862007f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch<br>
&gt; @@ -0,0 +1,150 @@<br>
&gt; +From 80db5e90fa18d3e34bb91dd027bdf76d31e93dcd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 13:30:08 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: implement<br>
&gt; + name_constraints_node_list_union<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/80db5e90fa18d3e34bb91dd027bdf76d31e93dcd" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/80db5e90fa18d3e34b=
b91dd027bdf76d31e93dcd</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 98 ++++++++++++++++++++++++++++++++---=
--<br>
&gt; + 1 file changed, 86 insertions(+), 12 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -41,6 +41,7 @@<br>
&gt; + #include &quot;intprops.h&quot;<br>
&gt; + #include &quot;minmax.h&quot;<br>
&gt; + <br>
&gt; ++#include &lt;assert.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; + <br>
&gt; + #define MAX_NC_CHECKS (1 &lt;&lt; 20)<br>
&gt; +@@ -867,22 +868,95 @@ cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-static int name_constraints_node_list_concat(<br>
&gt; +-=C2=A0 =C2=A0 gnutls_x509_name_constraints_t nc,<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_list_st *nodes,<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_list_st *nodes2)<br=
>
&gt; ++static int<br>
&gt; ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st =
*nodes,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st =
*nodes2)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; ++=C2=A0 =C2=A0 size_t i =3D 0, j =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_st *nc1;<br>
&gt; ++=C2=A0 =C2=A0 const struct name_constraints_node_st *nc2;<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_list_st result =3D { 0 };=
<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (nodes2-&gt;size =3D=3D 0) /* nothing to do */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 ret =3D ensure_sorted(nodes);<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 ret =3D ensure_sorted(nodes2);<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* traverse both lists in a single pass and merge them=
 w/o duplicates */<br>
&gt; ++=C2=A0 =C2=A0 while (i &lt; nodes-&gt;size || j &lt; nodes2-&gt;size=
) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc1 =3D (i &lt; nodes-&gt;=
size) ? nodes-&gt;sorted_view[i] : NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc2 =3D (j &lt; nodes2-&gt=
;size) ? nodes2-&gt;sorted_view[j] : NULL;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; nodes2-&gt;size; i++) {<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_add_copy(nc, nodes,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes2-&gt;data[i]);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_name_const=
raint_nodes(nc1, nc2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL); /* comparator-guaranteed */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;result, nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc2 !=3D NULL); /* comparator-guaranteed */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_copy(nc, &amp;result, nc2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: /* nc1 i=
s broader, shallow-copy it */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* comparator */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;result, nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: /* nc=
2 is broader, deep-copy it */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* comparator */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_copy(nc, &amp;result, nc2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* loop condition */<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;result, nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(ret);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(nodes-&gt;data);<br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(nodes-&gt;sorted_view);<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;data =3D result.data;<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;sorted_view =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;size =3D result.size;<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;capacity =3D result.capacity;<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;dirty =3D true;<br>
&gt; ++=C2=A0 =C2=A0 /* since we know it&#39;s sorted, populate sorted_view=
 almost for free */<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;sorted_view =3D gnutls_calloc(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodes-&gt;size, sizeof(str=
uct name_constraints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 if (!nodes-&gt;sorted_view)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS; /=
* we tried, no harm done */<br>
&gt; ++=C2=A0 =C2=A0 memcpy(nodes-&gt;sorted_view, nodes-&gt;data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodes-&gt;size * sizeof(str=
uct name_constraints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 nodes-&gt;dirty =3D false;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 result.data =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<br>
&gt; ++cleanup:<br>
&gt; ++=C2=A0 =C2=A0 name_constraints_node_list_clear(&amp;result);<br>
&gt; ++=C2=A0 =C2=A0 return gnutls_assert_val(ret);<br>
&gt; + }<br>
&gt; + <br>
&gt; + /**<br>
&gt; +@@ -1023,7 +1097,7 @@ static int name_constraints_add(gnutls_x<br>
&gt; +=C2=A0 * @nc2: The name constraints to be merged with<br>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 * This function will merge the provided name constraints struc=
tures<br>
&gt; +- * as per RFC5280 p6.1.4. That is, the excluded constraints will be =
appended,<br>
&gt; ++ * as per RFC5280 p6.1.4. That is, the excluded constraints will be =
unioned,<br>
&gt; +=C2=A0 * and permitted will be intersected. The intersection assumes =
that @nc<br>
&gt; +=C2=A0 * is the root CA constraints.<br>
&gt; +=C2=A0 *<br>
&gt; +@@ -1045,8 +1119,8 @@ int _gnutls_x509_name_constraints_merge(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 ret =3D name_constraints_node_list_concat(nc, &amp;nc-=
&gt;excluded,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;nc2-&gt;excluded);<br>
&gt; ++=C2=A0 =C2=A0 ret =3D name_constraints_node_list_union(nc, &amp;nc-&=
gt;excluded,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;nc2-&gt;excluded);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls_assert();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9beca76a35<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch<br>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +From d0ac999620c8c0aeb6939e1e92d884ca8e40b759 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 18:31:37 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: make types_with_empty_interse=
ction a<br>
&gt; + bitmask<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/d0ac999620c8c0aeb6939e1e92d884ca8e40b759" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/d0ac999620c8c0aeb6=
939e1e92d884ca8e40b759</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/x509/name_constraints.c | 39 +++++++++++++++++++++++++++--------=
--<br>
&gt; + 1 file changed, 29 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -275,6 +275,7 @@ static enum name_constraint_relation com<br>
&gt; + <br>
&gt; + static inline bool is_supported_type(unsigned type)<br>
&gt; + {<br>
&gt; ++=C2=A0 =C2=A0 /* all of these should be under GNUTLS_SAN_MAX (inters=
ect bitmasks) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=
=3D GNUTLS_SAN_RFC822NAME ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D=3D GNUTLS_SAN_IPAD=
DRESS;<br>
&gt; + }<br>
&gt; +@@ -683,6 +684,21 @@ name_constraints_node_new(gnutls_x509_na<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tmp;<br>
&gt; + }<br>
&gt; + <br>
&gt; ++static int<br>
&gt; ++name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st =
*nodes,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st =
*nodes2);<br>
&gt; ++<br>
&gt; ++#define type_bitmask_t uint8_t /* increase if GNUTLS_SAN_MAX grows *=
/<br>
&gt; ++#define type_bitmask_set(mask, t) ((mask) |=3D (1u &lt;&lt; (t)))<br=
>
&gt; ++#define type_bitmask_clr(mask, t) ((mask) &amp;=3D ~(1u &lt;&lt; (t)=
))<br>
&gt; ++#define type_bitmask_in(mask, t) ((mask) &amp; (1u &lt;&lt; (t)))<br=
>
&gt; ++/* C99-compatible compile-time assertions; gnutls_int.h undefines ve=
rify */<br>
&gt; ++typedef char assert_san_max[(GNUTLS_SAN_MAX &lt; 8) ? 1 : -1];<br>
&gt; ++typedef char assert_dnsname[(GNUTLS_SAN_DNSNAME &lt;=3D GNUTLS_SAN_M=
AX) ? 1 : -1];<br>
&gt; ++typedef char assert_rfc822[(GNUTLS_SAN_RFC822NAME &lt;=3D GNUTLS_SAN=
_MAX) ? 1 : -1];<br>
&gt; ++typedef char assert_ipaddr[(GNUTLS_SAN_IPADDRESS &lt;=3D GNUTLS_SAN_=
MAX) ? 1 : -1];<br>
&gt; ++<br>
&gt; + /*-<br>
&gt; +=C2=A0 * @brief name_constraints_node_list_intersect:<br>
&gt; +=C2=A0 * @nc: %gnutls_x509_name_constraints_t<br>
&gt; +@@ -710,12 +726,9 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .capacity =3D 0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const unsigned char universal_ip[32] =3D {=
 0 };<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /* temporary array to see, if we need to add universal=
 excluded constraints<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* (see phase 3 for details)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* indexed directly by (gnutls_x509_subject_alt_n=
ame_t enum - 1) */<br>
&gt; +-=C2=A0 =C2=A0 unsigned char types_with_empty_intersection[GNUTLS_SAN=
_MAX];<br>
&gt; +-=C2=A0 =C2=A0 memset(types_with_empty_intersection, 0,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(types_with_empty_int=
ersection));<br>
&gt; ++=C2=A0 =C2=A0 /* bitmask to see if we need to add universal excluded=
 constraints<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* (see phase 3 for details) */<br>
&gt; ++=C2=A0 =C2=A0 type_bitmask_t types_with_empty_intersection =3D 0;<br=
>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (permitted-&gt;size =3D=3D 0 || permitted2-&gt=
;size =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +@@ -741,7 +754,8 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// note the possibility of empty interse=
ction for this type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// if we add something to the intersecti=
on in phase 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// we will reset this flag back to 0 the=
n<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types_with_empty_intersection[t-&gt;type - =
1] =3D 1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_set(types_with_empty_intersect=
ion,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0t-&gt;type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D t2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +@@ -795,8 +809,8 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GNUTLS_E_INTERNAL_ERROR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// we will not add universal excluded co=
nstraint for this type<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types_with_empty_intersection[tmp-&gt;type =
- 1] =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_clr(types_with_empty_intersect=
ion,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tmp-&gt;type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// add intersection node to PERMITTED<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D name_constraints_node_list_add(p=
ermitted,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tmp);<br>
&gt; +@@ -824,7 +838,7 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * excluded constraint with universal wildcard<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 * (since the intersection of permitted is now em=
pty). */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (type =3D 1; type &lt;=3D GNUTLS_SAN_MAX; typ=
e++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (types_with_empty_inter=
section[type - 1] =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!type_bitmask_in(types=
_with_empty_intersection, type))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_hard_log(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Adding universal excluded name constraint for type %d.\n&quot;=
,<br>
&gt; +@@ -868,6 +882,11 @@ cleanup:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; + }<br>
&gt; + <br>
&gt; ++#undef type_bitmask_t<br>
&gt; ++#undef type_bitmask_set<br>
&gt; ++#undef type_bitmask_clr<br>
&gt; ++#undef type_bitmask_in<br>
&gt; ++<br>
&gt; + static int<br>
&gt; + name_constraints_node_list_union(gnutls_x509_name_constraints_t nc,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_node_list_st *n=
odes,<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..27ed995d8d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch<br>
&gt; @@ -0,0 +1,437 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From d6054f0016db05fb5c82177ddbd0a4e8331059a1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Wed, 4 Feb 2026 20:03:49 +0100<br>
&gt; +Subject: [PATCH] x509/name_constraints: name_constraints_node_list_in=
tersect<br>
&gt; + over sorted<br>
&gt; +<br>
&gt; +Fixes: #1773<br>
&gt; +Fixes: GNUTLS-SA-2026-02-09-2<br>
&gt; +Fixes: CVE-2025-14831<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/d6054f0016db05fb5c82177ddbd0a4e8331059a1" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/d6054f0016db05fb5c=
82177ddbd0a4e8331059a1</a>]<br>
&gt; +CVE: CVE-2025-14831<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt; + lib/x509/name_constraints.c | 350 ++++++++++++++--------------------=
--<br>
&gt; + 2 files changed, 142 insertions(+), 215 deletions(-)<br>
&gt; +<br>
&gt; +#diff --git a/NEWS b/NEWS<br>
&gt; +#index e506db547a..96b7484fdf 100644<br>
&gt; +#--- a/NEWS<br>
&gt; +#+++ b/NEWS<br>
&gt; +#@@ -14,6 +14,13 @@ See the end for copying conditions.<br>
&gt; +#=C2=A0 =C2=A0 Reported by Jaehun Lee.<br>
&gt; +#=C2=A0 =C2=A0 [Fixes: GNUTLS-SA-2026-02-09-1, CVSS: high] [CVE-2026-=
1584]<br>
&gt; +# <br>
&gt; +#+** libgnutls: Fix name constraint processing performance issue<br>
&gt; +#+=C2=A0 =C2=A0Verifying certificates with pathological amounts of na=
me constraints<br>
&gt; +#+=C2=A0 =C2=A0could lead to a denial of service attack via resource =
exhaustion.<br>
&gt; +#+=C2=A0 =C2=A0Reworked processing algorithms exhibit better performa=
nce characteristics.<br>
&gt; +#+=C2=A0 =C2=A0Reported by Tim Scheckenbach.<br>
&gt; +#+=C2=A0 =C2=A0[Fixes: GNUTLS-SA-2026-02-09-2, CVSS: medium] [CVE-202=
5-14831]<br>
&gt; +#+<br>
&gt; +# ** libgnutls: Fix multiple unexploitable overflows<br>
&gt; +#=C2=A0 =C2=A0 Reported by Tim R=C3=BChsen (#1783, #1786).<br>
&gt; +# <br>
&gt; +--- a/lib/x509/name_constraints.c<br>
&gt; ++++ b/lib/x509/name_constraints.c<br>
&gt; +@@ -446,13 +446,6 @@ name_constraints_node_add_copy(gnutls_x5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 src-&gt;name.data, src-&gt;name.size);<br>
&gt; + }<br>
&gt; + <br>
&gt; +-// for documentation see the implementation<br>
&gt; +-static int name_constraints_intersect_nodes(<br>
&gt; +-=C2=A0 =C2=A0 gnutls_x509_name_constraints_t nc,<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_st *node1,<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_st *node2,<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st **intersection);<br>
&gt; +-<br>
&gt; + /*-<br>
&gt; +=C2=A0 * _gnutls_x509_name_constraints_is_empty:<br>
&gt; +=C2=A0 * @nc: name constraints structure<br>
&gt; +@@ -716,129 +709,143 @@ typedef char assert_ipaddr[(GNUTLS_SAN_I<br>
&gt; + static int name_constraints_node_list_intersect(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gnutls_x509_name_constraints_t nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *permitted,<=
br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_list_st *permitted2=
,<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_list_st *permitted2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct name_constraints_node_list_st *excluded)<b=
r>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st *tmp;<br>
&gt; +-=C2=A0 =C2=A0 int ret, type, used;<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_list_st removed =3D { .da=
ta =3D NULL,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D 0,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.capacity =3D 0 };<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_st *nc1, *nc2;<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_list_st result =3D { 0 };=
<br>
&gt; ++=C2=A0 =C2=A0 struct name_constraints_node_list_st unsupp2 =3D { 0 }=
;<br>
&gt; ++=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; ++=C2=A0 =C2=A0 unsigned type;<br>
&gt; ++=C2=A0 =C2=A0 int ret =3D GNUTLS_E_SUCCESS;<br>
&gt; ++=C2=A0 =C2=A0 size_t i, j, p1_unsupp =3D 0, p2_unsupp =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 type_bitmask_t universal_exclude_needed =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 type_bitmask_t types_in_p1 =3D 0, types_in_p2 =3D 0;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0static const unsigned char universal_ip[32] =3D {=
 0 };<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /* bitmask to see if we need to add universal excluded=
 constraints<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* (see phase 3 for details) */<br>
&gt; +-=C2=A0 =C2=A0 type_bitmask_t types_with_empty_intersection =3D 0;<br=
>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (permitted-&gt;size =3D=3D 0 || permitted2-&gt=
;size =3D=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /* Phase 1<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* For each name in PERMITTED, if a PERMITTED2 do=
es not contain a name<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* with the same type, move the original name to =
REMOVED.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* Do this also for node of unknown type (not DNS=
, email, IP) */<br>
&gt; +-=C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; permitted-&gt;size;) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct name_constraints_no=
de_st *t =3D permitted-&gt;data[i];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct name_constrai=
nts_node_st *found =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t j =3D 0; j &lt=
; permitted2-&gt;size; j++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const struct name_constraints_node_st *t2 =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 permitted2-&gt;data[j];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (t-&gt;type =3D=3D t2-&gt;type) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // check bounds (we will use &#39;t-&gt;typ=
e&#39; as index)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (t-&gt;type &gt; GNUTLS_SAN_MAX || t-&gt=
;type =3D=3D 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert()=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GNUTLS_=
E_INTERNAL_ERROR;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // note the possibility of empty intersecti=
on for this type<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // if we add something to the intersection =
in phase 2,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // we will reset this flag back to 0 then<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_set(types_with_empty_intersect=
ion,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0t-&gt;type);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D t2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; ++=C2=A0 =C2=A0 /* make sorted views of the arrays */<br>
&gt; ++=C2=A0 =C2=A0 ret =3D ensure_sorted(permitted);<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 ret =3D ensure_sorted(permitted2);<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* deal with the leading unsupported types first: coun=
t, then union */<br>
&gt; ++=C2=A0 =C2=A0 while (p1_unsupp &lt; permitted-&gt;size &amp;&amp;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_supported_type(permitte=
d-&gt;sorted_view[p1_unsupp]-&gt;type))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p1_unsupp++;<br>
&gt; ++=C2=A0 =C2=A0 while (p2_unsupp &lt; permitted2-&gt;size &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_supported_type(permitte=
d2-&gt;sorted_view[p2_unsupp]-&gt;type))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2_unsupp++;<br>
&gt; ++=C2=A0 =C2=A0 if (p1_unsupp) { /* copy p1 unsupported type pointers =
into result */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result.data =3D gnutls_cal=
loc(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 p1_unsupp, sizeof(struct name_constraints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!result.data) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D GNUTLS_E_MEMORY_ERROR;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(result.data, permit=
ted-&gt;sorted_view,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0p1_unsupp * sizeof(struct name_constraints_node_st *));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result.size =3D result.cap=
acity =3D p1_unsupp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result.dirty =3D true;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 if (p2_unsupp) { /* union will make deep copies from p=
2 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsupp2.data =3D permitted=
2-&gt;sorted_view; /* so, just alias */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsupp2.size =3D unsupp2.c=
apacity =3D p2_unsupp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsupp2.dirty =3D false; /=
* we know it&#39;s sorted */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsupp2.sorted_view =3D pe=
rmitted2-&gt;sorted_view;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_n=
ode_list_union(nc, &amp;result, &amp;unsupp2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (found !=3D NULL &amp;&=
amp; is_supported_type(t-&gt;type)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* move node from PERMITTED to REMOVED */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;removed, t);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* remove node by swapping */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (i &lt; permitted-&gt;size - 1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 permitted-&gt;data[i] =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 permitted-&gt;d=
ata[permitted-&gt;size - 1];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 permitted-&gt;size--;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 permitted-&gt;dirty =3D true;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
&gt; ++=C2=A0 =C2=A0 /* with that out of the way, pre-compute the supported=
 types we have */<br>
&gt; ++=C2=A0 =C2=A0 for (i =3D p1_unsupp; i &lt; permitted-&gt;size; i++) =
{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D permitted-&gt;sor=
ted_view[i]-&gt;type;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type &lt; 1 || type &g=
t; GNUTLS_SAN_MAX) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_set(types_in_=
p1, type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 for (j =3D p2_unsupp; j &lt; permitted2-&gt;size; j++)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D permitted2-&gt;so=
rted_view[j]-&gt;type;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type &lt; 1 || type &g=
t; GNUTLS_SAN_MAX) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_set(types_in_=
p2, type);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 /* universal excludes might be needed for types inters=
ecting to empty */<br>
&gt; ++=C2=A0 =C2=A0 universal_exclude_needed =3D types_in_p1 &amp; types_i=
n_p2;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /* Phase 2<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* iterate through all combinations from PERMITTE=
D2 and PERMITTED<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* and create intersections of nodes with same ty=
pe */<br>
&gt; +-=C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; permitted2-&gt;size; i++) =
{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct name_constrai=
nts_node_st *t2 =3D permitted2-&gt;data[i];<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // current PERMITTED2 node=
 has not yet been used for any intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // (and is not in REMOVED =
either)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 used =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t j =3D 0; j &lt=
; removed.size; j++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const struct name_constraints_node_st *t =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 removed.data[j];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // save intersection of name constraints into tmp<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_intersect_nodes(nc, t, t2, &amp;tmp);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 used =3D 1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // if intersection is not empty<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tmp !=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NULL) { // intersection for this type is not empty<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // check bounds<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tmp-&gt;type &gt; GNUTLS_SAN_MAX ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp-&gt;type =3D=3D 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_free(tmp=
);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gnutls_a=
ssert_val(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 GNUTLS_E_INTERNAL_ERROR);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // we will not add universal excluded const=
raint for this type<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type_bitmask_clr(types_with_empty_intersect=
ion,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0tmp-&gt;type);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // add intersection node to PERMITTED<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_node_list_add(perm=
itted,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmp);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert()=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; ++=C2=A0 =C2=A0 /* go through supported type NCs and intersect in a si=
ngle pass */<br>
&gt; ++=C2=A0 =C2=A0 i =3D p1_unsupp;<br>
&gt; ++=C2=A0 =C2=A0 j =3D p2_unsupp;<br>
&gt; ++=C2=A0 =C2=A0 while (i &lt; permitted-&gt;size || j &lt; permitted2-=
&gt;size) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc1 =3D (i &lt; permitted-=
&gt;size) ? permitted-&gt;sorted_view[i] : NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc2 =3D (j &lt; permitted2=
-&gt;size) ? permitted2-&gt;sorted_view[j] :<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_name_const=
raint_nodes(nc1, nc2);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL); /* comparator-guaranteed */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* if nothing to intersect with, shallow-copy nc1 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!type_bitmask_in(types_in_p2, nc1-&gt;type))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_node_list_add(&amp=
;result,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++; /* otherwise skip nc1 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc2 !=3D NULL); /* comparator-guaranteed */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* if nothing to intersect with, deep-copy nc2 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (!type_bitmask_in(types_in_p1, nc2-&gt;type))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D name_constraints_node_add_copy(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc, &amp;result=
, nc2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++; /* otherwise skip nc2 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: /* ad=
d nc1, shallow-copy */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* comparator */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 type_bitmask_clr(universal_exclude_needed, nc1-&gt;type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;result, nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: /* pick =
nc2, deep-copy */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* comparator */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 type_bitmask_clr(universal_exclude_needed, nc2-&gt;type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_copy(nc, &amp;result, nc2);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: /* pick whi=
chever: nc1, shallow-copy */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert(nc1 !=3D NULL &amp;&amp; nc2 !=3D NULL); /* loop condition */<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 type_bitmask_clr(universal_exclude_needed, nc1-&gt;type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_list_add(&amp;result, nc1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 j++;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // if the node from PERMIT=
TED2 was not used for intersection, copy it to DEST<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Beware: also copies nod=
es other than DNS, email, IP,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=
=A0since their counterpart may have been moved in phase 1.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!used) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D name_constraints_node_add_copy(nc, permitted, t2);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_assert();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gnutls_assert();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 /* Phase 3<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* For each type: If we have empty permitted name=
 constraints now<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* and we didn&#39;t have at the beginning, we ha=
ve to add a new<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* excluded constraint with universal wildcard<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0* (since the intersection of permitted is now em=
pty). */<br>
&gt; ++=C2=A0 =C2=A0 /* finishing touch: add universal excluded constraints=
 for types where<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* both lists had constraints, but all intersecti=
ons ended up empty */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (type =3D 1; type &lt;=3D GNUTLS_SAN_MAX; typ=
e++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!type_bitmask_in(types=
_with_empty_intersection, type))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!type_bitmask_in(unive=
rsal_exclude_needed, type))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_hard_log(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Adding universal excluded name constraint for type %d.\n&quot;=
,<br>
&gt; +@@ -871,14 +878,24 @@ static int name_constraints_node_list_in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default: // do nothing, at=
 least one node was already moved in phase 1<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default: /* unsupported ty=
pe; should be unreacheable */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret =3D gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 ret =3D GNUTLS_E_SUCCESS;<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(permitted-&gt;data);<br>
&gt; ++=C2=A0 =C2=A0 gnutls_free(permitted-&gt;sorted_view);<br>
&gt; ++=C2=A0 =C2=A0 permitted-&gt;data =3D result.data;<br>
&gt; ++=C2=A0 =C2=A0 permitted-&gt;sorted_view =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 permitted-&gt;size =3D result.size;<br>
&gt; ++=C2=A0 =C2=A0 permitted-&gt;capacity =3D result.capacity;<br>
&gt; ++=C2=A0 =C2=A0 permitted-&gt;dirty =3D true;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 result.data =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 ret =3D GNUTLS_E_SUCCESS;<br>
&gt; + cleanup:<br>
&gt; +-=C2=A0 =C2=A0 gnutls_free(removed.data);<br>
&gt; ++=C2=A0 =C2=A0 name_constraints_node_list_clear(&amp;result);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; + }<br>
&gt; + <br>
&gt; +@@ -1254,100 +1271,6 @@ static unsigned email_matches(const gnut<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return rel =3D=3D NC_EQUAL || rel =3D=3D NC_INCLU=
DED_BY;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-/*-<br>
&gt; +- * name_constraints_intersect_nodes:<br>
&gt; +- * @nc1: name constraints node 1<br>
&gt; +- * @nc2: name constraints node 2<br>
&gt; +- * @_intersection: newly allocated node with intersected constraints=
,<br>
&gt; +- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL if the intersection =
is empty<br>
&gt; +- *<br>
&gt; +- * Inspect 2 name constraints nodes (of possibly different types) an=
d allocate<br>
&gt; +- * a new node with intersection of given constraints.<br>
&gt; +- *<br>
&gt; +- * Returns: On success, %GNUTLS_E_SUCCESS (0) is returned, otherwise=
 a negative error value.<br>
&gt; +- -*/<br>
&gt; +-static int name_constraints_intersect_nodes(<br>
&gt; +-=C2=A0 =C2=A0 gnutls_x509_name_constraints_t nc,<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_st *node1,<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_st *node2,<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st **_intersection)<br>
&gt; +-{<br>
&gt; +-=C2=A0 =C2=A0 // presume empty intersection<br>
&gt; +-=C2=A0 =C2=A0 struct name_constraints_node_st *intersection =3D NULL=
;<br>
&gt; +-=C2=A0 =C2=A0 const struct name_constraints_node_st *to_copy =3D NUL=
L;<br>
&gt; +-=C2=A0 =C2=A0 enum name_constraint_relation rel;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 *_intersection =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 if (node1-&gt;type !=3D node2-&gt;type) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 switch (node1-&gt;type) {<br>
&gt; +-=C2=A0 =C2=A0 case GNUTLS_SAN_DNSNAME:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_dns_names(=
&amp;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 case GNUTLS_SAN_RFC822NAME:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_emails(&am=
p;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 case GNUTLS_SAN_IPADDRESS:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rel =3D compare_ip_ncs(&am=
p;node1-&gt;name, &amp;node2-&gt;name);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (rel) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_EQUAL: // equal me=
ans doesn&#39;t matter which one<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDES: // node2=
 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_INCLUDED_BY: // no=
de1 is more specific<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 to_copy =3D node1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_BEFORE: // n=
o intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case NC_SORTS_AFTER: // no=
 intersection<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return GNUTLS_E_SUCCESS;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 default:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // for other types, we don=
&#39;t know how to do the intersection, assume empty<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<b=
r>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 // copy existing node if applicable<br>
&gt; +-=C2=A0 =C2=A0 if (to_copy !=3D NULL) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *_intersection =3D name_co=
nstraints_node_new(nc, to_copy-&gt;type,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_copy-&gt;name.dat=
a,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_copy-&gt;name.siz=
e);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*_intersection =3D=3D =
NULL)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(GNUTLS_E_MEMORY_ERROR);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intersection =3D *_interse=
ction;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(intersection-&gt;na=
me.data !=3D NULL);<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 return GNUTLS_E_SUCCESS;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + /*<br>
&gt; +=C2=A0 * Returns: true if the certification is acceptable, and false =
otherwise.<br>
&gt; +=C2=A0 */<br>
&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a> b/meta/recip=
es-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; index 026ae650f6..ccb6a2b4b2 100644<br>
&gt; --- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; @@ -34,6 +34,15 @@ SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/=
ftp/gcrypt/gnutls/v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar" rel=3D"noreferrer"=
 target=3D"_blank">https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnu=
tls-${PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-32990.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-6395.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-9820.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-1.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-2.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-3.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-4.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-5.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-6.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-7.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-8.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-9.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;2bea4e154794f3f00180fa2a5c51fe8b005=
ac7a31cd58bd44cdfa7f36ebc3a9b&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000549c6a064b8a496e--

