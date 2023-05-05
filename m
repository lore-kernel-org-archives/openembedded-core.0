Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B3EC77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:26:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4724.1683314776476976358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CNTa2l3a;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f14468ef54so2529506e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683314775; x=1685906775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIqD7Wo8hq4z0+Op1f4cvM4aZ7/xU7vZvsNn5xedN8M=;
        b=CNTa2l3ap7MO64keeNqaqMLwYk61UNfodC98N7aOgITWalfXP/thjv/XLD3G2j95RF
         k0+/7KbK6d/K+fvxBGJXVWkzwUPv0omJE6iT/irjK5+JufEl6GetjWLfxS/OJ1yy0mQJ
         YiJ1K618fMp/t6RcYul/xdmVBVa1SpinJk0sYr5i3TgY1KNEYpCEPacLWdL7IZA/pq7O
         VNufZ/fOYjPbwrEdPU5kXGEYjG3NRMelN4vj5i+NhHKvFlwBAzojERCJPRO9SaKYppGa
         kaiX0f8o0oaQEiG9zfdX/x+RS9eSuumJ+S2YMaAZr68Q68dxvkDbmmx9x79EAGsa3dEi
         ayAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683314775; x=1685906775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIqD7Wo8hq4z0+Op1f4cvM4aZ7/xU7vZvsNn5xedN8M=;
        b=LnDG+ZcdGST3QHDjquS0E6fu5XUdanaRAmQ4rvVdCVcXSoqXkMQWHZNLbFVb6USoSD
         m4V5zW4reCwl0KVGndkIKbWejOH6Bc+Mf2e7ppUyTpzkg9cZMWuLY0jZ0ald9xagFtNj
         LkwIKqrTjJgEq1PgnLgrt+FcD2/pS02tv89KgLKtZ+tCNDh7lZ0gKa1pw1FzutmiGsA2
         a4MS1JONIaJds171gZSK97w+JlWWmVBX+2b5Uo4GqsTXmz1s3pic7fB+5ZtnogJf8JaX
         8JUKX0cK2HbC0axxwZ5JhpgTAfOg5MWtyidDb9n4Mg8Pnc6ZFuPZVGkSuNyZWjTam8/T
         iOYg==
X-Gm-Message-State: AC+VfDzPljTxTGG8+S00OB7eyjKL9fpoTGEtvEc6bx7RTtBkHKyfYg2r
	F/duuiHRUVl9lz9eOnhLUzoNgXZJtE1ZYiSrb/X71shK
X-Google-Smtp-Source: ACHHUZ5bp7Gxc1znC5QHQiyAIMbMWTf0C9uoBdzOMhy24VIOjrZm2n/65ClMk9+Et8qnAenK7RO9k4LlD0P8lgTHMHc=
X-Received: by 2002:ac2:5602:0:b0:4f1:4086:9384 with SMTP id
 v2-20020ac25602000000b004f140869384mr762937lfd.61.1683314774689; Fri, 05 May
 2023 12:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
 <ce83564a-1362-f45d-8c4d-e33e68a72d27@baylibre.com> <CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com>
 <82fbf114-27ee-7d88-5d1d-5e0d0669f6ce@baylibre.com>
In-Reply-To: <82fbf114-27ee-7d88-5d1d-5e0d0669f6ce@baylibre.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 21:26:03 +0200
Message-ID: <CA+cAkeoZGx-HG+9KXaKsfh_yHEehtDM3eSmvn-jt=KF+-eRiUQ@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000030cd3205faf74388"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180976

--00000000000030cd3205faf74388
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 at 21:08, Trevor Gamblin <tgamblin@baylibre.com> wrote:

