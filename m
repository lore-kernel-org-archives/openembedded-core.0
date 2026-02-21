Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943E1C61DE5
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 16:45:37 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23022.1771692335927483700
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 08:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ifvgGmcA;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649e97f1e99so2633245d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771692335; cv=none;
        d=google.com; s=arc-20240605;
        b=JOU/hVKXnDLruziY5BwF+lZGer0U4nf4omVPQctE8MGScqpmbl9E3szSeN7gq0DbHt
         UNGeKqC/hrF6Dmu2UX5Wa22hIugEVszlfj1Rarz+vjKLxPW2Lz4p81v2lyrCPTN9RzBA
         AhC3nxx+vG3fNKLUqdFyrwoNf1E+ChY5yC5Xla0xi+jqQnmI9j4TeU6UAlEg6EgUzvkB
         yvbjVSUR4drY5QsAlBEgSzAEhSwok42VEIlaw0Np9cWJ9X6gUyr5VDK9FHEnQFiahGwO
         Qaz2SSHX+kBBRYCt2wk8LBJ1MyqlBybfoFC7rD7YD4S5qNGFKQak6+RH3XZRPMSur6QN
         sL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iKgxg/E6nIlehPBNPiIB7AzFjRtq2Gc9pt9QUQ0LXn0=;
        fh=bNoVUmK9O0vE3kX3q1TCx065x9AJf7wShrYaRToWCWk=;
        b=SKwrp4ZVLbQasg6qUDC1/X6C6UGcztUjDp7tJajfQAx6AYu17eAh/RUxucJuWWujDD
         j64TjxTtVrHgxrIf8sORZTSILQ7mDnLEKMKi0ZTOgi+MFgbkaz1+UQY64PJHLzdlvY3Z
         a0gJ4HhlIjDMdg6SCrDr1PAB+ZpsSm2+XXkNz9VKHQcuMPN+TKLNmE7ZNXvlwXbV7R0P
         jrXXGqW804dtN44cvdTLmRHz7q3m1FA8thkQqUVwO7xPJKamHQ9aJthaJ3vjco5QqHhq
         n0w5sOB71+NUpOQfS9G7hj/ZSbZvbXxJeYSFp5RLS31ZJIgYQT+YbYRg/TtR8+7aqWtt
         Jf9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771692335; x=1772297135; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKgxg/E6nIlehPBNPiIB7AzFjRtq2Gc9pt9QUQ0LXn0=;
        b=ifvgGmcAuaBk0sfQDhzrgb7WvxSvHQyOBZ0Axa8gf2As6mY1qxio20aMSJ7c5T/2fA
         MqBrfiHbGJS+uETHj50JDo3N7JFmA0jjvfQygjHUUgFBT5W2Y7qLPK5CAG2vb0qPLCqY
         83hd0T9YQ7ACAB+CL/sTNsXbaqo15qM87LGiZZQSozfUcRWfMZuiTWWAMXu7GQOVN/lp
         ZUok1CI81wHROkrenwldwOs0GFIH86LhgHT1QH1K3K3OwKZKekZNjBGBl5PZr/njGT+B
         v04gSl09qYNl+3RXuqxvMH3PclAZvZ2G7Zv6yUABfT1zfqFWfvuA5235eWMJfFeV/6YA
         2npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692335; x=1772297135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKgxg/E6nIlehPBNPiIB7AzFjRtq2Gc9pt9QUQ0LXn0=;
        b=wOeAXja+7czbMf8q51U6Qmtxj5uELWKeB8Puo0poUHknnbvWAHi5oZ5clKFAxGeM2n
         7M6zeIvGBM3VqdchZNw1OO9VYUPdIgX8MBBoFQ8pfi7cokV0gJ5Iw3t5Hpi3viY5FQQ7
         /tzLvzqmq2AZ/JTvzJ4TN5epg7jM6tb8T15mIvxNsxV9LR4j9lW4f518d3r8RPjvCWfh
         jWoMS4asOD3k+5I4R/SCMtv3woxVDpAjtnK7M4CmE7ykLPdbSAfPDJgvMqhUdywQDcOZ
         bjfFmxGWyWBXd1WrO1D4FisKxMyepOk8FIEoKCwlpGAsfn8uYq55oO/pp4rBKHcFk/de
         uAcw==
X-Gm-Message-State: AOJu0YwqkNLDgQxi4zeh4SEV3I/WhRcLfbRisvMl+DmpetVw/KtvpZLp
	3PabmtUEdn8zMdT2blPtn4bAJ8Vq+W4dFLrGx8aFhrAAfNOeGrgupcHCTZbX+nDhs8z9yP3RL/K
	J7QZREc69LINmMWKHLqF4nk/dtuK+omw=
