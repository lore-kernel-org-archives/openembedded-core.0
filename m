Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F56E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 11:35:24 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11886.1771500923308122941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 03:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIhLOsRb;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50335b926c2so7023531cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 03:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771500922; cv=none;
        d=google.com; s=arc-20240605;
        b=TqEl9Ja2F1BKs3GzLbeuOE5yUb9/ClJGifbCpJxaONmM0Y2WXpjD6t1YiVFUn+3vfd
         hJzlICYvNkzuDh0+pua+NyE7LbKypyhwyBywA6EdO5ZtWAvJdt3rAN2bNtMr25LaPcx2
         OQUXoAcCBZXUo8eoHuQsbKHHdOgsA07gLy6c5I0gJwvPXcKkAyi4f/kKh6JrTsKjPSRy
         EdaM0Zpmt+gpe8yx4ycMEt0jyFQxOtKCq8gHwJlhEJa8ZN+JLXfbVhP9ET8WOIkMYFX6
         q1W4IDdebUCa83gVMc+nwXGx61W4HkgrlSzveBgreNK/HqHSoDy/5e6EQW3XDSwF7y5M
         SdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qXpWYz+YXjT1jWWIjhhDVgBKEjoYvv4CpVWKhB6j0ZU=;
        fh=S/S4+dG0nEUKrGhkPn81IC3f2ryU0i6TWoqnv7JNxAI=;
        b=D7wb0JSosWHgFecPzyQk3Kmj86q1n8KK6GdRGiyfMrTwI2cfuTfb8WTP9gImqvJmEP
         a9siwdtaUZjCvgzdMsoiIAQC3lJRUoNln+qwiA5Z+Lop+3ptCgdf1eIIFzWRaxr8J0OG
         B35bP6KPwfGxyJWIE4KhaVrYr51CygziYLM6phj/PYCcdRatbMrTYUsX79Jc4WA/xEGE
         P1DhzftHd74yPvw3T+1RZJ0PPWO3NDE+JpEssIzC1veyT4N96QPuVm25+nM+AgZOKOLq
         QRFSC4keCP1njkMidV69uSMHSJrL1FANBLleEZloGh1t7a2A9/aHA2hNbBqkHJiH5egP
         LmXQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771500922; x=1772105722; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXpWYz+YXjT1jWWIjhhDVgBKEjoYvv4CpVWKhB6j0ZU=;
        b=bIhLOsRbAJxvOCP5ArYUP7/Ti22Mhjx+r3TfFnZbs/AsYuhRVRWqMJAA0xJJ7nOr/I
         lTVc+sJvnTFA0qY3xJ+OwfTYiUgm13P3Zpl+XvSKgu6TI40IQ7x1TMEtjadBmbp/s4Ui
         0Z2mmvP4KOAVc0MAes2jx66WPopc2Fhzoci49iJ4RckU887SNR+QWF7Z5NISo9FkhzFm
         h1NO9Iu1J6dMZGrDXtS5g1P/aPSwnEiSQj0+Fxbl3sieJ8PbmMXWGKv6ZVdW/wG2B57v
         cphobp8CRaDEeqwz3Gjpk1QrFeQViNz7/wtz9U/KvQa7q7is0UqHP6/tcXMIYLee1cJE
         dfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500922; x=1772105722;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXpWYz+YXjT1jWWIjhhDVgBKEjoYvv4CpVWKhB6j0ZU=;
        b=ee7Zvg+eT+eskJ0jhQYdUcmzMw0uAUoklYvZTgsGCjKF3X8Q4zJ2i4+qINE4QrtihP
         HggtLk8pCCHwwvpSYhWQjJ+wFc87yQZCBCUa2I/nNcRRkILgrkHIPoyrUU+rylBcEHIF
         IzqONdM4ZvEWvdQehajofQDT70jpbT3MrexKrjMnZ4k0/Z0CF7Ol/o74M5nLGvEi+ppp
         4hRKXXUzc4SGd+OI00sEo9DXqZjhZ5h8dlnQTCyj+b4jHcvum5igDnS8IcLXH/06P55X
         yYm8nY97ZPGUPqddb5ZddihSZiFwWAF2s4OpUtekU94fjbqmk4OBMPdBI8kDy0lkzvk1
         0fOg==
X-Forwarded-Encrypted: i=1; AJvYcCV61Dv4dLprwo6RyDHeugldXwz0Hwfbfek+ndFBo6+lTGxYNhAqprDXh8kx0SBkO+mK6tYYxFWic5213Ys4YpomVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzULyVAF2MSt87WRpxY6mQDmv6mdb0yZ/AEvQo9ynmejjjcBSC9
	iZiU74GWAiiLXfW6XpYdZcYW0JYHJ0ZAynx9JXOjXyjI7aL1OQFDSTrCMvk+3RyWDzWOuzTu5AS
	VB7uUqe+x0KDs3+cVFJxAn2ZKaZMZqtU=
