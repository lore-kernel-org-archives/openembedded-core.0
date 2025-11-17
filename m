Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F18ECE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 18:15:15 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16485.1763403310753629390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 10:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z97cBvNM;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-640c9c85255so4803405d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403310; x=1764008110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j423iHImMhBURPtLhJtIyj9Lcmy4R/gz+bYSDjlsKss=;
        b=Z97cBvNMhs0W+vwLi7fD9vV5vE1YaO8v9rsElv3xiNRI693Fms3G49RHGdK+cwa54e
         fzjWs8vC84bU922D3WsbstVCTsP7pxyweqDYoxM59Exhd/cbchkaEwNDSXf0gaNlBYHJ
         P7xSU2FCdVG9759mA6LuWiWjsc3lxXN7nmcPo3jE0p/wE/sSBodk2TlB0QYe9o3aK93m
         R5g/W7TXvfZpg1+A0Dx8tW+KiUUT33diJ/VjSOHAvNev9uia/O3dw3GdpoPCYlKVUUYl
         hs0PRv4MnGa1joCLigo8V3shGd0mvamnV8ZuZC8Jhad3OK2+tIM0qawXgNbGFx01TKxl
         b9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403310; x=1764008110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j423iHImMhBURPtLhJtIyj9Lcmy4R/gz+bYSDjlsKss=;
        b=k7jFeFxmDmZWSPSMgP4sA2yqviNyYYUwfxrFdjARACEP+J7xjSKDPyaX21Hdj4OAXq
         JZ67DU117vndhvmR+k7OB6nx8kPtYvOjkShj7s8dR1IhvSTsWZ5iSpkUWTVXjNHPli+9
         qf0q8laWuP/Ui5FMJV8SnQoZUwX3SBpoW9Pskt7oRRajRwc2JN8kxzV2ofkam4ISSfog
         ieS2n1J13xh6XVj9yt+HqiTFDaj6rOK2Nxah8IRWjBDB4kSx8I7KnZPMfpYB4gsIRHuV
         Ki3cvv/K7QysFmwWgSB52ZClABSzLPvnzA3fcN6OKE0A9+CAuB/3RcoNfumOzhK8TPxM
         zGHA==
X-Gm-Message-State: AOJu0Yx8mz5tftxpKLF5sdZ1dTTlto2ML62N7UIwKCd0uYUBd4tbqQl4
	+G+o3nHfrZGYQIMmLl6bn999WXod3yIn6RhUnYuWUImhBoxWwtDmw17rdY95B+yvj0lFzYpbThh
	BirbGYTtSNeSfBaZc3DndWaNVyIbnUL4=
X-Gm-Gg: ASbGnct5L8JvS/7pJHvm3Ddjt9P7QXYNdgBFSJ+R6jTX98i60feNAaW7yM1Z2Nn2bTC
	VETrbkUlBGDkhXRIVsgzBVd+48hYhWfJoY+PskQyjVpcOicfCpv22VdtJpjKI9/JSIJHOlsF6Af
	2JgwpPg1cUqqUjNeEj3hekdf3sjm4P0HehC/Ah6g7TyUc22kwSJ0N0Kt/SgSrC1dGb+0/bX81Ea
	1he8dpiNx7pl6WyUR+LjEOFsm3sKk3N8yb6PVd4RstyharSx5IQcJgbrca3v9nRgovRBq9TwOuN
	J63hWKM/r6ZMMXWYZya1KXNpsliFCqShErHJOh65RkrWQs0+9x8bCGFT1OrWoGqeyUrLfrBOGVL
	Z32rqOwbeYQK6
X-Google-Smtp-Source: AGHT+IF4d0OyfyTlsv8XXAIXgykhUC8Cb/YxmTUy8oJN0LQiUmFsK5FrI83ZRYMx+jqY614tTczsvF3LYc4iSItfFSY=
X-Received: by 2002:a05:690e:1590:20b0:641:f5bc:68d2 with SMTP id
 956f58d0204a3-641f5bc716amr6185616d50.79.1763403309458; Mon, 17 Nov 2025
 10:15:09 -0800 (PST)
MIME-Version: 1.0
References: <3718eb98-0915-475c-b2bf-8e4743a5c098@windriver.com>
In-Reply-To: <3718eb98-0915-475c-b2bf-8e4743a5c098@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Nov 2025 10:14:43 -0800
X-Gm-Features: AWmQ_bkDkk2Aj1p_tmujVukY1p5IJGUYyPsAX8YK_9lCfpV41uxRdnWTbKSUq4Q
Message-ID: <CAMKF1sqanamwazZxAgZ8-Eza45_kviQ+Ut+G7rxuZTVs8v8kuQ@mail.gmail.com>
Subject: Re: [OE-core] Analysis of Rust v1.91.0/1 build issues
To: Yash.Shinde@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>, peter.tatrai.ext@siemens.com, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000db2b270643ce5388"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 18:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226507

--000000000000db2b270643ce5388
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:12=E2=80=AFAM Yash Shinde via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:

