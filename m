Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCF7C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 18:06:50 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.72.1675361200731994096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 10:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wjq2ZoOU;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id g2so3260020ybk.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2yb147UejIndtfIPUas9c23lV8pqXjvHon1VP0M8Lj0=;
        b=Wjq2ZoOU/ZezNKn16aezOh+kBtr1ELo6hfL3BSu55txGtrQPZF9RPx/mDlSjjiSl5a
         kiy0D2mV9g4Q4SMgvX3znLkYbPvMIdxzK4XE2jiQWO13yauOtX9cYXBPB8jQEy4HEMVc
         RDhO1Cum9LCm6i0O8f2N/EwcoV/guVpPPWePk4vSeSP7UjjZ4uLKGglpOsOwgjGycuYx
         qt1dVlMi9JmgkR3YjZPYO98fT69UXTqNJy9fMIaDBqysGJq8jtpcTZ8MHw8xb97Zya6I
         1i8FOG3WKXCLC5m2QwCp99C9r+v7xhDLnqVWx3hrf9+4rpaQyDuQm+bC7E/eTTa6fvGA
         hHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yb147UejIndtfIPUas9c23lV8pqXjvHon1VP0M8Lj0=;
        b=rqBeSRroI1+zmJoKZt4Chz1VGSfbWBIr7+kTAPTlEC9o9w8NKRsTi4fQw4Yofy3oRC
         B0Zy8R+rN2ihRdbH+k4Y3fv0smBO9Ut9eV1hOoBWUF5QdR2s1PgHXiOhbkYqi9CBjE6M
         2si//EPewdFI9k+RioUucou5JioQaPQGLsuOff804OGUyBz2Ao1oq6r1xY7vlCggCxCg
         JYhTVS1pdUBZCKBrQsBjpdU9I2G3I28ieAuBgfe5MSUiv4w1If5eGx+R7UjM+i2G7Pi9
         B3VVq6gDLyIvAV6EtMrGmUSudwDHz3K2uF1UmYQ/A2tZbQ+wzk0NlQrD2wlb5bw4jn4E
         VHNg==
X-Gm-Message-State: AO0yUKUZP6qzfbMtZkqX7ySLmcu16bHKQkFIKe94yA6shluXH7cN9j4O
	AmqdOKVyVKCy2peXe0vTBcYBOVkyEdoKRD403rk=
X-Google-Smtp-Source: AK7set9q+khkdZZHjNTuZ47+7CevDps3fq4qETOUgrdqLMduKg/aG0vvFpV4Y9thu+4Na9NGTHyXdpA76dzPUU9HBoo=
X-Received: by 2002:a25:af4f:0:b0:7c8:3a6f:9b7b with SMTP id
 c15-20020a25af4f000000b007c83a6f9b7bmr833335ybj.88.1675361199698; Thu, 02 Feb
 2023 10:06:39 -0800 (PST)
MIME-Version: 1.0
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org> <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com> <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
 <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com> <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
In-Reply-To: <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 2 Feb 2023 10:06:28 -0800
Message-ID: <CANx9H-D3eWosG+Jafc8StygdBy01O953vAFg+R32zPvdUjuidQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Steve Sakoman <steve@sakoman.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, sundeep.kokkonda@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002dbb5905f3bb6d81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 18:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176702

--0000000000002dbb5905f3bb6d81
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 6:08 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> <snip>
>
> The Rust developers / community seems to want their software to work in a
> similar way.
> They have a quite exhaustive test suite (Crater) to check for regressions.
> I'll look for some actual test results from Crater and reply here when I
> find them.
>
There is a Crater <https://github.com/rust-lang/crater> chapter in the Rust
docs <https://rustc-dev-guide.rust-lang.org/tests/crater.html>
I haven't found any test runs/results in their GitHub actions yet...
There is rust-toolstate
<https://github.com/rust-lang-nursery/rust-toolstate>, but it only shows
the status per commit, not the test case results.

Ah, perhaps these are the Crater tests?
 https://github.com/rust-lang-ci/rust/actions
<https://github.com/rust-lang-ci/rust/actions>

> I not sure what to make of the "Rust Editions" and how they'd fit into our
> distro support
> but the clear mandate from upstream is that only the 'stable' release is
> supported.
>
>    https://doc.rust-lang.org/edition-guide/editions/index.html
>
> I think there's an argument to be made that until Rust releases 2.x, we
> just update
> to the latest version. If you haven't please read:
>
>
> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda
>
Fedora's Josh Stone mentioned that they keep the latest rust
<https://src.fedoraproject.org/rpms/rust> packaged for all supported Fedora
releases:
https://packages.fedoraproject.org/pkgs/rust/rust/

