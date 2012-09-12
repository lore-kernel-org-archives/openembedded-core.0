Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TBvt0-0000Dc-PX
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 00:58:23 +0200
Received: by obblz20 with SMTP id lz20so3592767obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=kIJIO7T4Q3NwbrNZkMkcRF+FzjEKJayj/eUBFgzfFQA=;
	b=GdG4Ki2AUYVYY7UgPnbhCiYQaBSQnEeeMBf4p1rdsrH/nAnr0haI4SmONe157HamW6
	HnNll/ZanZ+rCQzTtJykrzMgaB/4lF+F8s3joyNyfh88vRQx8YkrjE8CIikSWbordVLN
	1hhkRKRYA0sYb/g6ug2K/vZIm2mbJ2/oMbU7TBFv69dH4bcjjkdejOi26wFURjdHcnIf
	g7RmujBKHtjFlu72ERF3FMbNEoIMctYdRNk2MgBJ0NviOLE3whtpTq0x4pEKnTKMQgT0
	9NKSX0K0I60Cji5DqEuovE2l0/zbzRDzlBnoE8Ige+js9OARvEz0k/dO6gtEc/Hym99Y
	snvw==
Received: by 10.60.27.10 with SMTP id p10mr50230oeg.49.1347489949628; Wed, 12
	Sep 2012 15:45:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Wed, 12 Sep 2012 15:45:29 -0700 (PDT)
X-Originating-IP: [79.118.163.23]
In-Reply-To: <5050F3A5.9070609@linux.intel.com>
References: <cover.1347480378.git.andrei@gherzan.ro>
	<09795cfdec0b03e3c5e03b8bef431de0adad71e5.1347480378.git.andrei@gherzan.ro>
	<5050F3A5.9070609@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 13 Sep 2012 01:45:29 +0300
Message-ID: <CAK18fxFZimpcNkW8dVGKpAQ8iWQY34LUtESJVXr4GmidLqrRYg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQn8u7HDI1KKo3O7+ZAemEmQPTInwwLXWtUgMvNWX8eDsAhfkqpvJLHTcZ/I0Hob4mKAm+7p
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] image_types.bbclass: Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Wed, 12 Sep 2012 22:58:23 -0000
Content-Type: multipart/alternative; boundary=e89a8fb20264c9372104c988f302

