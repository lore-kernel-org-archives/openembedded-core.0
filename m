Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7298EDF04F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 07:10:02 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40437.1770880200237657168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 23:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbklf4Wc;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506989e8516so1407481cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 23:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770880199; cv=none;
        d=google.com; s=arc-20240605;
        b=FXeEvo2pGTuya54AviVGU2waa6w0Ns2uwJ8EIQ3R+RZI0unbFTk5TRqy3RjUu2eqkW
         vIgCBx/VfZR78SbCSK3lI3v8WJhzObndZkt3AQjBfVsoJO65W2SnvWhusILIaqkKZ1h7
         4i/paJ2kAi/oMel6Am19Rpwp1VHdj77zb0UcnxCs4PCUXcz0fClEDqft8cIw1pDbglqa
         /rWBvCMMcG/I/TvHGRHN1NYwV01zWUw2wCC85RzjV+j4wMt7mU6XQh8LXGLwO73YTWdj
         h7rd85t49t9flE3B5JWA6bmz3bnQdp0X7Ph9RG+Mjys+Awp6OVVRtd8hccgW0SjQQONt
         JsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=idYNdDVrcuOF0P24mes6QKDta3jwStvqLkqJF1kF42U=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=bcLZ+uWvblnmJU0pDOtiAw1eiAxAFORcLHoictQfndmi2MQYDde1uA9w3jpEjMc/f8
         2Y183KOzmHfRFnW+pYDlVlbTjDcfp8B6PWpoIHxy/Y3niHXtl9vq6T7UFvDGimjTXS4g
         V0lpgmUZDvNpNuXlB6Lny6CnChrRcyPzbeTRFVNjqGanwXMDMVpQzKu5gJ4TU6XRVYLO
         vsZr0naF8psfyQdSI1l3MLTMbnbElzF6jfWLLVLUPbipdhW1mwEypN5vxhBEBqwT8gn5
         c5RZErE+HQWxdM6t+rd+W96cUR507D8OzJ6CbjdQIQ5lgtaZ6sAl2eBZTzmEDNQr3uoG
         ZYlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770880199; x=1771484999; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=idYNdDVrcuOF0P24mes6QKDta3jwStvqLkqJF1kF42U=;
        b=jbklf4WcBmxoq44MHlWVOEOqYnZKrNpJiZk122SUrr+zXPr/x5Dc67YEGIK/z8V3Qe
         rpGHqs2caAqKjfke7R/KZaIO6CZMpVGCRBgfJOX5MFgO/rzB0oO8KWP56q7CcQMMcmvw
         /xaYcaNBGbunI2KXAEiKc6ie80gdok0gKeQDanOCTDOpNysp2PHxczUou8LdDGoMttjx
         OYdfNdKbOc5PEZnI+NXQH5TFdHATOcUPmyh2Vz78lP4zOEzuSx7Wm9K+EUF0MQnsNhE8
         kiHNtjnxICmXi6cY5NNgyQwhhiOfa32DxAwmjQFSfIXSIXXE3f3IYshDY2tEbO1W+ZlQ
         vEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880199; x=1771484999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idYNdDVrcuOF0P24mes6QKDta3jwStvqLkqJF1kF42U=;
        b=hCUKLcWGjdsYE5xxvb2sekqLs1QCZrMCn7qrXNaJ4XBlpWzN3iCSH8IqX7htIO8Pw3
         20yNwRYnfIii8DYenf+McsLxf1CANnFU+cgasZtFt0aZWCFkb/PJl4u8+XAIlPItg6gg
         PWQoB8s51JGP7ORXUIVvyrZsOBUfTwPuS+WEI792/tZE2WQrekt++fMW2jPGVe15msvC
         KCqpRPLtZ2S2cYrztCGovPz9I8fHBvsU2tw7f6mzZ4CUCfgnnCG3mg4ljWTPmmNM6RnP
         aBMIGnkTeKvZcYziid4mM8upL7o8iteQoqYkBItGFVAQnTzl0nP0GWM3gC1DgK05DM4s
         KZuw==
X-Gm-Message-State: AOJu0YzRrSe+68X8u/RuL5O9hmc1fd4zcGD4WtPlcirOM7F+C0FV2DBX
	07RKuPnyDvDJdjZz7AY8VK1wzCiasMPS0U547s1vH7m4gCPVt1Qmk8vjZLWqE9gGqFwip1K1ahe
	MCQ9njJSydESADwO1YCguNQ3jPHLrbgv4IQ==