X-Gm-Gg: AZuq6aLPx+COwUsGV0KCqXzu7eoIo68WmR3Qj1Hm7Ev+qXKdWPCrwUWxpfjelaj6IP/
	EHwV28B0oKx4GOLkeIfFjWM+oYCHRYsT7emh+IpESGv2llNqZxDWedIY6PCCoLjLehX8QPeQQ99
	vpl53Q7r4n/ig24CxMu6Asicyk1AWjiUVYkIGvT7xEX5WkjDCaGFp+nFNgraKwIYBpSEHFNI2HY
	wE1i4tEs0r/HU794poIsCs3drlfKJW8PipdtrQkfLPyaUt7wBxsdrJ1J+BXW1nXuv7M9Gs4Tj+I
	gCw2JY5QcQp5eR7QOjY=
X-Received: by 2002:a05:622a:1484:b0:4ee:7ee:df70 with SMTP id
 d75a77b69052e-506e92b122dmr57565501cf.80.1771500922210; Thu, 19 Feb 2026
 03:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20260127091608.598339-1-namanj1@kpit.com> <CAMSfU+5X8yphvKpggDiwAva9GNrkgPv23udRXqUhrSrJB6Yi9w@mail.gmail.com>
 <CALCkg5bw6BqhBjf+rkE+RraYvM+KkEis6qFovi+-6YaxLs3Pog@mail.gmail.com>
In-Reply-To: <CALCkg5bw6BqhBjf+rkE+RraYvM+KkEis6qFovi+-6YaxLs3Pog@mail.gmail.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Thu, 19 Feb 2026 17:05:10 +0530
X-Gm-Features: AaiRm53SA0G_tvlLDQJmg6d_YUkp_ubNd8LaRwP7OcVJ1vhU8dkClnrwGWcBgqA
Message-ID: <CALCkg5Z2cykCt9f0P6vgc3ZTsg0nbV+bFWgzazMonosG0SiSgg@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] libmd: add ptest for 'libmd'
To: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000301142064b2bb37a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231422

--000000000000301142064b2bb37a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
The patch is merged in master
https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bdab30=
e3b349fef8df6ca0ef4893b89
Can you please check

Thanks
Naman jain

On Thu, 12 Feb, 2026, 12:39=E2=80=AFpm Naman Jain, <nmjain23@gmail.com> wro=
te:

