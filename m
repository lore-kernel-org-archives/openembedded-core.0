Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02746C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:50 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11905.1790087687661016912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=b3tyCcS/;
 spf=pass (domain: underview.tech, ip: 74.125.225.76, mailfrom: vince@underview.tech)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so12661f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087686; cv=none;
        d=google.com; s=arc-20260327;
        b=SCQjY2N/s3t29NRcTaOxOS2sqtxzJGC1kRg/6802kxEJwuXW/BAyIe+xurQ/jVSau9
         I+HAN9O8nZ2Zs0Rbtm4hJcR1eFN0QptKcWFJmRqhFyMUz5AhdCyrZhjs5aJHBrs4suj4
         VpLoVHwr0RXft7aHdZHVVmvRCAp+/NQDTzj0cWPXExCf9ipj9M/OqWE1Hb817h3qlrlG
         1FUOm+bm/oEleBvf0W1ACMNZW91kTQh1DJKjskp1ZTpK2igN3R66W6FVC/roMoUifOgA
         2+rfHFuOPVrgEJimMlbQFUnhr90HSPOUmRQccLnQ45AdE0z759VS+QFdcwqtXRqan4HI
         n1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kU6qJ3EBOJ4qzjhUgnLnWoEnZwiI+XE49MqL0M2a3Gc=;
        fh=WT+bcx0KPadZktzTRyWFGsMkYaDtw6xmCiYlLDKLv/Q=;
        b=LDuKbu+DRpOSAvBqfeYrOd4yw751x5Yy5EWXRwsc7j+wVTmMfjqw+VLVlT+6/a2Vub
         ECZ1RMjVXJaxQPujaU8ZYLftvU3z4mZU36a+LRfpAEqMXKkAO/R5AFYbJAd9yr/btv7g
         iaYWC6/gForiZvI+0jnwEQWx6MAJphuRx/zpGG+8WNqMlsm09CzSdRUWzJI+CoR5FuQd
         m1Ic1lETqcAnRujTAhYX6TtdWJNkMFrbU/GvVkkwVpb/HoSrE7y2GLpP7NfCReQsKpvb
         DxizFoL4Aj7bZSeRE6deUNatRz01yb+EFuXvhrfY5q9/EoUfARhNR4hK+GGZZcSMObhP
         vJjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1790087686; x=1790692486; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kU6qJ3EBOJ4qzjhUgnLnWoEnZwiI+XE49MqL0M2a3Gc=;
        b=b3tyCcS/gziljG36SRTzpd+Rbv/CKi5mubD9ZzHePG3cvgDDZMBOeEvj9VEGvoYmsj
         OuWGqNrjG4gP+PeCmSnl1j/r7jNc6cbGwU0ipJLWiSbblUhkYJIDg2hnPnBcxS8GUV4G
         KbM7D6xv1XjA7Fc8/tQPN5Azr+JNJUR4pqS7XUTXEu23v+zx0v21fBr+pb7nmPxq6zPm
         PcYagqjD6W2n1zkz6EpX3rkdWzd83Mii//EgSHZ91vxUKr8u+9WNcWdgdBEiueM9xSET
         84XD80PU4tny6TPSiYDSSw28yh3lL7XYgvsjIeqi4ndcCpNI/Y6LG+xVd55BQlRqYyF3
         Ra0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087686; x=1790692486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kU6qJ3EBOJ4qzjhUgnLnWoEnZwiI+XE49MqL0M2a3Gc=;
        b=Gf8+JGeUeXT2SRNKBy3HhhrkZ/DGzX2J3+5BrvkIthvgJxmzFBjoLJWd6cTbMWRvfa
         2aY5S5H2CgWrSAdD5v4Q54l7zT681oMo6OwUR3poQvXMeckWeCVl/i7Tx16oQWCMKuM6
         aCy2WZxyMg0p0/P8uL1+IdL9pGq7VuFY3n9krukuZTwcklkU+dt797AA700YCLHsy8V3
         9MsdzxOo9UsWAVdIc/J8A/ny96E3935tig5ytOj6+PdhEQ+43moBQUc8N/jYFG2ZZB+J
         ElWtjfRyJTH3XPYhPjTlLPcPubvKAY+jF1kAZMEgLsJboJldX7lkzIKRqUjA61gS7Fzp
         ss8Q==
X-Gm-Message-State: AFuF++mvQ8bFJ+U2VZ4czm7HJorptch+K1GrSpmYRjXMTwMXQRQJLCf6
	aCAz9/syfixeDPg9/DPIgYvEBHqBZYjzVo66O2rbr1i4XMzu95DKMtyixfdJATkO09/wAe82GxS
	PMHMCWcTnl9r0r6Vs7XYVVmxIpNQRlYuQFzgNgoysDA==
