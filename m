Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05A3C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 19:19:31 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.4813.1703013567822932828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 11:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUAHjEiv;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e2168ab09so6089048e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 11:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703013566; x=1703618366; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUNB8j+iwhkgwQwLqEDk/VMrJTO6ceOn4N41JlJe6Uw=;
        b=aUAHjEiv13XbSmZEWXy+9qy8AvGYAd//yJQed1FggmxiVKpba8McTCFrRTKl46Y+BU
         XikX6RV/99TQoeM6CYp8RqDxpibxlQL/LPXCgMAP2Di4MQYAdm/v0J/rZt6fRI9VmSkM
         YUz/Un8/W7MtKeXn4agADjdwwkQ7OgXjoMPqk8p5M/szhFW9Hmz+Vi8p7Ju88CS8d1n8
         MDYD1CsJSZdKtFQAQvwDbf1QIknx3U6DyJsl/1Bl5/4+u4/Lh15xsKd31H/TY/6vFwpS
         fXNR6DvDiI68ORUkq4sp/YgCkP0sa4ajKQrY9ljwW3WWCPzNmtVijIlZmyokuc1DDMIJ
         k/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703013566; x=1703618366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUNB8j+iwhkgwQwLqEDk/VMrJTO6ceOn4N41JlJe6Uw=;
        b=sDMBrcoQoBoEz/y/CEoPP2C4eiq4/pg7vZ2gi3p7YYzROMnz5QAExHuE34jsenS7WO
         yx3CjvXDV26aJq2AyAc8aA/ICxfytv5gxnb0W4BZhkK7K2NJT2JynuuZctMrwK4BsBXL
         K6R0zZbF+0JyfvCXryWYQTUeWDAJEgTrLlqlO75NRNHbnYIo8aquERrlRLbCXMiFDLMl
         OU6KLjgXqE7lquIDorEX9P75aJbyzg8okruuUHOucy3RH+uYbYNyxmKwZ1GUysI84R3D
         3679yCY5o+35XgxWLXBOtsWDFsNW1ImDurN6fCJj+4lBBXSvH50IvXiGMwqWEAKsL9YH
         njRw==
X-Gm-Message-State: AOJu0Yze3wcvRZ6GEUJTLqrq3gYySWCLp+ln90js8UX9G3iiib3oFwp+
	c1oHcuHr1xxVD+M9LthWQx1YST1jtzJpoHIgsIE=
X-Google-Smtp-Source: AGHT+IE1HZEX1AHXghJZUDYELp4RykR/dE3+KOXBWgg6IpviNWJZ5jxLcwWptd/KDFFrFXm8OGXvMxi1veyZGO1NwX0=
X-Received: by 2002:a05:6512:b9f:b0:50c:19:5909 with SMTP id
 b31-20020a0565120b9f00b0050c00195909mr11644154lfv.18.1703013565541; Tue, 19
 Dec 2023 11:19:25 -0800 (PST)
MIME-Version: 1.0
References: <SJ1PR11MB612945FEF0196ABDC4C53FFBEB97A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB612945FEF0196ABDC4C53FFBEB97A@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 19 Dec 2023 19:19:12 +0000
Message-ID: <CAO5Uq5STtbUL6oh-unPR6dUNaoHwbwQ0EanZvsscxUxfkaBKfw@mail.gmail.com>
Subject: Re: [OE-core] Rust Oe-selftest Updates
To: Yash.Shinde@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Sadineni, Harish" <Harish.Sadineni@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	"Kallapa, Umesh" <Umesh.Kallapa@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192757

On Tue, Dec 19, 2023 at 2:28=E2=80=AFPM Shinde, Yash via
lists.openembedded.org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> I tested rust oe-selftest with Alex's rust: Upgrade 1.71.1 -> 1.74.1 patc=
h(https://lists.openembedded.org/g/openembedded-core/message/192277) and st=
ill the same failures are observed as seen in the earlier versions.
>
> Currently, we are checking the root cause of this issue and trying to che=
ck the required target specifications for poky target(x86_64-poky-linux-gnu=
).
>
> error: the option `Z` is only accepted on the nightly compiler
> help: consider switching to a nightly toolchain: `rustup default nightly`
> note: selecting a toolchain with `+toolchain` arguments require a rustup =
proxy; see <https://rust-lang.github.io/rustup/concepts/index.html>
> note: for more information about Rust's stability policy, see <https://do=
c.rust-lang.org/book/appendix-07-nightly-rust.html#unstable-features>
>
> error: 1 nightly option were parsed
> thread 'main' panicked at synthetic_targets.rs:66:9:
> failed to gather the target spec for x86_64-poky-linux-gnu
> note: run with `RUST_BACKTRACE=3D1` environment variable to display a bac=
ktrace
>
> https://github.com/rust-lang/rust/commit/a56c829e747a6ee2e1a1d8d20472f3a5=
a4d95c79?diff=3Dsplit&w=3D0#:~:text=3D//%20To%20get%20the,with%20%60%2DC%60=
%20flags.
>
> From rust 1.72, as mentioned in the comments(in above commit), the 'get_c=
urrent_target_config()' function fetches the target specs using '--print=3D=
all-target-specs-json' and '--print=3Dcfg --target=3D$target' but that's no=
t working in this case and gives the following error as the rust built is s=
table one.
>

My feeling is upstream isn't going to change their view on the -Z
options. I wonder if something like a change to inject the target
specs to the test framework might be acceptable to them?

I'll be in the office with our resident rustacean on Thursday, I'll
try and remember to get his view across this stuff.

--=20
Alex Kiernan

