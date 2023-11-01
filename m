Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D028C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 06:28:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.1199.1698820081277020983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 23:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJ+vTKfY;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c6cb4a79deso5996691fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698820079; x=1699424879; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjghzCDTKYZ7lSTxLOUvpEee3haMt3iPGUJh6W77X4U=;
        b=WJ+vTKfY0PObFA2S96wcUPXGqnJhp9kvzGGW31ZaJIC6f31EXbVodLTQjh7zR4Ylsu
         /a/Ia6jGmebwl6NWG1CcI0KtCJWSs318l34qoxo4S3JeLL0E0oPIx6Q6xgJ3x/thecHo
         jzpNdt6h66zGqNXrSowwThp78lQ96/XdYWBxaD84dnp8xOl1Bu96HcLDtKDKoBDdMikz
         m7Us7LDnuQlyGmv+Ac2DOreMsUcFfmMSs6iZcmBQacVLz+l22DrdVVy4inUgd65DHBBp
         BY5bQAgtDh4u+MNguQZsUHzvcfVZR6gU9sHi6vgUHOjxcvpYcc6GId5uhys1cyP+TLPj
         RhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698820079; x=1699424879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjghzCDTKYZ7lSTxLOUvpEee3haMt3iPGUJh6W77X4U=;
        b=W/cHHBwgW2N663PkQr2T1ULvXGS30MSI9ressf6pga7nYtRP9oRVipcBcgcghrTQzE
         yjwy02BFLUv1r6PvmrR7OgPY3ivi6Ag1jf5t24B3WwCKquWnhbiCKQ6xQ6oTxDbtlUmg
         VCmHuxqKHQ0+A4DApzOuiT5ziwvMDXHfsJnpNkoqKVnzsvSk3HIKbpz6RiIx8WnizrZn
         XSfsxVDiZns3G81e6oDuQWtHP5hnfVFHH+odoJZ/LItFBQbRD6aFDJ0CwzERtDrEbUCh
         yQfx/vqMGZyurO6IfMnQKI7OH3PTQCBZV405o0cHmH/BIuDseG8Y3U94jm+uqx9a7rLH
         YKCA==
X-Gm-Message-State: AOJu0YzV03dAg53abIvJUSrhThVkN40xT5TywsgvxbCvx9NeM8pzXN6d
	lke1zi1jtyKu6il0eFeO5n4gUMyVWVvDZ82GbiU=
X-Google-Smtp-Source: AGHT+IFoQD01tlKAIFAmQ4m1aYYukH6abR5ObTHFxf34tak/rVLC1YMA76FgTukuUWZJkLRTNeqifTmlWmWUj8TjasQ=
X-Received: by 2002:a05:651c:102d:b0:2c5:2357:c6a7 with SMTP id
 w13-20020a05651c102d00b002c52357c6a7mr1893642ljm.17.1698820079304; Tue, 31
 Oct 2023 23:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
 <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
 <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com> <179368C4B8E65457.29356@lists.openembedded.org>
In-Reply-To: <179368C4B8E65457.29356@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 1 Nov 2023 07:27:46 +0100
Message-ID: <CAApg2=R1_4qFb5ZJJqhonChLAOsM+UPPf7pP2S-rVY1ag+SZzQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
To: rybczynska@gmail.com
Cc: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>, 
	Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 06:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189897

On Wed, Nov 1, 2023 at 6:31=E2=80=AFAM Marta Rybczynska via
lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
wrote:
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
>

Here is what I have for the documentation:
https://lists.yoctoproject.org/g/docs/message/4544

Kind regards,
Marta

