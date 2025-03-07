Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D65AC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 11:09:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.8738.1741345777088083968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 03:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hUx2WRPP;
 spf=pass (domain: mvista.com, ip: 209.85.218.48, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeec07b705so275378066b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741345775; x=1741950575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=znkMDtImV+Cs05Rv9PsVjkf4xYDruMuNTdTG9w0hLzM=;
        b=hUx2WRPPLkYinXzZi7b+wuNIX2lS9znLHtvjrLYAXmsgLU40sfp7SXdVvAhC1rah+R
         njDRg/vzbZHC0YQ/T/4bKIPpL+AskIKpDbOR4aKMV7udddtaeiEVgtWE40iExuoSvnZB
         kThTGTSwAZuMtQoGMHDshxMG7qtQFSrQb0IKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345775; x=1741950575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znkMDtImV+Cs05Rv9PsVjkf4xYDruMuNTdTG9w0hLzM=;
        b=tE1WvZFSYi7B8ztFcNI5GiQahvOB6Ped6fwKhL1mTaVaAfwuKvJaJQ/4suWSkDiyzt
         9pwWV8pP9GzxYhZcwWpRID8gRMAkHRw+WswHvzhspRNzQSmw9aJJe4baM1qG0a06tMr9
         TdqLoWfMtai11bXVl0eYxsO2T1AJCVBU9tb2tOsMC8oAAsGwdrBrnZAZfRLfq+F7BTaj
         /2uxo3HU13coMI99Aoj9MHs0PljlOsYKIkCwIjg3clZUDiI9hnvIkWCChvzhHRo1OG9d
         o5Ds80zldwtpR8khBMfN/qFaByKLb237hJnIV8XaiSaM8LR6tVATOJpvENNyMJcRw8an
         LiVg==
X-Gm-Message-State: AOJu0Yy21lFIDh7QgFRyKB7jC68C+TCaqhqgq3Jsz1qOd4lOPY5465AO
	iTBInjS6GycCxtoURfG2dfeRoDoCMCabJd5dEpfEGjlzQSggIMj04dutEv6E31xZbYdPxjVnCBL
	1uZMf2pnORdwToj4LUq6SClqQoTK/uYb70tTiHEfDebSVjUNE9IaEVg==
X-Gm-Gg: ASbGncuve4bheIUuIY1ibiIkTUVr22gLykroysWAeld6K9pb2BcS2bYAeBnC0twHefx
	B4ygBzpgsR+ttJK8Fh7wzzf/+aZ90H+QKznoSwqgohF4edpXbcZKTmajOcmfGqVO9O9A3guIE7d
	XrrVhEYFxL3icdVEf3RIhlVyvF6SM=
X-Google-Smtp-Source: AGHT+IHeXB1yYy3O/HiiSaTjKukutLykQdd1wVzwLkXKCCvzZILYch7mDiZnCv6ESZgOg8lhCVtiL9u7Dlosva3NAZg=
X-Received: by 2002:a17:907:7d8e:b0:abf:44bd:8326 with SMTP id
 a640c23a62f3a-ac25264fac3mr267430066b.17.1741345775074; Fri, 07 Mar 2025
 03:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 7 Mar 2025 16:39:23 +0530
X-Gm-Features: AQ5f1JqpboUSNpy5C3jt3XRAHwIaQKPtCkvumQYGOotz5LxH3j4ByDtQnNK5kvE
Message-ID: <CANQUz18GwO4HEGP+BK10wjJoe5=MZvyqANS-Ye1FBbyf1P9s9Q@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXVtraXJrc3RvbmVdW1BBVENIwqBdIGxpYnRhc24xOiBmaXggQ1ZFLQ==?=
	=?UTF-8?B?MjAyNC0xMjEzMw==?=
To: peng.zhang1.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005adaaf062fbea8dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 11:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212431

--0000000000005adaaf062fbea8dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhang Peng,

Updating libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-12133.

Upgrade patch was already sent and now it is in the master branch .

https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b9f522e0b=
e31c08790a3f2050c6d052d93

https://lists.openembedded.org/g/openembedded-core/message/212059

Later it will merged to scarthgap and kirkstone branches.

Thanks & Regards,
Vijay






On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul) (CN) via
lists.openembedded.org <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.o=
rg>
wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> CVE-2024-12133:
> A flaw in libtasn1 causes inefficient handling of specific certificate
> data.
> When processing a large number of elements in a certificate, libtasn1 tak=
es
> much longer than expected, which can slow down or even crash the system.
> This flaw allows an attacker to send a specially crafted certificate,
> causing a denial of service attack.
>
> Reference:
> [https://nvd.nist.gov/vuln/detail/CVE-2024-12133]
>
> Upstream patches:
> [
> https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf778=
0fc4a51f75a
> ]
> [
> https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1=
c22545ffc3d
> ]
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  .../gnutls/libtasn1/CVE-2024-12133-0001.patch |  43 ++++
>  .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 ++++++++++++++++++
>  .../recipes-support/gnutls/libtasn1_4.19.0.bb |   2 +
>  3 files changed, 280 insertions(+)
>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>
> diff --git
> a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> new file mode 100644
> index 0000000000..d843b6dc92
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
> @@ -0,0 +1,43 @@
> +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Sat, 19 Oct 2024 02:47:04 +0900
> +Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call with no=
de
> + cache
> +
> +If we are parsing a sequence or set and the current node is a direct
> +child of it, there is no need to traverse the list back to the
> +leftmost one as we have a node cache.
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> +
> +CVE: CVE-2024-12133
> +Upstream-Status: Backport [
> https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf778=
0fc4a51f75a
> ]
> +
> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> +---
> + lib/decoding.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/decoding.c b/lib/decoding.c
> +index d2f6dea..1e0fcb3 100644
> +--- a/lib/decoding.c
> ++++ b/lib/decoding.c
> +@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, const voi=
d
> *ider, int *max_ider_len,
> +           move =3D UP;
> +       }
> +       if (move =3D=3D UP)
> +-      p =3D _asn1_find_up (p);
> ++      {
> ++        /* If we are parsing a sequence or set and p is a direct
> ++           child of it, no need to traverse the list back to the
> leftmost node. */
> ++        if (tcache.tail =3D=3D p)
> ++          p =3D tcache.head;
> ++        else
> ++          p =3D _asn1_find_up (p);
> ++      }
> +     }
> +
> +   _asn1_delete_not_used (*element);
> +--
> +GitLab
> diff --git
> a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> new file mode 100644
> index 0000000000..a3a6af2920
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
> @@ -0,0 +1,235 @@
> +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Fri, 8 Nov 2024 16:05:32 +0900
> +Subject: [PATCH] asn1_find_node: optimize "?NUMBER" node lookup with
> indexing
> +
> +To avoid linear search of named nodes, this adds a array of child
> +nodes to their parent nodes as a cache.
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> +
> +CVE: CVE-2024-12133
> +Upstream-Status: Backport [
> https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1=
c22545ffc3d
> ]
> +
> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> +---
> + lib/element.c    | 56 ++++++++++++++++++++++++++++++++++++++++++------
> + lib/element.h    | 10 +++++++++
> + lib/int.h        |  8 +++++++
> + lib/parser_aux.c | 10 +++++++++
> + lib/structure.c  | 13 +++++++++++
> + 5 files changed, 90 insertions(+), 7 deletions(-)
> +
> +diff --git a/lib/element.c b/lib/element.c
> +index 850bef4a..528df418 100644
> +--- a/lib/element.c
> ++++ b/lib/element.c
> +@@ -33,6 +33,8 @@
> + #include "structure.h"
> + #include "c-ctype.h"
> + #include "element.h"
> ++#include <limits.h>
> ++#include "intprops.h"
> +
> + void
> + _asn1_hierarchical_name (asn1_node_const node, char *name, int name_siz=
e)
> +@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char *value,
> unsigned char *value_out,
> +   return ASN1_SUCCESS;
> + }
> +
> ++int
> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position=
,
> ++                    asn1_node node)
> ++{
> ++  if (position >=3D array->size)
> ++    {
> ++      size_t new_size =3D position, i;
> ++      asn1_node *new_nodes;
> ++
> ++      if (INT_MULTIPLY_OVERFLOW (new_size, 2))
> ++      return ASN1_GENERIC_ERROR;
> ++      new_size *=3D 2;
> ++
> ++      if (INT_ADD_OVERFLOW (new_size, 1))
> ++      return ASN1_GENERIC_ERROR;
> ++      new_size +=3D 1;
> ++
> ++      if (INT_MULTIPLY_OVERFLOW (new_size, sizeof (*new_nodes)))
> ++      return ASN1_GENERIC_ERROR;
> ++
> ++      new_nodes =3D realloc (array->nodes, new_size * sizeof (*new_node=
s));
> ++      if (!new_nodes)
> ++      return ASN1_MEM_ALLOC_ERROR;
> ++
> ++      for (i =3D array->size; i < new_size; i++)
> ++      new_nodes[i] =3D NULL;
> ++
> ++      array->nodes =3D new_nodes;
> ++      array->size =3D new_size;
> ++    }
> ++
> ++  array->nodes[position] =3D node;
> ++  return ASN1_SUCCESS;
> ++}
> ++
> + /* Appends a new element into the sequence (or set) defined by this
> +  * node. The new element will have a name of '?number', where number
> +  * is a monotonically increased serial number.
> +@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, struct
> node_tail_cache_st *pcache)
> +   asn1_node p, p2;
> +   char temp[LTOSTR_MAX_SIZE + 1];
> +   long n;
> ++  int result;
> +
> +   if (!node || !(node->down))
> +     return ASN1_GENERIC_ERROR;
> +@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node, struct
> node_tail_cache_st *pcache)
> +       pcache->tail =3D p2;
> +     }
> +
> +-  if (p->name[0] =3D=3D 0)
> +-    _asn1_str_cpy (temp, sizeof (temp), "?1");
> +-  else
> ++  n =3D 0;
> ++  if (p->name[0] !=3D 0)
> +     {
> +-      n =3D strtol (p->name + 1, NULL, 0);
> +-      n++;
> +-      temp[0] =3D '?';
> +-      _asn1_ltostr (n, temp + 1);
> ++      n =3D strtol (p->name + 1, NULL, 10);
> ++      if (n <=3D 0 || n >=3D LONG_MAX - 1)
> ++      return ASN1_GENERIC_ERROR;
> +     }
> ++  temp[0] =3D '?';
> ++  _asn1_ltostr (n + 1, temp + 1);
> +   _asn1_set_name (p2, temp);
> +   /*  p2->type |=3D CONST_OPTION; */
> ++  result =3D _asn1_node_array_set (&node->numbered_children, n, p2);
> ++  if (result !=3D ASN1_SUCCESS)
> ++    return result;
> ++  p2->parent =3D node;
> +
> +   return ASN1_SUCCESS;
> + }
> +diff --git a/lib/element.h b/lib/element.h
> +index 732054e9..b84e3a27 100644
> +--- a/lib/element.h
> ++++ b/lib/element.h
> +@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char *value=
,
> + void _asn1_hierarchical_name (asn1_node_const node, char *name,
> +                             int name_size);
> +
> ++static inline asn1_node_const
> ++_asn1_node_array_get (const struct asn1_node_array_st *array, size_t
> position)
> ++{
> ++  return position < array->size ? array->nodes[position] : NULL;
> ++}
> ++
> ++int
> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position=
,
> ++                    asn1_node node);
> ++
> + #endif
> +diff --git a/lib/int.h b/lib/int.h
> +index 4f2d98d1..41b12b0b 100644
> +--- a/lib/int.h
> ++++ b/lib/int.h
> +@@ -31,6 +31,12 @@
> +
> + # define ASN1_SMALL_VALUE_SIZE 16
> +
> ++struct asn1_node_array_st
> ++{
> ++  asn1_node *nodes;
> ++  size_t size;
> ++};
> ++
> + /* This structure is also in libtasn1.h, but then contains less
> +    fields.  You cannot make any modifications to these first fields
> +    without breaking ABI.  */
> +@@ -47,6 +53,8 @@ struct asn1_node_st
> +   asn1_node left;             /* Pointer to the next list element */
> +   /* private fields: */
> +   unsigned char small_value[ASN1_SMALL_VALUE_SIZE];   /* For small
> values */
> ++  asn1_node parent;           /* Pointer to the parent node */
> ++  struct asn1_node_array_st numbered_children; /* Array of unnamed chil=
d
> nodes for caching */
> +
> +   /* values used during decoding/coding */
> +   int tmp_ival;
> +diff --git a/lib/parser_aux.c b/lib/parser_aux.c
> +index 415905a0..4281cc97 100644
> +--- a/lib/parser_aux.c
> ++++ b/lib/parser_aux.c
> +@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, const char
> *name)
> +   const char *n_start;
> +   unsigned int nsize;
> +   unsigned int nhash;
> ++  const struct asn1_node_array_st *numbered_children;
> +
> +   if (pointer =3D=3D NULL)
> +     return NULL;
> +@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, const char
> *name)
> +       if (p->down =3D=3D NULL)
> +       return NULL;
> +
> ++      numbered_children =3D &p->numbered_children;
> +       p =3D p->down;
> +       if (p =3D=3D NULL)
> +       return NULL;
> +@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, const char
> *name)
> +       }
> +       else
> +       {                       /* no "?LAST" */
> ++        if (n[0] =3D=3D '?' && c_isdigit (n[1]))
> ++          {
> ++            long position =3D strtol (n + 1, NULL, 10);
> ++            if (position > 0 && position < LONG_MAX)
> ++              p =3D _asn1_node_array_get (numbered_children, position -=
 1);
> ++          }
> +         while (p)
> +           {
> +             if (p->name_hash =3D=3D nhash && !strcmp (p->name, n))
> +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned int flag=
s)
> +       if (node->value !=3D node->small_value)
> +       free (node->value);
> +     }
> ++
> ++  free (node->numbered_children.nodes);
> +   free (node);
> + }
> +
> +diff --git a/lib/structure.c b/lib/structure.c
> +index 9c95b9e2..32692ad2 100644
> +--- a/lib/structure.c
> ++++ b/lib/structure.c
> +@@ -31,6 +31,9 @@
> + #include <structure.h>
> + #include "parser_aux.h"
> + #include <gstr.h>
> ++#include "c-ctype.h"
> ++#include "element.h"
> ++#include <limits.h>
> +
> +
> + extern char _asn1_identifierMissing[];
> +@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, const cha=
r
> *element_name)
> +   if (source_node =3D=3D NULL)
> +     return ASN1_ELEMENT_NOT_FOUND;
> +
> ++  if (source_node->parent
> ++      && source_node->name[0] =3D=3D '?'
> ++      && c_isdigit (source_node->name[1]))
> ++    {
> ++      long position =3D strtol (source_node->name + 1, NULL, 10);
> ++      if (position > 0 && position < LONG_MAX)
> ++      _asn1_node_array_set (&source_node->parent->numbered_children,
> ++                            position - 1, NULL);
> ++    }
> ++
> +   p2 =3D source_node->right;
> +   p3 =3D _asn1_find_left (source_node);
> +   if (!p3)
> +--
> +GitLab
> diff --git a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> index 5fb8b54c06..d5bc1e408e 100644
> --- a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
> "file://doc/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
>
>  SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
>             file://dont-depend-on-help2man.patch \
> +           file://CVE-2024-12133-0001.patch \
> +           file://CVE-2024-12133-0002.patch \
>             "
>
>  DEPENDS =3D "bison-native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212428):
> https://lists.openembedded.org/g/openembedded-core/message/212428
> Mute This Topic: https://lists.openembedded.org/mt/111565382/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005adaaf062fbea8dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Zhang Peng,<br><br></div>Updat=
ing libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-12133.<br><br></di=
v>Upgrade patch was already sent and now it is in the master branch .<br><b=
r><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D3a=
8633b9f522e0be31c08790a3f2050c6d052d93">https://git.openembedded.org/openem=
bedded-core/commit/?id=3D3a8633b9f522e0be31c08790a3f2050c6d052d93</a><br><b=
r><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/212=
059">https://lists.openembedded.org/g/openembedded-core/message/212059</a><=
br><br></div>Later it will merged to scarthgap and kirkstone branches.<br><=
br></div>Thanks &amp; Regards,<br></div>Vijay<div><br><br><br><br><br></div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (=
Paul) (CN) via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;<a href=3D"http://peng.zhang1.cn">peng.zhang1.cn</a>=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.=
com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
<br>
CVE-2024-12133:<br>
A flaw in libtasn1 causes inefficient handling of specific certificate data=
.<br>
When processing a large number of elements in a certificate, libtasn1 takes=
<br>
much longer than expected, which can slow down or even crash the system.<br=
>
This flaw allows an attacker to send a specially crafted certificate,<br>
causing a denial of service attack.<br>
<br>
Reference:<br>
[<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-12133" rel=3D"norefer=
rer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2024-12133</a>]=
<br>
<br>
Upstream patches:<br>
[<a href=3D"https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b5=
46afddf7780fc4a51f75a" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a</a>]<=
br>
[<a href=3D"https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620=
dabcad84e1c22545ffc3d" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d</a>]<=
br>
<br>
Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../gnutls/libtasn1/CVE-2024-12133-0001.patch |=C2=A0 43 ++++<br>
=C2=A0.../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 +++++++++++++++++=
+<br>
=C2=A0.../recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a> |=C2=A0 =C2=A02 +<=
br>
=C2=A03 files changed, 280 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-1213=
3-0001.patch<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-1213=
3-0002.patch<br>
<br>
diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch=
 b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch<br>
new file mode 100644<br>
index 0000000000..d843b6dc92<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch<br>
@@ -0,0 +1,43 @@<br>
+From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00 2001<br>
+From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_blank">uen=
o@gnu.org</a>&gt;<br>
+Date: Sat, 19 Oct 2024 02:47:04 +0900<br>
+Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call with node=
<br>
+ cache<br>
+<br>
+If we are parsing a sequence or set and the current node is a direct<br>
+child of it, there is no need to traverse the list back to the<br>
+leftmost one as we have a node cache.<br>
+<br>
+Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_b=
lank">ueno@gnu.org</a>&gt;<br>
+Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefsson.org" =
target=3D"_blank">simon@josefsson.org</a>&gt;<br>
+<br>
+CVE: CVE-2024-12133<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/libtasn1/-=
/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b5=
46afddf7780fc4a51f75a</a>]<br>
+<br>
+Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.c=
om" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
+---<br>
+ lib/decoding.c | 9 ++++++++-<br>
+ 1 file changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/decoding.c b/lib/decoding.c<br>
+index d2f6dea..1e0fcb3 100644<br>
+--- a/lib/decoding.c<br>
++++ b/lib/decoding.c<br>
+@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, const void =
*ider, int *max_ider_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D UP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (move =3D=3D UP)<br>
+-=C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we are parsing a sequence or set and p =
is a direct<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child of it, no need to traverse=
 the list back to the leftmost node. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcache.tail =3D=3D p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D tcache.head;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0_asn1_delete_not_used (*element);<br>
+-- <br>
+GitLab<br>
diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch=
 b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch<br>
new file mode 100644<br>
index 0000000000..a3a6af2920<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch<br>
@@ -0,0 +1,235 @@<br>
+From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00 2001<br>
+From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_blank">uen=
o@gnu.org</a>&gt;<br>
+Date: Fri, 8 Nov 2024 16:05:32 +0900<br>
+Subject: [PATCH] asn1_find_node: optimize &quot;?NUMBER&quot; node lookup =
with indexing<br>
+<br>
+To avoid linear search of named nodes, this adds a array of child<br>
+nodes to their parent nodes as a cache.<br>
+<br>
+Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_b=
lank">ueno@gnu.org</a>&gt;<br>
+Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefsson.org" =
target=3D"_blank">simon@josefsson.org</a>&gt;<br>
+<br>
+CVE: CVE-2024-12133<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/libtasn1/-=
/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620=
dabcad84e1c22545ffc3d</a>]<br>
+<br>
+Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.c=
om" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
+---<br>
+ lib/element.c=C2=A0 =C2=A0 | 56 +++++++++++++++++++++++++++++++++++++++++=
+------<br>
+ lib/element.h=C2=A0 =C2=A0 | 10 +++++++++<br>
+ lib/int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++<br>
+ lib/parser_aux.c | 10 +++++++++<br>
+ lib/structure.c=C2=A0 | 13 +++++++++++<br>
+ 5 files changed, 90 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/lib/element.c b/lib/element.c<br>
+index 850bef4a..528df418 100644<br>
+--- a/lib/element.c<br>
++++ b/lib/element.c<br>
+@@ -33,6 +33,8 @@<br>
+ #include &quot;structure.h&quot;<br>
+ #include &quot;c-ctype.h&quot;<br>
+ #include &quot;element.h&quot;<br>
++#include &lt;limits.h&gt;<br>
++#include &quot;intprops.h&quot;<br>
+ <br>
+ void<br>
+ _asn1_hierarchical_name (asn1_node_const node, char *name, int name_size)=
<br>
+@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char *value, un=
signed char *value_out,<br>
+=C2=A0 =C2=A0return ASN1_SUCCESS;<br>
+ }<br>
+ <br>
++int<br>
++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asn=
1_node node)<br>
++{<br>
++=C2=A0 if (position &gt;=3D array-&gt;size)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 size_t new_size =3D position, i;<br>
++=C2=A0 =C2=A0 =C2=A0 asn1_node *new_nodes;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, 2))<br>
++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
++=C2=A0 =C2=A0 =C2=A0 new_size *=3D 2;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (INT_ADD_OVERFLOW (new_size, 1))<br>
++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
++=C2=A0 =C2=A0 =C2=A0 new_size +=3D 1;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, sizeof (*new_no=
des)))<br>
++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 new_nodes =3D realloc (array-&gt;nodes, new_size * s=
izeof (*new_nodes));<br>
++=C2=A0 =C2=A0 =C2=A0 if (!new_nodes)<br>
++=C2=A0 =C2=A0 =C2=A0 return ASN1_MEM_ALLOC_ERROR;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D array-&gt;size; i &lt; new_size; i++)<br>
++=C2=A0 =C2=A0 =C2=A0 new_nodes[i] =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 array-&gt;nodes =3D new_nodes;<br>
++=C2=A0 =C2=A0 =C2=A0 array-&gt;size =3D new_size;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 array-&gt;nodes[position] =3D node;<br>
++=C2=A0 return ASN1_SUCCESS;<br>
++}<br>
++<br>
+ /* Appends a new element into the sequence (or set) defined by this<br>
+=C2=A0 * node. The new element will have a name of &#39;?number&#39;, wher=
e number<br>
+=C2=A0 * is a monotonically increased serial number.<br>
+@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, struct node=
_tail_cache_st *pcache)<br>
+=C2=A0 =C2=A0asn1_node p, p2;<br>
+=C2=A0 =C2=A0char temp[LTOSTR_MAX_SIZE + 1];<br>
+=C2=A0 =C2=A0long n;<br>
++=C2=A0 int result;<br>
+ <br>
+=C2=A0 =C2=A0if (!node || !(node-&gt;down))<br>
+=C2=A0 =C2=A0 =C2=A0return ASN1_GENERIC_ERROR;<br>
+@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node, struct no=
de_tail_cache_st *pcache)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcache-&gt;tail =3D p2;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (p-&gt;name[0] =3D=3D 0)<br>
+-=C2=A0 =C2=A0 _asn1_str_cpy (temp, sizeof (temp), &quot;?1&quot;);<br>
+-=C2=A0 else<br>
++=C2=A0 n =3D 0;<br>
++=C2=A0 if (p-&gt;name[0] !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p-&gt;name + 1, NULL, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 n++;<br>
+-=C2=A0 =C2=A0 =C2=A0 temp[0] =3D &#39;?&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 _asn1_ltostr (n, temp + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p-&gt;name + 1, NULL, 10);<br>
++=C2=A0 =C2=A0 =C2=A0 if (n &lt;=3D 0 || n &gt;=3D LONG_MAX - 1)<br>
++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 temp[0] =3D &#39;?&#39;;<br>
++=C2=A0 _asn1_ltostr (n + 1, temp + 1);<br>
+=C2=A0 =C2=A0_asn1_set_name (p2, temp);<br>
+=C2=A0 =C2=A0/*=C2=A0 p2-&gt;type |=3D CONST_OPTION; */<br>
++=C2=A0 result =3D _asn1_node_array_set (&amp;node-&gt;numbered_children, =
n, p2);<br>
++=C2=A0 if (result !=3D ASN1_SUCCESS)<br>
++=C2=A0 =C2=A0 return result;<br>
++=C2=A0 p2-&gt;parent =3D node;<br>
+ <br>
+=C2=A0 =C2=A0return ASN1_SUCCESS;<br>
+ }<br>
+diff --git a/lib/element.h b/lib/element.h<br>
+index 732054e9..b84e3a27 100644<br>
+--- a/lib/element.h<br>
++++ b/lib/element.h<br>
+@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char *value,<=
br>
+ void _asn1_hierarchical_name (asn1_node_const node, char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int name_size);<br>
+ <br>
++static inline asn1_node_const<br>
++_asn1_node_array_get (const struct asn1_node_array_st *array, size_t posi=
tion)<br>
++{<br>
++=C2=A0 return position &lt; array-&gt;size ? array-&gt;nodes[position] : =
NULL;<br>
++}<br>
++<br>
++int<br>
++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asn=
1_node node);<br>
++<br>
+ #endif<br>
+diff --git a/lib/int.h b/lib/int.h<br>
+index 4f2d98d1..41b12b0b 100644<br>
+--- a/lib/int.h<br>
++++ b/lib/int.h<br>
+@@ -31,6 +31,12 @@<br>
+ <br>
+ # define ASN1_SMALL_VALUE_SIZE 16<br>
+ <br>
++struct asn1_node_array_st<br>
++{<br>
++=C2=A0 asn1_node *nodes;<br>
++=C2=A0 size_t size;<br>
++};<br>
++<br>
+ /* This structure is also in libtasn1.h, but then contains less<br>
+=C2=A0 =C2=A0 fields.=C2=A0 You cannot make any modifications to these fir=
st fields<br>
+=C2=A0 =C2=A0 without breaking ABI.=C2=A0 */<br>
+@@ -47,6 +53,8 @@ struct asn1_node_st<br>
+=C2=A0 =C2=A0asn1_node left;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Pointer to the next list element */<br>
+=C2=A0 =C2=A0/* private fields: */<br>
+=C2=A0 =C2=A0unsigned char small_value[ASN1_SMALL_VALUE_SIZE];=C2=A0 =C2=
=A0/* For small values */<br>
++=C2=A0 asn1_node parent;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Point=
er to the parent node */<br>
++=C2=A0 struct asn1_node_array_st numbered_children; /* Array of unnamed c=
hild nodes for caching */<br>
+ <br>
+=C2=A0 =C2=A0/* values used during decoding/coding */<br>
+=C2=A0 =C2=A0int tmp_ival;<br>
+diff --git a/lib/parser_aux.c b/lib/parser_aux.c<br>
+index 415905a0..4281cc97 100644<br>
+--- a/lib/parser_aux.c<br>
++++ b/lib/parser_aux.c<br>
+@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, const char *n=
ame)<br>
+=C2=A0 =C2=A0const char *n_start;<br>
+=C2=A0 =C2=A0unsigned int nsize;<br>
+=C2=A0 =C2=A0unsigned int nhash;<br>
++=C2=A0 const struct asn1_node_array_st *numbered_children;<br>
+ <br>
+=C2=A0 =C2=A0if (pointer =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, const char *n=
ame)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;down =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 numbered_children =3D &amp;p-&gt;numbered_children;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D p-&gt;down;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, const char *=
name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no &quot;?LAST&quot; */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n[0] =3D=3D &#39;?&#39; &amp;&amp; c_isdi=
git (n[1]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long position =3D strtol (n + 1=
, NULL, 10);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (position &gt; 0 &amp;&amp; =
position &lt; LONG_MAX)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_node_array_g=
et (numbered_children, position - 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;name_hash =3D=3D=
 nhash &amp;&amp; !strcmp (p-&gt;name, n))<br>
+@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned int flags)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (node-&gt;value !=3D node-&gt;small_value)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free (node-&gt;value);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 free (node-&gt;numbered_children.nodes);<br>
+=C2=A0 =C2=A0free (node);<br>
+ }<br>
+ <br>
+diff --git a/lib/structure.c b/lib/structure.c<br>
+index 9c95b9e2..32692ad2 100644<br>
+--- a/lib/structure.c<br>
++++ b/lib/structure.c<br>
+@@ -31,6 +31,9 @@<br>
+ #include &lt;structure.h&gt;<br>
+ #include &quot;parser_aux.h&quot;<br>
+ #include &lt;gstr.h&gt;<br>
++#include &quot;c-ctype.h&quot;<br>
++#include &quot;element.h&quot;<br>
++#include &lt;limits.h&gt;<br>
+ <br>
+ <br>
+ extern char _asn1_identifierMissing[];<br>
+@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, const char =
*element_name)<br>
+=C2=A0 =C2=A0if (source_node =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0return ASN1_ELEMENT_NOT_FOUND;<br>
+ <br>
++=C2=A0 if (source_node-&gt;parent<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; source_node-&gt;name[0] =3D=3D &#39;?&#39=
;<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; c_isdigit (source_node-&gt;name[1]))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 long position =3D strtol (source_node-&gt;name + 1, =
NULL, 10);<br>
++=C2=A0 =C2=A0 =C2=A0 if (position &gt; 0 &amp;&amp; position &lt; LONG_MA=
X)<br>
++=C2=A0 =C2=A0 =C2=A0 _asn1_node_array_set (&amp;source_node-&gt;parent-&g=
t;numbered_children,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 position - 1, NULL);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0p2 =3D source_node-&gt;right;<br>
+=C2=A0 =C2=A0p3 =3D _asn1_find_left (source_node);<br>
+=C2=A0 =C2=A0if (!p3)<br>
+-- <br>
+GitLab<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a> b/meta/reci=
pes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">libtasn1_4.19.0.bb</a><br>
index 5fb8b54c06..d5bc1e408e 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.19.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtasn1_4.19.0.bb</a><br>
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=3Dd3223=
9bcb673463ab874e80d47fae504 \<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dont-depend-on-help2man.pa=
tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12133-0001.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-12133-0002.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bison-native&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212428): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212428" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212428</a><br>
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

--0000000000005adaaf062fbea8dd--

