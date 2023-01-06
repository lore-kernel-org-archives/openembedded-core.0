Return-Path: <pzalewski@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86672C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 13:11:10 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.12866.1673010661812784484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 05:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20210112.gappssmtp.com header.s=20210112 header.b=ceeNQoF+;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.166.181, mailfrom: pzalewski@thegoodpenguin.co.uk)
Received: by mail-il1-f181.google.com with SMTP id a9so347266ilp.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 05:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1Ydgquvzq5Q9nkUGYiFGgklIgHOTgp4Ow3rCQN5KK8=;
        b=ceeNQoF+wQ8khXcNiXrXhNs7ZUekHHkqReOc2xg727k1YX08sIVj7ka0m40kb2isSB
         3jeMU0MYFl8kObgUXgAeR+mr2qGDMj50AmsMIZE9op7sSeRa/gx2XZcQpxqREbnb2Za6
         cnpZWwswi7Gt8agRwhdAubCUspa1pJrrDAm87LFT55mOVOUYLxTLFRjBG54chAYRvh6J
         L61FIlWOFkL/HgaZM+6rw4Ux6VerVQS8KLXxAq1DwmPh3sR3PRC3zJnAbG2dLuDBCjsp
         xVunRsS60NYc7+I6664qn93pdHM/pyRQs51r+n5+QrIa+MEUZPA+EG+IFo2fzhWeUY/W
         rf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1Ydgquvzq5Q9nkUGYiFGgklIgHOTgp4Ow3rCQN5KK8=;
        b=ndvfzhGKpQHFVvhGxM53oR5LTLMYpQ5t39/vEoOuhWkKDHANw1sypRdA7U3MoJwXdH
         MEGjmgQCfb+tkXVQWWTPU4kcnr2kNh/iXbVGYBuDES5pezjlTb7uwqDmsKaxqfiODIXn
         ifrcdc38iEPFnUzdiUOvX/K5xCz16RCWGtP62bOAJF5Z55v7PQz21u+53wpUB0Y6UK/P
         PUuvIxv3uWeOQp7tRarjTjOOc6eIrYAZTdwvI3Br9/UsF5myvKjQtiM5hSs2jFa+D48a
         fyKc7bF6mL1Idxzj+mLOFE6RFwSDr0KeGMce8nZ+Wwf+h9XEkSUis0hwcO5ZANSU26OJ
         Peqw==
X-Gm-Message-State: AFqh2krcE31zryxCq+jJDXfagEej3GWwbyI0a3vHYiF0rEEc0Oq8ENWx
	vqCZ8M2MZNCduNIdQTwGpzUZzCd+KE7YSwL/PV2hyg==
X-Google-Smtp-Source: AMrXdXt6KccdHGK0+gjF98jqbVFezml3d3iSv6VAPVejduHwPRV3+aPg/wEOeQRnqMKuPO4Gue946gKNJXM/pCxucFg=
X-Received: by 2002:a92:4442:0:b0:303:510c:4ba3 with SMTP id
 a2-20020a924442000000b00303510c4ba3mr5964050ilm.172.1673010661086; Fri, 06
 Jan 2023 05:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
 <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
 <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com> <CANNYZj9H__DUKty+N3R=didcPYk9FT7RKSYTQum0H1HPzpbfJA@mail.gmail.com>
In-Reply-To: <CANNYZj9H__DUKty+N3R=didcPYk9FT7RKSYTQum0H1HPzpbfJA@mail.gmail.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 6 Jan 2023 13:10:50 +0000
Message-ID: <CAA6zWZ+Vh_qjeTaJw+c0EzOgmKdsYac2q85ihn0v5A6i=b-Y_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 13:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175587

1. inherit fs-uuid in some-recipe
2. set ROOTFS to some-existing-rootfs
3. make call to get_rootfs_uuid somewhere in that recipe ie.
"${@get_rootfs_uuid(d)}"
3. bitbake some-recipe

Pawel

On Fri, 6 Jan 2023 at 12:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Can you please describe steps to reproduce?
>
> Alex
>
> On Fri 6. Jan 2023 at 13.40, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk> wrote:
>>
>> It is not actually being used by default in Yocto ?
>> This was found in kirkstone.
>> But regardless, it is wrong and will drop an error.
>>
>> Kind regards,
>> Pawel
>>
>> On Fri, 6 Jan 2023 at 12:06, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
>> > > The default return value from subprocess.check_output is an encoded byte.
>> > > The applied fix will decode the value to a string.
>> > >
>> > > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
>> > > ---
>> > >  meta/classes/fs-uuid.bbclass | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
>> > > index 9b53dfba7a..731ea575bd 100644
>> > > --- a/meta/classes/fs-uuid.bbclass
>> > > +++ b/meta/classes/fs-uuid.bbclass
>> > > @@ -4,7 +4,7 @@
>> > >  def get_rootfs_uuid(d):
>> > >      import subprocess
>> > >      rootfs = d.getVar('ROOTFS')
>> > > -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
>> > > +    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
>> > >      for line in output.split('\n'):
>> > >          if line.startswith('Filesystem UUID:'):
>> > >              uuid = line.split()[-1]
>> >
>> >
>> > That looks reasonable, I just wonder how this has worked until now? Why
>> > aren't we seeing errors due to this?
>> >
>> > Does it mean we don't have some test coverage? or was there silent
>> > breakage of some kind this fixes?
>> >
>> > Cheers,
>> >
>> > Richard
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#175583): https://lists.openembedded.org/g/openembedded-core/message/175583
>> Mute This Topic: https://lists.openembedded.org/mt/95823853/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

