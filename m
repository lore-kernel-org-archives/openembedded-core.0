Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 260CE731D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:42:23 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id i129so1359920vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TLeTWkf+EtUiglCAQIpU3bFY2u2ctWcuLac05am8U+s=;
	b=bMNfpFVQ5k7zZ9EEYry8Z7Zz/E6fB45JRzJA93a2c0aM3IzymEV+5gsNFlcZ+VHYGA
	rYMTPPJwqHI8WyW+xPWm7mvvkudQ6g//vtq2JRZ+T6Obg7u0xY+3Nwvf6NF/G1FJV62w
	GMiPLA3pbvsxaQjWEceRFdHZkQH9utwKeg3t/Q1BJvqr/TZgVBXnWbGfNlnPORwkSzyn
	CtnR+d7AgUyahOPXcuMw4RI1Sd84eLJN8bNcJDDdHpy9faGasD0B1WanoOdx4YnNEByW
	pSTZycpBHC9L235yY9H0qoQtTxLxDxVbH+dMJhxsTxMb9doi5f1tRFr3sJcPYt1a4KsZ
	tYjQ==
MIME-Version: 1.0
X-Received: by 10.31.5.15 with SMTP id 15mr63434045vkf.108.1452001344331; Tue,
	05 Jan 2016 05:42:24 -0800 (PST)
Received: by 10.31.30.204 with HTTP; Tue, 5 Jan 2016 05:42:24 -0800 (PST)
In-Reply-To: <568A8891.3050200@windriver.com>
References: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
	<568A8891.3050200@windriver.com>
Date: Tue, 5 Jan 2016 14:42:24 +0100
Message-ID: <CALatG=6iWgCRo1UWGUPmosN6WQ5y8LJBvU=R1C_ntZVKRfOprg@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "yue.tao" <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V1 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Tue, 05 Jan 2016 13:42:24 -0000
Content-Type: multipart/alternative; boundary=001a1143df7457a3440528966816

--001a1143df7457a3440528966816
Content-Type: text/plain; charset=UTF-8

Hi, Bruce:

I had sent out another 0/N thread as you requested, please ignore this
thread then.

the best,
thank you

2016-01-04 15:58 GMT+01:00 Bruce Ashfield <bruce.ashfield@windriver.com>:

> On 15-12-30 04:19 PM, Ming Liu wrote:
>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> It makes no sense to install a initramfs bundled kernel image since
>> do_package does not depend on do_bundle_initramfs at all, otherwise, it
>> leads to a impicit kernel-image package depending on do_package run before
>> or after do_bundle_initramfs.
>>
>
> It may just be the holiday break that has me thinking slower than
> normal .. but I'm missing an overall description of the problem you are
> trying to solve with this series, and also a writeup of how the new
> implementation works.
>
> Can you re-submit this with a 0/N that describes the issue with the
> current implementation, and how this series solves it .. and then
> perhaps the individual patches will make more sense.
>
> We were able to bundle in the past, but the message I'm getting from
> the commit messages is that something fundamental isn't working, but
> I can't quite put the whole picture together without some more context.
>
> Bruce
>
>
>
>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>   meta/classes/kernel.bbclass | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4ce1611..d1ca614 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>>                 kernel_do_compile
>>                 mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>                 mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>> -               # Update install area
>> -               echo "There is kernel image bundled with initramfs:
>> ${B}/${KERNEL_OUTPUT}.initramfs"
>> -               install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>> -               echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>         fi
>>   }
>>
>>
>>
>

--001a1143df7457a3440528966816
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi, Bruce:<br><br></div>I had sent out another 0=
/N thread as you requested, please ignore this thread then.<br><br></div><d=
iv>the best,<br></div><div>thank you<br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">2016-01-04 15:58 GMT+01:00 Bruce Ashfiel=
d <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" tar=
get=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">On 15-12-30 04:19 PM, Ming Liu wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.com" t=
arget=3D"_blank">peter.x.liu@external.atlascopco.com</a>&gt;<br>
<br>
It makes no sense to install a initramfs bundled kernel image since<br>
do_package does not depend on do_bundle_initramfs at all, otherwise, it<br>
leads to a impicit kernel-image package depending on do_package run before<=
br>
or after do_bundle_initramfs.<br>
</blockquote>
<br></span>
It may just be the holiday break that has me thinking slower than<br>
normal .. but I&#39;m missing an overall description of the problem you are=
<br>
trying to solve with this series, and also a writeup of how the new<br>
implementation works.<br>
<br>
Can you re-submit this with a 0/N that describes the issue with the<br>
current implementation, and how this series solves it .. and then<br>
perhaps the individual patches will make more sense.<br>
<br>
We were able to bundle in the past, but the message I&#39;m getting from<br=
>
the commit messages is that something fundamental isn&#39;t working, but<br=
>
I can&#39;t quite put the whole picture together without some more context.=
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Bruce</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com" target=3D"_blank">peter.x.liu@external.atlascopco.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/kernel.bbclass | 4 ----<br>
=C2=A0 1 file changed, 4 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 4ce1611..d1ca614 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -179,10 +179,6 @@ do_bundle_initramfs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_do_compile<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f ${KERNEL_OUTP=
UT} ${KERNEL_OUTPUT}.initramfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f ${KERNEL_OUTP=
UT}.bak ${KERNEL_OUTPUT}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Update install ar=
ea<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;There is=
 kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B=
}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACH=
INE}.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${B}/${K=
ERNEL_OUTPUT}.initramfs&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 }<br>
<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--001a1143df7457a3440528966816--
