Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4509F6D123
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 03:48:01 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hp15so2958636lab.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 20:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WYcKEWrdmEVpLggvAQCAL40BEEBX6CuK/Tzq03ZFYuo=;
	b=iMuN1aFfnSeItN6p9yztjIPTENDEvWZbzUBTue5kwa1PA4fqg4EHzeHt2O4Kt5Iz9J
	zIa72nvNKOQtYE1YfciFZjf+XosdwWvkAUWrxx8mZdtZHi2tYQ4APH3udCphCEOoocYg
	4jakc/Du4rPU3W52Zg6YQj654MQQ/cJrVIyAeVZnU7Mo14wCkU+nPRg7M8ajZf+Vmp6i
	h2d6lwJ5OQ8g/OiSJg1WZHm70bEe0pO5qzKOqHXDdCgfreoLnd2UuINZNT3TrwpOY7Wo
	a2J3mDbYaCPBe7aoZ+7XVmX5NdAHuQoQu5k28gtYFK44aguGB914aDFK46yIdIoQtTAd
	rJAw==
X-Received: by 10.152.21.133 with SMTP id v5mr565385lae.14.1383277682363; Thu,
	31 Oct 2013 20:48:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 31 Oct 2013 20:47:42 -0700 (PDT)
In-Reply-To: <52731BF7.1070302@felipetonello.com>
References: <1383272753-20012-1-git-send-email-eu@felipetonello.com>
	<52731BF7.1070302@felipetonello.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 31 Oct 2013 20:47:42 -0700
X-Google-Sender-Auth: RTzOMkOPyNkEn7aC99VaFafYn_A
Message-ID: <CABcZANnXQhm02xiokhxmC_7hdiaR=hDtM6K7ogbnQQHokdPH3Q@mail.gmail.com>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Fix split_and_strip_files when file has single quote (')
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
X-List-Received-Date: Fri, 01 Nov 2013 03:48:01 -0000
Content-Type: multipart/alternative; boundary=089e0158ad5ae2156104ea156e69

--089e0158ad5ae2156104ea156e69
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 8:11 PM, Felipe Ferreri Tonello <
eu@felipetonello.com> wrote:

> On 10/31/2013 07:25 PM, eu@felipetonello.com wrote:
>
>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>
>> Fix false error report when a file that has a single quote by escaping
>> the single quote. Some packages might install files with quotes, such
>> as music files and other types, that will cause the problem.
>>
>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
>> ---
>>   meta/classes/package.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index b0f44c7..a12b7b7 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -747,7 +747,7 @@ python split_and_strip_files () {
>>       # 16 - kernel module
>>       def isELF(path):
>>           type =3D 0
>> -        ret, result =3D oe.utils.getstatusoutput("file '%s'" % path)
>> +        ret, result =3D oe.utils.getstatusoutput("file '%s'" %
>> path.replace("'", "\\'"))
>>
>>           if ret:
>>               msg =3D "split_and_strip_files: 'file %s' failed" % path
>>
>>
>
> I just found a bug in this implementation. I will send a v2 shortly.


This should really be fixed to use a better method. In this case we=E2=80=
=99re just
running a single binary with one argument, there=E2=80=99s no need to call =
out to a
shell at all, much less have to mess around with escaping arguments :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158ad5ae2156104ea156e69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 31, 2013 at 8:11 PM, Felipe Ferreri Tonello <span dir=3D"ltr">&=
lt;<a href=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonel=
lo.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 10/31/2013 07:25 PM, <a=
 href=3D"mailto:eu@felipetonello.com" target=3D"_blank">eu@felipetonello.co=
m</a> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: &quot;Felipe F. Tonello&quot; &lt;<a href=3D"mailto:eu@felipetonello.=
com" target=3D"_blank">eu@felipetonello.com</a>&gt;<br>
<br>
Fix false error report when a file that has a single quote by escaping<br>
the single quote. Some packages might install files with quotes, such<br>
as music files and other types, that will cause the problem.<br>
<br>
Signed-off-by: Felipe F. Tonello &lt;<a href=3D"mailto:eu@felipetonello.com=
" target=3D"_blank">eu@felipetonello.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/package.<span class=3D"il">bbclass</span> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/package.<span class=3D"il">bbclass</span> b/meta/=
classes/package.<span class=3D"il">bbclass</span><br>
index b0f44c7..a12b7b7 100644<br>
--- a/meta/classes/package.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/package.<span class=3D"il">bbclass</span><br>
@@ -747,7 +747,7 @@ python split_and_strip_files () {<br>
=C2=A0 =C2=A0 =C2=A0 # 16 - kernel module<br>
=C2=A0 =C2=A0 =C2=A0 def isELF(path):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D 0<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, result =3D oe.utils.getstatusoutput(&quot=
;file &#39;%s&#39;&quot; % path)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, result =3D oe.utils.getstatusoutput(&quot=
;file &#39;%s&#39;&quot; % path.replace(&quot;&#39;&quot;, &quot;\\&#39;&qu=
ot;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;split_and_st=
rip_files: &#39;file %s&#39; failed&quot; % path<br>
<br>
</blockquote>
<br>
<br></div>
I just found a bug in this implementation. I will send a v2 shortly.</block=
quote></div><br>This should really be fixed to use a better method. In this=
 case we=E2=80=99re just running a single binary with one argument, there=
=E2=80=99s no need to call out to a shell at all, much less have to mess ar=
ound with escaping arguments :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0158ad5ae2156104ea156e69--
