Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Csx-0006Em-Cq
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:14:07 +0100
Received: by mail-we0-f172.google.com with SMTP id x10so361902wey.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=oeeZeeUqJ8xWSg582TivN9WHFny9vKvQ/KJk2vY1t9c=;
	b=wmogxWroCe21ynNDBBRNlRI0SH+qwQIiS9S/mShyy+PGpygBK3/B/N5PnO1owoFub3
	TTVyPR68yd0QTxLcKhBtG3gCsh1017s5JWD+QbhFG9LoH1nyFCWy2+xh8gJ1XIRD6v9D
	nWmShuUB0pnKxn9paw9PNCsdJBei/1w9Md3ZIA3GJzgVQegPsAuYmcaoq/xYigGxxlED
	XG+bnJ8bD1QXZjZTA4Jh0jBeyHSSTWWXPbpfyUPZr5mrgyGyk//C5cSWhVSCV3zko+L9
	hcNwnYT4gXAn6+ZiYtS6Bu6TLTkG50/t9cY5qKvfSQmz0SHGx8jlU1Rw4WWlGYVNVDPK
	nQIA==
MIME-Version: 1.0
X-Received: by 10.180.90.147 with SMTP id bw19mr3108362wib.28.1359471507674;
	Tue, 29 Jan 2013 06:58:27 -0800 (PST)
Received: by 10.194.179.39 with HTTP; Tue, 29 Jan 2013 06:58:27 -0800 (PST)
In-Reply-To: <CABcZANnz3b5W056P3NX0HktHfOrbE-Mu+88izcQtrTpaUnyszA@mail.gmail.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
	<1359464656-27638-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANnz3b5W056P3NX0HktHfOrbE-Mu+88izcQtrTpaUnyszA@mail.gmail.com>
Date: Tue, 29 Jan 2013 15:58:27 +0100
Message-ID: <CA+chaQcgMfW3=GxnMDJTgx8C5v3QU8HPNyODwv43JLkCc3-g+w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 15:14:11 -0000
Content-Type: multipart/alternative; boundary=f46d043892514c147704d46ea05d

--f46d043892514c147704d46ea05d
Content-Type: text/plain; charset=UTF-8

Ah, good to know, sending v3.


On Tue, Jan 29, 2013 at 3:29 PM, Chris Larson <clarson@kergoth.com> wrote:

>
> On Tue, Jan 29, 2013 at 6:04 AM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> * as reported by Enrico on #oe
>>   11:06:50 < ensc|w> JaMa: might this be caused by
>> dc78ef91a2bf01efb8028c9afbe69e506e016265
>>   which checks for 'd.getVar('LICENSE_CREATE_PACKAGE', True)' evaluating
>> to 'True' for every
>>   string (including the default 0)
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/classes/license.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>> index d4ebb26..229f755 100644
>> --- a/meta/classes/license.bbclass
>> +++ b/meta/classes/license.bbclass
>> @@ -103,7 +103,7 @@ python do_populate_lic() {
>>  # it would be better to copy them in do_install_append, but
>> find_license_filesa is python
>>  python perform_packagecopy_prepend () {
>>      enabled = d.getVar('LICENSE_CREATE_PACKAGE', True)
>> -    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
>> +    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled ==
>> "1":
>
>
> We do have an existing mechanism for handling boolean variables in a sane
> way, as an FYI.
>
> LICENSE_CREATE_PACKAGE[type] = "boolean"
>
> LICENSE_CREATE_PACKAGE = "1"
> oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') == True
> LICENSE_CREATE_PACKAGE = "0"
> oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') == False
>
> Available types: boolean, integer (with support for different bases),
> float (with support for hexadecimal floating point values), regex, choice
> (which lets you only allow from a set of possible string values), list
> (which does the (d.getVar() or "").split() crap for you).
>
> You can also INHERIT += "type_check", and you'll know immediately at
> ConfigParsed time if any of the values are invalid for their specified
> types.
> --
> Christopher Larson
>

--f46d043892514c147704d46ea05d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, good to know, sending v3.</div><div class=3D"gmail_ext=
ra"><br><br><div class=3D"gmail_quote">On Tue, Jan 29, 2013 at 3:29 PM, Chr=
is Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" targ=
et=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"im"><br><div class=3D"gmail_quote">On Tue, Jan 29, 2013 at 6:=
04 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>* as reported by Enrico on #oe<br>
=C2=A0 11:06:50 &lt; ensc|w&gt; JaMa: might this be caused by dc78ef91a2bf0=
1efb8028c9afbe69e506e016265<br>
=C2=A0 which checks for &#39;d.getVar(&#39;LICENSE_CREATE_PACKAGE&#39;, Tru=
e)&#39; evaluating to &#39;True&#39; for every<br>
=C2=A0 string (including the default 0)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/license.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
</div>index d4ebb26..229f755 100644<br>
<div>--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -103,7 +103,7 @@ python do_populate_lic() {<br>
=C2=A0# it would be better to copy them in do_install_append, but find_lice=
nse_filesa is python<br>
=C2=A0python perform_packagecopy_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0enabled =3D d.getVar(&#39;LICENSE_CREATE_PACKAGE&#39;, =
True)<br>
- =C2=A0 =C2=A0if d.getVar(&#39;CLASSOVERRIDE&#39;, True) =3D=3D &#39;class=
-target&#39; and enabled:<br>
</div>+ =C2=A0 =C2=A0if d.getVar(&#39;CLASSOVERRIDE&#39;, True) =3D=3D &#39=
;class-target&#39; and enabled =3D=3D &quot;1&quot;:</blockquote></div><br>=
</div>We do have an existing mechanism for handling boolean variables in a =
sane way, as an FYI.</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">LICENSE_CRE=
ATE_PACKAGE[type] =3D &quot;boolean&quot;</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">LICENSE_CREATE_PACKAGE =3D &quot;1&quot=
;</div>


<div class=3D"gmail_extra">oe.data.typed_value(d, &#39;LICENSE_CREATE_PACKA=
GE&#39;) =3D=3D True<br><div class=3D"gmail_extra">LICENSE_CREATE_PACKAGE =
=3D &quot;0&quot;</div><div>oe.data.typed_value(d, &#39;LICENSE_CREATE_PACK=
AGE&#39;) =3D=3D False</div>


<div><br></div><div>Available types: boolean, integer (with support for dif=
ferent bases), float (with support for hexadecimal floating point values), =
regex, choice (which lets you only allow from a set of possible string valu=
es), list (which does the (d.getVar() or &quot;&quot;).split() crap for you=
).</div>


<div><br></div><div>You can also INHERIT +=3D &quot;type_check&quot;, and y=
ou&#39;ll know immediately at ConfigParsed time if any of the values are in=
valid for their specified types.</div><span class=3D"HOEnZb"><font color=3D=
"#888888">-- <br>
Christopher Larson</font></span></div>

</div>
</blockquote></div><br></div>

--f46d043892514c147704d46ea05d--
