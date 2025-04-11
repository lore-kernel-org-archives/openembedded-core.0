Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88E6C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 11:57:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.24001.1744372668907932812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 04:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T/uQ5OxP;
 spf=pass (domain: mvista.com, ip: 209.85.218.53, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so345884666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744372667; x=1744977467; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVoJ8miitHlSVeOGo8Oi7C6tH6doOKIKKvlIYWYN7nw=;
        b=T/uQ5OxP12Wm6xpNz7FW1JChv96mH5v/s3+m7ejIfdO+I7dvnDYL0F5BQEXA60cSjK
         ig840DauRzc54aO141xi9zp4cdGcVKfAvfWN4gsvD5MgRq9iqQ3SoJTXS7NDMqe7wmLs
         KYua3c94nJ5b9DvH/QEAudtr1+BjZSRtWnaI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372667; x=1744977467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVoJ8miitHlSVeOGo8Oi7C6tH6doOKIKKvlIYWYN7nw=;
        b=FVZlhsrVVBrJiYmBm1LJfXsa2kZgiOwXbX7uI2KI/ipsVRDrNG6c7vjv1WiYiKxDk1
         ZomgRo9cAKxP2pRtlKUPr17FrQb9xdlEIiXdwGCJ0B2057R6rf5bS8iKt4PDdYu1Hd81
         r1/6ZBUe7D9xNwTP/KsTO2uaYP23NWSzB5YATMcqKd5bYLgoe8w+WrCYjE3gb1iI1dNH
         Qvl7bZAjtYNEFSjnx8TZNFwlfyt345SqA9hLFOGBVVbGOd2sCvdWhgQP70gJqZPtIP4L
         nW+uYpt5+9FkT6RWf+DqJHsRHP7msxMKYm/X56JI8+k/BB6XeoO/jQzQvaFeLuRnhmX3
         6Nlw==
X-Gm-Message-State: AOJu0YxmE/FgXyQSV1l1AaubL1vUun9cj06pAw2Hc83+D1KUqUoTRMRG
	8QHUVGSSvs+yP4wLAjMtALcUfXoFduZ9QwM0wj+VI6ifhmIzGEoA6neI+acn267MiaayxHycKyB
	2SZXGrzcklHD7//FjGWSOq9CX3kFX3rTS/xk3PA==
X-Gm-Gg: ASbGncsnzzj4PpZVU4K+BQV1RzG6htt26jSQW0o8JQjAgTtRhuBymAez3q/aD2aOubD
	YLCpLsNkY0keg7UJovGbwGTWTSZcov/vTgEX8cQBf6HRn9IBADW3KhigzEsDcRZEGA2sq0mxR9s
	wVW7s0mRJUmyTGEuiiK/uqs/Q=
X-Google-Smtp-Source: AGHT+IGHTYdNCO9lytHk/HoE7DGPFbHtNkXIAf8ajSgz47+rFF8/8bYL3GKhFkGEuv2zyfw0tSXP3y0kdEHBm4ajl8s=
X-Received: by 2002:a17:906:7154:b0:aca:dd0c:cfc8 with SMTP id
 a640c23a62f3a-acadd0cd3bamr12561266b.10.1744372666869; Fri, 11 Apr 2025
 04:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250411093440.20727-1-vanusuri@mvista.com> <CAMSfU+5+s0T5PbTiftgd3EeVUjWJzDNoqnfM3T=k=8FaZMF8vg@mail.gmail.com>
In-Reply-To: <CAMSfU+5+s0T5PbTiftgd3EeVUjWJzDNoqnfM3T=k=8FaZMF8vg@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 11 Apr 2025 17:27:33 +0530
X-Gm-Features: ATxdqUFMcqwCmBdOuyVT5p8GYMQOATaYIw-HAtjZNQjtPBhBF1nmhTh_3dved28
Message-ID: <CANQUz19raZ5F6nDFaPYoR6zOwRPNCzK0WGOiSe2c1DHsP-v4aw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssh: upgrade 9.9p2 -> 10.0p1
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002a616306327f6904"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 11:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214736

--0000000000002a616306327f6904
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Yoann for letting me know.

As per https://www.openwall.com/lists/oss-security/2025/04/09/6 , they  do
not intend to make a new release to fix this mistake. They released tarball
with the name openssh-10.0p1.tar.gz
<https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.0p1.tar.gz=
>
.

I will update about this in the commit message and send a v2 patch.

Thanks & Regards,
Vijay



On Fri, Apr 11, 2025 at 3:21=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

>
>
> Le ven. 11 avr. 2025 =C3=A0 11:35, Vijay Anusuri via lists.openembedded.o=
rg
> <vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :
>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Includes fix for CVE-2025-32728
>>
>> Release Notes: https://www.openssh.com/txt/release-10.0
>
>
> There was a mishap in the release process:
> https://www.openwall.com/lists/oss-security/2025/04/09/6
>
> This version will present itself as 10.0p2 (see version.h in sources)
>
> I don't know if we need to handle this particularly in the recipe but can
> you mention this is the commit message to avoid an eventual confusion?
>
> Thanks!
>
>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../openssh/{openssh_9.9p2.bb =3D> openssh_10.0p1.bb}             | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb =3D>
>> openssh_10.0p1.bb} (99%)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
>> b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
>> rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
>> index 5191725796..21e1e50759 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
>> @@ -26,7 +26,7 @@ SRC_URI =3D "
>> https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
>>
>> file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
>>
>> file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
>>             "
>> -SRC_URI[sha256sum] =3D
>> "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
>> +SRC_URI[sha256sum] =3D
>> "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
>>
>>  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is speci=
fic
>> to OpenSSH with the pam opie which we don't build/use here."
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214721):
>> https://lists.openembedded.org/g/openembedded-core/message/214721
>> Mute This Topic: https://lists.openembedded.org/mt/112207287/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>

