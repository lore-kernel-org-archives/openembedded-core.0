Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.38752.1622424293609538702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 18:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PShyaJnq;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id u7so4399163plq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 18:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2XBIHrOo76LT5ksqrjEyaMIMsn8CoRIAGHfhVkEXzk=;
        b=PShyaJnqQSQDtLQW+EdZggBb1zXrtLEADUc4eB04CaunL5ncYeM9tPGcyIqAcGZw7g
         ndoA2ucOA2wAq5ULkl+tKGfbes3UNZU/NEqFIp549+lX9uksV4g4bTwx/CmxhRM7hbQ+
         AQP34RZOSHTkuGfkWuOB9QOw5od55mKk9dpUKme3s2c0oCjAGCp2//pHX16FKzQLirun
         D15vd2v3efm4/nBvsrAr3jnhcJ4jvvOcjZqthmQtPmEYuTSHTsVE5VMLaIlPChlX8Xf4
         nPM6M8a5RHHOJw6vDJhWPP/dQjE+gDu/aiExa27IMsU/p0ogSl1YiPRwvatGltIy5Mz9
         zuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2XBIHrOo76LT5ksqrjEyaMIMsn8CoRIAGHfhVkEXzk=;
        b=ba8RBP6cv+elFPIiu0zT0Gs9EJqZytzoGoGfMBhuI2VD6JnKvTMNH8lRPEDZYcBsmj
         hZ3mx/asHTal2SNfc5W1933HpqPW+U+r8WYNQmfEr65EKw4oVH3RoJOAA94MplToIdhC
         VAFJLP+Aj7XMHCoHkZJg4c9/0YboDJzLv1mDrE9sjbANB2/EdsRc8ksk4ubR3/2YNsye
         43nVZqqxl4udI4AhgfThvqK5wVYHIpo+1CQgu3EPX15Uj7MtpCwBa8A5ulkBTO3GXGg4
         wDYHpWrbeaDOWDrpApGp1pxgNgrNVf/pQxcLuPbb2gLVhF3uAQtE5FfbNwXCniu4AFlT
         2e0Q==
X-Gm-Message-State: AOAM532NXQtNR7t6iABRFKy8hzCfnfBn4zhjJvBp12v9LDld4JrVyz4J
	Wsb5B9nd7kDfGIUOkx2ZDy6OkMssNiIIBZ0TB7dnOpAy9YSL5w==
X-Google-Smtp-Source: ABdhPJwKixNsX1d/dMTj2/weoQ//2zCnS+6ySV5l1W2IXZOsZSC5v5hUxDPN392Bwn2Op+yk6sxWhI9mhuO1LsFQsvE=
X-Received: by 2002:a17:90b:2397:: with SMTP id mr23mr16144661pjb.77.1622424292948;
 Sun, 30 May 2021 18:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519102302.2674317-1-Martin.Jansa@gmail.com>
 <AM9PR09MB4642AC4E6EAC764B936940BAA82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CA+chaQdBf=aJZddxAc43GBXNoRAYwWTzw3MtQSmKxK7=tsNnzQ@mail.gmail.com> <AM9PR09MB46421A3886751FC639F8A6F2A82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB46421A3886751FC639F8A6F2A82B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 31 May 2021 03:24:41 +0200
Message-ID: <CALbNGRTv_xN-xt134yEMPj_3R=LO-mm2x5G_43QHb1vQERVyTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstatesig.py: make it fatal error when sstate manifest isn't found
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 6:46 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
If I am not mistaken this breaks wide areas of meta-freescale +
meta-qt5-extra. I have seen the manifest warning using meta-freescale
for long time (and many licensed not found in do_rootfs) but now
builds fail.
Most recipes failing are native recipes inheriting meta-qt5's
cmake_qt5-bbcalss  - have many of them in meta-qt5-extra.
To analyse I did:

[superandy@thanks-buchmuellers oe-core]$ bitbake -e
extra-cmake-modules-native | grep ^DEPENDS
DEPENDS="qtbase qtbase-native cmake-native  qtbase-native
qtbase-native cmake-native qttools-native python3-native
python3-native  ninja-native"

As soon as I remove (target) qtbase from DEPENDS, build is fine.
Have the strong feeling that the dynamic-packagearch magic [1] is the
culprit confusing a native recipe finding target recipe's manifest if
that recipe is marked as SO-SPECIFIC  - as qtbase [2] is.

Wrote here because I hope the audience is wider - will open an issue
at meta-freescale tomorrow after zzz...

Cheers,

Andreas

[1] https://github.com/Freescale/meta-freescale/blob/master/classes/fsl-dynamic-packagearch.bbclass
[2] https://github.com/Freescale/meta-freescale/blob/733e1683ce8895a960c01a3ee1fce40118d82982/conf/machine/include/imx-base.inc#L246
