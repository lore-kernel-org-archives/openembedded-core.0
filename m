Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B88C282DE
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:04:20 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.14728.1741363452680314643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AIWIhDlL;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso1760189276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741363452; x=1741968252; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM0ztiabdtoiURsQWQKv9HssGUWwJeSVOa9q/WvLNpA=;
        b=AIWIhDlLcrzQlCoZ8AqcT+aZdaPSMucqXSfQquCCUwbukTTDte1MOjXdrMzLJ3Jxcw
         ZBcb2GNCt7fVYfaxPvW7nOwM0JVV4CffW8WGcbAgIX03WeI5PibBTe1L462zXKO7xt9e
         fKVsY7KI8rJEH0zrmgPXylSvN3uk3XN7h1S8S0NXZU7+OzgN5eUzJ3DyupROqXv8k0Qx
         PBM0snRmlTgJKOLOIhGVg3vVvcYQCYazG1KXcn+iEKFSzxx4+SAy088D9hmFO86kW09Q
         U3tZEOPFN8NPOYLXOB18CvAxatsfAQ+sKatbt8sjB6ZS+69d6JY6e9zgpL8pkr+hdlMX
         N6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363452; x=1741968252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM0ztiabdtoiURsQWQKv9HssGUWwJeSVOa9q/WvLNpA=;
        b=VRSmO9YrHOaW3p49bkTuY3AmAYD8DkZ7FqYtmXG+zXIJPHh9G8jMiSU76+2wKI4Jiy
         KKHc01I2yAIVwBwiUvZ3Z+FOXAUgR7d7nZbjdS4sohVFTMFyJLTMdEY8NtdAJDiMZUwL
         Dtvr0fRS1nnIWr8wfAaRaJqMdwmM9ODwi890Za7W4xRyk/6NG0q2Sl69KBOBLdUkTBGm
         LS/6hTSGC3j0HMbP2mLA17HmGB8D6P+oe/AKoH5pThWPKpLqasQTAJtaPXdefbGSl4tJ
         5kmbX/Cv0UI5HEcyVJF6MQiae/JRQ27y8zOg7EFRhrCPMIwHRbyDnlJ/9Z1cFOhmleoK
         CSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVil+Je5jHg2B9zie/Q1g0w5fLyLcZ8O+svK9xaAZYCQwlnFJPiavu1XqItT4MD5SIN929aB9qXYc+dARcbroSs6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4v02ND9rarp9U33Crytl9LYbKHAaesWxb7XgMzC4W+HsBAMz/
	5Z1/nFrishEAb+beiPM2APpoZubaul3ZmQaApqDH5zYThY+LFnW6XMDNl8TInjNeeagtOUBe0Cm
	0sr2suaHQLFclalHCwMVmwOJRkKgskCbBzrqiEw==
X-Gm-Gg: ASbGncsWv6mdVrtkArXdgRjUwKxXhJsNTuQCjEtLyFxyZ2a6d7XuimTdH1pgyDSCmcR
	Qq53PJxYTtlZQZS6ZURDxjPh1WEuR07Sck9K+AQUK73R01U0k9fuVLxDm876/QifOVq/9ZFhWLc
	CCm5buvADb1oU6vDFH0kDLFKLW4oJrR9Dm97Xt5VTDEeZ1hfgfSlkb1QssFQ==
X-Google-Smtp-Source: AGHT+IEwz2Kz+IkilGFtqnm+jldzTamGuf7XgLNx/WSlL2UfUd32FyvROlSS5T5ucRl6r49xfEv6TSsc1wVSX/lPNCw=
X-Received: by 2002:a05:6902:3102:b0:e57:fbf0:5016 with SMTP id
 3f1490d57ef6-e635c175a54mr4355248276.22.1741363451526; Fri, 07 Mar 2025
 08:04:11 -0800 (PST)
MIME-Version: 1.0
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com> <CANQUz18GwO4HEGP+BK10wjJoe5=MZvyqANS-Ye1FBbyf1P9s9Q@mail.gmail.com>
In-Reply-To: <CANQUz18GwO4HEGP+BK10wjJoe5=MZvyqANS-Ye1FBbyf1P9s9Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 7 Mar 2025 08:03:59 -0800
X-Gm-Features: AQ5f1Jo9p7kpN1NRlfUe6s-lIoVtqgB3pmQQ_U1bo-EKlqM70l4CBtgpZSKyLmg
Message-ID: <CAOSpxdbuJ39w-P9C9b+GpOjudn1h4n9-XnGvHGk=hC2US4Wo9Q@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXVtraXJrc3RvbmVdW1BBVENIwqBdIGxpYnRhc24xOiBmaXggQ1ZFLQ==?=
	=?UTF-8?B?MjAyNC0xMjEzMw==?=