> Hi
> The patch is merged in master
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bdab=
30e3b349fef8df6ca0ef4893b89
> Can you please check
>
> On Tue, 27 Jan, 2026, 2:59=E2=80=AFpm Yoann Congal, <yoann.congal@smile.f=
r> wrote:
>
>>
>>
>> Le mar. 27 janv. 2026 =C3=A0 10:16, Naman Jain via lists.openembedded.or=
g
>> <nmjain23=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>
>>> Adapt the compile 'test' phony target from Makefile and deploy as
>>> ptest for libmd.
>>> It takes less than 30seconds for ptest completion
>>>
>>> Signed-off-by: Naman Jain <namanj1@kpit.com>
>>>
>>
>> Hello,
>>
>> This patch was also sent to master :
>> https://lists.openembedded.org/g/openembedded-core/message/229867
>> ... but not merged yet.
>>
>> Can you please wait for it to be merged on master before resending the
>> backport request?
>>
>> Thanks!
>>
>>
>> ---
>>>  .../distro/include/ptest-packagelists.inc     |  1 +
>>>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>>>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
>>>  3 files changed, 38 insertions(+), 2 deletions(-)
>>>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>>>
>>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>>> b/meta/conf/distro/include/ptest-packagelists.inc
>>> index 9950e46776..784176f579 100644
>>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>>> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>>>      json-glib \
>>>      libconvert-asn1-perl \
>>>      libgpg-error\
>>> +    libmd\
>>>      libnl \
>>>      libpcre \
>>>      libssh2 \
>>> diff --git a/meta/recipes-support/libmd/files/run-ptest
>>> b/meta/recipes-support/libmd/files/run-ptest
>>> new file mode 100644
>>> index 0000000000..0c4a5f64ec
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libmd/files/run-ptest
>>> @@ -0,0 +1,18 @@
>>> +#!/bin/sh
>>> +
>>> +cd test
>>> +status =3D 0
>>> +
>>> +for testbin in *; do
>>> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
>>> +        if "./$testbin"; then
>>> +            echo "PASS: $testbin"
>>> +        else
>>> +            echo "FAIL: $testbin"
>>> +            status=3D1
>>> +        fi
>>> +    fi
>>> +done
>>> +
>>> +return $status
>>> +
>>> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb
>>> b/meta/recipes-support/libmd/libmd_1.1.0.bb
>>> index dc588a0f95..ffc59deb26 100644
>>> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
>>> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
>>> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/"
>>>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812f=
9e1df"
>>>
>>> -SRC_URI =3D "
>>> https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
>>> +SRC_URI =3D "
>>> https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
>>> +          file://run-ptest \
>>> +"
>>>  SRC_URI[sha256sum] =3D
>>> "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>>>
>>> -inherit autotools
>>> +inherit autotools ptest
>>> +
>>> +do_compile_ptest() {
>>> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
>>> +    oe_runmake check
>>> +}
>>> +
>>> +
>>> +do_install_ptest() {
>>> +    install -d ${D}${PTEST_PATH}/test
>>> +    for bin in ${B}/test/*; do
>>> +        if [ -x "$bin" ]; then
>>> +            ${B}/libtool --mode=3Dinstall install "$bin"
>>> ${D}${PTEST_PATH}/test/$(basename "$bin")
>>> +        fi
>>> +    done
>>> +}
>>>
>>>  BBCLASSEXTEND =3D "native nativesdk"
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#230035):
>>> https://lists.openembedded.org/g/openembedded-core/message/230035
>>> Mute This Topic: https://lists.openembedded.org/mt/117485645/4316185
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> yoann.congal@smile.fr]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>

--000000000000301142064b2bb37a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">Hi</div><di=
v dir=3D"auto">The patch is merged in master</div><div dir=3D"auto"><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D4c0a41389bd=
ab30e3b349fef8df6ca0ef4893b89">https://git.openembedded.org/openembedded-co=
re/commit/?id=3D4c0a41389bdab30e3b349fef8df6ca0ef4893b89</a></div><div dir=
=3D"auto">Can you please check</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks</div><div dir=3D"auto">Naman jain</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, 12 Feb, 2026, 12:39=E2=80=AFpm Naman Jain, &lt;<a href=3D"mailto:=
nmjain23@gmail.com">nmjain23@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"auto">Hi<div dir=3D"auto">The patch is merge=
d in master</div><div dir=3D"auto"><a href=3D"https://git.openembedded.org/=
openembedded-core/commit/?id=3D4c0a41389bdab30e3b349fef8df6ca0ef4893b89" ta=
rget=3D"_blank" rel=3D"noreferrer">https://git.openembedded.org/openembedde=
d-core/commit/?id=3D4c0a41389bdab30e3b349fef8df6ca0ef4893b89</a></div><div =
dir=3D"auto">Can you please check</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 27 Jan, 2026, 2:59=E2=80=AFp=
m Yoann Congal, &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bla=
nk" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar.=
 27 janv. 2026 =C3=A0=C2=A010:16, Naman Jain via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;nmjain23=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" rel=3D"noreferrer noreferrer" target=3D"_blank">gmail.com@lists.ope=
nembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Adapt the compile &#39;test&#39; phony target fro=
m Makefile and deploy as<br>
ptest for libmd.<br>
It takes less than 30seconds for ptest completion<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" rel=3D"no=
referrer noreferrer" target=3D"_blank">namanj1@kpit.com</a>&gt;<br></blockq=
uote><div><br></div><div>Hello,</div><div><br></div><div>This patch was als=
o sent to master :=C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/229867" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-core/message/229867</a></div>=
<div>... but not merged yet.</div><div><br></div><div>Can you please wait f=
or it to be merged on master before resending the backport request?</div><d=
iv><br></div><div>Thanks!</div><div><br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-support/libmd/files/run-ptest=C2=A0 =C2=A0 | 18 ++++++++=
++++++++<br>
=C2=A0meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0| 21 +++++++++++++++++--<br>
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
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a=
> b/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"nor=
eferrer noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
index dc588a0f95..ffc59deb26 100644<br>
--- a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
+++ b/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
@@ -8,9 +8,26 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.hadrons.org/soft=
ware/libmd/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://www.hadrons.org/software/libmd/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0436d4fb62a71f661d6e8=
b7812f9e1df&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a>&quo=
t;<br>
+SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a> \<b=
r>
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
enembedded-core/message/230035" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
230035</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117485645/431=
6185" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/117485645/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoan=
n.congal@smile.fr" rel=3D"noreferrer noreferrer" target=3D"_blank">yoann.co=
ngal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div>
</blockquote></div>

--000000000000301142064b2bb37a--

