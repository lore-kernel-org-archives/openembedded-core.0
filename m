Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62490C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 06:14:30 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.4641.1741414468000669177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 22:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ghc95lZL;
 spf=pass (domain: mvista.com, ip: 209.85.218.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac202264f9cso482697466b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 22:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741414466; x=1742019266; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TuBbmRO+of4GPLwIAgqD8MC40x30Qea666TvPfXJXPA=;
        b=ghc95lZLCgBz1CKLBS67uzrWXktPGaLmG66G3kS1ZOj1XqwdvB2kN8dK+DCw2h7dgW
         dWfwts0mJPAqNnujzJDQM00Y9dzum3csfdkCVegvOxT/wSMj7R1VPF0fLZvwTKV2pabh
         YVLFbhzjd8bWk5MONGKQYH7De7hcRVrs+ZbGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741414466; x=1742019266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuBbmRO+of4GPLwIAgqD8MC40x30Qea666TvPfXJXPA=;
        b=Suy7wvxgAK8npapKtGKw71AjXoyWMUUkMeSN3sglpJTv+NLu8AJoE6Ujt1OPewhjww
         jPOa2cJuIFy5zLT/EylBZW/Apa226dzbJjjlajAa6AnEYTyh4xo/iT8QlNcshR0CC98E
         zi4KldJX1FYtxfkovKzdBknZsz5FDL7rhB38tJ1wQoEy7cfSCa5jVSLLJrpDGL+wGDNB
         bD3jo+BzCP1MD7BLMECJicbPt0UJNTiDHPCRkrfLHe0CG8vXwTBWFJ3EzhzePfcCGxLW
         +8tsqINB9qgHDWNLusfaRbA6a79feNnzxmppe2rezBNvWWxyzVsV/MLu7CgbH+jor1Ap
         DKgA==
X-Forwarded-Encrypted: i=1; AJvYcCVXL/c12Y19eA9a2ipxsinIrKPZI6t5e+ZtsNeY2X13l4hyPXFC9PMa8wMx4fQzPGhg0cD4n6lANOrlaAzNftsMcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxx2QtZ+5rMU8Dobppe0RrlDikW0FhjLUjtVBP3w8GEuzD34hCY
	S6LerlbX1DfICw3sfkDd5HU3dtV7uO3GAsGhoXs+b3aIu9rrst5yCuMNHgGKV0BqRMYqJawLXwe
	8KWp3P0TvEiJVUgaqh5VO/8g7l/1ZEm6zOIxk3Q==
X-Gm-Gg: ASbGncsJllaG2Pgfpmtbg2dleqWKYROjoF8+BCrA1z+T2TxMF9mcwByTKCvXs5eB8bp
	bbyvqC+P4MjLdnxVbdBqIgJeH95lfYra1Wvp8X15ZJWGdUtDWdz2AqANov2waVG2u1/QYpmHnXb
	xMuEAzgnbtGkuiqh88anN8kBlIqIA=
X-Google-Smtp-Source: AGHT+IGDVasex3xMat5mLHOCPlovXU6aT7cMAWucU3yzaCAhNrrgvxap5Sd/6hVoU2gpYMunKzmWM0JG28cr0Q0h4vo=
X-Received: by 2002:a17:907:2d92:b0:abf:489b:5c77 with SMTP id
 a640c23a62f3a-ac252b35b7emr715349366b.31.1741414465834; Fri, 07 Mar 2025
 22:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
 <CANQUz18GwO4HEGP+BK10wjJoe5=MZvyqANS-Ye1FBbyf1P9s9Q@mail.gmail.com> <CAOSpxdbuJ39w-P9C9b+GpOjudn1h4n9-XnGvHGk=hC2US4Wo9Q@mail.gmail.com>
In-Reply-To: <CAOSpxdbuJ39w-P9C9b+GpOjudn1h4n9-XnGvHGk=hC2US4Wo9Q@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 8 Mar 2025 11:44:14 +0530
X-Gm-Features: AQ5f1JqWU6LaUwMACH_zP5GbKEPLX6M0hkYqUFr8C5af-SPMr938QDevqy9tlfc
Message-ID: <CANQUz1-d8E6UOUu2s-wtPOAZEj0pAqYs6ZJZSniVm+cijoQAog@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXVtraXJrc3RvbmVdW1BBVENIwqBdIGxpYnRhc24xOiBmaXggQ1ZFLQ==?=
	=?UTF-8?B?MjAyNC0xMjEzMw==?=
To: steve@sakoman.com
Cc: peng.zhang1.cn@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a4ac42062fcea609"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 06:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212473

--000000000000a4ac42062fcea609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Steve...!!!

Thanks & Regards,
Vijay

On Fri, Mar 7, 2025 at 9:34=E2=80=AFPM Steve Sakoman via lists.openembedded=
.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:

> On Fri, Mar 7, 2025 at 3:09=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > Hi Zhang Peng,
> >
> > Updating libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-12133.
> >
> > Upgrade patch was already sent and now it is in the master branch .
> >
> >
> https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b9f522e=
0be31c08790a3f2050c6d052d93
> >
> > https://lists.openembedded.org/g/openembedded-core/message/212059
> >
> > Later it will merged to scarthgap and kirkstone branches.
>
> Looks like you only tagged it for styhead and scarthgap.  I'll add it
> to kirkstone too.
>
> Steve
>
>
> > On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul) (CN) via
> lists.openembedded.org <peng.zhang1.cn=3D
> windriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> >>
> >> CVE-2024-12133:
> >> A flaw in libtasn1 causes inefficient handling of specific certificate
> data.
> >> When processing a large number of elements in a certificate, libtasn1
> takes
> >> much longer than expected, which can slow down or even crash the syste=
m.
> >> This flaw allows an attacker to send a specially crafted certificate,
> >> causing a denial of service attack.
> >>
> >> Reference:
> >> [https://nvd.nist.gov/vuln/detail/CVE-2024-12133]
> >>
> >> Upstream patches:
> >> [
> https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf778=
0fc4a51f75a
> ]
> >> [
> https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1=
c22545ffc3d
> ]
> >>
> >> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> >> ---
> >>  .../gnutls/libtasn1/CVE-2024-12133-0001.patch |  43 ++++
> >>  .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 +++++++++++++++++=
+
> >>  .../recipes-support/gnutls/libtasn1_4.19.0.bb |   2 +
> >>  3 files changed, 280 insertions(+)
> >>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> >>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> >>
> >> diff --git
> a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> >> new file mode 100644
> >> index 0000000000..d843b6dc92
> >> --- /dev/null
> >> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> >> @@ -0,0 +1,43 @@
> >> +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00 200=
1
> >> +From: Daiki Ueno <ueno@gnu.org>
> >> +Date: Sat, 19 Oct 2024 02:47:04 +0900
> >> +Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call with
> node
> >> + cache
> >> +
> >> +If we are parsing a sequence or set and the current node is a direct
> >> +child of it, there is no need to traverse the list back to the
> >> +leftmost one as we have a node cache.
> >> +
> >> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> >> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> >> +
> >> +CVE: CVE-2024-12133
> >> +Upstream-Status: Backport [
> https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf778=
0fc4a51f75a
> ]
> >> +
> >> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> >> +---
> >> + lib/decoding.c | 9 ++++++++-
> >> + 1 file changed, 8 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/lib/decoding.c b/lib/decoding.c
> >> +index d2f6dea..1e0fcb3 100644
> >> +--- a/lib/decoding.c
> >> ++++ b/lib/decoding.c
> >> +@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, const
> void *ider, int *max_ider_len,
> >> +           move =3D UP;
> >> +       }
> >> +       if (move =3D=3D UP)
> >> +-      p =3D _asn1_find_up (p);
> >> ++      {
> >> ++        /* If we are parsing a sequence or set and p is a direct
> >> ++           child of it, no need to traverse the list back to the
> leftmost node. */
> >> ++        if (tcache.tail =3D=3D p)
> >> ++          p =3D tcache.head;
> >> ++        else
> >> ++          p =3D _asn1_find_up (p);
> >> ++      }
> >> +     }
> >> +
> >> +   _asn1_delete_not_used (*element);
> >> +--
> >> +GitLab
> >> diff --git
> a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> >> new file mode 100644
> >> index 0000000000..a3a6af2920
> >> --- /dev/null
> >> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> >> @@ -0,0 +1,235 @@
> >> +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00 200=
1
> >> +From: Daiki Ueno <ueno@gnu.org>
> >> +Date: Fri, 8 Nov 2024 16:05:32 +0900
> >> +Subject: [PATCH] asn1_find_node: optimize "?NUMBER" node lookup with
> indexing
> >> +
> >> +To avoid linear search of named nodes, this adds a array of child
> >> +nodes to their parent nodes as a cache.
> >> +
> >> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> >> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> >> +
> >> +CVE: CVE-2024-12133
> >> +Upstream-Status: Backport [
> https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1=
c22545ffc3d
> ]
> >> +
> >> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> >> +---
> >> + lib/element.c    | 56 ++++++++++++++++++++++++++++++++++++++++++----=
--
> >> + lib/element.h    | 10 +++++++++
> >> + lib/int.h        |  8 +++++++
> >> + lib/parser_aux.c | 10 +++++++++
> >> + lib/structure.c  | 13 +++++++++++
> >> + 5 files changed, 90 insertions(+), 7 deletions(-)
> >> +
> >> +diff --git a/lib/element.c b/lib/element.c
> >> +index 850bef4a..528df418 100644
> >> +--- a/lib/element.c
> >> ++++ b/lib/element.c
> >> +@@ -33,6 +33,8 @@
> >> + #include "structure.h"
> >> + #include "c-ctype.h"
> >> + #include "element.h"
> >> ++#include <limits.h>
> >> ++#include "intprops.h"
> >> +
> >> + void
> >> + _asn1_hierarchical_name (asn1_node_const node, char *name, int
> name_size)
> >> +@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char
> *value, unsigned char *value_out,
> >> +   return ASN1_SUCCESS;
> >> + }
> >> +
> >> ++int
> >> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t
> position,
> >> ++                    asn1_node node)
> >> ++{
> >> ++  if (position >=3D array->size)
> >> ++    {
> >> ++      size_t new_size =3D position, i;
> >> ++      asn1_node *new_nodes;
> >> ++
> >> ++      if (INT_MULTIPLY_OVERFLOW (new_size, 2))
> >> ++      return ASN1_GENERIC_ERROR;
> >> ++      new_size *=3D 2;
> >> ++
> >> ++      if (INT_ADD_OVERFLOW (new_size, 1))
> >> ++      return ASN1_GENERIC_ERROR;
> >> ++      new_size +=3D 1;
> >> ++
> >> ++      if (INT_MULTIPLY_OVERFLOW (new_size, sizeof (*new_nodes)))
> >> ++      return ASN1_GENERIC_ERROR;
> >> ++
> >> ++      new_nodes =3D realloc (array->nodes, new_size * sizeof
> (*new_nodes));
> >> ++      if (!new_nodes)
> >> ++      return ASN1_MEM_ALLOC_ERROR;
> >> ++
> >> ++      for (i =3D array->size; i < new_size; i++)
> >> ++      new_nodes[i] =3D NULL;
> >> ++
> >> ++      array->nodes =3D new_nodes;
> >> ++      array->size =3D new_size;
> >> ++    }
> >> ++
> >> ++  array->nodes[position] =3D node;
> >> ++  return ASN1_SUCCESS;
> >> ++}
> >> ++
> >> + /* Appends a new element into the sequence (or set) defined by this
> >> +  * node. The new element will have a name of '?number', where number
> >> +  * is a monotonically increased serial number.
> >> +@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, struct
> node_tail_cache_st *pcache)
> >> +   asn1_node p, p2;
> >> +   char temp[LTOSTR_MAX_SIZE + 1];
> >> +   long n;
> >> ++  int result;
> >> +
> >> +   if (!node || !(node->down))
> >> +     return ASN1_GENERIC_ERROR;
> >> +@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node,
> struct node_tail_cache_st *pcache)
> >> +       pcache->tail =3D p2;
> >> +     }
> >> +
> >> +-  if (p->name[0] =3D=3D 0)
> >> +-    _asn1_str_cpy (temp, sizeof (temp), "?1");
> >> +-  else
> >> ++  n =3D 0;
> >> ++  if (p->name[0] !=3D 0)
> >> +     {
> >> +-      n =3D strtol (p->name + 1, NULL, 0);
> >> +-      n++;
> >> +-      temp[0] =3D '?';
> >> +-      _asn1_ltostr (n, temp + 1);
> >> ++      n =3D strtol (p->name + 1, NULL, 10);
> >> ++      if (n <=3D 0 || n >=3D LONG_MAX - 1)
> >> ++      return ASN1_GENERIC_ERROR;
> >> +     }
> >> ++  temp[0] =3D '?';
> >> ++  _asn1_ltostr (n + 1, temp + 1);
> >> +   _asn1_set_name (p2, temp);
> >> +   /*  p2->type |=3D CONST_OPTION; */
> >> ++  result =3D _asn1_node_array_set (&node->numbered_children, n, p2);
> >> ++  if (result !=3D ASN1_SUCCESS)
> >> ++    return result;
> >> ++  p2->parent =3D node;
> >> +
> >> +   return ASN1_SUCCESS;
> >> + }
> >> +diff --git a/lib/element.h b/lib/element.h
> >> +index 732054e9..b84e3a27 100644
> >> +--- a/lib/element.h
> >> ++++ b/lib/element.h
> >> +@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char
> *value,
> >> + void _asn1_hierarchical_name (asn1_node_const node, char *name,
> >> +                             int name_size);
> >> +
> >> ++static inline asn1_node_const
> >> ++_asn1_node_array_get (const struct asn1_node_array_st *array, size_t
> position)
> >> ++{
> >> ++  return position < array->size ? array->nodes[position] : NULL;
> >> ++}
> >> ++
> >> ++int
> >> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t
> position,
> >> ++                    asn1_node node);
> >> ++
> >> + #endif
> >> +diff --git a/lib/int.h b/lib/int.h
> >> +index 4f2d98d1..41b12b0b 100644
> >> +--- a/lib/int.h
> >> ++++ b/lib/int.h
> >> +@@ -31,6 +31,12 @@
> >> +
> >> + # define ASN1_SMALL_VALUE_SIZE 16
> >> +
> >> ++struct asn1_node_array_st
> >> ++{
> >> ++  asn1_node *nodes;
> >> ++  size_t size;
> >> ++};
> >> ++
> >> + /* This structure is also in libtasn1.h, but then contains less
> >> +    fields.  You cannot make any modifications to these first fields
> >> +    without breaking ABI.  */
> >> +@@ -47,6 +53,8 @@ struct asn1_node_st
> >> +   asn1_node left;             /* Pointer to the next list element */
> >> +   /* private fields: */
> >> +   unsigned char small_value[ASN1_SMALL_VALUE_SIZE];   /* For small
> values */
> >> ++  asn1_node parent;           /* Pointer to the parent node */
> >> ++  struct asn1_node_array_st numbered_children; /* Array of unnamed
> child nodes for caching */
> >> +
> >> +   /* values used during decoding/coding */
> >> +   int tmp_ival;
> >> +diff --git a/lib/parser_aux.c b/lib/parser_aux.c
> >> +index 415905a0..4281cc97 100644
> >> +--- a/lib/parser_aux.c
> >> ++++ b/lib/parser_aux.c
> >> +@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, const
> char *name)
> >> +   const char *n_start;
> >> +   unsigned int nsize;
> >> +   unsigned int nhash;
> >> ++  const struct asn1_node_array_st *numbered_children;
> >> +
> >> +   if (pointer =3D=3D NULL)
> >> +     return NULL;
> >> +@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, const
> char *name)
> >> +       if (p->down =3D=3D NULL)
> >> +       return NULL;
> >> +
> >> ++      numbered_children =3D &p->numbered_children;
> >> +       p =3D p->down;
> >> +       if (p =3D=3D NULL)
> >> +       return NULL;
> >> +@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, const
> char *name)
> >> +       }
> >> +       else
> >> +       {                       /* no "?LAST" */
> >> ++        if (n[0] =3D=3D '?' && c_isdigit (n[1]))
> >> ++          {
> >> ++            long position =3D strtol (n + 1, NULL, 10);
> >> ++            if (position > 0 && position < LONG_MAX)
> >> ++              p =3D _asn1_node_array_get (numbered_children, positio=
n -
> 1);
> >> ++          }
> >> +         while (p)
> >> +           {
> >> +             if (p->name_hash =3D=3D nhash && !strcmp (p->name, n))
> >> +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned int
> flags)
> >> +       if (node->value !=3D node->small_value)
> >> +       free (node->value);
> >> +     }
> >> ++
> >> ++  free (node->numbered_children.nodes);
> >> +   free (node);
> >> + }
> >> +
> >> +diff --git a/lib/structure.c b/lib/structure.c
> >> +index 9c95b9e2..32692ad2 100644
> >> +--- a/lib/structure.c
> >> ++++ b/lib/structure.c
> >> +@@ -31,6 +31,9 @@
> >> + #include <structure.h>
> >> + #include "parser_aux.h"
> >> + #include <gstr.h>
> >> ++#include "c-ctype.h"
> >> ++#include "element.h"
> >> ++#include <limits.h>
> >> +
> >> +
> >> + extern char _asn1_identifierMissing[];
> >> +@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, const
> char *element_name)
> >> +   if (source_node =3D=3D NULL)
> >> +     return ASN1_ELEMENT_NOT_FOUND;
> >> +
> >> ++  if (source_node->parent
> >> ++      && source_node->name[0] =3D=3D '?'
> >> ++      && c_isdigit (source_node->name[1]))
> >> ++    {
> >> ++      long position =3D strtol (source_node->name + 1, NULL, 10);
> >> ++      if (position > 0 && position < LONG_MAX)
> >> ++      _asn1_node_array_set (&source_node->parent->numbered_children,
> >> ++                            position - 1, NULL);
> >> ++    }
> >> ++
> >> +   p2 =3D source_node->right;
> >> +   p3 =3D _asn1_find_left (source_node);
> >> +   if (!p3)
> >> +--
> >> +GitLab
> >> diff --git a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> >> index 5fb8b54c06..d5bc1e408e 100644
> >> --- a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> >> +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> >> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
> "file://doc/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >>
> >>  SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
> >>             file://dont-depend-on-help2man.patch \
> >> +           file://CVE-2024-12133-0001.patch \
> >> +           file://CVE-2024-12133-0002.patch \
> >>             "
> >>
> >>  DEPENDS =3D "bison-native"
> >> --
> >> 2.43.0
> >>
> >>
> >>
> >>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212453):
> https://lists.openembedded.org/g/openembedded-core/message/212453
> Mute This Topic: https://lists.openembedded.org/mt/111565382/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a4ac42062fcea609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Steve...!!!<br><br></div><div>Thanks &amp; Reg=
ards,</div><div>Vijay</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, 2025 at 9:3=
4=E2=80=AFPM Steve Sakoman via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.op=
enembedded.org">sakoman.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar 7, 2025 at 3:=
09=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Hi Zhang Peng,<br>
&gt;<br>
&gt; Updating libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-12133.<b=
r>
&gt;<br>
&gt; Upgrade patch was already sent and now it is in the master branch .<br=
>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D3a8633b9f522e0be31c08790a3f2050c6d052d93" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b9=
f522e0be31c08790a3f2050c6d052d93</a><br>
&gt;<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
212059" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/212059</a><br>
&gt;<br>
&gt; Later it will merged to scarthgap and kirkstone branches.<br>
<br>
Looks like you only tagged it for styhead and scarthgap.=C2=A0 I&#39;ll add=
 it<br>