To: vanusuri@mvista.com
Cc: peng.zhang1.cn@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 16:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212453

On Fri, Mar 7, 2025 at 3:09=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Hi Zhang Peng,
>
> Updating libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-12133.
>
> Upgrade patch was already sent and now it is in the master branch .
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b9f522e=
0be31c08790a3f2050c6d052d93
>
> https://lists.openembedded.org/g/openembedded-core/message/212059
>
> Later it will merged to scarthgap and kirkstone branches.

Looks like you only tagged it for styhead and scarthgap.  I'll add it
to kirkstone too.

Steve


> On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul) (CN) via lists.=
openembedded.org <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wr=
ote:
>>
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> CVE-2024-12133:
>> A flaw in libtasn1 causes inefficient handling of specific certificate d=
ata.
>> When processing a large number of elements in a certificate, libtasn1 ta=
kes
>> much longer than expected, which can slow down or even crash the system.
>> This flaw allows an attacker to send a specially crafted certificate,
>> causing a denial of service attack.
>>
>> Reference:
>> [https://nvd.nist.gov/vuln/detail/CVE-2024-12133]
>>
>> Upstream patches:
>> [https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7=
780fc4a51f75a]
>> [https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84=
e1c22545ffc3d]
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
>>  .../gnutls/libtasn1/CVE-2024-12133-0001.patch |  43 ++++
>>  .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 ++++++++++++++++++
>>  .../recipes-support/gnutls/libtasn1_4.19.0.bb |   2 +
>>  3 files changed, 280 insertions(+)
>>  create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-=
0001.patch
>>  create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-=
0002.patch
>>
>> diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.pa=
tch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>> new file mode 100644
>> index 0000000000..d843b6dc92
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>> @@ -0,0 +1,43 @@
>> +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00 2001
>> +From: Daiki Ueno <ueno@gnu.org>
>> +Date: Sat, 19 Oct 2024 02:47:04 +0900
>> +Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call with n=
ode
>> + cache
>> +
>> +If we are parsing a sequence or set and the current node is a direct
>> +child of it, there is no need to traverse the list back to the
>> +leftmost one as we have a node cache.
>> +
>> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
>> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
>> +
>> +CVE: CVE-2024-12133
>> +Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/=
4082ca2220b5ba910b546afddf7780fc4a51f75a]
>> +
>> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> +---
>> + lib/decoding.c | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/lib/decoding.c b/lib/decoding.c
>> +index d2f6dea..1e0fcb3 100644
>> +--- a/lib/decoding.c
>> ++++ b/lib/decoding.c
>> +@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, const vo=
id *ider, int *max_ider_len,
>> +           move =3D UP;
>> +       }
>> +       if (move =3D=3D UP)
>> +-      p =3D _asn1_find_up (p);
>> ++      {
>> ++        /* If we are parsing a sequence or set and p is a direct
>> ++           child of it, no need to traverse the list back to the leftm=
ost node. */
>> ++        if (tcache.tail =3D=3D p)
>> ++          p =3D tcache.head;
>> ++        else
>> ++          p =3D _asn1_find_up (p);
>> ++      }
>> +     }
>> +
>> +   _asn1_delete_not_used (*element);
>> +--
>> +GitLab
>> diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.pa=
tch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>> new file mode 100644
>> index 0000000000..a3a6af2920
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>> @@ -0,0 +1,235 @@
>> +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00 2001
>> +From: Daiki Ueno <ueno@gnu.org>
>> +Date: Fri, 8 Nov 2024 16:05:32 +0900
>> +Subject: [PATCH] asn1_find_node: optimize "?NUMBER" node lookup with in=
dexing
>> +
>> +To avoid linear search of named nodes, this adds a array of child
>> +nodes to their parent nodes as a cache.
>> +
>> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
>> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
>> +
>> +CVE: CVE-2024-12133
>> +Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/=
869a97aa259dffa2620dabcad84e1c22545ffc3d]
>> +
>> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> +---
>> + lib/element.c    | 56 ++++++++++++++++++++++++++++++++++++++++++------
>> + lib/element.h    | 10 +++++++++
>> + lib/int.h        |  8 +++++++
>> + lib/parser_aux.c | 10 +++++++++
>> + lib/structure.c  | 13 +++++++++++
>> + 5 files changed, 90 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/lib/element.c b/lib/element.c
>> +index 850bef4a..528df418 100644
>> +--- a/lib/element.c
>> ++++ b/lib/element.c
>> +@@ -33,6 +33,8 @@
>> + #include "structure.h"
>> + #include "c-ctype.h"
>> + #include "element.h"
>> ++#include <limits.h>
>> ++#include "intprops.h"
>> +
>> + void
>> + _asn1_hierarchical_name (asn1_node_const node, char *name, int name_si=
ze)
>> +@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char *value,=
 unsigned char *value_out,