X-Gm-Gg: AYBFou1vkLP3626/xKhjHfbMn5VWpHzGyip1LlKEWu/TMSXi2wEJczKHOc7zJYzWxRL
	0ZeoY5BSLKc9chOgTdjrBBq5OHzCJdIwAYw5/u31DaYA7O0+9B+2++1MclwjUogfCOpiap3al8p
	OykyBnCQYtoa6800Ip2Go+fUyU+/kodjfa3vXl/w5tC/wU+VlvgtrEXC6PBhU4RpkqWs9QhEid3
	/ctGiO0scYRNj76SFiuEzi+OWLk1QfUIHAjGSP7hIU8g/7AaL68b906FfX/bdk2/kcLSM/2G1Tb
	vtrqhd+WXlnTDlrDE5g01PELN0uDjOIZhlZYd9qg0E8lzgiG/+aoCkKfVzy9ykqvEIyOAh/AAOE
	rH5IB4OMj2RVVCBuRkggcrwQ=
X-Received: by 2002:a5d:5d02:0:b0:485:8ee5:5ffa with SMTP id
 ffacd0b85a97d-4871e36b1c7mr21775449f8f.38.1790087685632; Tue, 22 Sep 2026
 07:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260712184307.3259642-1-vince@underview.tech>
 <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <953617.1784488771319074426@lists.openembedded.org> <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org>
 <2546320.1788388183210489037@lists.openembedded.org> <44e11d55e07f423de965992fc4821ff8573e7049.camel@linuxfoundation.org>
 <2546320.1788393678217660963@lists.openembedded.org>
In-Reply-To: <2546320.1788393678217660963@lists.openembedded.org>
From: Vincent Davis <vince@underview.tech>
Date: Tue, 22 Sep 2026 10:34:33 -0400
X-Gm-Features: AclHuK8cP_r7zgq0S_zo4iaOaodLmyJOIkxF_PRGKJSigF7xY-S-mGIR-u9Ar0k
Message-ID: <CAPQx_gMkYyWq1GQ_EiMAKbQTBi=d7yEGF_J6w1+Lskhn45V3VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: Vincent Davis <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e899c065c1344c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246418

--0000000000009e899c065c1344c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

In response to

https://lists.openembedded.org/g/openembedded-core/topic/121365625?msg=3D24=
6365#msg246365

You can bypass spdx issues by

inheriting nospdx.

Put still run into same packaging issue. Even when changing PACKAGE_ARCH.

How do we think we want to proceed?

On Wed, Sep 2, 2026, 8:01=E2=80=AFPM Vincent Davis Jr via lists.openembedde=
d.org
<vince=3Dunderview.tech@lists.openembedded.org> wrote:

> Yes,
>
> Setting PACKAGE_ARCH and updating PACKAGE_ARCHS.
>
> Will run into
>
> do_create_spdx: Could not find a static SPDX document named *static*
> -liveusb-console-linux
>
> Which could probably be fix fairly easily. Will post when I'm further.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244993):
> https://lists.openembedded.org/g/openembedded-core/message/244993
> Mute This Topic: https://lists.openembedded.org/mt/120238087/7072109
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [vince@underview.tech]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e899c065c1344c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">In re=
sponse to</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/topic/121365625?msg=3D24636=
5#msg246365">https://lists.openembedded.org/g/openembedded-core/topic/12136=
5625?msg=3D246365#msg246365</a></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">You can bypass spdx issues by</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">inheriting nospdx.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Put still run into same packaging issue. Even when changing PACK=
AGE_ARCH.</div><div dir=3D"auto"><br></div><div dir=3D"auto">How do we thin=
k we want to proceed?</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2026, 8:01=
=E2=80=AFPM Vincent Davis Jr via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;vince=3D<a href=3D"mailto:underview.tech@lis=
ts.openembedded.org">underview.tech@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div>Yes,</div>
<div>=C2=A0</div>
<div>Setting PACKAGE_ARCH and updating PACKAGE_ARCHS.</div>
<div><br>Will run into</div>
<div>=C2=A0</div>
<div>do_create_spdx: Could not find a static SPDX document named <strong>st=
atic</strong>-liveusb-console-linux<br><br>Which could probably be fix fair=
ly easily. Will post when I&#39;m further.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#244993): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244993" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/244993</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120238087/707=
2109" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120238087/7072109</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [vince@underview.tech]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e899c065c1344c4--

