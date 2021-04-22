Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.3034.1619120101759400026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 12:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=o7Iw0B7z;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id A943220B8001;
	Thu, 22 Apr 2021 12:35:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A943220B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1619120101;
	bh=hDZTKVeLivUbxjtIvsZtwVk6gcJHnNm3lfZ85yaRg8U=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=o7Iw0B7zvMUGCREjP2UoxHReiAw7oQtUMrgtRtiOJR9VuX5ek9t3nckZCitI8SWWa
	 UovaU7QTFInqMrRe7fjMqeeAzcM8eMPZqGcTTvKdUXzooicW5X8govHelZORtk+F6e
	 4yvLd7UnGr8XUR3EyN1AmDoHkfkoTlrJaRSxYpcE=
Subject: Re: [OE-core] [meta-oe][PATCH v2] cve-update-db-native: skip on empty cpe23Uri
To: Ralph Siemsen <ralph.siemsen@linaro.org>,
 Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
References: <AM9PR09MB464219591A09F7157448D429A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <20210422171249.GA926@maple.netwinder.org>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <f0004ab2-3c2b-8fee-ef75-1b0c5420787a@linux.microsoft.com>
Date: Thu, 22 Apr 2021 13:34:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422171249.GA926@maple.netwinder.org>
Content-Type: multipart/alternative;
 boundary="------------86256F595E69CADF2F47C542"
Content-Language: en-US

--------------86256F595E69CADF2F47C542
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Konrad,

Seems to work on my side as well, it applies cleanly for dunfell as=20
well, I will send=C2=A0 it again so it gets backported since that also bro=
ken.

Cheers,

Alejandro

Tested-by: Alejandro Hernandez <alhe@linux.microsoft.com>

On 4/22/21 11:12 AM, Ralph Siemsen wrote:
> On Thu, Apr 22, 2021 at 06:48:27PM +0200, Konrad Weihmann wrote:
>> Recently an entry in the NVD DB appeared that looks like that
>> {'vulnerable': True, 'cpe_name': []}.
>> As besides all the vulnerable flag no data is present we would get
>> a KeyError exception on acccess.
>> Use get method on dictionary and return if no meta data is present
>> Also quit if the length of the array after splitting is less than 6
>
> Seems to work fine here. Thanks for the quick action.
>
> Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>
>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>> v2: handle the case where key is set but value is none and
>> =C2=A0=C2=A0 if resulting array is shorter than expected
>>
>> meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb=20
>> b/meta/recipes-core/meta/cve-update-db-native.bb
>> index 25ec6bac71..e5822cee58 100644
>> --- a/meta/recipes-core/meta/cve-update-db-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>> @@ -139,7 +139,12 @@ def parse_node_and_insert(c, node, cveId):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cpe in node.get('cpe_mat=
ch', ()):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if n=
ot cpe['vulnerable']:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpe=
23 =3D cpe['cpe23Uri'].split(':')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpe=
23 =3D cpe.get('cpe23Uri')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
not cpe23:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpe=
23 =3D cpe23.split(':')
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
len(cpe23) < 6:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vend=
or =3D cpe23[3]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prod=
uct =3D cpe23[4]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vers=
ion =3D cpe23[5]
>> --=20
>> 2.25.1
>>
>
>=20
>

--------------86256F595E69CADF2F47C542
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hey Konrad,</p>
    <p>Seems to work on my side as well, it applies cleanly for dunfell
      as well, I will send=C2=A0 it again so it gets backported since that
      also broken.</p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <p>Tested-by: Alejandro Hernandez <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a=
> <br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/22/21 11:12 AM, Ralph Siemsen
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20210422171249.GA926@maple.netwinder.org">On Thu, Apr
      22, 2021 at 06:48:27PM +0200, Konrad Weihmann wrote:
      <br>
      <blockquote type=3D"cite">Recently an entry in the NVD DB appeared
        that looks like that
        <br>
        {'vulnerable': True, 'cpe_name': []}.
        <br>
        As besides all the vulnerable flag no data is present we would
        get
        <br>
        a KeyError exception on acccess.
        <br>
        Use get method on dictionary and return if no meta data is
        present
        <br>
        Also quit if the length of the array after splitting is less
        than 6
        <br>
      </blockquote>
      <br>
      Seems to work fine here. Thanks for the quick action.
      <br>
      <br>
      Tested-by: Ralph Siemsen <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:ralph.siemsen@linaro.org">&lt;ralph.siemsen@linaro.org&gt;</a>
      <br>
      <br>
      <blockquote type=3D"cite">Signed-off-by: Konrad Weihmann
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kweihmann@outloo=
k.com">&lt;kweihmann@outlook.com&gt;</a>
        <br>
        ---
        <br>
        v2: handle the case where key is set but value is none and
        <br>
        =C2=A0=C2=A0 if resulting array is shorter than expected
        <br>
        <br>
        meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
        <br>
        1 file changed, 6 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
        b/meta/recipes-core/meta/cve-update-db-native.bb
        <br>
        index 25ec6bac71..e5822cee58 100644
        <br>
        --- a/meta/recipes-core/meta/cve-update-db-native.bb
        <br>
        +++ b/meta/recipes-core/meta/cve-update-db-native.bb
        <br>
        @@ -139,7 +139,12 @@ def parse_node_and_insert(c, node, cveId):
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cpe in node.get('cp=
e_match', ()):
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if not cpe['vulnerable']:
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0 return
        <br>
        -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpe23 =3D cpe['cpe23Uri'].split(':')
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpe23 =3D cpe.get('cpe23Uri')
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if not cpe23:
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpe23 =3D cpe23.split(':')
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if len(cpe23) &lt; 6:
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 vendor =3D cpe23[3]
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 product =3D cpe23[4]
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 version =3D cpe23[5]
        <br>
        --=C2=A0<br>
        2.25.1
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------86256F595E69CADF2F47C542--