to kirkstone too.<br>
<br>
Steve<br>
<br>
<br>
&gt; On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul) (CN) via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> &lt;<a href=3D"http://peng.zhang1.cn" rel=3D"no=
referrer" target=3D"_blank">peng.zhang1.cn</a>=3D<a href=3D"mailto:windrive=
r.com@lists.openembedded.org" target=3D"_blank">windriver.com@lists.openemb=
edded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; CVE-2024-12133:<br>
&gt;&gt; A flaw in libtasn1 causes inefficient handling of specific certifi=
cate data.<br>
&gt;&gt; When processing a large number of elements in a certificate, libta=
sn1 takes<br>
&gt;&gt; much longer than expected, which can slow down or even crash the s=
ystem.<br>
&gt;&gt; This flaw allows an attacker to send a specially crafted certifica=
te,<br>
&gt;&gt; causing a denial of service attack.<br>
&gt;&gt;<br>
&gt;&gt; Reference:<br>
&gt;&gt; [<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-12133" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024=
-12133</a>]<br>
&gt;&gt;<br>
&gt;&gt; Upstream patches:<br>
&gt;&gt; [<a href=3D"https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220=
b5ba910b546afddf7780fc4a51f75a" rel=3D"noreferrer" target=3D"_blank">https:=
//gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f=
75a</a>]<br>
&gt;&gt; [<a href=3D"https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa25=
9dffa2620dabcad84e1c22545ffc3d" rel=3D"noreferrer" target=3D"_blank">https:=
//gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ff=
c3d</a>]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@win=
driver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../gnutls/libtasn1/CVE-2024-12133-0001.patch |=C2=A0 43 +++=
+<br>
&gt;&gt;=C2=A0 .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 ++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a> |=C2=A0 =
=C2=A02 +<br>
&gt;&gt;=C2=A0 3 files changed, 280 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-=
2024-12133-0001.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-=
2024-12133-0002.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0=
001.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch<=
br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..d843b6dc92<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.pat=
ch<br>
&gt;&gt; @@ -0,0 +1,43 @@<br>
&gt;&gt; +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_b=
lank">ueno@gnu.org</a>&gt;<br>
&gt;&gt; +Date: Sat, 19 Oct 2024 02:47:04 +0900<br>
&gt;&gt; +Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call =
with node<br>
&gt;&gt; + cache<br>
&gt;&gt; +<br>
&gt;&gt; +If we are parsing a sequence or set and the current node is a dir=
ect<br>
&gt;&gt; +child of it, there is no need to traverse the list back to the<br=
>
&gt;&gt; +leftmost one as we have a node cache.<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" tar=
get=3D"_blank">ueno@gnu.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefs=
son.org" target=3D"_blank">simon@josefsson.org</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2024-12133<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/l=
ibtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220=
b5ba910b546afddf7780fc4a51f75a</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@wi=
ndriver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + lib/decoding.c | 9 ++++++++-<br>
&gt;&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/decoding.c b/lib/decoding.c<br>
&gt;&gt; +index d2f6dea..1e0fcb3 100644<br>
&gt;&gt; +--- a/lib/decoding.c<br>
&gt;&gt; ++++ b/lib/decoding.c<br>
&gt;&gt; +@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, co=
nst void *ider, int *max_ider_len,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D UP;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (move =3D=3D UP)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we are parsing a sequence or s=
et and p is a direct<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child of it, no need to=
 traverse the list back to the leftmost node. */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcache.tail =3D=3D p)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D tcache.head;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0_asn1_delete_not_used (*element);<br>
