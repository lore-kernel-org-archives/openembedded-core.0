Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC643C48BCB
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.25640.1649655996470458354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 22:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id D2FD8D7B2;
	Mon, 11 Apr 2022 07:46:34 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.225]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ndmsk-2DbsRt0; Mon, 11 Apr 2022 07:46:34 +0200
Content-Type: multipart/alternative;
 boundary="------------Miin3DGSHElObNtRs2sJT383"
Message-ID: <b06ab65f-b328-6b96-fe0d-cd124641f0ca@t-online.de>
Date: Mon, 11 Apr 2022 07:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe-core][PATCH] glib-networking: build with gnutls support
Content-Language: en-US
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20220410172852.4136-1-f_l_k@t-online.de>
 <CAJ86T=Vojo4Y1sTzHtDca79WQXuWdE6VS0r=P7wpvHHE3nBrQQ@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAJ86T=Vojo4Y1sTzHtDca79WQXuWdE6VS0r=P7wpvHHE3nBrQQ@mail.gmail.com>
X-TOI-EXPURGATEID: 150726::1649655994-000116DC-77F717A5/0/0 CLEAN NORMAL
X-TOI-MSGID: e36d12e9-ed44-4e3c-9569-6a77adfa3d1b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164214

This is a multi-part message in MIME format.
--------------Miin3DGSHElObNtRs2sJT383
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Am 11.04.22 um 06:25 schrieb Andre McCurdy:
> On Sun, Apr 10, 2022 at 10:29 AM Markus Volk<f_l_k@t-online.de>  wrote:
>> this fixes authentication issues with geary and tls connection
>>
>> Signed-off-by: Markus Volk<f_l_k@t-online.de>
>> ---
>>   meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
>>   meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
>>   meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.=
bb b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
>> index d578f17aa5..73827b0a85 100644
>> --- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
>> @@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0"
>>
>>   SRC_URI[archive.sha256sum] =3D "100aaebb369285041de52da422b6b716789d=
5e4d7549a3a71ba587b932e0823b"
>>
>> -PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1=
', 'tests', '', d)}"
>> +PACKAGECONFIG ??=3D "openssl gnutls ${@bb.utils.contains('PTEST_ENABL=
ED', '1', 'tests', '', d)}"
> This should either be gnutls or openssl, not both. But aside from
> that, gnutls brings (L)GPLv3 issues and therefore should not be
> enabled by default.

In a perfect world, I would say you are right. There should not even=20
exist more than one implementation.

In reality, at least for now, geary is broken with openssl.

As for your concern about gplv3 issues. As far as I know, the core of=20
gnutls is under LGPL-2.1. Only installation of gnutls-bin or=20
gnutls-openssl ||should introduce GPL-3.0.

I'm more like thinking "better to have more mainstays, so you dont fall=20
if you loose one". But=C2=A0 i'm not strict with my opinion. This change =
can=20
also be done with bbappends.

> Are you saying that some glib-networking functionality works when
> using gnutls but does not work when using openssl? If so, is it a
> known limitation? Or a bug? If a bug, has it been reported upstream?
> The commit message should explain those kinds of details.

It completely stopped working with openssl. This happened about two=20
weeks ago, possibly because of the latest openssl update.



--------------Miin3DGSHElObNtRs2sJT383
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Am 11.04.22 um 06:25 schrieb Andre
      McCurdy:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJ86T=3DVojo4Y1sTzHtDca79WQXuWdE6VS0r=3DP7wpvHHE3nBrQQ@mail.=
gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Sun, Apr 10, 2022 at 10:2=
9 AM Markus Volk <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:f_l_k@=
t-online.de">&lt;f_l_k@t-online.de&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
this fixes authentication issues with geary and tls connection

Signed-off-by: Markus Volk <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
---
 meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
 meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
index d578f17aa5..73827b0a85 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0"

 SRC_URI[archive.sha256sum] =3D "100aaebb369285041de52da422b6b716789d5e4d=
7549a3a71ba587b932e0823b"

-PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', =
'tests', '', d)}"
+PACKAGECONFIG ??=3D "openssl gnutls ${@bb.utils.contains('PTEST_ENABLED'=
, '1', 'tests', '', d)}"
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This should either be gnutls or openssl, not both. But aside from
that, gnutls brings (L)GPLv3 issues and therefore should not be
enabled by default.
</pre>
    </blockquote>
    <p>In a perfect world, I would say you are right. There should not
      even exist more than one implementation.</p>
    <p>In reality, at least for now, geary is broken with openssl.<br>
    </p>
    <p>As for your concern about gplv3 issues. As far as I know, the
      core of gnutls is under LGPL-2.1. Only installation of gnutls-bin
      or gnutls-openssl <code></code>should introduce GPL-3.0.</p>
    <p>I'm more like thinking "better to have more mainstays, so you
      dont fall if you loose one". But=C2=A0 i'm not strict with my opini=
on.
      This change can also be done with bbappends.<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAJ86T=3DVojo4Y1sTzHtDca79WQXuWdE6VS0r=3DP7wpvHHE3nBrQQ@mail.=
gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Are you saying that some glib-networking functionality works when
using gnutls but does not work when using openssl? If so, is it a
known limitation? Or a bug? If a bug, has it been reported upstream?
The commit message should explain those kinds of details.
</pre>
    </blockquote>
    <p>It completely stopped working with openssl. This happened about
      two weeks ago, possibly because of the latest openssl update.</p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------Miin3DGSHElObNtRs2sJT383--