Debian is on 1.64 even for experimental
<https://salsa.debian.org/rust-team/rust>. Stable releases are on _much_
older versions <https://tracker.debian.org/pkg/rustc>.

Ubuntu <https://launchpad.net/ubuntu/+source/rustc> is on 1.65.

It will be interesting to see what the distros do to handle this situation.

<snip>
>
> Sundeep,
>
> Please also try to backporting the fixes to say Cargo/Rust for kirkstone.
> This CVE resulted in ~10 patches so it's hopefully one
> of the more complicated back ports and will prove to be a good test case.
>
> The patch series for CVE-2022-46176
<https://github.com/rust-lang/wg-security-response/tree/main/patches/CVE-2022-46176>


> ../Randy
>
> <snip>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176070):
> https://lists.openembedded.org/g/openembedded-core/message/176070
> Mute This Topic: https://lists.openembedded.org/mt/96218038/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002dbb5905f3bb6d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Jan 17, 2023 at 6:08 PM Randy MacLeod &lt;<a =
href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <div>&lt;snip&gt;</div>
    <p>The Rust developers / community seems to want their software to
      work in a similar way.<br>
      They have a quite exhaustive test suite (Crater) to check for
      regressions.<br>
      I&#39;ll look for some actual test results from Crater and reply here
      when I find them.</p></div></blockquote><div>There is a=C2=A0<a href=
=3D"https://github.com/rust-lang/crater">Crater</a>=C2=A0chapter in the=C2=
=A0<a href=3D"https://rustc-dev-guide.rust-lang.org/tests/crater.html">Rust=
 docs</a>=C2=A0</div><div>I haven&#39;t found any test runs/results in thei=
r GitHub actions yet...</div><div>There is <a href=3D"https://github.com/ru=
st-lang-nursery/rust-toolstate">rust-toolstate</a>, but it only shows the s=
tatus per commit, not the test case results.</div><div><br></div><div>Ah, p=
erhaps these are the Crater tests?<a href=3D"https://github.com/rust-lang-c=
i/rust/actions">=C2=A0https://github.com/rust-lang-ci/rust/actions</a></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      I not sure what to make of the &quot;Rust Editions&quot; and how they=
&#39;d fit
      into our distro support<br>
      but the clear mandate from upstream is that only the &#39;stable&#39;
      release is supported.<br>
    </p>
    <p>=C2=A0=C2=A0 <a href=3D"https://doc.rust-lang.org/edition-guide/edit=
ions/index.html" target=3D"_blank">https://doc.rust-lang.org/edition-guide/=
editions/index.html</a>=C2=A0=C2=A0
      <br>
    </p>
    <p>I think there&#39;s an argument to be made that until Rust releases
      2.x, we just update<br>
      to the latest version. If you haven&#39;t please read:</p>
    <p>=C2=A0
<a href=3D"https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-o=
lder-releases/18152/3?u=3Dsundeep-kokkonda" target=3D"_blank">https://inter=
nals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=
=3Dsundeep-kokkonda</a></p></div></blockquote><div>Fedora&#39;s Josh Stone =
mentioned that they keep the latest <a href=3D"https://src.fedoraproject.or=
g/rpms/rust">rust</a>=C2=A0packaged for all supported Fedora releases:</div=
><div><a href=3D"https://packages.fedoraproject.org/pkgs/rust/rust/">https:=
//packages.fedoraproject.org/pkgs/rust/rust/</a></div><div><br></div><div>D=
ebian is on 1.64 even for <a href=3D"https://salsa.debian.org/rust-team/rus=
t">experimental</a>. Stable releases are on _much_ older <a href=3D"https:/=
/tracker.debian.org/pkg/rustc">versions</a>.</div><div><br></div><div><a hr=
ef=3D"https://launchpad.net/ubuntu/+source/rustc">Ubuntu</a> is on 1.65.</d=
iv><div><br></div><div>It will be interesting to see what the distros do to=
 handle this situation.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div>
    <p>&lt;snip&gt;</p>
    <p>Sundeep, <br>
      <br>
      Please also try to backporting the fixes to say Cargo/Rust for
      kirkstone. <br>
      This CVE resulted in ~10 patches so it&#39;s hopefully one<br>
      of the more complicated back ports and will prove to be a good
      test case.<br>
      <br></p></div></blockquote><div>The patch series for=C2=A0<a href=3D"=
https://github.com/rust-lang/wg-security-response/tree/main/patches/CVE-202=
2-46176">CVE-2022-46176</a>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><p>
    </p>
    <p>../Randy</p>
    <p>&lt;snip&gt;</p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176070): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176070" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176070</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96218038/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
96218038/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002dbb5905f3bb6d81--

