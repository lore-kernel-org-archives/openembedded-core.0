Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD57C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 11:49:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.11019.1686656986553356590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 04:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pEx0vkv8;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30fc2b44281so1880455f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686656985; x=1689248985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mf47lKIE1b69AZZIPDFALHt8SYoOkLj8KedmkNJE9U=;
        b=pEx0vkv8trk7ibA8lN5cEr4QKyF/CN/vH9S0YghHrTACQOc25XMOUPZZkV3jWKyEYT
         8YQFFHnElzUIukZdcZ8qB9joV5bZfiRP7CEUteuJB6X5Hn62stABT5QVp0FHn3R/0XLa
         IlGERR58WO7r53jpmL5aCTMTfGzMQNry9/wTmbzkjgZG8s0SNMfn+NZWQcUW+fIKYpMc
         Zvcs0+/0nCeHE4eE0vICOFgLL56EHLzxJThDYF7ja46LYFnVwFrCYyuWHk7c+BN8LbOp
         K00aB68sYwpuTNKcooqhGEN4sZTSc5HB+4K58WzJvWIgukkEvzE24FyKJdGdwpNV+coi
         gEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686656985; x=1689248985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mf47lKIE1b69AZZIPDFALHt8SYoOkLj8KedmkNJE9U=;
        b=EdAyQ9itYyQNm9lN5i7R4JRbIvaMFJysUY674bhQyHsVDNabIU8A0XaFSzuKAZxV7n
         bRPsFeTO1+AtY6QsbYcnHLJIExp7y8VTlui3PLPyjVQhoYSfBiXjb0qgusS4SiD8DcjH
         gSK06hzWVOHwZOYxWLhOQ4+C36g8XCCd7MEjZHNXTQgAbrpy6X4yz7GI+eGP6b0QVcur
         HGNx8Z6klL593RKpk0t5d0c0eNJI5Lxsq+NtykCWBnndd9O+7EcdA6Rv2vMxUwjAeGJE
         7ItsnyPs2iwMa6UTrI8lqSdaerJr018jjmoT5I7be4/Oyd5Jsjvsf3CTXMjhJHl6po+G
         BNrA==
X-Gm-Message-State: AC+VfDz+DRdDejDPvQZ/C1I92MJJCIKpgxtZiaQdxhG8xK0tUwCPyX43
	K31DFgynAHY3+/kvmBpqPd10LFhTriMMn4aMUDU=
X-Google-Smtp-Source: ACHHUZ52cnPWJ40htDSWOc2P+IKn75bflrl8Zx9q6r1vPTpBip3cByVqNIRWm96n//GHln6vmbzbZeDANKu5nHJaDj0=
X-Received: by 2002:adf:f98d:0:b0:309:566f:3cd with SMTP id
 f13-20020adff98d000000b00309566f03cdmr7063997wrr.6.1686656984625; Tue, 13 Jun
 2023 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230517162906.2395999-1-peter.hoyes@arm.com> <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
 <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com> <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
In-Reply-To: <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Jun 2023 13:49:32 +0200
Message-ID: <CA+chaQeMPpEdc14cuU1xp8Kpp2nq4ROdRViodzV9sNxh_Sg4Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for write_image_test_data
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Hoyes <peter.hoyes@arm.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d370805fe016ebd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 11:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182713

--0000000000006d370805fe016ebd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 1:33=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-06-13 at 10:55 +0100, Peter Hoyes wrote:
> > On 23/05/2023 18:06, Ross Burton wrote:
> > > On 17 May 2023, at 17:29, Peter Hoyes via lists.openembedded.org
> > > <peter.hoyes=3Darm.com@lists.openembedded.org> wrote:
> > > > The testdata.json file generated as part of the rootfs
> > > > postprocess
> > > > commands contains almost all Bitbake variables and is used by
> > > > OEQA test
> > > > cases to inspect the build environment. However it is only
> > > > regenerated
> > > > when the rootfs task is otherwise retriggered, complicating the
> > > > process
> > > > of developing OEQA test cases.
> > > I=E2=80=99m about to run for dinner, but would it make more sense for=
 this
> > > function to be a separate task inside testimage.bbclass that
> > > happens after rootfs?  This will stop the explosion of variable
> > > dependencies causing rootfs to re-run.
> > >
> > > Ross
> >
> > Thanks for the suggestion - I have implemented this for consideration
> > in
> >
> https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2/995017=
85
>
> Making it a separate task is fine, the challenge is that it needs to
> run at the same time as image processing so that DATE/TIME are
> consistent and the image names are correct.
>

Maybe the final change from [YOCTO #12937] should help with this as with
that the do_image_complete will produce the images without version suffix
(and only when something in them changed) and separate task will create new
hardlinks with version suffix (which might point to the same image from
previous build or newly built one).

Cheers,


> That implies that it has to be before do_image_complete which means any
> change in variables will retrigger the image creation :(.
>
> I think we need to try and fix this differently and stop exporting
> every variable.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182712):
> https://lists.openembedded.org/g/openembedded-core/message/182712
> Mute This Topic: https://lists.openembedded.org/mt/98951993/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006d370805fe016ebd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 13, 2023 at 1:33=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2023-06-1=
3 at 10:55 +0100, Peter Hoyes wrote:<br>
&gt; On 23/05/2023 18:06, Ross Burton wrote:<br>
&gt; &gt; On 17 May 2023, at 17:29, Peter Hoyes via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&gt; &gt; &lt;peter.hoyes=3D<a href=3D"mailto:arm.com@lists.openembedded.or=
g" target=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The testdata.json file generated as part of the rootfs<br>
&gt; &gt; &gt; postprocess<br>
&gt; &gt; &gt; commands contains almost all Bitbake variables and is used b=
y<br>
&gt; &gt; &gt; OEQA test<br>
&gt; &gt; &gt; cases to inspect the build environment. However it is only<b=
r>
&gt; &gt; &gt; regenerated<br>
&gt; &gt; &gt; when the rootfs task is otherwise retriggered, complicating =
the<br>
&gt; &gt; &gt; process<br>
&gt; &gt; &gt; of developing OEQA test cases.<br>
&gt; &gt; I=E2=80=99m about to run for dinner, but would it make more sense=
 for this<br>
&gt; &gt; function to be a separate task inside testimage.bbclass that<br>
&gt; &gt; happens after rootfs?=C2=A0 This will stop the explosion of varia=
ble<br>
&gt; &gt; dependencies causing rootfs to re-run.<br>
&gt; &gt; <br>
&gt; &gt; Ross<br>
&gt; <br>
&gt; Thanks for the suggestion - I have implemented this for consideration<=
br>
&gt; in <br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/pa=
tch_1_2/99501785" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/topic/patch_1_2/99501785</a><br>
<br>
Making it a separate task is fine, the challenge is that it needs to<br>
run at the same time as image processing so that DATE/TIME are<br>
consistent and the image names are correct.<br></blockquote><div><br></div>=
<div>Maybe the final change from [YOCTO #12937] should help with this as wi=
th that the do_image_complete will produce the images without version suffi=
x (and only when something in them changed) and separate task will create n=
ew hardlinks with version suffix (which might point to the same image from =
previous build or newly built one).</div><div><br></div><div>Cheers,</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
That implies that it has to be before do_image_complete which means any<br>
change in variables will retrigger the image creation :(.<br>
<br>
I think we need to try and fix this differently and stop exporting<br>
every variable.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182712): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182712" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182712</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98951993/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98951993/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006d370805fe016ebd--