>> +   return ASN1_SUCCESS;
>> + }
>> +
>> ++int
>> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t positio=
n,
>> ++                    asn1_node node)
>> ++{
>> ++  if (position >=3D array->size)
>> ++    {
>> ++      size_t new_size =3D position, i;
>> ++      asn1_node *new_nodes;
>> ++
>> ++      if (INT_MULTIPLY_OVERFLOW (new_size, 2))
>> ++      return ASN1_GENERIC_ERROR;
>> ++      new_size *=3D 2;
>> ++
>> ++      if (INT_ADD_OVERFLOW (new_size, 1))
>> ++      return ASN1_GENERIC_ERROR;
>> ++      new_size +=3D 1;
>> ++
>> ++      if (INT_MULTIPLY_OVERFLOW (new_size, sizeof (*new_nodes)))
>> ++      return ASN1_GENERIC_ERROR;
>> ++
>> ++      new_nodes =3D realloc (array->nodes, new_size * sizeof (*new_nod=
es));
>> ++      if (!new_nodes)
>> ++      return ASN1_MEM_ALLOC_ERROR;
>> ++
>> ++      for (i =3D array->size; i < new_size; i++)
>> ++      new_nodes[i] =3D NULL;
>> ++
>> ++      array->nodes =3D new_nodes;
>> ++      array->size =3D new_size;
>> ++    }
>> ++
>> ++  array->nodes[position] =3D node;
>> ++  return ASN1_SUCCESS;
>> ++}
>> ++
>> + /* Appends a new element into the sequence (or set) defined by this
>> +  * node. The new element will have a name of '?number', where number
>> +  * is a monotonically increased serial number.
>> +@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, struct n=
ode_tail_cache_st *pcache)
>> +   asn1_node p, p2;
>> +   char temp[LTOSTR_MAX_SIZE + 1];
>> +   long n;
>> ++  int result;
>> +
>> +   if (!node || !(node->down))
>> +     return ASN1_GENERIC_ERROR;
>> +@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node, struct=
 node_tail_cache_st *pcache)
>> +       pcache->tail =3D p2;
>> +     }
>> +
>> +-  if (p->name[0] =3D=3D 0)
>> +-    _asn1_str_cpy (temp, sizeof (temp), "?1");
>> +-  else
>> ++  n =3D 0;
>> ++  if (p->name[0] !=3D 0)
>> +     {
>> +-      n =3D strtol (p->name + 1, NULL, 0);
>> +-      n++;
>> +-      temp[0] =3D '?';
>> +-      _asn1_ltostr (n, temp + 1);
>> ++      n =3D strtol (p->name + 1, NULL, 10);
>> ++      if (n <=3D 0 || n >=3D LONG_MAX - 1)
>> ++      return ASN1_GENERIC_ERROR;
>> +     }
>> ++  temp[0] =3D '?';
>> ++  _asn1_ltostr (n + 1, temp + 1);
>> +   _asn1_set_name (p2, temp);
>> +   /*  p2->type |=3D CONST_OPTION; */
>> ++  result =3D _asn1_node_array_set (&node->numbered_children, n, p2);
>> ++  if (result !=3D ASN1_SUCCESS)
>> ++    return result;
>> ++  p2->parent =3D node;
>> +
>> +   return ASN1_SUCCESS;
>> + }
>> +diff --git a/lib/element.h b/lib/element.h
>> +index 732054e9..b84e3a27 100644
>> +--- a/lib/element.h
>> ++++ b/lib/element.h
>> +@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char *valu=
e,
>> + void _asn1_hierarchical_name (asn1_node_const node, char *name,
>> +                             int name_size);
>> +
>> ++static inline asn1_node_const
>> ++_asn1_node_array_get (const struct asn1_node_array_st *array, size_t p=
osition)
>> ++{
>> ++  return position < array->size ? array->nodes[position] : NULL;
>> ++}
>> ++
>> ++int
>> ++_asn1_node_array_set (struct asn1_node_array_st *array, size_t positio=
n,
>> ++                    asn1_node node);
>> ++
>> + #endif
>> +diff --git a/lib/int.h b/lib/int.h
>> +index 4f2d98d1..41b12b0b 100644
>> +--- a/lib/int.h
>> ++++ b/lib/int.h
>> +@@ -31,6 +31,12 @@
>> +
>> + # define ASN1_SMALL_VALUE_SIZE 16
>> +
>> ++struct asn1_node_array_st
>> ++{
>> ++  asn1_node *nodes;
>> ++  size_t size;
>> ++};
>> ++
>> + /* This structure is also in libtasn1.h, but then contains less
>> +    fields.  You cannot make any modifications to these first fields
>> +    without breaking ABI.  */
>> +@@ -47,6 +53,8 @@ struct asn1_node_st
>> +   asn1_node left;             /* Pointer to the next list element */
>> +   /* private fields: */
>> +   unsigned char small_value[ASN1_SMALL_VALUE_SIZE];   /* For small val=
ues */
>> ++  asn1_node parent;           /* Pointer to the parent node */
>> ++  struct asn1_node_array_st numbered_children; /* Array of unnamed chi=
ld nodes for caching */
>> +
>> +   /* values used during decoding/coding */
>> +   int tmp_ival;
>> +diff --git a/lib/parser_aux.c b/lib/parser_aux.c
>> +index 415905a0..4281cc97 100644
>> +--- a/lib/parser_aux.c
>> ++++ b/lib/parser_aux.c
>> +@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, const char=
 *name)
