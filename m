Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4A43B73779
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 10:56:28 +0000 (UTC)
Received: by igin14 with SMTP id n14so31136359igi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XJSP8kwnfRoEj8YzOgRJmFZw3HUDCCfgIfyFpfe29Ew=;
	b=nEr0RckP5XFEd0mUeFmNtPUXQd2EpuB23xQKEpFJkkHa5dqWSbbm9d98uEIcXxI7It
	ckEEmNQABlEvC5kMqshDYAGNb4nkvhdEiRMaogaXkzJKaiuTCYQVOEb1j/X6IY8rUza5
	mYBe3DXBzU03Md/VqUpWhSBKxAU6DkthBrpw8GvDFKnhwYP5KHhPgTyPC5uRAjRR1bAG
	tF0UaoWBTwuf/aLmslldEkqq2lxy0AvuNkQCyuxXkkwWbF+Q+Om+xZM0WACLiVWat28Y
	C0Wjf1ccXA4l1r+9rs5UpI0EXn381CBgqAgalX/eTKH8WkjqAMKOzHHNERiMVhNlHc4L
	hvXw==
X-Gm-Message-State: ALoCoQnDB/NzmJifaulxqxORQnzyd6ztAKT7otJC8RrmUaYZRd41jrrLWHo12EDn+4275yqEYHnP
MIME-Version: 1.0
X-Received: by 10.42.43.199 with SMTP id y7mr36507975ice.12.1435143389189;
	Wed, 24 Jun 2015 03:56:29 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Wed, 24 Jun 2015 03:56:29 -0700 (PDT)
In-Reply-To: <CAJTo0LaRBA4+hX9iQiSO85HoPH+RR05_xD1Q0LYxP3+dxehzqw@mail.gmail.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf51CUgAM3QKXu9JTUOgBX8=fm5U00k0bn=jcz932UC9CQ@mail.gmail.com>
	<CAJTo0LaRBA4+hX9iQiSO85HoPH+RR05_xD1Q0LYxP3+dxehzqw@mail.gmail.com>
Date: Wed, 24 Jun 2015 16:26:29 +0530
Message-ID: <CAD3vsf6Q4t-o5se+1_MEDUEtPaFmGRcML=VSpiizRg8U7c=xkw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 24 Jun 2015 10:56:29 -0000
Content-Type: multipart/alternative; boundary=bcaec5196941ea38210519415b37

--bcaec5196941ea38210519415b37
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 23, 2015 at 4:36 PM, Burton, Ross <ross.burton@intel.com> wrote:

> These were literally just merged into master.
>
> Thanks.


> Ross
>
> On 23 June 2015 at 11:57, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>
>> ping
>>
>> Regards,
>> Jagadeesh
>>
>> On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
>> jkrishnanjanappa@mvista.com> wrote:
>>
>>> Basically, runqemu script autodetects MACHINE type based on the
>>> kernel image name; if MACHINE name is not specified. Since 'qemuarm'
>>> string is common in both qemuarm amnd qemuarm64 kernel image names, the
>>> MACHINE type is considered as 'qemuarm' even when qemuarm64 kernel
>>> image name is given in command line.
>>>
>>> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>>> ---
>>>  scripts/runqemu | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 84ece4d..09c507d 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -232,13 +232,13 @@ fi
>>>
>>>  if [ -z "$MACHINE" ]; then
>>>      if [ "x$FSTYPE" = "xvmdk" ]; then
>>> -        MACHINE=`basename $VM | sed -n
>>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>> +        MACHINE=`basename $VM | sed -n
>>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>>          if [ -z "$MACHINE" ]; then
>>>              error "Unable to set MACHINE from vmdk filename [$VM]"
>>>          fi
>>>          echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>>>      else
>>> -        MACHINE=`basename $KERNEL | sed -n
>>> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>> +        MACHINE=`basename $KERNEL | sed -n
>>> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>>>          if [ -z "$MACHINE" ]; then
>>>              error "Unable to set MACHINE from kernel filename [$KERNEL]"
>>>          fi
>>> --
>>> 1.9.1
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--bcaec5196941ea38210519415b37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 23, 2015 at 4:36 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">These w=
ere literally just merged into master.<div><br></div></div></blockquote><di=
v>Thanks.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote"><div><div class=3D"h5">On 23 June 2015 at 11:57, Jagade=
esh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishnanjanapp=
a@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;</span> =
wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5"=
><div dir=3D"ltr">ping<div><br></div><div>Regards,</div><div>Jagadeesh</div=
></div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkri=
shnanjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Basically, runqemu script autodetects MACHINE type based on the<br>
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
</div></div><br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">=
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></font></span></blockquote></div><br></div>
</blockquote></div><br></div></div>

--bcaec5196941ea38210519415b37--