>
> On 2023-05-05 14:31, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>
>
>
> Le ven. 5 mai 2023, 20:21, Trevor Gamblin <tgamblin@baylibre.com> a
> =C3=A9crit :
>
>>
>> On 2023-05-05 13:37, Alexander Kanavin wrote:
>> > There is
>> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>> > and some additional pages linked from it:
>> > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> > http://www.openembedded.org/wiki/Styleguide
>> >
>> > The wiki is not great, and needs improvements, but the problem is it's
>> > difficult to write an authoritative and comprehensive answer to the
>> > questions you ask because there's just so many possible things one
>> > could check with any change to yocto. If you touch a recipe, you
>> > should of course check that 'bitbake recipe' still completes without
>> > an error. But that's obvious, isn't it? Beyond that... it depends. And
>> > requires a bit of intuition and experience, or advice from someone who
>> > knows the specific item better.
>> >
>> > We generally don't expect people to learn 'the rules' upfront - just
>> > write some code, and if you're not certain how to test it properly or
>> > whether it even makes sense, submit the patch as RFC and ask to take a
>> > look. If it fails in integration testing, you'll hear about it too,
>> > and that's normal and expected for anything more complex than a typo
>> > fix. My patches appear 'perfect' only because I pre-test them myself
>> > on the autobuilder :)
>> >
>> > Where we would *greatly* appreciate help is a special bot called
>> > patchtest that used to check mailing list submissions for common
>> > problems. That fell into disrepair due to lack of maintenance. Fixing
>> > that would be fantastic - and people could run it locally too. That
>> > could act as both a repository of rules-as-code, and a way to check
>> > them automatically. It could also offer hints for testing, depending
>> > on what the change touches. All sorts of nice things, if there is a
>> > person looking after it.
>>
>> I'm actually working on getting patchtest running again, and I've
>> assigned myself as maintainer :)
>>
>> To add to what Alex said, a good place for you to start might be looking
>> at the Newcomer Bugs list:
>> https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
>>
>> Alternatively, watching AUH failures and figuring out broken upgrades,
>
>
> What is AUH? Where I can see broken upgrades you talked about? And more
> important to me, how can I replicate them to investigate on my side?
>
> AUH is "Auto Upgrade Helper". If you search the OE-core mailing list for
> the acronym, you will sometimes see results like this:
>
> [OE-core] [AUH] icu: upgrading to 73-1 FAILED
>
> These could be another area to look at contributing in addition to the
> Newcomer Bugs or other parts of the Bugzilla, but the Newcomer list is
> probably the best place to get yourself familiarized.
>
> You may find this page useful when it comes to recipe upgrades:
> https://docs.yoctoproject.org/dev/dev-manual/upgrading-recipes.html
>

Alright, I will take a look. Thanks trevor.

