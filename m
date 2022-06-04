Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA53C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 11:07:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8908.1654340866213230156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 04:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N8vqMxMR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o9so5235961wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=o/DBgwSGM1R8GaHkiferYqdw4692kI1aHxMUyd01Ja4=;
        b=N8vqMxMRLVk7zLvK+YODYcbh1/2GinRFxmi1C7Q5xW/MoVoR3HfwHtpxYcbWRO1gQ5
         pPrpcXBnfOXHW2PHDlrFqIzxJZ0a2acWaH9EBXkAjwKvVizVKmZPR6mFba3QrHYKgd+R
         pTvza8SK6h8ghhfPb27W7UY/b0ST87emgOY90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=o/DBgwSGM1R8GaHkiferYqdw4692kI1aHxMUyd01Ja4=;
        b=lTON45xkqZBO59bVxzXuCsfLOzITh4e9ox60UwL09KXoJLJPb3qMx52npy74gVf72Z
         7ZNKf8Mluw55w/HyBuvLhaOdygSrcSOQs8sxropmdVSXA231JoRo7bMREV8uzTZCJjLC
         q2a9zb3R0CbBVb74D2ORdnj87fN940ESzoN/LEW6OZridpcuwbYTukR3BsmHmPKOanRO
         szJzmu+wOdfVc5BO7/fwXWXacjl5Q4Y2p4P3b4sYefyyrhyUUPz0NcXCPu/q/wQC4a9S
         ag95bc11XL4lzK5OL+IHwTjFhj6VgFTjSUFKzgYfHUYAOwNVkXCm+AqAWuZx/2DFacyX
         08VQ==
X-Gm-Message-State: AOAM532vw6O5+TcvczepLyZk1wcAV3pXZ+wpL/Av4skd5/sXMc1JLXEf
	ilpXL7feoZrm0fttLggUZyDj92YTrzrsLPTs
X-Google-Smtp-Source: 
 ABdhPJxc5xWq3xmHjgSiLqiCQACzysb8Qdpq5u3QxwgG7TkAE20GUpEZN7vhrNNRjdZ5psjxmijmaw==
X-Received: by 2002:a05:600c:3511:b0:397:ed1d:6c0a with SMTP id
 h17-20020a05600c351100b00397ed1d6c0amr13341935wmq.191.1654340864446;
        Sat, 04 Jun 2022 04:07:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118?
 ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b0039749bab534sm16312713wmf.1.2022.06.04.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 04:07:44 -0700 (PDT)
Message-ID: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
Subject: perl makefile race - any make experts who can help?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, swat
	 <swat@lists.yoctoproject.org>
Date: Sat, 04 Jun 2022 12:07:43 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 11:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166564

Hi,

Occasionally we see perl do_install failures on the autobuilder. It
looks like some kind of make race. With the last failure I saved off
the build directory and have spent a lot of time staring at it but I
don't understand how what the logs say happened actually happened.

The build failure is here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5315/step=
s/11/logs/stdio

and you can see it failed in do_install. The first error is;

| Couldn't copy cpan/podlators/blib/script/pod2text to /home/pokybuild/yoct=
o-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/perl/5.34.1=
-r0/image/usr/bin/pod2text: No such file or directory
| Couldn't chmod 755 /home/pokybuild/yocto-worker/genericx86-64/build/build=
/tmp/work/core2-64-poky-linux/perl/5.34.1-r0/image/usr/bin/pod2text: No suc=
h file or directory

then

installman: Can't open cpan/podlators/blib/script/pod2text: No such file or=
 directory
| ABORTED

Looking at the build directory, cpan/podlators/blib/script/pod2text
isn't there, cpan/podlators/script/pod2text is. I went digging in the
compile log which didn't fail but is interesting in what it doesn't say
nd the ordering. The full log:

https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/log.do_compil=
e.25823

or my edited down version:

https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/compile-cutdo=
wn.log

and note it never actually builds cpan/podlators/blib/script/pod2text.

If I go into the failed build dir, it does build it:

https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/manual-compil=
e.log

I tried a few variations of deleting and rebuilding files there just to sho=
w behaviour.

The makefiles from the podlators directory:

https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/Makefile
https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/Makefile.PL


What really puzzles me is the "Manifying 2 pod documents" message
*before* it then generates scripts/pod2text from scripts/pod2text.PL in
the do_compile log.=C2=A0It appears to run the scripts/pod2text late and=
=20
never runs the $(INST_SCRIPT)/pod2text at all (hence no cp message and
the missing file).

The Makefile has default targets of pure_all and manifypods, that
message comes from manifypods but manifypods depends on pure_all.

pure_all is a double colon rule and I'm on less certain ground with how
those behave.

Are there any make experts out there who can spot the race in this
makefile?

Cheers,

Richard