--e89a8fb20264c9372104c988f302
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 12, 2012 at 11:42 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 09/12/2012 01:10 PM, Andrei Gherzan wrote:
>
>> If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if
>> base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an
>> unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if
>> IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So
>> let's add the round up code after the base_size calculus and it's
>> comparison.
>>
>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>   meta/classes/image_types.**bbclass |    7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image_types.**bbclass
>> b/meta/classes/image_types.**bbclass
>> index d286eea..6c01b21 100644
>> --- a/meta/classes/image_types.**bbclass
>> +++ b/meta/classes/image_types.**bbclass
>> @@ -82,9 +82,12 @@ runimagecmd () {
>>         # The base_size gets calculated:
>>         #  - initial size determined by `du -ks` of the IMAGE_ROOTFS
>>         #  - then multiplied by the IMAGE_OVERHEAD_FACTOR
>> -       #  - then rounded up to IMAGE_ROOTFS_ALIGNMENT
>>         #  - finally tested against IMAGE_ROOTFS_SIZE
>> -       ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 *
>> ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -=
>> base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size >
>> ${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) +
>> ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>> +       ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{base_size = $1 *
>> ${IMAGE_OVERHEAD_FACTOR}; print ((base_size > ${IMAGE_ROOTFS_SIZE} ?
>> base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }'`
>> +
>> +       # Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT
>> +       ROOTFS_SIZE=`awk "BEGIN { rootfs_size = $ROOTFS_SIZE +
>> ${IMAGE_ROOTFS_ALIGNMENT} - 1; rootfs_size -= rootfs_size %
>> ${IMAGE_ROOTFS_ALIGNMENT}; print rootfs_size }"`
>> +
>>
>
>
> AWK seems a little heavy weight here, now we are forking it twice, since
> we are already in awk above, can you not just continue the function from
> there instead, maybe with a END{} or something else?
>
> So, to be sure i understood. You want to have the whole routine in the
same awk right? I did it this way to make those steps a little clearer. But
indeed, this is a good idea in terms of performance.

Also will this guarantee an Integer result?
>
Will fix in V3. :)

Branch updated with v3.

ag

--e89a8fb20264c9372104c988f302
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Sep 12, 2012 at 11:42 PM, Saul Wold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">=
sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

On 09/12/2012 01:10 PM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
If we round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT before checking if<br>
base_size is greater then IMAGE_ROOTFS_SIZE, we can end up adding an<br>
unaligned value to IMAGE_ROOTFS_SIZE. Obviously, if<br>
IMAGE_ROOTFS_EXTRA_SPACE was overwritten with an unaligned value. So<br>
let&#39;s add the round up code after the base_size calculus and it&#39;s<b=
r>
comparison.<br>
<br>
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" targ=
et=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
---<br>
=A0 meta/classes/image_types.<u></u>bbclass | =A0 =A07 +++++--<br>
=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/image_types.<u></u>bbclass b/meta/classes/image_t=
ypes.<u></u>bbclass<br>
index d286eea..6c01b21 100644<br>
--- a/meta/classes/image_types.<u></u>bbclass<br>
+++ b/meta/classes/image_types.<u></u>bbclass<br>
@@ -82,9 +82,12 @@ runimagecmd () {<br>
=A0 =A0 =A0 =A0 # The base_size gets calculated:<br>
=A0 =A0 =A0 =A0 # =A0- initial size determined by `du -ks` of the IMAGE_ROO=
TFS<br>
=A0 =A0 =A0 =A0 # =A0- then multiplied by the IMAGE_OVERHEAD_FACTOR<br>
- =A0 =A0 =A0 # =A0- then rounded up to IMAGE_ROOTFS_ALIGNMENT<br>
=A0 =A0 =A0 =A0 # =A0- finally tested against IMAGE_ROOTFS_SIZE<br>
- =A0 =A0 =A0 ROOTFS_SIZE=3D`du -ks ${IMAGE_ROOTFS}|awk &#39;{base_size =3D=
 $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_ALIGNMENT} - 1; base_size -=
=3D base_size % ${IMAGE_ROOTFS_ALIGNMENT}; print ((base_size &gt; ${IMAGE_R=
OOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPAC=
E}) }&#39;`<br>


+ =A0 =A0 =A0 ROOTFS_SIZE=3D`du -ks ${IMAGE_ROOTFS}|awk &#39;{base_size =3D=
 $1 * ${IMAGE_OVERHEAD_FACTOR}; print ((base_size &gt; ${IMAGE_ROOTFS_SIZE}=
 ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_EXTRA_SPACE}) }&#39;`=
<br>
+<br>
+ =A0 =A0 =A0 # Round up ROOTFS_SIZE to IMAGE_ROOTFS_ALIGNMENT<br>
+ =A0 =A0 =A0 ROOTFS_SIZE=3D`awk &quot;BEGIN { rootfs_size =3D $ROOTFS_SIZE=
 + ${IMAGE_ROOTFS_ALIGNMENT} - 1; rootfs_size -=3D rootfs_size % ${IMAGE_RO=
OTFS_ALIGNMENT}; print rootfs_size }&quot;`<br>
+<br>
</blockquote>
<br>
<br>
AWK seems a little heavy weight here, now we are forking it twice, since we=
 are already in awk above, can you not just continue the function from ther=
e instead, maybe with a END{} or something else?<br>
<br></blockquote><div><span style=3D"background-color:rgb(255,255,255);colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px">So, to be sure=
 i understood. You want to have the whole routine in the same awk right? I =
did it this way to make those steps a little clearer. But indeed, this is a=
 good idea in terms of performance.</span>=A0</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
Also will this guarantee an Integer result?<br></blockquote><div><span styl=
e=3D"background-color:rgb(255,255,255);color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px">Will fix in V3. :)</span>=A0</div><div><br></d=
iv>

<div>Branch updated with v3.=A0</div><div><br></div><div>ag</div></div>

--e89a8fb20264c9372104c988f302--
