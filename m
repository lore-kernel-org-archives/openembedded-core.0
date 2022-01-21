Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5D5C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:59:04 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.10786.1642766344078353912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CjfsORr/;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id n15so14915766uaq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X8pwAeiC81RWK+8gPiwdJrlrdgBAhuoeKtJqO5AYDLs=;
        b=CjfsORr/VrwHmpDdc9Mo5WNYnylQKiH9tJ+5GBnfk5bMEcrlS0ex6bbpmpc223yXf1
         8BV9g7QPVHu23v0Liz07X/wuw8Zhu9xDFRFzYbEgDFwDgkIlujEHlDfu+tB0D7askjl8
         f61IqDrzspizgVNFjJwLlmyrS3n9acCDXfpQcPRseOxxxdcLyMyz575Bv1v8B+14e/a3
         oj5+6oH8CDBSGhomc5ypmdhjmxJhH4thX5HvMIIMLijwjAIMD/eh05sldsHv5u9PFCHh
         gTghkOQCyW/ysssUSw5tTOWAGdewpkMPIGVLkzBS3aXFQ5OWtclVMv8hMiwXNMyD0uTQ
         IKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X8pwAeiC81RWK+8gPiwdJrlrdgBAhuoeKtJqO5AYDLs=;
        b=bF9EbmtnvyJD9mMWF8La/Tt1r4sgKbqxKuXRpKIasNYsRdjEQrgWDTPrqftHuG2K14
         ckMQhqGZUYwV0On0Ctd2uJ1o27awQF4kNHGRNTwpCHqHouc5NxzA62VNIKoC4eZ2t/A0
         K4fc/mlWeLqOIFKZPYAOe6TxVH5Tj0l3V3VaGLY94S4RefsZEaqADMl7r8gbQVlEr2oD
         qQHox4doGtKmBQWk0t/DxITtygmL/ALdZsYdDYYlYGevK4w+tpV/1E6X1aZRgEMANgdB
         NImm4Wj8Gti9moucbXTVQoiiIWNgtjMZVE555VSYLvjy10IbVf1QmJkqc2tFJ1bLuZ3G
         cEMg==
X-Gm-Message-State: AOAM533znxu6epcboCByIs46NmrKNw6u3j2XxCr8BFBSp/30u4h+TDA+
	tClDoF6073Q+o7UaouCyZBpfgT/HZcyzp3Xd9c0=
X-Google-Smtp-Source: 
 ABdhPJyADvKHdm4Stby9TA2KIpyZ1N4vQd7YIyh3npzSNfqj36mBtdLaCOr/lUAlusmi6mP63JTCgj/Hd1YKvTMziDs=
X-Received: by 2002:a67:f882:: with SMTP id h2mr1296051vso.81.1642766343173;
 Fri, 21 Jan 2022 03:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
 <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
 <56724a11b917e32b196f8aeb7c4678c4e0903d49.camel@linuxfoundation.org>
 <16CC466E2ADD6F99.18230@lists.openembedded.org>
In-Reply-To: <16CC466E2ADD6F99.18230@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 12:58:51 +0100
Message-ID: 
 <CANNYZj-DxtpV2=g029VC9u5rSSjWV5nA=ua1XmqKFxeC=Vma=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Ross Burton <ross.burton@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000557c7205d6165884"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160822

--000000000000557c7205d6165884
Content-Type: text/plain; charset="UTF-8"

Come to think of it, what would work best is some kind of
~/.enable-runqemu-kvm file, which presence would indicate to runqemu that
it is permitted to auto-enable kvm when host and target arches match.

Alex

On Fri, 21 Jan 2022 at 12:43, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Thu, 20 Jan 2022 at 21:46, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>>
>> I think the patch as it stands will actually regress things for many
>> users. You
>> must be already in the right groups to be able to access kvm on your
>> system but
>> I don't think that is the default for many distros. On those distros you
>> would
>> see a "permission denied" message from qemu which users find very
>> confusing and
>> I think this is why the code is in the form it is in.
>>
>> We might be able to improve the test further with the open permissions
>> Alexander
>> mentions but that is probably necessary to make the patch mergable.
>>
>
> I guess what we can do for a start is to check if host and target arches
> match (e.g. x86 on x86), and then if kvm is not asked for, gently suggest
> to the users that they do, for a much better experience, with a link to the
> kvm on yocto guide. Then we can look into auto-attempting it carefully, so
> that such attempts don't make the experience worse.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160819):
> https://lists.openembedded.org/g/openembedded-core/message/160819
> Mute This Topic: https://lists.openembedded.org/mt/88560844/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000557c7205d6165884
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Come to think of it, what would work best is some kin=
d of ~/.enable-runqemu-kvm file, which presence would indicate to runqemu t=
hat it is permitted to auto-enable kvm when host and target arches match.</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Jan 2022 at 12:43, Alexand=
er Kanavin via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2022 at 21:46, R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><br>
I think the patch as it stands will actually regress things for many users.=
 You<br>
must be already in the right groups to be able to access kvm on your system=
 but<br>
I don&#39;t think that is the default for many distros. On those distros yo=
u would<br>
see a &quot;permission denied&quot; message from qemu which users find very=
 confusing and<br>
I think this is why the code is in the form it is in.<br>
<br>
We might be able to improve the test further with the open permissions Alex=
ander<br>
mentions but that is probably necessary to make the patch mergable.<br></bl=
ockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">I guess what we can do for a start is to check if host and target arche=
s match (e.g. x86 on x86), and then if kvm is not asked for, gently suggest=
 to the users that they do, for a much better experience, with a link to th=
e kvm on yocto guide. Then we can look into auto-attempting it carefully, s=
o that such attempts don&#39;t make the experience worse.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160819): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160819" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160819</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88560844/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88560844/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000557c7205d6165884--

