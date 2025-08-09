Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D19C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 15:34:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8415.1754753651364703154
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 08:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EHazojat;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so15105955e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754753650; x=1755358450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm7aLcEqwe8YM6nBm44TzJOy4Up8XiwxJuKdnl/c00M=;
        b=EHazojatw9Wtt2ZwalI9jNGV+qtLijGQQLVDoyRAd7foisV9LueGhw7bv4VTM8NjvV
         9bg4drC5WA7wWoG8c+7q8qMqb1o9F0ANDKcYolOvmtFUj+ob/uugXMAniTrQmiw6OW2Q
         qTk5r8K/kxAAe7s6gmRyJqDzXCuuiuOjhQ7P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754753650; x=1755358450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lm7aLcEqwe8YM6nBm44TzJOy4Up8XiwxJuKdnl/c00M=;
        b=O2Z5wtMcryJve8SvESePFmDznC3HL0AP/AVmSpmQIas/cCasxsePaaIpHvWEDSKCD2
         TCBKhPOKNYy9DdsPjhMO39jFjixZxAGkhEZnZFrt7N08At+JbLtQbYCaTOke8mkZt62R
         OD+bk3DbRrxf78wvPQTizdq9mgiVGLbucYFvyjRVRumMnnFMsu6TNIfhs8H8mM60AE+j
         YKwJ1usJNL+LTgKN9ADiqclsaJpHZ42B+cLNBt3d6Bj9qcogkZvAQgsjo8a7otEWH5Rz
         7yW7kLqWFZ7mMIL8Rw2GYf3IKOT/QlAEFhcgxwpLpjs3fj8TxmedO5hXCIkEMzIhGL5b
         ySDA==
X-Gm-Message-State: AOJu0YxluLJa1h8bEGnPmTULr8p2pqckBPl4u+fxKpDURL0XbiYBqh/u
	nJlWRFw6SO9RskU/dUBwBTbB5uqlu5zI2L9YLNzSMBcMaqB4AzDBcIgaqzeMRGrXRXB7Rv8mzMW
	junhPc/76vweSEzMiMk3qZN9vmtyR81/i/ZVBROdKDQ==
X-Gm-Gg: ASbGncvoy4y5xjZXJo5uJZFaFIFSbznCGx1YOIXW9dSmskgj6EjEtp/O/TzklzmzyEJ
	XSg2fNwL+R9s5IQHKDhw2TnH7GkOUl13KTrLsOVyqmKXgTpWM81prPkJbOMekI6CMm9haRA9cbb
	o/cLZ3clY2ujGKOW1gkNDGxxTSqYlXqxgd/Po/RLTrN8QwAi2c+BXFHEsfDkzklfTlZCuzrHjDn
	pPRWsNkruSIKL9jG/kNg4DmOBKU8IO2qJCg/kY=
X-Google-Smtp-Source: AGHT+IFWywr0u3dI3akIOkaeP7Qnog7rC41YgbcQKY+XfN2nhzny66+syECGrgLxl+0XRJl8x+JlYe8RfjRb5yK8/1w=
X-Received: by 2002:a05:600c:b86:b0:458:ba04:fe6d with SMTP id
 5b1f17b1804b1-459f4f52553mr62209785e9.14.1754753649616; Sat, 09 Aug 2025
 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250809071200.4017253-1-skandigraun@gmail.com>
 <CAMSfU+7fZMF6E4sJyjPwT8x=T3fB1_JK-k8Y-irAq13Y04xQoA@mail.gmail.com> <94194d86-7dda-4080-b484-cf30da04ad65@gmail.com>
In-Reply-To: <94194d86-7dda-4080-b484-cf30da04ad65@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 9 Aug 2025 17:33:43 +0200
X-Gm-Features: Ac12FXwrRtg_aoZF9HENkMuh_fMXKsOEaMaiXdPBcy9Cw2hdvY7XDdJqFecjghk
Message-ID: <CAMSfU+5wfM9ZY2O_yraQnORg=S-edhw+Xd1FBoWbG5u5i_BcCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rpm-sequoia: upgrade 1.7.0 -> 1.9.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f440d3063bf06b90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 15:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221683