> Hi everyone,
>
> We are working on Rust v1.91.0 and v1.91.1 version upgrade and the branch
> is available here:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddeepesh/y=
s_rust_191
>
>
> Following observations were made when testing in AB and local setup:
>
> 1. Initial testing without new bitbake setup (previous old workflow):
> The test suite builds passed successfully on AB (tested on 31-10-2025)
> when tested without the new bitbake-setup.
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2592
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2809
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/653
>
>
>
> 2.  Issues post individual clones of bitbake and oe-core:
> After the poky repo was dropped, we tested the test suite with new local
> setup
> and the same "target-rust-ccld" linker issue (missing zlib and zstd)
> was observed for "all targets" as seen by Peter Tatrai for ppc64.
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2646/s=
teps/13/logs/stdio
>
> https://lists.openembedded.org/g/openembedded-core/message/225636
> This issue was resolved after passing zlib and zstd to the testing image
> as described in Peter's patches:
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3Db7f2339d3c94d9167a9dbcead963fd3555fad8f9
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D36cc3834dc66e78c0a90306c6e4a8c28c6254aac
>
>
Interesting, does this happen when we switch default linker to lld all
across targets ? I think lld is not yet tested for all
rust targets except x86_64 upstream and it does not do overlinking, so it
will catch missing indirect dependencies like these


>
> 3.  Local Testing Observations:
> While the above failure was resolved however there was another error as
> follows:
>
>
>
>
>
>
>
> *1 command(s) did not execute successfully:      - Command
> `/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/recipe-sysro=
ot-native/usr/bin/cargo
> run --target x86_64-unknown-linux-gnu -Zbinary-dep-depinfo -j 192
> -Zroot-dir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/=
sources/rustc-1.91.1-src
> --frozen --release --manifest-path
> /home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc=
-1.91.1-src/src/tools/tier-check/Cargo.toml
> /home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc=
-1.91.1-src/src/doc/rustc/src/platform-support.md
> /home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.9
> 1.1/sources/rustc-1.91.1-src/build/x86_64-poky-linux-gnu/stage2/bin/rustc
> [workdir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/so=
urces/rustc-1.91.1-src]`
> failed with exit code 101  Created at:
> src/bootstrap/src/core/build_steps/tool.rs:174:21  Executed at:
> src/bootstrap/src/core/build_steps/test.rs:3436:55  Build completed
> unsuccessfully in 0:32:58*
>
> This issue has not been observed on AB so far.
>
>
>
> 4.  Subsequent failure in openssl-sys build in AB:
> When tested the same in AB, we encountered another failure while building
> openssl-sys (v0.9.109).
> The error log points to an issue during the execution of the openssl-sys
> custom build command: (line no. 34569):
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2639/s=
teps/13/logs/stdio
>
> It appears to be related to a failure in executing the build script for
> openssl-sys.
> The failure may be intermittent.
>
> Error Message:
>
> *error: failed to run custom build command for `openssl-sys
> v0.9.109`Caused by:  process didn't exit successfully:
> `/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-3420499/tmp/wor=
k/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/build/x86_64-un=
known-linux-gnu/stage2-tools/release/build/openssl-sys-bc375833fe379304/bui=
ld-script-main`
> (exit status: 101) *
>
>
>
> 5. Segfault Issues Reported by Mathieu:
> Additionally, Mathieu reported segfaults during the do_test_compile and
> do_install steps of the Rust build, potentially related to corrupted
> sstate-cache.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16058
> We have not been able to reproduce this issue locally at this point.
>
> Currently, with recent changes in bitbake we are experiencing rust v.1.91
> build issues.
> We are investigating the cause for these issues and the inconsistency in
> local v/s AB .
>
> Any suggestions, insights, or pointers regarding the above issues would b=
e
> highly appreciated .
> Thanks.
>
>
>
> Regards,
> Yash
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226494):
> https://lists.openembedded.org/g/openembedded-core/message/226494
> Mute This Topic: https://lists.openembedded.org/mt/116338092/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000db2b270643ce5388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 17,=
 2025 at 6:12=E2=80=AFAM Yash Shinde via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;Yash.Shinde=3D<a href=3D"mailto:wind=
river.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></=
u>

 =20
  <div>
    Hi everyone,<br>
    <br>
    We are working on Rust v1.91.0 and v1.91.1 version upgrade and the
    branch is available here:<br>
    <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Ddeepesh/ys_rust_191" target=3D"_blank">https://git.openembedded.org/ope=
nembedded-core-contrib/log/?h=3Ddeepesh/ys_rust_191</a><br>
    <br>
    <br>
    Following observations were made when testing in AB and local setup:<br=
>
    <br>
    1. Initial testing without new bitbake setup (previous old
    workflow):<br>
    The test suite builds passed successfully on AB (tested on
    31-10-2025) when tested without the new bitbake-setup.<br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/=
