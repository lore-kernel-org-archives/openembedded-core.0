Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72643C624D3
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 18:02:10 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167.1788631327136317872
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 11:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j6+TNEEh;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8200b55dc47so27239317b3.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 11:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788631326; cv=none;
        d=google.com; s=arc-20260327;
        b=FXQ+gMpBsR72oQIViajbx93gO2YRF8zYQcPNJlzuA6JbPvRJj7rlP0KwQo8vs1Xh88
         GE73+NvooFdg3wqaLIsOiQNboqVaJmfuMR6sApAfhdkSCyncVfVU2iCis3T+sRSkhB+l
         Kxdng+vd2fRN/4BkRdReG4uo1ioXcv1/l+zjA2jBjJkv7vU7SG7M723FBcaZjccMYjbK
         VrEF+LNVFu2N2dPl5s3+TsaqvPDwKHYVQ6B/1/CL5B9vmBUxbNGV0L+thzdNTWH5WpyE
         I3ciY2biFXVm+wGqd0SreP4QUEubzxjCiltCOfgDlhJYuX/W/SzM0VnuvMrQLAu54AwV
         XbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V1pxA4ZDg2Ju1xY+lYtHexeLk2UiOUtk0w+83vYSy4U=;
        fh=1OhkTCE7SeWDLzlx5UncT1DuIRvei4gwg2D8aZxYMzE=;
        b=E3zZyZDxagdv2+Urh/JAmVMHhOINYtpDy9FGkLClpyTuV7q9Hhz85rTyGpI26eA9lv
         7hzh2mJ3qiIUXrJeHgaNQKcdhZ9U8414sADhdNQglsW95JNwRH2U+3CSILKs7leW8QRw
         wORYKOqEFiI8InVzcQkqSPsjU6u/SwpOy4MutI821n6CN/xrX3WlBj1EFSf6HSbSkJUm
         DHMUou9wqrFmDXT0oLFUWyYYMhavdsq4FrYF3H5Ayzg3M4fZWXhGe5YWwE5BfAM17quR
         U7nR6oiH96O4abta/Pmxb48U3xZuEFRJ1dbn53FERu1qfPHfXgPDO/wk+xZyyWvCqv6n
         IrZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788631326; x=1789236126; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1pxA4ZDg2Ju1xY+lYtHexeLk2UiOUtk0w+83vYSy4U=;
        b=j6+TNEEhFV9I2ai0Gmzcpqh4cQpLSMj+9FqmkUQ2jEkazoWHy6Tsm+/C88CXrbkTcH
         RjAKaeMEtfvv82akSPTHz2R+EDvcXs5XzXFXcBtUvKt9BHPfvG0eImRFe2Kxafy98PgE
         OrsfWBzGhSl/YX3hCeI8j83KzcwjXs8sEvUjW9QHXz5eZgN1uabqgIM3YqZ+kBc4EiUg
         C0OkPBt163HhKJO59oeQIbJbUpsECTwSyMIe3cu6wkDOCW8/PF8DnZJQO16cY3HrbQJu
         19PYX0M1agxaladvIUANyRWOEEIkr7JrUyGqA88ddyiHviIe+9loCR460QC/mL8bdknT
         grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788631326; x=1789236126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V1pxA4ZDg2Ju1xY+lYtHexeLk2UiOUtk0w+83vYSy4U=;
        b=r9y/pn3r93G0V967WXUVVBWByjFRY72P6LNXfgDLs4tkyP6YBO+Ta445prtEXA8NgM
         emm9sFFR20+I0vbImEjaYqrhH+Sr5krkOaf7trqwF44zYne+k53jRgT9X0gNg6Du1r7N
         JLkUW9Ho2hxPkcB0VRwdAl6+KKzxcSEIrba4mU5x1hIy15gnMdd4MZ8DaqlmWkk25Ng1
         FCbXtVKe6cljl2sG51Y9+BYCEgVq0q7uwdIkFTQ3K0LI2GL382uI3H4Ssvvv+nF0GQAw
         FWzG7RTNsUB+FE4Vk5hxaZZcfQue+zI7f+tmx8pWlh1IO+qz5e9ieXd/F2qHSWSw6oDy
         PyfA==
X-Gm-Message-State: AFuF++mDmn8BNoeoXliprGBFM0a1wwu2UfJD8yypkx6VzPLChgE58GDj
	DOoPAh80oTLhRkIY4tpKCWLezmF+AXOS4WbfniBPkOoU5MrvpIYeZJnt9VCwJtKeA0tbFlE8+JB
	gNW+QknAY051oqXDIP8nv6uG1bVnXImE=