X-Gm-Gg: AZuq6aLTp3xUPAv2ZP6Ku75fM5vPQzOgxpFLXu+9n4qPT9h6fVfJZ6fnZJs3JNb+V9R
	b2DrXEaxHrajU/gLSWRlAFhbh7wveVkcnTNED05XZakFN3BH5Fi3KMoUB9IBaXaKX4lEnF7jOZw
	nZf9auS68xHgKJroAKxbpogNwxaRiwsHw5XVW7CnOyOQ0MUzVdOv/kFr1fjGoU5awLSkdDlsVez
	SCECWWeOSzXQj7a0z2B6P8nohCEVyZEKTHVzcpZTMlw0FPxbDqkSKuXTaXqqNz8LlPgmzhlNIaF
	bMHRB/p31X7Njdk5Kwiq3ws=
X-Received: by 2002:ac8:7f86:0:b0:4ee:2721:9ebe with SMTP id
 d75a77b69052e-50694b9a060mr14254241cf.53.1770880199176; Wed, 11 Feb 2026
 23:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20260127091608.598339-1-namanj1@kpit.com> <CAMSfU+5X8yphvKpggDiwAva9GNrkgPv23udRXqUhrSrJB6Yi9w@mail.gmail.com>
In-Reply-To: <CAMSfU+5X8yphvKpggDiwAva9GNrkgPv23udRXqUhrSrJB6Yi9w@mail.gmail.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Thu, 12 Feb 2026 12:39:45 +0530
X-Gm-Features: AZwV_Qg7ra__9g3tUS2rMT2vvjg5pjYTs63MbvCZ6lPIX2h_O3_Horig1DMw8dI
Message-ID: <CALCkg5bw6BqhBjf+rkE+RraYvM+KkEis6qFovi+-6YaxLs3Pog@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] libmd: add ptest for 'libmd'
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036353b064a9b2dc0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 07:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231015

--00000000000036353b064a9b2dc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
The patch is merged in master
https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bdab30=
e3b349fef8df6ca0ef4893b89
Can you please check

On Tue, 27 Jan, 2026, 2:59=E2=80=AFpm Yoann Congal, <yoann.congal@smile.fr>=
 wrote:

