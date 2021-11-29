Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976BFC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 23:51:47 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web08.69371.1638229906748419848
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D0zX7BDN;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id i6so37635039uae.6
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2KQ/8ltT+LHoHEf4z/Jt0vvxkby+gYm253hJcY0jjaM=;
        b=D0zX7BDNX9vZpOJOlW/NaNLNYkNcNRaJafkF1lBVCG8xQr6xVk49JKPO467mI8cCXH
         FDscRXdai41ZOG1ONLMPQF+/mgP2nwdggfjSHdsl455kWVVL1lzwvWTLe3OOAJo+YS4f
         4s4g43IRo5QPF9XxGQezkU06NDd2gt2VoArsEtUxXiIRtNBm/kosf2Sq3AKuWOIwQ5aZ
         qmMje3Cn68I6WkhBIxQq0ozMScnGqbFYJOOFCTu2M8UZoQQ9Aqft5ErRVrLhPcKwS3Iz
         NvhV/yV68suVUq5XAFOcu2aJrUV0ltdFI0m/QoFUDB1+sQmHGvq7u7BSCBGBa5MevEq9
         YUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2KQ/8ltT+LHoHEf4z/Jt0vvxkby+gYm253hJcY0jjaM=;
        b=e9BvryWb+B8o+cMAtSZc9NRhpce1ARFtMs6/hug39KfykHMD8p13eNrA+oqIJ780DH
         bsrSrLUOTaGuW6Pd3AFVtRwWBjOqDWiQiCn8MOVAhGJ5HdgvkxYjo8Ws+nZwXyopNlec
         R+2iE8Z01sF6VL82/GV0g41RFbUQQ4v0tR8EAkq0JZnMeCyZf8HbxC62k7ArQ2RQXjjf
         khMEQWY9nMKttDU9uuazeoSzmJoec+08dcIb5dqwDniyylbbkzAiVNU5BWlX/yTwSC5p
         YC2dAMkobpZTmuDfM2STvceo/l/gOKOxRT1HcnxVNa7QVsPSlmyIsawQYunw9GicJ9w8
         5UYQ==
X-Gm-Message-State: AOAM530GDf3j22N3WB9AAdy35ZIYgAwdgrRDjcmrifS1Q4bt0bycWbU9
	fMNb1TgCT1S6M9wZL9FBKK7duU+uedGsB4vr7e8=
X-Google-Smtp-Source: 
 ABdhPJyqCgkpREBqwCKn6hpvw4s1QwxujaRsmmz+2kCAWWMHy6RZyczjkZLSx+ix1x9bZlZv3FiS7tzUdgjzxhT3OlY=
X-Received: by 2002:ab0:77c3:: with SMTP id y3mr54667907uar.67.1638229905755;
 Mon, 29 Nov 2021 15:51:45 -0800 (PST)
MIME-Version: 1.0
From: Joel Winarske <joel.winarske@gmail.com>
Date: Mon, 29 Nov 2021 15:51:35 -0800
Message-ID: 
 <CABKMkPJ-kkhBuRMLGzV6ks9msbaR7+9KGr2H6VNVL0wb41+sjA@mail.gmail.com>
Subject: vulkan-loader
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097d2e105d1f61f99"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 23:51:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158962

--00000000000097d2e105d1f61f99
Content-Type: text/plain; charset="UTF-8"

I discovered an upstream problem with vulkan-loader today.

Effectively since 1.2.162 vulkan.pc is broken for cross compilation
scenarios.

This example illustrates current problem with vulkan.pc installed by
vulkan-loader:

$ pkg-config --print-errors --define-variable=prefix=/opt
--variable=includedir vulkan
/usr/include

It should return /opt/usr/include
So doing this in a meson project does not produce the expected result:

vulkan_hpp = join_paths([
    vulkan_dep.get_pkgconfig_variable('includedir', define_variable:
['prefix', get_option('prefix')])
    'vulkan',
    'vulkan.hpp'
    ])


What is the suggested approach to address this?  A patch for each branch up
to master?

Joel

--00000000000097d2e105d1f61f99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I discovered an upstream problem with vulkan-loader t=
oday.</div><div><br></div><div>Effectively since 1.2.162 vulkan.pc is broke=
n for cross compilation scenarios.</div><div><br></div><div>This example il=
lustrates current problem with vulkan.pc installed by vulkan-loader:<br></d=
iv><div><div class=3D"gmail-snippet-clipboard-content gmail-position-relati=
ve gmail-overflow-auto"><pre><code>$ pkg-config --print-errors --define-var=
iable=3Dprefix=3D/opt --variable=3Dincludedir vulkan
/usr/include
</code></pre></div>
<p>It should return /opt/usr/include</p></div><div>So doing this in a meson=
 project does not produce the expected result:</div><div><pre><code>vulkan_=
hpp =3D join_paths([
    vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;, define_variable=
: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)])
    &#39;vulkan&#39;,
    &#39;vulkan.hpp&#39;
    ])<br></code></pre></div><div><br></div><div>What is the suggested appr=
oach to address this?=C2=A0 A patch for each branch up to master?</div><div=
><br></div><div>Joel</div><br></div>

--00000000000097d2e105d1f61f99--

