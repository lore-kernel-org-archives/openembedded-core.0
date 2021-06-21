Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web08.49025.1624289880976696559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 08:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@fancydomain.eu header.s=mail header.b=K3CFXi8B;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171, mailfrom: jasper@fancydomain.eu)
Date: Mon, 21 Jun 2021 17:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1624289879;
	bh=nAegQeCidl57Io6PkV4Da/3qTdVANN77lhXWq/kX50A=;
	h=In-Reply-To:References:Subject:To:From;
	b=K3CFXi8Bkr/8CKHckGwiUNsr4B0d7S1u30imvNReDsOV5fmV3DfcNzHOo1+kJ9C58
	 bwDtSyZu40BQCLa9t63jufTYKWscVd9cDv6UwKBNiwpI/hLygTFYqZv9+SjiTKZcAZ
	 3TAa5CTHkT06ZHhoyqpw0KaYMuhPBA1VTpCMWrNiV62jF5u0RyVYz6fVLpPcILQ7dt
	 W+kfPzQO+5GH8spKaYoVFmsxQxNY2QN8tmCA3LDIfsncjZiLKBQvZrbmCUkyXxTL3V
	 HUj0hoeCVKoSGLMNJiq1j6WMYGSlA3ZIPAbIZMV01YQ6t9/O19boQDDGK4oZyCgeC8
	 EevMC3znuThGQ==
In-Reply-To: <CAGDS+nn3+01NZ3-GVD0wALQnyBgWmQU6Kz+3WZ_zB1UzEG7vsQ@mail.gmail.com>
References: <20210621141045.256726-1-jasper@fancydomain.eu> <CAGDS+nn3+01NZ3-GVD0wALQnyBgWmQU6Kz+3WZ_zB1UzEG7vsQ@mail.gmail.com>
Mime-Version: 1.0
Subject: Re: [oe-core][dunfell][PATCH] libxml2: Fix CVE-2021-3518
To: openembedded-core@lists.openembedded.org
From: "Jasper Orschulko" <jasper@fancydomain.eu>
Message-ID: <DDFB19ED-C146-4163-9B4D-670CB43415F0@fancydomain.eu>
Content-Type: multipart/alternative; boundary="----V2H83Y79CA6STOXO6TT9HP84LKSYGW"
Content-Transfer-Encoding: 7bit

------V2H83Y79CA6STOXO6TT9HP84LKSYGW
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Steve,

sorry about that=2E Accidental checkout of dunfell-next=2E I sent a new pa=
tch=2E

Best regards,
Jasper

