Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 410DC6D88C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 15:43:19 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at1so11860673iec.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cctB59uVmgxJOUyZhcz+WfiF8N57m13aGb+XLA2G+2M=;
	b=FeECQ98JhWRbqo5FvjOR13R97KMhYxm+MSltQKD/r6RiShGs3Q7ylihlkzTfW/O2DZ
	yrk03CBW7bQ9iwfdhg+/84JAtZ/i8NMHUEnnM9pg7tXTP2+Gt3TSKwzt70Gd96Q5XjE1
	h3sqH8SJiibxPuz9oGPfp66kmPJe5JAqKuR8XVvIhrfZUCUKYmU1ieNRdrmA42vAh4sa
	FgJRAhdcia6Oi3U+mNRBMKCQ3R+Par1LMEDUx0dnxX6GMTOXrz3sx4iu55xvOxg/WDKA
	LGz/o9413+o+MU+K5t/YVsWSdkQwfrD3hUVe2H2LCTXcFRMf6xZdsQ3oZ/SmzsQ64TVX
	lStg==
MIME-Version: 1.0
X-Received: by 10.50.57.44 with SMTP id f12mr22074507igq.39.1385566998520;
	Wed, 27 Nov 2013 07:43:18 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Wed, 27 Nov 2013 07:43:18 -0800 (PST)
In-Reply-To: <5295F7AF.1000506@windriver.com>
References: <1385559899.11222.0.camel@ted>
	<5295F7AF.1000506@windriver.com>
Date: Wed, 27 Nov 2013 07:43:18 -0800
Message-ID: <CAMKF1srofnw_==y87Sh7SJg2KNmv8kWbMj5QiHCbAgc5qB2fFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: restore scripts in the sysroot"
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
X-List-Received-Date: Wed, 27 Nov 2013 15:43:19 -0000
Content-Type: multipart/alternative; boundary=e89a8ff24d9dc26b4f04ec2a74ab

--e89a8ff24d9dc26b4f04ec2a74ab
Content-Type: text/plain; charset=UTF-8

On Wednesday, November 27, 2013, Bruce Ashfield wrote:

> On 13-11-27 08:44 AM, Richard Purdie wrote:
>
>> This reverts commit 6a6735cb98d529c8c5376aedb5c951339f54fe96.
>>
>> The module class already ensures the scripts are rebuilt correctly.
>> Running
>> this at sstate installation time is problematic since it can require the
>> cross compiler. Adding such a dependency would cause issues of its own.
>>
>
> I was waiting for the dust to clear and have been running with the
> same thing here, saves me from sending it and I've removed it from
> my queue.
>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>
Looks ok to me


>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 4974507..24ac778 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -290,17 +290,6 @@ kernel_do_install() {
>>   }
>>   do_install[prefuncs] += "package_get_auto_pr"
>>
>> -
>> -SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
>> -kernelscripts_sstate_postinst () {
>> -       if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o
>> "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
>> -               (
>> -                 cd ${STAGING_KERNEL_DIR}
>> -                 oe_runmake scripts
>> -               )
>> -       fi
>> -}
>> -
>>   python sysroot_stage_all () {
>>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
>> d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>>   }
>>
>>
>>
>

--e89a8ff24d9dc26b4f04ec2a74ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, November 27, 2013, Bruce Ashfield  wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 13-11-27 08:44 AM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This reverts commit 6a6735cb98d529c8c5376aedb5c951<u></u>339f54fe96.<br>
<br>
The module class already ensures the scripts are rebuilt correctly. Running=
<br>
this at sstate installation time is problematic since it can require the<br=
>
cross compiler. Adding such a dependency would cause issues of its own.<br>
</blockquote>
<br>
I was waiting for the dust to clear and have been running with the<br>
same thing here, saves me from sending it and I&#39;ve removed it from<br>
my queue.<br>
<br>
Acked-by: Bruce Ashfield &lt;<a>bruce.ashfield@windriver.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Looks ok to me</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a>richard.purdie@linuxfoundation.org</a>=
&gt;<br>
---<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 4974507..24ac778 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -290,17 +290,6 @@ kernel_do_install() {<br>
=C2=A0 }<br>
=C2=A0 do_install[prefuncs] +=3D &quot;package_get_auto_pr&quot;<br>
<br>
-<br>
-SSTATEPOSTINSTFUNCS +=3D &quot;kernelscripts_sstate_<u></u>postinst&quot;<=
br>
-kernelscripts_sstate_postinst () {<br>
- =C2=A0 =C2=A0 =C2=A0 if [ &quot;${BB_CURRENTTASK}&quot; =3D &quot;populat=
e_sysroot&quot; -o &quot;${BB_CURRENTTASK}&quot; =3D &quot;populate_sysroot=
_setscene&quot; ]; then<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${STAGING_KERN=
EL_DIR}<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake script=
s<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
- =C2=A0 =C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
=C2=A0 python sysroot_stage_all () {<br>
=C2=A0 =C2=A0 =C2=A0 oe.path.copyhardlinktree(d.<u></u>expand(&quot;${D}${K=
ERNEL_SRC_PATH}<u></u>&quot;), d.expand(&quot;${SYSROOT_DESTDIR}${<u></u>KE=
RNEL_SRC_PATH}&quot;))<br>
=C2=A0 }<br>
<br>
<br>
</blockquote>
<br>
</blockquote>

--e89a8ff24d9dc26b4f04ec2a74ab--