--000000000000f440d3063bf06b90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 9 ao=C3=BBt 2025, Gyorgy Sarvari <skandigraun@gmail.com> a =C3=A9=
crit :
>
>
> On 8/9/25 16:10, Yoann Congal wrote:
>> Hi,
>>
> <snip>
>>
>>      require ${BPN}-crates.inc
>>
>>     @@ -64,6 +63,11 @@ do_install:append () {
>>      do_install_ptest:append () {
>>             install -d ${D}${PTEST_PATH}/src
>>             install -m 644 ${S}/src/symbols.txt
>>     ${D}${PTEST_PATH}/src/symbols.txt
>>     +
>>     +       echo "#!/bin/sh" > ${D}${PTEST_PATH}/run-ptest
>>     +       echo "rc=3D0" >> ${D}${PTEST_PATH}/run-ptest
>>     +       echo "export TEST_DONT_BUILD_LIB=3D1" >>
>>     ${D}${PTEST_PATH}/run-ptest
>>     +       chmod 755 ${D}${PTEST_PATH}/run-ptest
>>
>>
>> Wouldn't that make run-ptest basically a no-op?
>>
>
> Thanks for reviewing.
> It looks like a no-op, but it isn't. cargo-ptest checks if run-ptest
> script exist[1], and if it does, it appends its own content to it, so
> both are kept.
> What came to my mind after sending it is to add this script simply as a
> file to SRC_URI instead of echoing it, but didn't want a v3 without
> someone asking for it.
>
> [1]:
>
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest-cargo.bbcl=
ass#n102

D'oh! You're right!
Since that is easy to miss, maybe add a comment stating that cargo-ptest
will fill the rest of the script?
Also, I'm in favour of the run-ptest in SRC_URI instead of echoing it in
do_install.

Thanks!



>
>
>> Maybe you can, either:
>> * rename the run-ptest generated by cargo-ptest and exec'ing it from
>> your script to keep the envvar
>> * overwrite the run-ptest generated by cargo-ptest (but keep its
>> current content: e.g calling the test binaries in sequence, printing
>> "PASS:" ...)
>>
>> Best regards,
>>
>>
>>      }
>>
>>      # Tests need objdump
>>
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>     Links: You receive all messages sent to this group.
>>     View/Reply Online (#221671):
>>     https://lists.openembedded.org/g/openembedded-core/message/221671
>>     Mute This Topic: https://lists.openembedded.org/mt/114612984/4316185
>>     Group Owner: openembedded-core+owner@lists.openembedded.org
>>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>>     Unsubscribe:
>>     https://lists.openembedded.org/g/openembedded-core/unsub
>>     [yoann.congal@smile.fr]
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>
>

--000000000000f440d3063bf06b90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Le samedi 9 ao=C3=BBt 2025, Gyorgy Sarvari &lt;<a =
href=3D"mailto:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.c=
om</a>&gt; a =C3=A9crit=C2=A0:<br>&gt;<br>&gt;<br>&gt; On 8/9/25 16:10, Yoa=
nn Congal wrote:<br>&gt;&gt; Hi,<br>&gt;&gt;<br>&gt; &lt;snip&gt;<br>&gt;&g=
t;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0require ${BPN}-crates.inc<br>&gt;&g=
t;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -64,6 +63,11 @@ do_install:append () {=
<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0do_install_ptest:append () {<br>&gt;&=
gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_P=
ATH}/src<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 install=
 -m 644 ${S}/src/symbols.txt<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0${D}${PTEST_PAT=
H}/src/symbols.txt<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0+<br>&gt;&gt;=C2=A0 =C2=
=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;#!/bin/sh&quot; &gt; ${D}$=
{PTEST_PATH}/run-ptest<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;rc=3D0&quot; &gt;&gt; ${D}${PTEST_PATH}/run-ptest<br>&gt;=
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;export TEST_=
DONT_BUILD_LIB=3D1&quot; &gt;&gt;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0${D}${PTES=
T_PATH}/run-ptest=C2=A0 =C2=A0 =C2=A0<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0chmod 755 ${D}${PTEST_PATH}/run-ptest<br>&gt;&gt;<b=
r>&gt;&gt;<br>&gt;&gt; Wouldn&#39;t=C2=A0that make run-ptest basically a no=
-op?<br>&gt;&gt;<br>&gt;<br>&gt; Thanks for reviewing.<br>&gt; It looks lik=
e a no-op, but it isn&#39;t. cargo-ptest checks if run-ptest<br>&gt; script=
 exist[1], and if it does, it appends its own content to it, so<br>&gt; bot=
h are kept.<br>&gt; What came to my mind after sending it is to add this sc=
ript simply as a<br>&gt; file to SRC_URI instead of echoing it, but didn&#3=
9;t want a v3 without<br>&gt; someone asking for it.<br>&gt;<br>&gt; [1]:<b=
r>&gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-recip=
e/ptest-cargo.bbclass#n102" target=3D"_blank">https://git.yoctoproject.org/=
poky/tree/meta/classes-recipe/ptest-cargo.bbclass#n102</a><br><br>D&#39;oh!=
 You&#39;re right!<br><div>Since that is easy to miss, maybe add a comment =
stating that cargo-ptest will fill the rest of the script?</div><div>Also, =
I&#39;m in favour of the run-ptest in SRC_URI instead of echoing it in do_i=
nstall.</div><div><br></div><div>Thanks!</div><div><br></div></div><br><br>=
&gt;<br>&gt;<br>&gt;&gt; Maybe you can, either:<br>&gt;&gt; * rename the ru=
n-ptest generated by cargo-ptest and exec&#39;ing it from<br>&gt;&gt; your =
script to keep the envvar<br>&gt;&gt; * overwrite the run-ptest generated b=
y cargo-ptest (but keep its<br>&gt;&gt; current content: e.g calling the te=
st binaries in sequence, printing<br>&gt;&gt; &quot;PASS:&quot; ...)<br>&gt=
;&gt;<br>&gt;&gt; Best regards,<br>&gt;&gt; =C2=A0<br>&gt;&gt;<br>&gt;&gt;=
=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>&gt;&gt;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0=C2=
=A0# Tests need objdump<br>&gt;&gt;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0Links:=
 You receive all messages sent to this group.<br>&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0View/Reply Online (#221671):<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/221671" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-core/message/221671<=
/a><br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://list=
s.openembedded.org/mt/114612984/4316185" target=3D"_blank">https://lists.op=
enembedded.org/mt/114612984/4316185</a><br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0Grou=
p Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.org=
" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><br>&=
gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%2=
52Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowne=
r@lists.openembedded.org</a>&gt;<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe=
:<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/unsub</a><br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"m=
ailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<b=
r>&gt;&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; --<br>&gt;&gt; Yoann Conga=
l<br>&gt;&gt; Smile ECS<br>&gt;<br>&gt;

--000000000000f440d3063bf06b90--