builds/2592" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/66/builds/2592</a><br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/=
builds/2809" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyri=
e/#/builders/37/builds/2809</a><br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/=
builds/653" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie=
/#/builders/58/builds/653</a><br>
    <br>
    <br>
    <br>
    2.=C2=A0 Issues post individual clones of bitbake and oe-core:<br>
    After the poky repo was dropped, we tested the test suite with new
    local setup=C2=A0<br>
    and the same &quot;target-rust-ccld&quot; linker issue (missing zlib an=
d
    zstd)=C2=A0<br>
    was observed for &quot;all targets&quot; as seen by Peter Tatrai for pp=
c64.=C2=A0<br>
    <br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/buil=
ds/2646/steps/13/logs/stdio" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/#/builders/66/builds/2646/steps/13/logs/stdio</a><br>
    <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
25636" target=3D"_blank"><br>
      https://lists.openembedded.org/g/openembedded-core/message/225636</a>=
<br>
    This issue was resolved after passing zlib and zstd to the testing
    image as described in Peter&#39;s patches:<br>
    <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dm=
aster-next&amp;id=3Db7f2339d3c94d9167a9dbcead963fd3555fad8f9" target=3D"_bl=
ank">https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&amp;id=3Db7f2339d3c94d9167a9dbcead963fd3555fad8f9</a><br>
    <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dm=
aster-next&amp;id=3D36cc3834dc66e78c0a90306c6e4a8c28c6254aac" target=3D"_bl=
ank">https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&amp;id=3D36cc3834dc66e78c0a90306c6e4a8c28c6254aac</a><br>
    <br></div></blockquote><div><br></div><div>Interesting, does this happe=
n when we switch default linker to lld all across targets ? I think lld is =
not yet tested for all</div><div>rust targets except x86_64 upstream and it=
 does not do overlinking, so it will catch missing indirect dependencies li=
ke these</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>
    <br>
    <br>
    3.=C2=A0 Local Testing Observations:<br>
    While the above failure was resolved however there was another error
    as follows:<br>
    <br>
    <i>1 command(s) did not execute successfully:<br>
      =C2=A0<br>
      =C2=A0 =C2=A0- Command
`/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/recipe-sysroot=
-native/usr/bin/cargo
      run --target x86_64-unknown-linux-gnu -Zbinary-dep-depinfo -j 192
-Zroot-dir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/so=
urces/rustc-1.91.1-src
      --frozen --release --manifest-path
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1=
.91.1-src/src/tools/tier-check/Cargo.toml
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1=
.91.1-src/src/doc/rustc/src/platform-support.md
      /home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.9=C2=A0 =C2=A0=
 =C2=A0
1.1/sources/rustc-1.91.1-src/build/x86_64-poky-linux-gnu/stage2/bin/rustc
[workdir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sour=
ces/rustc-1.91.1-src]`
      failed with exit code 101<br>
      <br>
      =C2=A0Created at: src/bootstrap/src/core/build_steps/tool.rs:174:21<b=
r>
      =C2=A0Executed at: src/bootstrap/src/core/build_steps/test.rs:3436:55=
<br>
      =C2=A0Build completed unsuccessfully in 0:32:58</i><br>
    <br>
    This issue has not been observed on AB so far.<br>
    <br>
    <br>
    <br>
    4.=C2=A0 Subsequent failure in openssl-sys build in AB:<br>
    When tested the same in AB, we encountered another failure while
    building openssl-sys (v0.9.109).=C2=A0<br>
    The error log points to an issue during the execution of the
    openssl-sys custom build command: (line no. 34569):<br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/=
builds/2639/steps/13/logs/stdio" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/66/builds/2639/steps/13/logs/stdio</a><br>
    <br>
    It appears to be related to a failure in executing the build script
    for openssl-sys.=C2=A0<br>
    The failure may be intermittent.<br>
    <br>
    Error Message:<br>
    <i>error: failed to run custom build command for `openssl-sys
      v0.9.109`Caused by:=C2=A0 process didn&#39;t exit successfully:=C2=A0=
<br>
`/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-3420499/tmp/work/=
x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/build/x86_64-unkn=
own-linux-gnu/stage2-tools/release/build/openssl-sys-bc375833fe379304/build=
-script-main`
      (exit status: 101)=C2=A0</i><br>
    <br>
    <br>
    <br>
    5. Segfault Issues Reported by Mathieu:<br>
    Additionally, Mathieu reported segfaults during the do_test_compile
    and do_install steps of the Rust build, potentially related to
    corrupted sstate-cache.<br>
    <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16058" t=
arget=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16058<=
/a><br>
    We have not been able to reproduce this issue locally at this point.<br=
>
    <br>
    Currently, with recent changes in bitbake we are experiencing rust
    v.1.91 build issues.<br>
    We are investigating the cause for these issues and the
    inconsistency in local v/s AB .<br>
    <br>
    Any suggestions, insights, or pointers regarding the above issues
    would be highly appreciated .<br>
    Thanks.<br>
    <br>
    <br>
    <br>
    Regards,<br>
    Yash
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226494): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226494" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226494</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116338092/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116338092/1997914</a><br>
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

--000000000000db2b270643ce5388--