>
>
> Le mar. 27 janv. 2026 =C3=A0 10:16, Naman Jain via lists.openembedded.org
> <nmjain23=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> Adapt the compile 'test' phony target from Makefile and deploy as
>> ptest for libmd.
>> It takes less than 30seconds for ptest completion
>>
>> Signed-off-by: Naman Jain <namanj1@kpit.com>
>>
>
> Hello,
>
> This patch was also sent to master :
> https://lists.openembedded.org/g/openembedded-core/message/229867
> ... but not merged yet.
>
> Can you please wait for it to be merged on master before resending the
> backport request?
>
> Thanks!
>
>
> ---
>>  .../distro/include/ptest-packagelists.inc     |  1 +
>>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>>
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>> b/meta/conf/distro/include/ptest-packagelists.inc
>> index 9950e46776..784176f579 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>>      json-glib \
>>      libconvert-asn1-perl \
>>      libgpg-error\
>> +    libmd\
>>      libnl \
>>      libpcre \
>>      libssh2 \
>> diff --git a/meta/recipes-support/libmd/files/run-ptest
>> b/meta/recipes-support/libmd/files/run-ptest
>> new file mode 100644
>> index 0000000000..0c4a5f64ec
>> --- /dev/null
>> +++ b/meta/recipes-support/libmd/files/run-ptest
>> @@ -0,0 +1,18 @@
>> +#!/bin/sh
>> +
>> +cd test
>> +status =3D 0
>> +
>> +for testbin in *; do
>> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
>> +        if "./$testbin"; then
>> +            echo "PASS: $testbin"
>> +        else
>> +            echo "FAIL: $testbin"
>> +            status=3D1
>> +        fi
>> +    fi
>> +done
>> +
>> +return $status
>> +
>> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb
>> b/meta/recipes-support/libmd/libmd_1.1.0.bb
>> index dc588a0f95..ffc59deb26 100644
>> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
>> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
>> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/"
>>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812f9=
e1df"
>>
>> -SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar=
.xz
>> "
>> +SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar=
.xz
>> \
>> +          file://run-ptest \
>> +"
>>  SRC_URI[sha256sum] =3D
>> "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>>
>> -inherit autotools
>> +inherit autotools ptest
>> +
>> +do_compile_ptest() {
>> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
>> +    oe_runmake check
>> +}
>> +
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/test
>> +    for bin in ${B}/test/*; do
>> +        if [ -x "$bin" ]; then
>> +            ${B}/libtool --mode=3Dinstall install "$bin"
>> ${D}${PTEST_PATH}/test/$(basename "$bin")
>> +        fi
>> +    done
>> +}
>>
>>  BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#230035):
>> https://lists.openembedded.org/g/openembedded-core/message/230035
>> Mute This Topic: https://lists.openembedded.org/mt/117485645/4316185
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

--00000000000036353b064a9b2dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi<div dir=3D"auto">The patch is merged in master</div><d=
iv dir=3D"auto"><a href=3D"https://git.openembedded.org/openembedded-core/c=
ommit/?id=3D4c0a41389bdab30e3b349fef8df6ca0ef4893b89">https://git.openembed=
ded.org/openembedded-core/commit/?id=3D4c0a41389bdab30e3b349fef8df6ca0ef489=
3b89</a></div><div dir=3D"auto">Can you please check</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 27 Jan, 2026, 2:59=E2=80=AFpm Yoann Congal, &lt;<a href=3D"mai=
lto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0=
mar. 27 janv. 2026 =C3=A0=C2=A010:16, Naman Jain via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded=
.org</a> &lt;nmjain23=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Adapt the compile &#39;test&#39; phony target from Makefile and dep=
loy as<br>
ptest for libmd.<br>
It takes less than 30seconds for ptest completion<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br></blockquote><div><=
br></div><div>Hello,</div><div><br></div><div>This patch was also sent to m=
aster :=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/=
message/229867" target=3D"_blank" rel=3D"noreferrer">https://lists.openembe=
dded.org/g/openembedded-core/message/229867</a></div><div>... but not merge=
d yet.</div><div><br></div><div>Can you please wait for it to be merged on =
master before resending the backport request?</div><div><br></div><div>Than=
ks!</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-support/libmd/files/run-ptest=C2=A0 =C2=A0 | 18 ++++++++=
++++++++<br>
=C2=A0meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 21 +++++++++++++++++--<br>
=C2=A03 files changed, 38 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libmd/files/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 9950e46776..784176f579 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -29,6 +29,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0json-glib \<br>
=C2=A0 =C2=A0 =C2=A0libconvert-asn1-perl \<br>
=C2=A0 =C2=A0 =C2=A0libgpg-error\<br>
+=C2=A0 =C2=A0 libmd\<br>
=C2=A0 =C2=A0 =C2=A0libnl \<br>
=C2=A0 =C2=A0 =C2=A0libpcre \<br>
=C2=A0 =C2=A0 =C2=A0libssh2 \<br>
diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-supp=
ort/libmd/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..0c4a5f64ec<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libmd/files/run-ptest<br>
@@ -0,0 +1,18 @@<br>
+#!/bin/sh<br>
+<br>
+cd test<br>
+status =3D 0<br>
+<br>
+for testbin in *; do<br>
+=C2=A0 =C2=A0 if [ -x &quot;$testbin&quot; ] &amp;&amp; [ ! -d &quot;$test=
bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;./$testbin&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+return $status<br>
+<br>
diff --git a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a> b/meta/re=
cipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
index dc588a0f95..ffc59deb26 100644<br>
--- a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
+++ b/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
@@ -8,9 +8,26 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.hadrons.org/soft=
ware/libmd/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.ha=
drons.org/software/libmd/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0436d4fb62a71f661d6e8=
b7812f9e1df&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1bd6aa42275313af3141c7cf2e5b964e8b1fd488=
025caf2f971f43b00776b332&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools ptest<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 sed -i &quot;/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d&quot; =
test/Makefile<br>
+=C2=A0 =C2=A0 oe_runmake check<br>
+}<br>
+<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
+=C2=A0 =C2=A0 for bin in ${B}/test/*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x &quot;$bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/libtool --mode=3Dinstall in=
stall &quot;$bin&quot; ${D}${PTEST_PATH}/test/$(basename &quot;$bin&quot;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230035" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/230035</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117485645/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/117485645/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@sm=
ile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div>

--00000000000036353b064a9b2dc0--

