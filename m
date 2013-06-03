Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9D16065C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 19:02:03 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id i4so1268041oah.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LpgvjQL1qYcM3tIXEDVEQsVo2p7zHIGROdi3j3/immo=;
	b=wdLMQLLexKnriglUrgy7x01K7ZAR9GGEc2D75vtJ3Wuv/VtzIpYHRntuSapcdMiQry
	q9m4IJAkhUrqusB1Vuy5nGTlbue4/MszXrK9l+hw9Edy8o4+twnjf3YY5VLp9DETx7p1
	nFG4a8BDNueF9AwnG5tLAYhD1uGef5ESgH9Tdr6GoCkuTj/QvnF6raj82VToeIWWoLr3
	yC4awtusS/a8LD9W7PUQUPsej1Ck/Vt/h6HJ8ssbarZlEOYSGrZtHadoj61oi5xxzBrP
	zVUeJWP4lHySDYMkeqgerGYEmO7P8y2NvK7ADYz8auKeC3e1YPF2AdSDqYylyot+N7Nx
	5yZQ==
MIME-Version: 1.0
X-Received: by 10.60.134.236 with SMTP id pn12mr11058076oeb.4.1370286123808;
	Mon, 03 Jun 2013 12:02:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 3 Jun 2013 12:02:03 -0700 (PDT)
In-Reply-To: <51ACD5A7.2060707@pseudoterminal.org>
References: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
	<51ACD5A7.2060707@pseudoterminal.org>
Date: Mon, 3 Jun 2013 16:02:03 -0300
X-Google-Sender-Auth: 0TTnB3BhqnHB-995ROAF5z8FOhY
Message-ID: <CAP9ODKovJjk=GaaS2ssA32jSbZy4fHqte68MgBvmnS2CXvjryw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 19:02:04 -0000
Content-Type: multipart/alternative; boundary=047d7b471f6aa6d9b204de449963

--047d7b471f6aa6d9b204de449963
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 3, 2013 at 2:43 PM, Carlos Rafael Giani
<dv@pseudoterminal.org>wrote:

> On 03.06.2013 18:53, Otavio Salvador wrote:
>
>> The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we
>> need to have them available or the installation of the meta package
>> will fail.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> This patch is need to make the meta packages work. This should also be
>> applied in dylan branch as currently ${PN}-meta packages are not
>> installable.
>>
>>   meta/recipes-multimedia/**gstreamer/gst-plugins-package.**inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/**gstreamer/gst-plugins-package.**inc
>> b/meta/recipes-multimedia/**gstreamer/gst-plugins-package.**inc
>> index 7ae3ef6..b768094 100644
>> --- a/meta/recipes-multimedia/**gstreamer/gst-plugins-package.**inc
>> +++ b/meta/recipes-multimedia/**gstreamer/gst-plugins-package.**inc
>> @@ -28,6 +28,8 @@ python populate_packages_prepend () {
>>   # each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev
>> on PN-staticdev
>>   # so we need them even when empty (like in gst-plugins-good case)
>>   ALLOW_EMPTY_${PN} = "1"
>> +ALLOW_EMPTY_${PN}-apps = "1"
>> +ALLOW_EMPTY_${PN}-glib = "1"
>>   ALLOW_EMPTY_${PN}-dev = "1"
>>   ALLOW_EMPTY_${PN}-staticdev = "1"
>>
>>
>
> Note that I posted a similar patch here some time ago, and the concern
> about unnecessary empty packages was raised. My proposed OE-core GStreamer
> 1.0 patches include code that takes care of this by adding packages to the
> -meta rdepends only if they are not empty.
>

Oh; good. Maybe you could split this patch from it so we can have it
applied and easy to backport to dylan?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b471f6aa6d9b204de449963
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 3, 2013 at 2:43 PM, Carlos Rafael Giani <span dir=3D"lt=
r">&lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudo=
terminal.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
3.06.2013 18:53, Otavio Salvador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we<br>
need to have them available or the installation of the meta package<br>
will fail.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
This patch is need to make the meta packages work. This should also be<br>
applied in dylan branch as currently ${PN}-meta packages are not<br>
installable.<br>
<br>
=A0 meta/recipes-multimedia/<u></u>gstreamer/gst-plugins-package.<u></u>inc=
 | 2 ++<br>
=A0 1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-multimedia/<u></u>gstreamer/gst-plugins-package.<=
u></u>inc b/meta/recipes-multimedia/<u></u>gstreamer/gst-plugins-package.<u=
></u>inc<br>
index 7ae3ef6..b768094 100644<br>
--- a/meta/recipes-multimedia/<u></u>gstreamer/gst-plugins-package.<u></u>i=
nc<br>
+++ b/meta/recipes-multimedia/<u></u>gstreamer/gst-plugins-package.<u></u>i=
nc<br>
@@ -28,6 +28,8 @@ python populate_packages_prepend () {<br>
=A0 # each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev =
on PN-staticdev<br>
=A0 # so we need them even when empty (like in gst-plugins-good case)<br>
=A0 ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-apps =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-glib =3D &quot;1&quot;<br>
=A0 ALLOW_EMPTY_${PN}-dev =3D &quot;1&quot;<br>
=A0 ALLOW_EMPTY_${PN}-staticdev =3D &quot;1&quot;<br>
=A0 <br>
</blockquote>
<br></div></div>
Note that I posted a similar patch here some time ago, and the concern abou=
t unnecessary empty packages was raised. My proposed OE-core GStreamer 1.0 =
patches include code that takes care of this by adding packages to the -met=
a rdepends only if they are not empty.<br>
</blockquote><div><br></div><div style>Oh; good. Maybe you could split this=
 patch from it so we can have it applied and easy to backport to dylan?=A0<=
/div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--047d7b471f6aa6d9b204de449963--
