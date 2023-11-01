Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4544C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 13:49:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.7598.1698846539770551248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 06:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tdtZc/ny;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c603e2354fso182653466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698846538; x=1699451338; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmduH28tzkvofA/FlVJEn7akABP24cYMM1tezRVR8LM=;
        b=tdtZc/nylUqU6pKLm6nKd9OyGmG463RX58qLSDFIT1RkpthYbAmxYpi/etaTGIltf6
         2kuBhQwqBr78j/oePSNjzVR1HZ/vVT8sEtI/zOYp3XBkt3Kypkge+FdXmxBj90k/DkW/
         8qKNzRpM8szO5D2mkR25hmmPFzZhN7v6zW8JDccnwu18QHEex9FvkQPjaHqeouSjCwCC
         5TjNo+EoD71+njxpCzmGM03tVvoyJbi11cAwM4fOw+OdZ7dQWQQai5Lqe30EgZU2TaLV
         i0jS6PwqTItAY96KXxRC3LTpmXKnFELbzRPVvAydoDb7had7n3mxZhW3k8eODswYVyUe
         CnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846538; x=1699451338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmduH28tzkvofA/FlVJEn7akABP24cYMM1tezRVR8LM=;
        b=D1PefTjm4xoEbsXAFdemwdfJn6SqBTfgCXxh+f/QdmDIXzh6XifaDlugG5wJrEOcvJ
         ZGMU7WbbORIa22dd4JEDY7/2rtcGhpVUPt+Wtl0mQXgTBfOdil0UrP9HOsJxMSw9Ylj9
         eloGrreDtbSe/xzbWHgF2MTc6oNqVn5weXn6GEHas37/PJHMHMppnLKGletoQU9KUTkH
         Nnqg3Gl29OjRJv8Jf+jCKCCDI23jwEWUyHfqrwc5uH809MHtnT9u74Jpps8AQyNB8Jlj
         jQqfPdQ7geot14iYfokz82qExIJdLqEJgxHzR9bewEUKl/Z6dArme09Xr9MvubVzZaPx
         AA0A==
X-Gm-Message-State: AOJu0YwBZX7EV209+0hu9NOBignQMBt59uLN7JACsOFcyp5U2vvAHaal
	wtRyxHlyQbVk2qRXQqHTnBiR314wu2A5Fy9AWT9r6w==
X-Google-Smtp-Source: AGHT+IGSpt230Zw/IJcX8rZprwTkwrIG2sVj6sFbLMYuWpdWkTVtlpoYdGKL0F1CnVunMW5u7YXDOmYe9Q/v8lvs4ig=
X-Received: by 2002:a17:906:eec5:b0:9b2:be2f:e31a with SMTP id
 wu5-20020a170906eec500b009b2be2fe31amr2180865ejb.31.1698846537835; Wed, 01
 Nov 2023 06:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
 <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
 <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com> <CAApg2=SuPopzhjLJgC1oy3e42xEci+1_h2scS-mkT+8EsQCjHg@mail.gmail.com>
In-Reply-To: <CAApg2=SuPopzhjLJgC1oy3e42xEci+1_h2scS-mkT+8EsQCjHg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Nov 2023 03:48:46 -1000
Message-ID: <CAOSpxda_dq1AGeVCxaoeGLY-u+8d4k7QD7SP-MrNSyw4Kb1TxQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Tim Orling <ticotimo@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 13:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189913

On Tue, Oct 31, 2023 at 7:31=E2=80=AFPM Marta Rybczynska <rybczynska@gmail.=
com> wrote:
>
>
>
>
> On Wed, 1 Nov 2023, 11:48 Anuj Mittal, <anuj.mittal@intel.com> wrote:
>>
>> On Tue, 2023-10-31 at 19:33 -0700, Tim Orling wrote:
>> >
>> >
>> > On Tue, Oct 31, 2023 at 7:26=E2=80=AFPM Anuj Mittal <anuj.mittal@intel=
.com>
>> > wrote:
>> > > On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin wrote:
>> > > > Thank you for your submission. Patchtest identified one
>> > > > or more issues with the patch. Please see the log below for
>> > > > more information:
>> > > >
>> > > > ---
>> > > > Testing patch /home/patchtest/share/mboxes/patchtest-shorten-
>> > > > test-
>> > > > result-outputs.patch
>> > > >
>> > > > FAIL: test CVE presence in commit message: A CVE tag should be
>> > > > provided in the commit message with format: "CVE: CVE-YYYY-XXXX"
>> > > > (test_mbox.TestMbox.test_cve_presence_in_commit_message)
>> > >
>> > > Is this a requirement to have this in commit message in this
>> > > format? I
>> > > don't think this was being followed until now. A lot of patches
>> > > seem to
>> > > be failing this test as a result.
>> > >
>> >
>> >
>> > This was required when patchtest was running previously. It has been
>> > ignored for a while now, but that does not mean we should not enforce
>> > it. It should be documented as required.
>> >
>> > The tags allow for machines to parse the relevant info. Anything else
>> > is purely random and chaos.
>>
>> The tag is already required to be present in the CVE patch itself which
>> is/can be parsed by scripts which actually I think is a better way of
>> detecting whether a CVE is patched rather than looking at commit
>> messages.
>>
>> If having it in a specific format in commit message as well helps,
>> sure. It shouldn't take time to add it but we seem to be adding too
>> many rules ...
>>
>
> (adding Steve)
>
> I agree with Anuj, and I do not remember seeing a rule to put the
> CVE number in the commit message. We already have it in the
> patch file name (recommended) and inside the patch file itself.
> Those two places are enough in my opinion. In fact, it will likely
> be there in the commit message (its title), so repeating it does
> not make much logical sense.
>
> In fact, I have an update of the manual with more detailed information
> on submitting CVE fixes and looking for a resolution of this question
> to submit it :)
>
> Steve, does such additional tag in the commit message make it
> easier for you?

No.  In most cases it seems to add no value, since the cve number is
already in the shortlog, the filename of the patch(es), and the CVE
tag in the patch file(s).

I haven't been requiring it, so have no issue with removing that test
in patchtest.

Steve