> - Trevor
>
>
>
>> or looking on the Bugzilla under terms like "ptest" could also be very
>> useful, while providing better understanding of how recipes are written
>> and being somewhat more accessible.
>>
>> You can also ask questions in the #yocto channel on the Libera.Chat IRC
>> server if you need additional help.
>>
>> - Trevor
>>
>> >
>> > Alex
>> >
>> > On Fri, 5 May 2023 at 19:17, Frederic Martinsons
>> > <frederic.martinsons@gmail.com> wrote:
>> >> Hello list
>> >>
>> >> I'm wondering if there are documentations on how contribution are
>> managed for the project.
>> >>
>> >> I try to find some but didn't manage to. There are easily reachable
>> doc about how to contribute of course (how to make patches, fixe your
>> identity, send mail via git... etc) but I didn't find what I usually fin=
d
>> on other open source project (CONTRIBUTING.md file most of the time) lik=
e
>> >>    - what are the tests do should I run before submitting (I learnt b=
y
>> practice about test image or bitbake selftest for example) ?
>> >>    - is there a specific configuration that I should test before
>> submitting (poky is ok, or should I also test another distro)?
>> >>    - does some commit writing rules exist ? (some projects want
>> commits to begin with a prefix, usually the software component that is
>> modified by the patch for example)
>> >>   - what are the coding rules you should follow, if any? (having
>> common coding rules helps greatly the review of patches, pylint for pyth=
on
>> code for example, and I saw there are some bitbake recipes linter from
>> meta-sca layer)
>> >>
>> >> Long story short, I really would like to know what are the different
>> steps a patch should go through before being merged into master (and as =
a
>> side question, what are the steps for a patch to be backported into one =
of
>> the LTS branch).
>> >>
>> >> I'm deeply sorry if all these questions are obvious to you and have
>> been already answered somewhere, in that case, please just give me the l=
ink.
>> >>
>> >> I recently started to contribute to yocto / oe and I think it will
>> help me to make better contributions if I know more of how it works "und=
er
>> the hood".
>> >>
>> >> Best regards.
>> >>
>> >>
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#180962):
>> https://lists.openembedded.org/g/openembedded-core/message/180962
>> >> Mute This Topic: https://lists.openembedded.org/mt/98710419/7611679
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> [tgamblin@baylibre.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>
>>
>

--00000000000030cd3205faf74388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 May 2023 at 21:08, Trevor G=
amblin &lt;<a href=3D"mailto:tgamblin@baylibre.com">tgamblin@baylibre.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 2023-05-05 14:31, Fr=C3=A9d=C3=A9ric
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto">
        <div><br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Le ven. 5 mai 2023, 20:21=
,
              Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" t=
arget=3D"_blank">tgamblin@baylibre.com</a>&gt;
              a =C3=A9crit=C2=A0:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
              On 2023-05-05 13:37, Alexander Kanavin wrote:<br>
              &gt; There is<br>
              &gt; <a href=3D"http://www.openembedded.org/wiki/How_to_submi=
t_a_patch_to_OpenEmbedded" rel=3D"noreferrer noreferrer" target=3D"_blank">=
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a><=
br>
              &gt; and some additional pages linked from it:<br>
              &gt; <a href=3D"http://www.openembedded.org/wiki/Commit_Patch=
_Message_Guidelines" rel=3D"noreferrer noreferrer" target=3D"_blank">http:/=
/www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
              &gt; <a href=3D"http://www.openembedded.org/wiki/Styleguide" =
rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.openembedded.org=
/wiki/Styleguide</a><br>
              &gt;<br>
              &gt; The wiki is not great, and needs improvements, but
              the problem is it&#39;s<br>
              &gt; difficult to write an authoritative and comprehensive
              answer to the<br>
              &gt; questions you ask because there&#39;s just so many
              possible things one<br>
              &gt; could check with any change to yocto. If you touch a
              recipe, you<br>
              &gt; should of course check that &#39;bitbake recipe&#39; sti=
ll
              completes without<br>
              &gt; an error. But that&#39;s obvious, isn&#39;t it? Beyond
              that... it depends. And<br>
              &gt; requires a bit of intuition and experience, or advice
              from someone who<br>
              &gt; knows the specific item better.<br>
              &gt;<br>
              &gt; We generally don&#39;t expect people to learn &#39;the r=
ules&#39;
              upfront - just<br>
              &gt; write some code, and if you&#39;re not certain how to
              test it properly or<br>
              &gt; whether it even makes sense, submit the patch as RFC
              and ask to take a<br>
              &gt; look. If it fails in integration testing, you&#39;ll hea=
r
              about it too,<br>
              &gt; and that&#39;s normal and expected for anything more
              complex than a typo<br>
              &gt; fix. My patches appear &#39;perfect&#39; only because I
              pre-test them myself<br>
              &gt; on the autobuilder :)<br>
              &gt;<br>
              &gt; Where we would *greatly* appreciate help is a special
              bot called<br>
              &gt; patchtest that used to check mailing list submissions
              for common<br>
              &gt; problems. That fell into disrepair due to lack of
              maintenance. Fixing<br>
              &gt; that would be fantastic - and people could run it
              locally too. That<br>
              &gt; could act as both a repository of rules-as-code, and
              a way to check<br>
              &gt; them automatically. It could also offer hints for
              testing, depending<br>
              &gt; on what the change touches. All sorts of nice things,
              if there is a<br>
              &gt; person looking after it.<br>
              <br>
              I&#39;m actually working on getting patchtest running again,
              and I&#39;ve <br>
              assigned myself as maintainer :)<br>
              <br>
              To add to what Alex said, a good place for you to start
              might be looking <br>
              at the Newcomer Bugs list: <br>
              <a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newc=
omer_Bugs" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoc=
toproject.org/wiki/Bug_Triage#Newcomer_Bugs</a><br>
              <br>
              Alternatively, watching AUH failures and figuring out
              broken upgrades,</blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">What is AUH? Where I can see broken upgrades you
          talked about? And more important to me, how can I replicate
          them to investigate on my side? <br>
        </div>
      </div>
    </blockquote>
    <p>AUH is &quot;Auto Upgrade Helper&quot;. If you search the OE-core ma=
