Return-Path: <mgloff@emacinc.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6142E606BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Feb 2015 22:15:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id z12so19909645wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Feb 2015 14:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=M4dvNkr2Pz7ms2KHpqxZnYnpDk8hTlk0WsSB7BYFB+4=;
	b=KRl5A501atmAfr+VhP3pwe3wV6epA83yAYjnKmP+eQU/wizqXM5Y4i5Vix+Pqx6ZVi
	PCw5Y9/xP7uw6JJOGJLWhYfrGGXMS7n8zZa6wXMdiznY7QRTXMC3FLDAckdtx11ea2mF
	ncFihNTPKX8fm0vAv7CdrJsjEHcDeCmgBD7dgsUcGb29iCu+B8exaF36BTBPHTBr7l37
	8rvRupADAUl4aI2KMxZmSzXvDuViF27uHQzj4ez6xT/3JHnDrJbu4WIMBNg57DeySunD
	BV+Xa9UaJ/dBIQaZDAsGPUUJpbxkkIscGYsOFWhDeoO7jx5d3qb5Cpn5111HWSeDU20E
	RzVQ==
X-Gm-Message-State: ALoCoQmBbkEAbi8my0Ai4IUDIIs8h1zTTS1DRGd0NEJ+TIgJuwkGQGDlonEFLfp6X6ilbxgHRBf6
MIME-Version: 1.0
X-Received: by 10.195.11.72 with SMTP id eg8mr23405576wjd.48.1423347345164;
	Sat, 07 Feb 2015 14:15:45 -0800 (PST)
Received: by 10.216.105.66 with HTTP; Sat, 7 Feb 2015 14:15:45 -0800 (PST)
In-Reply-To: <548EEC94.4020601@mlbassoc.com>
References: <1418500650-2156-1-git-send-email-mgloff@emacinc.com>
	<1418500650-2156-2-git-send-email-mgloff@emacinc.com>
	<548EEC94.4020601@mlbassoc.com>
Date: Sat, 7 Feb 2015 16:15:45 -0600
Message-ID: <CALXw4G71w2=tDFdCYLT6Ahhi6SHtyD1i=rngR9breFTP+vgDOQ@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] volatiles: Create /var/run/resolv.conf before linking to it
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
X-List-Received-Date: Sat, 07 Feb 2015 22:15:54 -0000
Content-Type: multipart/alternative; boundary=089e013a206ce6a13b050e86e0f3

--089e013a206ce6a13b050e86e0f3
Content-Type: text/plain; charset=UTF-8

Sorry for such a late reply. I'll fix the commit log. The reason for the
order change is that I get:

rm: can't remove '/etc/resolv.conf': Read-only file system
ln: /etc/resolv.conf: File exists

every time on boot up. When switched, no error messages. It does still
'work', I just thought I'd clear up an error message while I was at it.

Michael Gloff


On Mon, Dec 15, 2014 at 8:13 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> No commit log?
>
> Also, the order for a symbolic link should not matter, so why make this
> change?
>
> On 2014-12-13 12:57, Michael Gloff wrote:
>
>> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
>> ---
>>   meta/recipes-core/initscripts/initscripts-1.0/volatiles | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> index 1fc5816..e6f0695 100644
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> @@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp
>>   d root root 0755 /var/lock/subsys none
>>   f root root 0664 /var/log/wtmp none
>>   f root root 0664 /var/run/utmp none
>> -l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>>   f root root 0644 /var/run/resolv.conf none
>> +l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>>   d root root 1777 /run/media none
>>   l root root 1777 /media /run/media
>>
>>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e013a206ce6a13b050e86e0f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sorry for such a late reply. I&#39;ll fix the co=
mmit log. The reason for the order change is that I get:<br><br>rm: can&#39=
;t remove &#39;/etc/resolv.conf&#39;: Read-only file system<br>ln: /etc/res=
olv.conf: File exists<br><br></div>every time on boot up. When switched, no=
 error messages. It does still &#39;work&#39;, I just thought I&#39;d clear=
 up an error message while I was at it.<br><br></div>Michael Gloff<br><div>=
<div><br></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Dec 15, 2014 at 8:13 AM, Gary Thomas <span dir=3D"ltr">&l=
t;<a href=3D"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">No commit log?<br>
<br>
Also, the order for a symbolic link should not matter, so why make this cha=
nge?<br>
<br>
On 2014-12-13 12:57, Michael Gloff wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc.com" targ=
et=3D"_blank">mgloff@emacinc.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/initscripts/<u></u>initscripts-1.0/volatiles | 2 +=
-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>vo=
latiles b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volat=
iles<br>
index 1fc5816..e6f0695 100644<br>
--- a/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volatiles=
<br>
+++ b/meta/recipes-core/<u></u>initscripts/initscripts-1.0/<u></u>volatiles=
<br>
@@ -32,7 +32,7 @@ l root root 1777 /tmp /var/tmp<br>
=C2=A0 d root root 0755 /var/lock/subsys none<br>
=C2=A0 f root root 0664 /var/log/wtmp none<br>
=C2=A0 f root root 0664 /var/run/utmp none<br>
-l root root 0644 /etc/resolv.conf /var/run/resolv.conf<br>
=C2=A0 f root root 0644 /var/run/resolv.conf none<br>
+l root root 0644 /etc/resolv.conf /var/run/resolv.conf<br>
=C2=A0 d root root 1777 /run/media none<br>
=C2=A0 l root root 1777 /media /run/media<br>
<br><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
------------------------------<u></u>------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------<u></u>------------------------------<br>
-- <br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</font></span></blockquote></div><br></div>

--089e013a206ce6a13b050e86e0f3--