&gt;&gt; +--<br>
&gt;&gt; +GitLab<br>
&gt;&gt; diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0=
002.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch<=
br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..a3a6af2920<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.pat=
ch<br>
&gt;&gt; @@ -0,0 +1,235 @@<br>
&gt;&gt; +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_b=
lank">ueno@gnu.org</a>&gt;<br>
&gt;&gt; +Date: Fri, 8 Nov 2024 16:05:32 +0900<br>
&gt;&gt; +Subject: [PATCH] asn1_find_node: optimize &quot;?NUMBER&quot; nod=
e lookup with indexing<br>
&gt;&gt; +<br>
&gt;&gt; +To avoid linear search of named nodes, this adds a array of child=
<br>
&gt;&gt; +nodes to their parent nodes as a cache.<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" tar=
get=3D"_blank">ueno@gnu.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefs=
son.org" target=3D"_blank">simon@josefsson.org</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2024-12133<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/l=
ibtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa25=
9dffa2620dabcad84e1c22545ffc3d</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@wi=
ndriver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + lib/element.c=C2=A0 =C2=A0 | 56 ++++++++++++++++++++++++++++++++=
++++++++++------<br>
&gt;&gt; + lib/element.h=C2=A0 =C2=A0 | 10 +++++++++<br>
&gt;&gt; + lib/int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++<br>
&gt;&gt; + lib/parser_aux.c | 10 +++++++++<br>
&gt;&gt; + lib/structure.c=C2=A0 | 13 +++++++++++<br>
&gt;&gt; + 5 files changed, 90 insertions(+), 7 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/element.c b/lib/element.c<br>
&gt;&gt; +index 850bef4a..528df418 100644<br>
&gt;&gt; +--- a/lib/element.c<br>
&gt;&gt; ++++ b/lib/element.c<br>
&gt;&gt; +@@ -33,6 +33,8 @@<br>
&gt;&gt; + #include &quot;structure.h&quot;<br>
&gt;&gt; + #include &quot;c-ctype.h&quot;<br>
&gt;&gt; + #include &quot;element.h&quot;<br>
&gt;&gt; ++#include &lt;limits.h&gt;<br>
&gt;&gt; ++#include &quot;intprops.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt; + void<br>
&gt;&gt; + _asn1_hierarchical_name (asn1_node_const node, char *name, int n=
ame_size)<br>
&gt;&gt; +@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char *=
value, unsigned char *value_out,<br>
&gt;&gt; +=C2=A0 =C2=A0return ASN1_SUCCESS;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++int<br>
&gt;&gt; ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t p=
osition,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 asn1_node node)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 if (position &gt;=3D array-&gt;size)<br>
&gt;&gt; ++=C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 size_t new_size =3D position, i;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 asn1_node *new_nodes;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, 2))<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 new_size *=3D 2;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (INT_ADD_OVERFLOW (new_size, 1))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 new_size +=3D 1;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, sizeof=
 (*new_nodes)))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 new_nodes =3D realloc (array-&gt;nodes, new=
_size * sizeof (*new_nodes));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!new_nodes)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return ASN1_MEM_ALLOC_ERROR;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D array-&gt;size; i &lt; new_size;=
 i++)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 new_nodes[i] =3D NULL;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 array-&gt;nodes =3D new_nodes;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 array-&gt;size =3D new_size;<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 array-&gt;nodes[position] =3D node;<br>