X-Gm-Gg: AZuq6aI9plxqzirkrgXSBCDTqpPwKtbIlibJV3gbC3AAXextxeMDnQ8FVLxwT0KoOOW
	rOXxGxOObfMQ7iA6UgYq1as9ZASlAgmm/U+UgKPqWEXdFnGVw7yUAdi4YxReWcbAe1qsreJkFG/
	Zvn141nfr5IK/PjuspBJ68uFVLHR7K6fMdhUKhXwwiBmabgI2IX1SIrVyso8wAyblAAmrytgtGZ
	bqwv3rG3Wyw3O5/NDOSLo1qWNdtJYlK2sJNzw7QcYzQEeS6w+0MQeQXujoNj5DLpHZQKXI1zrwE
	4QHp1w==
X-Received: by 2002:a53:e011:0:b0:64a:e4ef:c74d with SMTP id
 956f58d0204a3-64c78d3b884mr2380241d50.46.1771692335024; Sat, 21 Feb 2026
 08:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20260221051006.335141-1-stondo@gmail.com> <20260221051006.335141-7-stondo@gmail.com>
In-Reply-To: <20260221051006.335141-7-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 21 Feb 2026 09:45:24 -0700
X-Gm-Features: AaiRm51gV5hBiqHrHhmWOjEasuUuTzmtJ7S8eLCA_kv-lsNeaWbhF1p--spHa1g
Message-ID: <CAJdd5GavU9pTnVrQar5Qx1yjCBGKY3GKfNLd1UhUyut2r1OAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] sbom30: Fix object deduplication to preserve
 complete data
To: Stefano Tondo <stondo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="00000000000047cdee064b584498"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 16:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231619

--00000000000047cdee064b584498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026, 10:10=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wro=
te:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> When consolidating SPDX documents via expand_collection(), objects
> with the same SPDX ID can appear in multiple source documents with
> different levels of completeness. The previous implementation used
> simple set union (self.objects |=3D other.objects), which would keep
> an arbitrary version when duplicates existed.
>
> This caused data loss during consolidation, particularly affecting
> externalIdentifier arrays where one version might have a basic PURL
> while another has multiple PURLs with Git metadata qualifiers.
>
> Fix by implementing intelligent object merging that:
> - Detects objects with duplicate SPDX IDs
> - Compares completeness based on externalIdentifier count
> - Keeps the more complete version (more externalIdentifiers)
> - Preserves objects without IDs as-is
>
> This ensures that consolidated SBOMs contain the most complete
> metadata available from all source documents.
>
> The bug was discovered while testing multi-PURL support where
> packages can have varying externalIdentifier counts (base PURL
> vs base + Git commit + Git branch PURLs), but affects any
> scenario with duplicate SPDX IDs during consolidation.
>

This doesn't sound correct. Each generated Element should have a completely
unique spdxid and only live in a single document. If that isn't the case
then I think it's a bug. Can you provide a concrete example where this is
happening?



> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/sbom30.py | 47 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 227ac51877..c77e18f4e8 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -822,7 +822,52 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>                  if not e.externalSpdxId in imports:
>                      imports[e.externalSpdxId] =3D e
>
> -            self.objects |=3D other.objects
> +            # Merge objects intelligently: if same SPDX ID exists, keep
> the one with more complete data
> +            #
> +            # WHY DUPLICATES OCCUR: When consolidating SPDX documents
> (e.g., recipe -> package -> image),
> +            # the same package can be referenced at different build
> stages, each with varying levels of
> +            # detail. Early stages may have basic PURLs, while later
> stages add Git metadata qualifiers.
> +            # This is architectural - multi-stage builds naturally creat=
e
> multiple representations of
> +            # the same entity.
> +            #
> +            # However, preserve object identity for types that get
> referenced (like CreationInfo)
> +            # to avoid breaking serialization
> +            other_by_id =3D {}
> +            for obj in other.objects:
> +                obj_id =3D getattr(obj, '_id', None)
> +                if obj_id:
> +                    other_by_id[obj_id] =3D obj
> +
> +            self_by_id =3D {}
> +            for obj in self.objects:
> +                obj_id =3D getattr(obj, '_id', None)
> +                if obj_id:
> +                    self_by_id[obj_id] =3D obj
> +
> +            # Merge: for duplicate IDs, prefer the object with more
> externalIdentifier entries
> +            # but only for Element types (not CreationInfo, Agent, Tool,
> etc.)
> +            for obj_id, other_obj in other_by_id.items():
> +                if obj_id in self_by_id:
> +                    self_obj =3D self_by_id[obj_id]
> +                    # Only replace Elements with more complete data
> +                    # Do NOT replace CreationInfo or other supporting
> types to preserve object identity
> +                    if isinstance(self_obj, oe.spdx30.Element):
> +                        # If both have externalIdentifier, keep the one
> with more entries
> +                        self_ext_ids =3D getattr(self_obj,
> 'externalIdentifier', [])
> +                        other_ext_ids =3D getattr(other_obj,
> 'externalIdentifier', [])
> +                        if len(other_ext_ids) > len(self_ext_ids):
> +                            # Replace self object with other (more
> complete) object
> +                            self.objects.discard(self_obj)
> +                            self.objects.add(other_obj)
> +                    # For non-Element types (CreationInfo, Agent, Tool),
> keep existing to preserve identity
> +                else:
> +                    # New object, just add it
> +                    self.objects.add(other_obj)
> +
> +            # Add any objects without IDs
> +            for obj in other.objects:
> +                if not getattr(obj, '_id', None):
> +                    self.objects.add(obj)
>
>          for o in add_objectsets:
>              merge_doc(o)
> --
> 2.53.0
>
>