>> +   const char *n_start;
>> +   unsigned int nsize;
>> +   unsigned int nhash;
>> ++  const struct asn1_node_array_st *numbered_children;
>> +
>> +   if (pointer =3D=3D NULL)
>> +     return NULL;
>> +@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, const char=
 *name)
>> +       if (p->down =3D=3D NULL)
>> +       return NULL;
>> +
>> ++      numbered_children =3D &p->numbered_children;
>> +       p =3D p->down;
>> +       if (p =3D=3D NULL)
>> +       return NULL;
>> +@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, const cha=
r *name)
>> +       }
>> +       else
>> +       {                       /* no "?LAST" */
>> ++        if (n[0] =3D=3D '?' && c_isdigit (n[1]))
>> ++          {
>> ++            long position =3D strtol (n + 1, NULL, 10);
>> ++            if (position > 0 && position < LONG_MAX)
>> ++              p =3D _asn1_node_array_get (numbered_children, position =
- 1);
>> ++          }
>> +         while (p)
>> +           {
>> +             if (p->name_hash =3D=3D nhash && !strcmp (p->name, n))
>> +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned int fla=
gs)
>> +       if (node->value !=3D node->small_value)
>> +       free (node->value);
>> +     }
>> ++
>> ++  free (node->numbered_children.nodes);
>> +   free (node);
>> + }
>> +
>> +diff --git a/lib/structure.c b/lib/structure.c
>> +index 9c95b9e2..32692ad2 100644
>> +--- a/lib/structure.c
>> ++++ b/lib/structure.c
>> +@@ -31,6 +31,9 @@
>> + #include <structure.h>
>> + #include "parser_aux.h"
>> + #include <gstr.h>
>> ++#include "c-ctype.h"
>> ++#include "element.h"
>> ++#include <limits.h>
>> +
>> +
>> + extern char _asn1_identifierMissing[];
>> +@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, const ch=
ar *element_name)
>> +   if (source_node =3D=3D NULL)
>> +     return ASN1_ELEMENT_NOT_FOUND;
>> +
>> ++  if (source_node->parent
>> ++      && source_node->name[0] =3D=3D '?'
>> ++      && c_isdigit (source_node->name[1]))
>> ++    {
>> ++      long position =3D strtol (source_node->name + 1, NULL, 10);
>> ++      if (position > 0 && position < LONG_MAX)
>> ++      _asn1_node_array_set (&source_node->parent->numbered_children,
>> ++                            position - 1, NULL);
>> ++    }
>> ++
>> +   p2 =3D source_node->right;
>> +   p3 =3D _asn1_find_left (source_node);
>> +   if (!p3)
>> +--
>> +GitLab
>> diff --git a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb b/meta/recip=
es-support/gnutls/libtasn1_4.19.0.bb
>> index 5fb8b54c06..d5bc1e408e 100644
>> --- a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>> +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dd32239b=
cb673463ab874e80d47fae504 \
>>
>>  SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
>>             file://dont-depend-on-help2man.patch \
>> +           file://CVE-2024-12133-0001.patch \
>> +           file://CVE-2024-12133-0002.patch \
>>             "
>>
>>  DEPENDS =3D "bison-native"
>> --
>> 2.43.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212431): https://lists.openembedded.org/g/openembedde=
d-core/message/212431
> Mute This Topic: https://lists.openembedded.org/mt/111565382/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