&gt;&gt; ++=C2=A0 return ASN1_SUCCESS;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; + /* Appends a new element into the sequence (or set) defined by t=
his<br>
&gt;&gt; +=C2=A0 * node. The new element will have a name of &#39;?number&#=
39;, where number<br>
&gt;&gt; +=C2=A0 * is a monotonically increased serial number.<br>
&gt;&gt; +@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, st=
ruct node_tail_cache_st *pcache)<br>
&gt;&gt; +=C2=A0 =C2=A0asn1_node p, p2;<br>
&gt;&gt; +=C2=A0 =C2=A0char temp[LTOSTR_MAX_SIZE + 1];<br>
&gt;&gt; +=C2=A0 =C2=A0long n;<br>
&gt;&gt; ++=C2=A0 int result;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0if (!node || !(node-&gt;down))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return ASN1_GENERIC_ERROR;<br>
&gt;&gt; +@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node, =
struct node_tail_cache_st *pcache)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pcache-&gt;tail =3D p2;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 if (p-&gt;name[0] =3D=3D 0)<br>
&gt;&gt; +-=C2=A0 =C2=A0 _asn1_str_cpy (temp, sizeof (temp), &quot;?1&quot;=
);<br>
&gt;&gt; +-=C2=A0 else<br>
&gt;&gt; ++=C2=A0 n =3D 0;<br>
&gt;&gt; ++=C2=A0 if (p-&gt;name[0] !=3D 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p-&gt;name + 1, NULL, 0);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 n++;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 temp[0] =3D &#39;?&#39;;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _asn1_ltostr (n, temp + 1);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p-&gt;name + 1, NULL, 10);<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (n &lt;=3D 0 || n &gt;=3D LONG_MAX - 1)<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 temp[0] =3D &#39;?&#39;;<br>
&gt;&gt; ++=C2=A0 _asn1_ltostr (n + 1, temp + 1);<br>
&gt;&gt; +=C2=A0 =C2=A0_asn1_set_name (p2, temp);<br>
&gt;&gt; +=C2=A0 =C2=A0/*=C2=A0 p2-&gt;type |=3D CONST_OPTION; */<br>
&gt;&gt; ++=C2=A0 result =3D _asn1_node_array_set (&amp;node-&gt;numbered_c=
hildren, n, p2);<br>
&gt;&gt; ++=C2=A0 if (result !=3D ASN1_SUCCESS)<br>
&gt;&gt; ++=C2=A0 =C2=A0 return result;<br>
&gt;&gt; ++=C2=A0 p2-&gt;parent =3D node;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0return ASN1_SUCCESS;<br>
&gt;&gt; + }<br>
&gt;&gt; +diff --git a/lib/element.h b/lib/element.h<br>
&gt;&gt; +index 732054e9..b84e3a27 100644<br>
&gt;&gt; +--- a/lib/element.h<br>
&gt;&gt; ++++ b/lib/element.h<br>
&gt;&gt; +@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char=
 *value,<br>