--0000000000002a616306327f6904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thanks Yoann for letting me know.<br><br></=
div>As per  <a href=3D"https://www.openwall.com/lists/oss-security/2025/04/=
09/6" target=3D"_blank">https://www.openwall.com/lists/oss-security/2025/04=
/09/6</a> , they=C2=A0 <span style=3D"font-family:arial,sans-serif;white-sp=
ace:pre-wrap">do not intend to make a new release to fix this mistake.

They released tarball with the name </span><span style=3D"font-family:arial=
,sans-serif"><a href=3D"https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portabl=
e/openssh-10.0p1.tar.gz">openssh-10.0p1.tar.gz</a>.<br><br></span></div><sp=
an style=3D"font-family:arial,sans-serif">I will update about this in the c=
ommit message and send a v2 patch.<br><br></span></div><div><span style=3D"=
font-family:arial,sans-serif">Thanks &amp; Regards,</span></div><div><span =
style=3D"font-family:arial,sans-serif">Vijay</span></div><div><br><br></div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Apr 11, 2025 at 3:21=E2=80=AFPM Yoann Congal=
 &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 11 avr. 2025 =C3=A0=C2=A011:35, =
Vijay Anusuri via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@l=
ists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" =
target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Includes fix for CVE-2025-32728<br>
<br>
Release Notes: <a href=3D"https://www.openssh.com/txt/release-10.0" rel=3D"=
noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-10.0</a><=
/blockquote><div><br></div><div>There was a mishap in the release process: =
<a href=3D"https://www.openwall.com/lists/oss-security/2025/04/09/6" target=
=3D"_blank">https://www.openwall.com/lists/oss-security/2025/04/09/6</a></d=
iv><div><br></div><div>This version will present itself as 10.0p2 (see vers=
ion.h in sources)</div><div><br></div><div>I don&#39;t know if we need to h=
andle this particularly in the recipe but can you mention this is the commi=
t message to avoid an eventual confusion?</div><div><br></div><div>Thanks!<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openssh/{<a href=3D"http://openssh_9.9p2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openssh_9.9p2.bb</a> =3D&gt; <a href=3D"http://openssh_10.=
0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-connectivity/openssh/{<a href=3D"http://openssh_9=
.9p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a> =3D&gt; =
<a href=3D"http://openssh_10.0p1.bb" rel=3D"noreferrer" target=3D"_blank">o=
penssh_10.0p1.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
9p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb" rel=3D"nore=
ferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.9=
p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a><br>
rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
index 5191725796..21e1e50759 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.9p2.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
@@ -26,7 +26,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.openbsd.org/pub/=
OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.ta" rel=3D"noreferrer" target=3D=
"_blank">https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}=
.ta</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-banner.sh-log=
-input-and-output-files-on-erro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-test-exec-use=
-the-absolute-path-in-the-SSH-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;91aadb603e08cc285eddf965e1199d02585fa94d994d6=
cae5b41e1721e215673&quot;<br>
+SRC_URI[sha256sum] =3D &quot;021a2e709a0edf4250b1256bd5a9e500411a90dddabea=
830ed59cef90eb9d85c&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This CVE i=
s specific to OpenSSH with the pam opie which we don&#39;t build/use here.&=
quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214721): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214721" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214721</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112207287/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112207287/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div>

--0000000000002a616306327f6904--