iling
      list for the acronym, you will sometimes see results like this:</p>
    <p>[OE-core] [AUH] icu: upgrading to 73-1 FAILED</p>
    <p>These could be another area to look at contributing in addition
      to the Newcomer Bugs or other parts of the Bugzilla, but the
      Newcomer list is probably the best place to get yourself
      familiarized.</p>
    <p>You may find this page useful when it comes to recipe upgrades:
      <a href=3D"https://docs.yoctoproject.org/dev/dev-manual/upgrading-rec=
ipes.html" target=3D"_blank">https://docs.yoctoproject.org/dev/dev-manual/u=
pgrading-recipes.html</a></p></div></blockquote><div><br></div><div>Alright=
, I will take a look. Thanks trevor.=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div>
    <p>- Trevor<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"auto">
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
              or looking on the Bugzilla under terms like &quot;ptest&quot;=
 could
              also be very <br>
              useful, while providing better understanding of how
              recipes are written <br>
              and being somewhat more accessible.<br>
              <br>
              You can also ask questions in the #yocto channel on the
              Libera.Chat IRC <br>
              server if you need additional help.<br>
              <br>
              - Trevor<br>
              <br>
              &gt;<br>
              &gt; Alex<br>
              &gt;<br>
              &gt; On Fri, 5 May 2023 at 19:17, Frederic Martinsons<br>
              &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=
=3D"noreferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;
              wrote:<br>
              &gt;&gt; Hello list<br>
              &gt;&gt;<br>
              &gt;&gt; I&#39;m wondering if there are documentations on how
              contribution are managed for the project.<br>
              &gt;&gt;<br>
              &gt;&gt; I try to find some but didn&#39;t manage to. There
              are easily reachable doc about how to contribute of course
              (how to make patches, fixe your identity, send mail via
              git... etc) but I didn&#39;t find what I usually find on othe=
r
              open source project (CONTRIBUTING.md file most of the
              time) like<br>
              &gt;&gt;=C2=A0 =C2=A0 - what are the tests do should I run be=
fore
              submitting (I learnt by practice about test image or
              bitbake selftest for example) ?<br>
              &gt;&gt;=C2=A0 =C2=A0 - is there a specific configuration tha=
t I
              should test before submitting (poky is ok, or should I
              also test another distro)?<br>
              &gt;&gt;=C2=A0 =C2=A0 - does some commit writing rules exist =
? (some
              projects want commits to begin with a prefix, usually the
              software component that is modified by the patch for
              example)<br>
              &gt;&gt;=C2=A0 =C2=A0- what are the coding rules you should f=
ollow,
              if any? (having common coding rules helps greatly the
              review of patches, pylint for python code for example, and
              I saw there are some bitbake recipes linter from meta-sca
              layer)<br>
              &gt;&gt;<br>
              &gt;&gt; Long story short, I really would like to know
              what are the different steps a patch should go through
              before being merged into master (and as a side question,
              what are the steps for a patch to be backported into one
              of the LTS branch).<br>
              &gt;&gt;<br>
              &gt;&gt; I&#39;m deeply sorry if all these questions are
              obvious to you and have been already answered somewhere,
              in that case, please just give me the link.<br>
              &gt;&gt;<br>
              &gt;&gt; I recently started to contribute to yocto / oe
              and I think it will help me to make better contributions
              if I know more of how it works &quot;under the hood&quot;.<br=
>
              &gt;&gt;<br>
              &gt;&gt; Best regards.<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              &gt;&gt; Links: You receive all messages sent to this
              group.<br>
              &gt;&gt; View/Reply Online (#180962): <a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/180962" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-c=
ore/message/180962</a><br>
              &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedd=
ed.org/mt/98710419/7611679" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://lists.openembedded.org/mt/98710419/7611679</a><br>
              &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bo=
wner@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">openembed=
ded-core+owner@lists.openembedded.org</a><br>
              &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/unsub</a>
              [<a href=3D"mailto:tgamblin@baylibre.com" rel=3D"noreferrer" =
target=3D"_blank">tgamblin@baylibre.com</a>]<br>
              &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              &gt;&gt;<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--00000000000030cd3205faf74388--