&gt;&gt; + void _asn1_hierarchical_name (asn1_node_const node, char *name,<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int name_size);<br>
&gt;&gt; +<br>
&gt;&gt; ++static inline asn1_node_const<br>
&gt;&gt; ++_asn1_node_array_get (const struct asn1_node_array_st *array, si=
ze_t position)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 return position &lt; array-&gt;size ? array-&gt;nodes[pos=
ition] : NULL;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; ++int<br>
&gt;&gt; ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t p=
osition,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 asn1_node node);<br>
&gt;&gt; ++<br>
&gt;&gt; + #endif<br>
&gt;&gt; +diff --git a/lib/int.h b/lib/int.h<br>
&gt;&gt; +index 4f2d98d1..41b12b0b 100644<br>
&gt;&gt; +--- a/lib/int.h<br>
&gt;&gt; ++++ b/lib/int.h<br>
&gt;&gt; +@@ -31,6 +31,12 @@<br>
&gt;&gt; +<br>
&gt;&gt; + # define ASN1_SMALL_VALUE_SIZE 16<br>
&gt;&gt; +<br>
&gt;&gt; ++struct asn1_node_array_st<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 asn1_node *nodes;<br>
&gt;&gt; ++=C2=A0 size_t size;<br>
&gt;&gt; ++};<br>
&gt;&gt; ++<br>
&gt;&gt; + /* This structure is also in libtasn1.h, but then contains less<=
br>
&gt;&gt; +=C2=A0 =C2=A0 fields.=C2=A0 You cannot make any modifications to =
these first fields<br>
&gt;&gt; +=C2=A0 =C2=A0 without breaking ABI.=C2=A0 */<br>
&gt;&gt; +@@ -47,6 +53,8 @@ struct asn1_node_st<br>
&gt;&gt; +=C2=A0 =C2=A0asn1_node left;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Pointer to the next list element */<br>
&gt;&gt; +=C2=A0 =C2=A0/* private fields: */<br>
&gt;&gt; +=C2=A0 =C2=A0unsigned char small_value[ASN1_SMALL_VALUE_SIZE];=C2=
=A0 =C2=A0/* For small values */<br>
&gt;&gt; ++=C2=A0 asn1_node parent;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Pointer to the parent node */<br>
&gt;&gt; ++=C2=A0 struct asn1_node_array_st numbered_children; /* Array of =
unnamed child nodes for caching */<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0/* values used during decoding/coding */<br>
&gt;&gt; +=C2=A0 =C2=A0int tmp_ival;<br>
&gt;&gt; +diff --git a/lib/parser_aux.c b/lib/parser_aux.c<br>
&gt;&gt; +index 415905a0..4281cc97 100644<br>
&gt;&gt; +--- a/lib/parser_aux.c<br>
&gt;&gt; ++++ b/lib/parser_aux.c<br>
&gt;&gt; +@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, cons=
t char *name)<br>
&gt;&gt; +=C2=A0 =C2=A0const char *n_start;<br>
&gt;&gt; +=C2=A0 =C2=A0unsigned int nsize;<br>
&gt;&gt; +=C2=A0 =C2=A0unsigned int nhash;<br>
&gt;&gt; ++=C2=A0 const struct asn1_node_array_st *numbered_children;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0if (pointer =3D=3D NULL)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, cons=
t char *name)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;down =3D=3D NULL)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 numbered_children =3D &amp;p-&gt;numbered_c=
hildren;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D p-&gt;down;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D NULL)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, con=
st char *name)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no &quot;?LAST&quot; */<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n[0] =3D=3D &#39;?&#39; &amp;&am=
p; c_isdigit (n[1]))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long position =3D strt=
ol (n + 1, NULL, 10);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (position &gt; 0 &a=
mp;&amp; position &lt; LONG_MAX)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_nod=
e_array_get (numbered_children, position - 1);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (p)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;name_ha=
sh =3D=3D nhash &amp;&amp; !strcmp (p-&gt;name, n))<br>
&gt;&gt; +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned i=
nt flags)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;value !=3D node-&gt;small=
_value)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0free (node-&gt;value);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 free (node-&gt;numbered_children.nodes);<br>
&gt;&gt; +=C2=A0 =C2=A0free (node);<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/lib/structure.c b/lib/structure.c<br>
&gt;&gt; +index 9c95b9e2..32692ad2 100644<br>
&gt;&gt; +--- a/lib/structure.c<br>
&gt;&gt; ++++ b/lib/structure.c<br>
&gt;&gt; +@@ -31,6 +31,9 @@<br>
&gt;&gt; + #include &lt;structure.h&gt;<br>
&gt;&gt; + #include &quot;parser_aux.h&quot;<br>
&gt;&gt; + #include &lt;gstr.h&gt;<br>
&gt;&gt; ++#include &quot;c-ctype.h&quot;<br>
&gt;&gt; ++#include &quot;element.h&quot;<br>
&gt;&gt; ++#include &lt;limits.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + extern char _asn1_identifierMissing[];<br>
&gt;&gt; +@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, co=
nst char *element_name)<br>
&gt;&gt; +=C2=A0 =C2=A0if (source_node =3D=3D NULL)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return ASN1_ELEMENT_NOT_FOUND;<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 if (source_node-&gt;parent<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; source_node-&gt;name[0] =3D=3D &=
#39;?&#39;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; c_isdigit (source_node-&gt;name[=
1]))<br>
&gt;&gt; ++=C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 long position =3D strtol (source_node-&gt;n=
ame + 1, NULL, 10);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (position &gt; 0 &amp;&amp; position &lt=
; LONG_MAX)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _asn1_node_array_set (&amp;source_node-&gt;=
parent-&gt;numbered_children,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 position - 1, NULL);<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0p2 =3D source_node-&gt;right;<br>
&gt;&gt; +=C2=A0 =C2=A0p3 =3D _asn1_find_left (source_node);<br>
&gt;&gt; +=C2=A0 =C2=A0if (!p3)<br>
&gt;&gt; +--<br>
&gt;&gt; +GitLab<br>
&gt;&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"http://libtasn=
1_4.19.0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a> b/=
meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.bb" rel=3D"no=
referrer" target=3D"_blank">libtasn1_4.19.0.bb</a><br>
&gt;&gt; index 5fb8b54c06..d5bc1e408e 100644<br>
&gt;&gt; --- a/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a><br>
&gt;&gt; @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md=
5=3Dd32239bcb673463ab874e80d47fae504 \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.=
gz \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-depend-=
on-help2man.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12133-00=
01.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12133-00=
02.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS =3D &quot;bison-native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.43.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212453): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212453" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212453</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111565382/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111565382/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a4ac42062fcea609--

