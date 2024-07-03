Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECB3C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:58:45 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.47533.1720000723704214599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjuyjJRd;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee7885aa5fso17470791fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000722; x=1720605522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z+U9ELKMxEB5rSl6xW17pyk2yjF0s/PAxSPkxEcUEoc=;
        b=HjuyjJRdI6yindZvgIULUZ2T3zQHhuCNWZsPqnzsSC8FVKFbFgpmWR16fNOZzclHFB
         zUk1+/kPHIrycXyS33WNSgNCjEhRn5rhu6rTGAYT+U5yd1aRm9z2TJ6mQED0MakYujJh
         QpenGnNXJGwBZXxJKDIL674a1FLo9DtsQ9NApLtSg5tYEZOe6vDkaHkPqM+nC9gOdRrX
         S7gIOYdNavMTX3tNTWBs+QoRwNvW5UXC+eUV3jAPTyD1ix0E/6LwrTlqUCTMZL7UHsRQ
         WIKTi6mGYpQQqdDYsZE3SukVe420uNaX0YykUddEn5NjVEB8Vst5UNZlWGsNyRt03GMy
         ew+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000722; x=1720605522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+U9ELKMxEB5rSl6xW17pyk2yjF0s/PAxSPkxEcUEoc=;
        b=AocHtu3kuB7bqDUZmWIB5faywWCKwks2NO4ZfqzEVnZCERnIigf6H3CTHgJLxbo8nQ
         PUeWBblIpd8/hZJF2KOaxWjStNvRQ1mxVqcJCWGT+rKdLFtqj02/j0bdtsgk9vnLJ4L1
         /Hfz+dFNl2EWEx4oJLg0RAHomVatR+m+fqtDxMDDkj+kSkDigOoIHoero9rx+O9K4UMl
         0yPZRRB1Z8eDAygRVYWEdFkuDBgM72uHCEHwrJ7K7wY8O3uMqs6vIqBU0mhkplCbL025
         P0C0JNvJ5UmbxTc3hKCQtFkmiyVfeiViH8K+gHcYIa4TGDDAfT+0prqRlKhxgGCXQMk8
         DqGA==
X-Gm-Message-State: AOJu0YwNj1gZxek835sNYCWrzEM9UY1/XpzIfp/xGx8ZiH75+08I2TMs
	4COLm5yNE7y+RtUexYONA6ehIZ7FiJOo/HfRlaMdxbU9lN6ZDGrOmpX5jvlWztsh7YOSBD+EESE
	z9H53g9J9+nAAIUaR6p72FgiFvacj34NW
X-Google-Smtp-Source: AGHT+IHHZhP7jUkHcA23iN1+D+OMCX36e71JW0lhzKpcgs6foYjGhrW6huwkIL0II65qp6b9czEpJD1bmPX5VY6bnkU=
X-Received: by 2002:a05:6512:3990:b0:52c:d9a3:58af with SMTP id
 2adb3069b0e04-52e8270fb87mr7237366e87.49.1720000721359; Wed, 03 Jul 2024
 02:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
 <2056.1719220048661049006@lists.openembedded.org> <CANNYZj-9Ky0Rw1022XDSuTxnABHjkxg0vtJYYi6pxATwqwCGxw@mail.gmail.com>
 <12dd26bc-91c1-4af7-b756-ff42967fe5f6@windriver.com> <CANNYZj-jWdnRXTbFL0fMYvbVTAeSBi3qka9WgcixrMPsf7Tmww@mail.gmail.com>
 <e5d56e42-52ac-4beb-be95-01e19c65773c@windriver.com>
In-Reply-To: <e5d56e42-52ac-4beb-be95-01e19c65773c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jul 2024 11:58:29 +0200
Message-ID: <CANNYZj-m-m+B3iaNLHeEq5C9w5Rfg28fGY+U8ezaZS6N33P4Ag@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000029dc0061c54e0b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201466

--000000000000029dc0061c54e0b0
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 10:09, Sundeep KOKKONDA <
Sundeep.Kokkonda@windriver.com> wrote:

>
> I ran both with 'bitbake -c install rust' which runs a complete build up
> to install task, and then checked that rustdoc in image/ is different
> between them. The other tasks aren't relevant, and you can ignore lack of
> package/ etc.
>
> You need to check the difference in content of rustc-1.75.0-src/ (this is
> where the build runs and intermediate artefacts are), and maybe
> temp/log.do_install will give clues about rustdoc as well.
>
> Hi Alex,
>
> I am checking the build artifacts generated and finding the probable
> reasons to identify the issue. While looking onto *.../temp/* I've seen a
> log - '*log.do_recipe_qa_setscene*', as per my understanding this task
> ensure that the build system can reuse previous build results to avoid
> unnecessary recompilation and to speed up the build process and which needs
> sharing of *sstate*. This log only seen in '*build-64-2*' directory (not
> in '*build-64*' dir).
>
> Also, I've checked my previous builds where sstate not shared and this
> task was not executed. In may case, I made multiple builds and the issue
> not reproduced w/o sharing sstate. Can you check local.conf settings the
> sstate is disabled? and when will the '*do_recipe_qa_setscene'  *task
> execute w/o sstate sharing?
>

 Hello Sundeep,

recipe_qa task is only used for QA checks on the recipe and has no
influence on what gets built and installed. The actual build and
installation happens in do_install task, and both tarballs have a built
tree where do_install was fully executed, with results going into image/
(specifically, that directory has two different rustdoc executables).

So you can ignore any other task, regardless of whether it's fulfilled from
sstate or not. The key pieces in the tarballs are the content of image/
(where rustdoc differs), temp/log.do_install (the log for build and
installation which may give clues to where things diverge), and the content
of rustc-1.75.0-src/. The challenging part for you is to narrow this down
to the specific point where the two builds diverge.

Alex

--000000000000029dc0061c54e0b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 3 Jul 2024 at 10:09, Sundeep KOKKONDA &lt;<a href=3D"mailto:=
Sundeep.Kokkonda@windriver.com">Sundeep.Kokkonda@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div><br><blockquote type=3D"cite"><div><div dir=3D"ltr"><div>I ran both =
with &#39;bitbake -c install rust&#39; which runs a
            complete build up to install task, and then checked that
            rustdoc in image/ is different between them. The other tasks
            aren&#39;t relevant, and you can ignore lack of package/ etc.<b=
r>
          </div>
          <div><br>
          </div>
          <div>You need to check the difference in content of
            rustc-1.75.0-src/ (this is where the build runs and
            intermediate artefacts are), and maybe temp/log.do_install
            will give clues about rustdoc as well.</div>
        </div>
      </div>
    </blockquote>
    Hi Alex,<br>
    <p>I am checking the build artifacts generated and finding the
      probable reasons to identify the issue. While looking onto
      <i>.../temp/</i> I&#39;ve seen a log - &#39;<i>log.do_recipe_qa_setsc=
ene</i>&#39;,
      as per my understanding this task ensure that the build system can
      reuse previous build results to avoid unnecessary recompilation
      and to speed up the build process and which needs sharing of <i>sstat=
e</i>.
      This log only seen in &#39;<i>build-64-2</i>&#39; directory (not in &=
#39;<i>build-64</i>&#39;
      dir).</p>
    <p>Also, I&#39;ve checked my previous builds where sstate not shared an=
d
      this task was not executed. In may case, I made multiple builds
      and the issue not reproduced w/o sharing sstate. Can you check
      local.conf settings the sstate is disabled? and when will the &#39;<i=
>do_recipe_qa_setscene&#39;=C2=A0
      </i>task execute w/o sstate sharing?</p></div></blockquote><div><br><=
/div><div>=C2=A0Hello Sundeep,</div><div><br></div><div>recipe_qa task is o=
nly used for QA checks on the recipe and has no influence on what gets buil=
t and installed. The actual build and installation happens in do_install ta=
sk, and both tarballs have a built tree where do_install was fully executed=
, with results going into image/ (specifically, that directory has two diff=
erent rustdoc executables).</div><div><br></div><div>So you can ignore any =
other task, regardless of whether it&#39;s fulfilled from sstate or not. Th=
e key pieces in the tarballs are the content of image/ (where rustdoc diffe=
rs), temp/log.do_install (the log for build and installation which may give=
 clues to where things diverge), and the content of             rustc-1.75.=
0-src/. The challenging part for you is to narrow this down to the specific=
 point where the two builds diverge.</div><div><br></div><div>Alex<br> </di=
v></div></div>

--000000000000029dc0061c54e0b0--

