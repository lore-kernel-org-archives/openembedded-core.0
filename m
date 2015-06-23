Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id B5FF8756C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 11:07:17 +0000 (UTC)
Received: by qgev13 with SMTP id v13so1669308qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 04:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Wy3tBypScIKqvUBfqQk2tM0fAR8w2sfUPkWyBkWsA88=;
	b=d5pE8h5cxHk30Ji3U8ZssqEP5xuy8L7inurcbAL09Y6h/JSBF+LpcBXLYIxqXg/1ao
	RklKEX5+9SoDX4wpGTRwjl4MOrLYusaTslYE1gr/TDHbXdPwTb621QlggcoBI2P/oHFY
	U8GllIMt9ZPTexw+1c6ci8V4GBjr9Vu08TkvCNbWOtPJ569Zh76GhHSeWYG8zMaBgj6I
	LksnpCI4RZtvCvykQ9rEoxWU1aEnGvuNTmdPtfFtC4oTgjE+4FB2UFQNNed7J1ml1OoB
	+FnGwBanSyZrEaAlZf1rHu+MI+HDyV3sRXepaFydC8h3Qbq95nhKKpTVwNgDnOxxOnhA
	58kQ==
X-Gm-Message-State: ALoCoQn8JDQ1SmWcHrZdTCn5JPRSJl+tIjZ2K2dZ22BGI6xJTGhE/ZtaquVTj3jAHp1K7idBlwAI
X-Received: by 10.140.133.199 with SMTP id 190mr45822045qhf.17.1435057638529; 
	Tue, 23 Jun 2015 04:07:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 04:06:59 -0700 (PDT)
In-Reply-To: <CAD3vsf51CUgAM3QKXu9JTUOgBX8=fm5U00k0bn=jcz932UC9CQ@mail.gmail.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf51CUgAM3QKXu9JTUOgBX8=fm5U00k0bn=jcz932UC9CQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 12:06:59 +0100
Message-ID: <CAJTo0LaRBA4+hX9iQiSO85HoPH+RR05_xD1Q0LYxP3+dxehzqw@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][fido 1/4] runqemu: fix MACHINE being detected as qemuarm for qemuarm64 kernel image
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
X-List-Received-Date: Tue, 23 Jun 2015 11:07:20 -0000
Content-Type: multipart/alternative; boundary=001a11353390c6f3cc05192d64c1

--001a11353390c6f3cc05192d64c1
Content-Type: text/plain; charset=UTF-8

These were literally just merged into master.

Ross

On 23 June 2015 at 11:57, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> ping
>
> Regards,
> Jagadeesh
>
> On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> Basically, runqemu script autodetects MACHINE type based on the
>> kernel image name; if MACHINE name is not specified. Since 'qemuarm'
>> string is common in both qemuarm amnd qemuarm64 kernel image names, the
>> MACHINE type is considered as 'qemuarm' even when qemuarm64 kernel
>> image name is given in command line.
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> ---
>>  scripts/runqemu | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 84ece4d..09c507d 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -232,13 +232,13 @@ fi
>>
>>  if [ -z "$MACHINE" ]; then
>>      if [ "x$FSTYPE" = "xvmdk" ]; then
>> -        MACHINE=`basename $VM | sed -n
>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>> +        MACHINE=`basename $VM | sed -n
>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>          if [ -z "$MACHINE" ]; then
>>              error "Unable to set MACHINE from vmdk filename [$VM]"
>>          fi
>>          echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>>      else
>> -        MACHINE=`basename $KERNEL | sed -n
>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>> +        MACHINE=`basename $KERNEL | sed -n
>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>          if [ -z "$MACHINE" ]; then
>>              error "Unable to set MACHINE from kernel filename [$KERNEL]"
>>          fi
>> --
>> 1.9.1
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11353390c6f3cc05192d64c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These were literally just merged into master.<div><br></di=
v><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 23 June 2015 at 11:57, Jagadeesh Krishnanjanappa <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkris=
hnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">ping<div><br></div><div>Regards,</div><div>Jagadeesh</=
div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh=
 Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanappa@m=
vista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Basically, runqemu script autodetects=
 MACHINE type based on the<br>
kernel image name; if MACHINE name is not specified. Since &#39;qemuarm&#39=
;<br>
string is common in both qemuarm amnd qemuarm64 kernel image names, the<br>
MACHINE type is considered as &#39;qemuarm&#39; even when qemuarm64 kernel<=
br>
image name is given in command line.<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 84ece4d..09c507d 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -232,13 +232,13 @@ fi<br>
<br>
=C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x$FSTYPE&quot; =3D &quot;xvmdk&quot; ]; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p=
&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemus=
h4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from vmdk filename [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Set MACHINE to [$MACHINE] base=
d on vmdk [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/=
\1/p&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|q=
emush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from kernel filename [$KERNEL]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>
</div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a11353390c6f3cc05192d64c1--