--00000000000047cdee064b584498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 20, 2026, 10:10=E2=
=80=AFPM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.com">stondo@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Stefano T=
ondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemens.com" target=3D"_blank"=
 rel=3D"noreferrer">stefano.tondo.ext@siemens.com</a>&gt;<br>
<br>
When consolidating SPDX documents via expand_collection(), objects<br>
with the same SPDX ID can appear in multiple source documents with<br>
different levels of completeness. The previous implementation used<br>
simple set union (self.objects |=3D other.objects), which would keep<br>
an arbitrary version when duplicates existed.<br>
<br>
This caused data loss during consolidation, particularly affecting<br>
externalIdentifier arrays where one version might have a basic PURL<br>
while another has multiple PURLs with Git metadata qualifiers.<br>
<br>
Fix by implementing intelligent object merging that:<br>
- Detects objects with duplicate SPDX IDs<br>
- Compares completeness based on externalIdentifier count<br>
- Keeps the more complete version (more externalIdentifiers)<br>
- Preserves objects without IDs as-is<br>
<br>
This ensures that consolidated SBOMs contain the most complete<br>
metadata available from all source documents.<br>
<br>
The bug was discovered while testing multi-PURL support where<br>
packages can have varying externalIdentifier counts (base PURL<br>
vs base + Git commit + Git branch PURLs), but affects any<br>
scenario with duplicate SPDX IDs during consolidation.<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">This doesn&#39;t soun=
d correct. Each generated Element should have a completely unique spdxid an=
d only live in a single document. If that isn&#39;t the case then I think i=
t&#39;s a bug. Can you provide a concrete example where this is happening?<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank" rel=3D"noreferrer">stefano.tondo.ext@siemens.com</=
a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/sbom30.py | 47 ++++++++++++++++++++++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 46 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py<br>
index 227ac51877..c77e18f4e8 100644<br>
--- a/meta/lib/oe/sbom30.py<br>
+++ b/meta/lib/oe/sbom30.py<br>
@@ -822,7 +822,52 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not e.exte=
rnalSpdxId in imports:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0imports[e.externalSpdxId] =3D e<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.objects |=3D other.objects<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Merge objects intelligently: i=
f same SPDX ID exists, keep the one with more complete data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # WHY DUPLICATES OCCUR: When con=
solidating SPDX documents (e.g., recipe -&gt; package -&gt; image),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the same package can be refere=
nced at different build stages, each with varying levels of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # detail. Early stages may have =
basic PURLs, while later stages add Git metadata qualifiers.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is architectural - multi-=
stage builds naturally create multiple representations of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the same entity.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # However, preserve object ident=
ity for types that get referenced (like CreationInfo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # to avoid breaking serializatio=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 other_by_id =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for obj in other.objects:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj_id =3D getattr=
(obj, &#39;_id&#39;, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj_id:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 othe=
r_by_id[obj_id] =3D obj<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self_by_id =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for obj in self.objects:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj_id =3D getattr=
(obj, &#39;_id&#39;, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj_id:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
_by_id[obj_id] =3D obj<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Merge: for duplicate IDs, pref=
er the object with more externalIdentifier entries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # but only for Element types (no=
t CreationInfo, Agent, Tool, etc.)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for obj_id, other_obj in other_b=
y_id.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if obj_id in self_=
by_id:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
_obj =3D self_by_id[obj_id]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # On=
ly replace Elements with more complete data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Do=
 NOT replace CreationInfo or other supporting types to preserve object iden=
tity<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i=
sinstance(self_obj, oe.spdx30.Element):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # If both have externalIdentifier, keep the one with more entrie=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self_ext_ids =3D getattr(self_obj, &#39;externalIdentifier&#39;,=
 [])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 other_ext_ids =3D getattr(other_obj, &#39;externalIdentifier&#39=
;, [])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if len(other_ext_ids) &gt; len(self_ext_ids):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # Replace self object with other (more complete) o=
bject<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.objects.discard(self_obj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.objects.add(other_obj)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fo=
r non-Element types (CreationInfo, Agent, Tool), keep existing to preserve =
identity<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ne=
w object, just add it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.objects.add(other_obj)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add any objects without IDs<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for obj in other.objects:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not getattr(obj=
, &#39;_id&#39;, None):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.objects.add(obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for o in add_objectsets:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0merge_doc(o)<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div></div>

--00000000000047cdee064b584498--