X-Gm-Gg: AYBFou2PNSNiZJyqZLGjgfgVdvMrPmGcGG57QMd6YJfS+HxIhygNcxoOv23J0gRj3UF
	TQN3cDlBTEF72p7DniDx3NXvi0PzfcUiCGzlNfWm3VMmoKOQeAm+yqpJTQm3GalJtjmcwsT/Bef
	yO7OhN6DHtF9v0vsJ1xFO4BpDvDgFuzEbW1GzscJaQrBYp4EOumBAp26pX2qCOUQSXYxiD9m0Yy
	zQJzn/dd/ZZ2fFX5Ky5ogAc4VbRn4jPv4Dk4oKNonsK+SG4XgNM7rR3x/VQ/jzrTGBJj1SKB8iP
	S8IY/f3pmIKDsPdSs7IZ4DcInVhisI09WlTlGvWP9l5qiLt0ojF9x9AgOlvSRw4Llk8KQqB2URc
	PUNWWnAHOTLcEd1Sx5PFUlhv+pG5Wsd7ZgHbaAxyg5cJ3dOlDPdgrc5Sz46pNt/WtT93FXQ30Xo
	yoBL5zAmGp+jyW3xkagU+KnPcQngzUkWjCUuBIUpKEhVV0U229nIp3q+OE/OXu8n1y/M6P9depU
	5U0pXMaMVgq6Q==
X-Received: by 2002:a05:690c:6f03:b0:873:5c6b:a307 with SMTP id
 00721157ae682-8735c6ba9bdmr29470587b3.53.1788631326003; Sat, 05 Sep 2026
 11:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
 <CAMKF1soQRjHMiJnndyuEGrjf_VqB5fg4TjekEMgAe5cZLz8t0A@mail.gmail.com>
 <cd27e5c8-3846-4e35-bde3-643a1b753c69@windriver.com> <CAMKF1sq0eQY8h3G3BMo7osHQRYvD159Rb9ucN=twWxWKE3OJDA@mail.gmail.com>
 <CAMKF1som_-0Mhpym4hztGRGd+o8PtoOJv+WDCSc-YaAdwEgZ8w@mail.gmail.com>
 <964.1788497355893282310@lists.openembedded.org> <135420.1788614769564017900@lists.openembedded.org>
In-Reply-To: <135420.1788614769564017900@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Sep 2026 11:01:39 -0700
X-Gm-Features: AcwNN1UPYqeDzo6AmnoUjC59TkJi2X1X0OHylNgw1gtHoQRbvt3UsshkQmxXYmQ
Message-ID: <CAMKF1srEqX7GYH8BESeVZjxHE4+Sj4J3gPbr9R-16ZDVbnFSsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/11] clang/llvm: Upgrade to 23.1.0
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d217f5065ac02e66"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 18:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245149

--000000000000d217f5065ac02e66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 6:26=E2=80=AFAM Dora, Sunil Kumar via lists.openembe=
dded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:

> On Fri, Sep 4, 2026 at 10:19 AM, Dora, Sunil Kumar wrote:
>
> I am reducing a testcase and will report it to llvm, will post the link
> here.
> If a fix lands I will request a release/23.x backport.
>
> Hi Khem,
>
> I bisected llvm between 22.1.8 and 23.1.0. The problem comes from the new
> DFAJumpThreading pass
> which is on by default in clang 23. The full file takes more than 90
> minutes where clang 22 needs about
> 2 seconds.
>
> I reported it upstream with a reduced testcase:
> https://github.com/llvm/llvm-project/issues/221391
>
> There is also a better workaround than the -disable-lsr I posted earlier.
> Turning off just the new pass keeps
> LSR and behaves the same as clang 22:
>
> CFLAGS:append:toolchain-clang =3D " -mllvm -enable-dfa-jump-thread=3Dfals=
e"
>
> I sent this as v2 of your dovecot patch on openembedded-devel. Once the
> llvm fix lands I will ask for a
> release/23.x backport, then we can drop the workaround.
>

Thanks Sunil. this looks more targeted I will take v2.


>
> Thanks,
> Sunil Dora
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245148):
> https://lists.openembedded.org/g/openembedded-core/message/245148
> Mute This Topic: https://lists.openembedded.org/mt/120998127/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d217f5065ac02e66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 5, =
2026 at 6:26=E2=80=AFAM Dora, Sunil Kumar via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;SunilKumar.Dora=3D<a href=3D"ma=
ilto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>On Fri, Sep 4, 2026 at 10:19 AM, Dora, Sunil Kumar wrote:</div>
<div>
<blockquote>I am reducing a testcase and will report it to llvm, will post =
the link here. <br>If a fix lands I will request a release/23.x backport.</=
blockquote>
Hi Khem,<br><br>I bisected llvm between 22.1.8 and 23.1.0. The problem come=
s from the new DFAJumpThreading pass <br>which is on by default in clang 23=
. The full file takes more than 90 minutes where clang 22 needs about<br>2 =
seconds. <br><br>I reported it upstream with a reduced testcase:<br><a href=
=3D"https://github.com/llvm/llvm-project/issues/221391" target=3D"_blank">h=
ttps://github.com/llvm/llvm-project/issues/221391</a><br><br>There is also =
a better workaround than the -disable-lsr I posted earlier. Turning off jus=
t the new pass keeps <br>LSR and behaves the same as clang 22:<br><br>CFLAG=
S:append:toolchain-clang =3D &quot; -mllvm -enable-dfa-jump-thread=3Dfalse&=
quot;<br><br>I sent this as v2 of your dovecot patch on openembedded-devel.=
 Once the llvm fix lands I will ask for a <br>release/23.x backport, then w=
e can drop the workaround.<br></div></blockquote><div><br></div><div>Thanks=
 Sunil. this looks more targeted=C2=A0I will take v2.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br>Thanks,<br>Suni=
l Dora<br><br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245148): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245148" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245148</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120998127/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120998127/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d217f5065ac02e66--