On 21 June 2021 17:26:14 CEST, Steve Sakoman <sakoman@gmail=2Ecom> wrote:
>Sadly this patch won't apply=2E
>
>Could you rebase it on the current head of dunfell?  It seems you
>generated this patch with an older version of dunfell that is missing
>"libxml: fix CVE-2021-3517 CVE-2021-3537":
>
>https://git=2Eopenembedded=2Eorg/openembedded-core-contrib/commit/?h=3Dst=
able/dunfell-nut&id=3Df177c0ec321f005dd9ce63aec2d700fd53c993ff
>
>Thanks again for helping with CVEs!
>
>Steve
>
>On Mon, Jun 21, 2021 at 4:11 AM Jasper Orschulko via
>lists=2Eopenembedded=2Eorg <jasper=3Dfancydomain=2Eeu@lists=2Eopenembedde=
d=2Eorg>
>wrote:
>>
>> There's a flaw in libxml2 in versions before 2=2E9=2E11=2E An attacker =
who
>is able to submit a crafted file to be processed by an application
>linked with libxml2 could trigger a use-after-free=2E The greatest impact
>from this flaw is to confidentiality, integrity, and availability=2E
>>
>> Upstream-Status: Backport [from fedora:
>> https://bugzilla=2Eredhat=2Ecom/show_bug=2Ecgi?id=3D1954243]
>>
>> Signed-off-by: Jasper Orschulko <jasper@fancydomain=2Eeu>
>> ---
>>  =2E=2E=2E/libxml/libxml2/CVE-2021-3518=2Epatch        | 108
>++++++++++++++++++
>>  meta/recipes-core/libxml/libxml2_2=2E9=2E10=2Ebb    |   1 +
>>  2 files changed, 109 insertions(+)
>>  create mode 100644
>meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch
>>
>> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch
>b/meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch
>> new file mode 100644
>> index 0000000000=2E=2Ec22cccf1b1
>> --- /dev/null
>> +++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch
>> @@ -0,0 +1,108 @@
>> +From ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00
>2001
>> +From: Nick Wellnhofer <wellnhofer@aevum=2Ede>
>> +Date: Wed, 10 Jun 2020 16:34:52 +0200
>> +Subject: [PATCH 1/2] Don't recurse into xi:include children in
>> + xmlXIncludeDoProcess
>> +
>> +Otherwise, nested xi:include nodes might result in a use-after-free
>> +if XML_PARSE_NOXINCNODE is specified=2E
>> +
>> +Found with libFuzzer and ASan=2E
>> +
>> +The upstream patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been
>modified,
>> +as to avoid unnecessary modifications to fallback files=2E
>> +
>> +Signed-off-by: Jasper Orschulko <Jasper=2EOrschulko@iris-sensing=2Ecom=
>
>> +---
>> + xinclude=2Ec | 24 ++++++++++--------------
>> + 1 file changed, 10 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/xinclude=2Ec b/xinclude=2Ec
>> +index ba850fa5=2E=2Ef260c1a7 100644
>> +--- a/xinclude=2Ec
>> ++++ b/xinclude=2Ec
>> +@@ -2392,21 +2392,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr
>ctxt, xmlDocPtr doc, xmlNodePtr tree) {
>> +      * First phase: lookup the elements in the document
>> +      */
>> +     cur =3D tree;
>> +-    if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1)
>> +-      xmlXIncludePreProcessNode(ctxt, cur);
>> +     while ((cur !=3D NULL) && (cur !=3D tree->parent)) {
>> +       /* TODO: need to work on entities -> stack */
>> +-      if ((cur->children !=3D NULL) &&
>> +-          (cur->children->type !=3D XML_ENTITY_DECL) &&
>> +-          (cur->children->type !=3D XML_XINCLUDE_START) &&
>> +-          (cur->children->type !=3D XML_XINCLUDE_END)) {
>> +-          cur =3D cur->children;
>> +-          if (xmlXIncludeTestNode(ctxt, cur))
>> +-              xmlXIncludePreProcessNode(ctxt, cur);
>> +-      } else if (cur->next !=3D NULL) {
>> ++        if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
>> ++            xmlXIncludePreProcessNode(ctxt, cur);
>> ++        } else if ((cur->children !=3D NULL) &&
>> ++                   (cur->children->type !=3D XML_ENTITY_DECL) &&
>> ++                   (cur->children->type !=3D XML_XINCLUDE_START) &&
>> ++                   (cur->children->type !=3D XML_XINCLUDE_END)) {
>> ++            cur =3D cur->children;
>> ++            continue;
>> ++        }
>> ++      if (cur->next !=3D NULL) {
>> +           cur =3D cur->next;
>> +-          if (xmlXIncludeTestNode(ctxt, cur))
>> +-              xmlXIncludePreProcessNode(ctxt, cur);
>> +       } else {
>> +           if (cur =3D=3D tree)
>> +               break;
>> +@@ -2416,8 +2414,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt,
>xmlDocPtr doc, xmlNodePtr tree) {
>> +                   break; /* do */
>> +               if (cur->next !=3D NULL) {
>> +                   cur =3D cur->next;
>> +-                  if (xmlXIncludeTestNode(ctxt, cur))
>> +-                      xmlXIncludePreProcessNode(ctxt, cur);
>> +                   break; /* do */
>> +               }
>> +           } while (cur !=3D NULL);
>> +--
>> +2=2E32=2E0
>> +
>> +
>> +From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 00:00:00
>2001
>> +From: Nick Wellnhofer <wellnhofer@aevum=2Ede>
>> +Date: Thu, 22 Apr 2021 19:26:28 +0200
>> +Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude
>--dropdtd`
>> +
>> +The --dropdtd option can leave dangling pointers in entity reference
>> +nodes=2E Make sure to skip these nodes when processing XIncludes=2E
>> +
>> +This also avoids scanning entity declarations and even modifying
>> +them inadvertently during XInclude processing=2E
>> +
>> +Move from a block list to an allow list approach to avoid descending
>> +into other node types that can't contain elements=2E
>> +
>> +Fixes #237=2E
>> +
>> +Signed-off-by: Jasper Orschulko <Jasper=2EOrschulko@iris-sensing=2Ecom=
>
>> +---
>> + xinclude=2Ec | 5 ++---
>> + 1 file changed, 2 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/xinclude=2Ec b/xinclude=2Ec
>> +index f260c1a7=2E=2Ed7648529 100644
>> +--- a/xinclude=2Ec
>> ++++ b/xinclude=2Ec
>> +@@ -2397,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt,
>xmlDocPtr doc, xmlNodePtr tree) {
>> +         if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
>> +             xmlXIncludePreProcessNode(ctxt, cur);
>> +         } else if ((cur->children !=3D NULL) &&
>> +-                   (cur->children->type !=3D XML_ENTITY_DECL) &&
>> +-                   (cur->children->type !=3D XML_XINCLUDE_START) &&
>> +-                   (cur->children->type !=3D XML_XINCLUDE_END)) {
>> ++                   ((cur->type =3D=3D XML_DOCUMENT_NODE) ||
>> ++                    (cur->type =3D=3D XML_ELEMENT_NODE))) {
>> +             cur =3D cur->children;
>> +             continue;
>> +         }
>> +--
>> +2=2E32=2E0
>> +
>> diff --git a/meta/recipes-core/libxml/libxml2_2=2E9=2E10=2Ebb
>b/meta/recipes-core/libxml/libxml2_2=2E9=2E10=2Ebb
>> index 4ebfb9e556=2E=2E04d32ade69 100644
>> --- a/meta/recipes-core/libxml/libxml2_2=2E9=2E10=2Ebb
>> +++ b/meta/recipes-core/libxml/libxml2_2=2E9=2E10=2Ebb
>> @@ -23,6 +23,7 @@ SRC_URI =3D
>"http://www=2Exmlsoft=2Eorg/sources/libxml2-${PV}=2Etar=2Egz;name=3Dlibta=
r \
>>             file://CVE-2020-7595=2Epatch \
>>             file://CVE-2019-20388=2Epatch \
>>             file://CVE-2020-24977=2Epatch \
>> +           file://CVE-2021-3518=2Epatch \
>>             "
>>
>>  SRC_URI[libtar=2Emd5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
>> --
>> 2=2E32=2E0
>>
>>
>>=20
>>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

------V2H83Y79CA6STOXO6TT9HP84LKSYGW
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Hi Steve,<br><br>sorry about that=2E Accidental ch=
eckout of dunfell-next=2E I sent a new patch=2E<br><br>Best regards,<br>Jas=
per<br><br><div class=3D"gmail_quote">On 21 June 2021 17:26:14 CEST, Steve =
Sakoman &lt;sakoman@gmail=2Ecom&gt; wrote:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">
<pre class=3D"k9mail">Sadly this patch won't apply=2E<br><br>Could you reb=
ase it on the current head of dunfell?  It seems you<br>generated this patc=
h with an older version of dunfell that is missing<br>"libxml: fix CVE-2021=
-3517 CVE-2021-3537":<br><br><a href=3D"https://git=2Eopenembedded=2Eorg/op=
enembedded-core-contrib/commit/?h=3Dstable/dunfell-nut&amp;id=3Df177c0ec321=
f005dd9ce63aec2d700fd53c993ff">https://git=2Eopenembedded=2Eorg/openembedde=
d-core-contrib/commit/?h=3Dstable/dunfell-nut&amp;id=3Df177c0ec321f005dd9ce=
63aec2d700fd53c993ff</a><br><br>Thanks again for helping with CVEs!<br><br>=
Steve<br><br>On Mon, Jun 21, 2021 at 4:11 AM Jasper Orschulko via<br>lists=
=2Eopenembedded=2Eorg &lt;jasper=3Dfancydomain=2Eeu@lists=2Eopenembedded=2E=
org&gt;<br>wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt=
 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><br> =
There's a flaw in libxml2 in versions before 2=2E9=2E11=2E An attacker who =
is able to submit a crafted file to be processed by an application linked w=
ith libxml2 could trigger a use-after-free=2E The greatest impact from this=
 flaw is to confidentiality, integrity, and availability=2E<br><br> Upstrea=
m-Status: Backport [from fedora:<br> <a href=3D"https://bugzilla=2Eredhat=
=2Ecom/show_bug=2Ecgi?id=3D1954243">https://bugzilla=2Eredhat=2Ecom/show_bu=
g=2Ecgi?id=3D1954243</a>]<br><br> Signed-off-by: Jasper Orschulko &lt;jaspe=
r@fancydomain=2Eeu&gt;<hr>  =2E=2E=2E/libxml/libxml2/CVE-2021-3518=2Epatch =
       | 108 ++++++++++++++++++<br>  meta/recipes-core/libxml/libxml2_2=2E9=
=2E10=2Ebb    |   1 +<br>  2 files changed, 109 insertions(+)<br>  create m=
ode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch<br><br> d=
iff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518=2Epatch b/meta/r=
ecipes-core/libxml/libxml2/CVE-2021-3518=2Epatch<br> new file mode 100644<b=
r> index 0000000000=2E=2Ec22cccf1b1<br> --- /dev/null<br> +++ b/meta/recipe=
s-core/libxml/libxml2/CVE-2021-3518=2Epatch<br> @@ -0,0 +1,108 @@<br> +From=
 ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00 2001<br> +Fro=
m: Nick Wellnhofer &lt;wellnhofer@aevum=2Ede&gt;<br> +Date: Wed, 10 Jun 202=
0 16:34:52 +0200<br> +Subject: [PATCH 1/2] Don't recurse into xi:include ch=
ildren in<br> + xmlXIncludeDoProcess<br> +<br> +Otherwise, nested xi:includ=
e nodes might result in a use-after-free<br> +if XML_PARSE_NOXINCNODE is sp=
ecified=2E<br> +<br> +Found with libFuzzer and ASan=2E<br> +<br> +The upstr=
eam patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been modified,<br> +=
as to avoid unnecessary modifications to fallback files=2E<br> +<br> +Signe=
d-off-by: Jasper Orschulko &lt;Jasper=2EOrschulko@iris-sensing=2Ecom&gt;<br=
> +---<br> + xinclude=2Ec | 24 ++++++++++--------------<br> + 1 file change=
d, 10 insertions(+), 14 deletions(-)<br> +<br> +diff --git a/xinclude=2Ec b=
/xinclude=2Ec<br> +index ba850fa5=2E=2Ef260c1a7 100644<br> +--- a/xinclude=
=2Ec<br> ++++ b/xinclude=2Ec<br> +@@ -2392,21 +2392,19 @@ xmlXIncludeDoProc=
ess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {<br> +      *=
 First phase: lookup the elements in the document<br> +      */<br> +     c=
ur =3D tree;<br> +-    if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1)<br> +- =
     xmlXIncludePreProcessNode(ctxt, cur);<br> +     while ((cur !=3D NULL)=
 &amp;&amp; (cur !=3D tree-&gt;parent)) {<br> +       /* TODO: need to work=
 on entities -&gt; stack */<br> +-      if ((cur-&gt;children !=3D NULL) &a=
mp;&amp;<br> +-          (cur-&gt;children-&gt;type !=3D XML_ENTITY_DECL) &=
amp;&amp;<br> +-          (cur-&gt;children-&gt;type !=3D XML_XINCLUDE_STAR=
T) &amp;&amp;<br> +-          (cur-&gt;children-&gt;type !=3D XML_XINCLUDE_=
END)) {<br> +-          cur =3D cur-&gt;children;<br> +-          if (xmlXI=
ncludeTestNode(ctxt, cur))<br> +-              xmlXIncludePreProcessNode(ct=
xt, cur);<br> +-      } else if (cur-&gt;next !=3D NULL) {<br> ++        if=
 (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {<br> ++            xmlXIncludeP=
reProcessNode(ctxt, cur);<br> ++        } else if ((cur-&gt;children !=3D N=
ULL) &amp;&amp;<br> ++                   (cur-&gt;children-&gt;type !=3D XM=
L_ENTITY_DECL) &amp;&amp;<br> ++                   (cur-&gt;children-&gt;ty=
pe !=3D XML_XINCLUDE_START) &amp;&amp;<br> ++                   (cur-&gt;ch=
ildren-&gt;type !=3D XML_XINCLUDE_END)) {<br> ++            cur =3D cur-&gt=
;children;<br> ++            continue;<br> ++        }<br> ++      if (cur-=
&gt;next !=3D NULL) {<br> +           cur =3D cur-&gt;next;<br> +-         =
 if (xmlXIncludeTestNode(ctxt, cur))<br> +-              xmlXIncludePreProc=
essNode(ctxt, cur);<br> +       } else {<br> +           if (cur =3D=3D tre=
e)<br> +               break;<br> +@@ -2416,8 +2414,6 @@ xmlXIncludeDoProce=
ss(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {<br> +        =
           break; /* do */<br> +               if (cur-&gt;next !=3D NULL) =
{<br> +                   cur =3D cur-&gt;next;<br> +-                  if =
(xmlXIncludeTestNode(ctxt, cur))<br> +-                      xmlXIncludePre=
ProcessNode(ctxt, cur);<br> +                   break; /* do */<br> +      =
         }<br> +           } while (cur !=3D NULL);<br> +--<br> +2=2E32=2E0=
<br> +<br> +<br> +From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 =
00:00:00 2001<br> +From: Nick Wellnhofer &lt;wellnhofer@aevum=2Ede&gt;<br> =
+Date: Thu, 22 Apr 2021 19:26:28 +0200<br> +Subject: [PATCH 2/2] Fix user-a=
fter-free with `xmllint --xinclude --dropdtd`<br> +<br> +The --dropdtd opti=
on can leave dangling pointers in entity reference<br> +nodes=2E Make sure =
to skip these nodes when processing XIncludes=2E<br> +<br> +This also avoid=
s scanning entity declarations and even modifying<br> +them inadvertently d=
uring XInclude processing=2E<br> +<br> +Move from a block list to an allow =
list approach to avoid descending<br> +into other node types that can't con=
tain elements=2E<br> +<br> +Fixes #237=2E<br> +<br> +Signed-off-by: Jasper =
Orschulko &lt;Jasper=2EOrschulko@iris-sensing=2Ecom&gt;<br> +---<br> + xinc=
lude=2Ec | 5 ++---<br> + 1 file changed, 2 insertions(+), 3 deletions(-)<br=
> +<br> +diff --git a/xinclude=2Ec b/xinclude=2Ec<br> +index f260c1a7=2E=2E=
d7648529 100644<br> +--- a/xinclude=2Ec<br> ++++ b/xinclude=2Ec<br> +@@ -23=
97,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc=
, xmlNodePtr tree) {<br> +         if (xmlXIncludeTestNode(ctxt, cur) =3D=
=3D 1) {<br> +             xmlXIncludePreProcessNode(ctxt, cur);<br> +     =
    } else if ((cur-&gt;children !=3D NULL) &amp;&amp;<br> +-              =
     (cur-&gt;children-&gt;type !=3D XML_ENTITY_DECL) &amp;&amp;<br> +-    =
               (cur-&gt;children-&gt;type !=3D XML_XINCLUDE_START) &amp;&am=
p;<br> +-                   (cur-&gt;children-&gt;type !=3D XML_XINCLUDE_EN=
D)) {<br> ++                   ((cur-&gt;type =3D=3D XML_DOCUMENT_NODE) ||<=
br> ++                    (cur-&gt;type =3D=3D XML_ELEMENT_NODE))) {<br> + =
            cur =3D cur-&gt;children;<br> +             continue;<br> +    =
     }<br> +--<br> +2=2E32=2E0<br> +<br> diff --git a/meta/recipes-core/lib=
xml/libxml2_2=2E9=2E10=2Ebb b/meta/recipes-core/libxml/libxml2_2=2E9=2E10=
=2Ebb<br> index 4ebfb9e556=2E=2E04d32ade69 100644<br> --- a/meta/recipes-co=
re/libxml/libxml2_2=2E9=2E10=2Ebb<br> +++ b/meta/recipes-core/libxml/libxml=
2_2=2E9=2E10=2Ebb<br> @@ -23,6 +23,7 @@ SRC_URI =3D "http://www=2Exmlsoft=
=2Eorg/sources/libxml2-${PV}=2Etar=2Egz;name=3Dlibtar \<br>             fil=
e://CVE-2020-7595=2Epatch \<br>             file://CVE-2019-20388=2Epatch \=
<br>             file://CVE-2020-24977=2Epatch \<br> +           file://CVE=
-2021-3518=2Epatch \<br>             "<br><br>  SRC_URI[libtar=2Emd5sum] =
=3D "10942a1dc23137a8aa07f0639cbfece5"<br> --<br> 2=2E32=2E0<br><br><br> <b=
r><br></blockquote></pre></blockquote></div><br>-- <br>Sent from my Android=
 device with K-9 Mail=2E Please excuse my brevity=2E</body></html>

------V2H83Y79CA6STOXO6TT9HP84LKSYGW--
