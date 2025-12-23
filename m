Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9038AE6F098
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 14:55:44 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102451.1766501742921874853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 06:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYzApwa/;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6447743ce90so4674657d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766501742; x=1767106542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSyaARfZeK3z9QYbEDvvJwfy6LkNqr50SCeGd6G6yU0=;
        b=iYzApwa/gfkmsJMJb9l7QdcJWVKL1iTKG3ig3zfyCut5OoKyDUJzjCEbQLHKtPNEPH
         PCo2tTdNodWRp8R2ONEwt0geWi4jIEjXaH6aB1IlzwAZ15Mp8234RIgpBbeKwFZPcwMq
         2l7XlAjRJ/7kgHoTxr+Rq1icLGfj2SQTTSWxnWNkRaP/9b4qHAThH2APkC+cKFVOYNmT
         u4B9C07z+2qO+EerELa2ALsH1fJBRat5uJtgGJiwrHmnt9phW1KBzmYdH5oHSRriuvSz
         yG7OsGIWw7KX6N6sc1fzQNShiZLSn3VrHikX3PrJDnYlK10WJ9Na3CVP7UHTDlYFHnRQ
         zg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766501742; x=1767106542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSyaARfZeK3z9QYbEDvvJwfy6LkNqr50SCeGd6G6yU0=;
        b=C/fEa5rMLul7Jl6ZyUf/40KwipRLfX4rFWoMFjIa8HbJos+waM+j571lYtQ+XTGo/R
         tVPfmw26YhSS2GLxLQlb+4CQZIr0L3etwTW4fY0LeEMq3NbLmlRFG4FTXGQnJj1bM22Z
         ODBIDR+9HcG/0D05f7LJggT05InZZ9H+BwS7wlRC/pKZ4OPwj/2rEa/e6cDES0oqzxiX
         v7kHtnaz7rRAdrGzidiqgEwDlFAJq+UW/eXlq0YcOUMC4wNjby0/o/2dSX0WGUQ4AYYm
         RDbwoYgsBNUVz86RAjU+wXukNwaLVsSwawKfD7E+U6Q1E1iyAd9qQFaJiz3F4TumSeFS
         VbyA==
X-Gm-Message-State: AOJu0YwzSQY6HAUlVXgSzJpj9mw3qpcsB7IDNT2Py2puZ5XQ11PAJUjE
	XFIhB0xpzhSdlq6Eo3VFNEeipj4FNw7jMK5jjU5FJnivVHloyX5WpNUQ8KJDD/TOvGMFOq5NnRo
	1jk7jwVBQz7ap0QZCWV2FGzvjGqwJweU=
X-Gm-Gg: AY/fxX5JUc7kIkxVoqkvRaAZ4UmdrPUpQpaCLWjzpXgXmpcQrxDYS1v2rWqA4AL+Ho9
	3kxaVlOgkf5yA+MQE8VdARU507GB8Z2Id0Z9FaXi5gBfE3lyBjI5EmHQ4Ng46K2w7fZtLOkKc0I
	OlrSQkPpzK9zroxF5H76BRmNHb5iiKG5yTkGIIWbPs/qc2RXofZAgMB6Mcs84WoHOusKCvb9FhT
	o84XmZcvgXzCCQ2iU1RGYQClV6iFD7AWQUhpemDcXjru2Os6/QdNdfoi+/5d7UaEC5QwsMwgOTL
	spx5eQsv5Id6H3hBomNMtsy29SQFzlxleinjHIKDZBnPTw+pF9mruYucqKWV4D4p1gkw0lpCArW
	s/JYF1JfGegssQ4ZDpGZAVGpu9afxKbtxqZm/lXSsTeBq7lUMK0F7nJSV
X-Google-Smtp-Source: AGHT+IGzjMN5WDsQi5dJF/nceb1aWNM2H1CIuJZ79juRK/JmNitWsnZWSqJ9Sj97G/88+VGmqc8Beg1YgR9OzGD9DR8=
X-Received: by 2002:a05:690e:140f:b0:644:542b:bd1d with SMTP id
 956f58d0204a3-6466a84c22fmr12687856d50.35.1766501741732; Tue, 23 Dec 2025
 06:55:41 -0800 (PST)
MIME-Version: 1.0
References: <14ecad42-51fb-4abc-a493-c58cfadb9688@windriver.com>
In-Reply-To: <14ecad42-51fb-4abc-a493-c58cfadb9688@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Dec 2025 06:55:30 -0800
X-Gm-Features: AQt7F2rGXS1KypO_JNS0dRr6a8add8cSrHEaJHRirmTh4fdmtvRk48O1bf910Ik
Message-ID: <CAMKF1so7Bm9QgASazA3WnF+4mRtQqfwwFpvMHbyNsNBdo1c7Bw@mail.gmail.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.45.1 release
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000cfad8e06469fbc15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 14:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228471

--000000000000cfad8e06469fbc15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is the one that=E2=80=99s failing unexpectedly

On Mon, Dec 22, 2025 at 11:16=E2=80=AFPM Yash Shinde <Yash.Shinde@windriver=
.com>
wrote:

> From: openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> <openembedded-core@lists.openembedded.org> on behalf of Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>
> <raj.khem=3Dgmail.com@lists.openembedded.org>
> Sent: Wednesday, November 26, 2025 7:11 AM
> To: openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> <openembedded-core@lists.openembedded.org>
> Cc: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release
>
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
> Regenerate ld/configure
>
> Brings following changes
>
> * e3a18893e1c LoongArch: Use more appropriate assertions for the
> relocation of TLS LE
> * b136efd10a7 Re: dlltool memory leaks
> * b4bde11f310 ld: Don't use -mdirect-extern-access for LoongArch
> * ab776bc8685 lto: Set plugin_format to bfd_plugin_no only if known_used
> is set
> * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla and bfscale [PR
> gas/33562]
> * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory feature set
> * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version dependency
> * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT version dependency
> * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version dependency
> * d5945a221ff x86: Copy non_got_ref_without_indirect_extern_access
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
> ---
>  .../binutils/binutils-2.45.inc                |    6 +-
>  ...-system-directories-when-cross-linki.patch |   48 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>  3 files changed, 832 insertions(+), 1049 deletions(-)
> .
> .
> .
>
> Here's the binutils test results summary:
>
> Test Results:
>                                                          Before
> After      Diff
> No. of expected passes                317            318         +1
> No. of unexpected failures            1                 0           -1
> No. of untested testcases              5                 5            0
> No. of unsupported tests              8                 8             0
>
>
> The additional passing test case is, "replacing non-deterministic member"
> after Ross's fix:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1=
852aff23616e973b382df44c8d0
>
>
> Regards,
> Yash
>
>

--000000000000cfad8e06469fbc15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What is the one that=E2=80=99s failing unexpectedly=C2=A0=
</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Dec 22, 2025 at 11:16=E2=80=AFPM Yash Sh=
inde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><u></u>

 =20
  <div>
    <p> </p>
    <div lang=3D"x-unicode">
      <p> </p>
      <div lang=3D"x-unicode">From: <a href=3D"mailto:openembedded-core@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded=
.org</a>
        <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">&lt;openembedded-core@lists.openembedded.org&gt;</a>
        on behalf of Khem Raj via <a href=3D"http://lists.openembedded.org"=
 target=3D"_blank">lists.openembedded.org</a> <a href=3D"mailto:raj.khem=3D=
gmail.com@lists.openembedded.org" target=3D"_blank">&lt;raj.khem=3Dgmail.co=
m@lists.openembedded.org&gt;</a><br>
        Sent: Wednesday, November 26, 2025 7:11 AM<br>
        To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a>
        <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
        Cc: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">&lt;raj.khem@gmail.com&gt;</a><br>
        Subject: [OE-core] [PATCH] binutils: Upgrade to 2.45.1 release</div=
>
      <div lang=3D"x-unicode"><br>
        <blockquote type=3D"cite">
          <div id=3D"m_1132560493976160023divRplyFwdMsg" dir=3D"ltr">
            <div>=C2=A0</div>
          </div>
          <div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"f=
ont-size:11pt">
                <div>CAUTION: This email comes from a
                  non Wind River email account!<br>
                  Do not click links or open attachments unless you
                  recognize the sender and know the content is safe.<br>
                  <br>
                  Regenerate ld/configure<br>
                  <br>
                  Brings following changes<br>
                  <br>
                  * e3a18893e1c LoongArch: Use more appropriate
                  assertions for the relocation of TLS LE<br>
                  * b136efd10a7 Re: dlltool memory leaks<br>
                  * b4bde11f310 ld: Don&#39;t use -mdirect-extern-access fo=
r
                  LoongArch<br>
                  * ab776bc8685 lto: Set plugin_format to bfd_plugin_no
                  only if known_used is set<br>
                  * cec7ab85f24 aarch64: gas: Allow movprfx with fmmla
                  and bfscale [PR gas/33562]<br>
                  * 0b040187894 aarch64, gas: Relax Armv9.6-A mandatory
                  feature set<br>
                  * 4df2be75910 i386: Add GLIBC_ABI_GNU_TLS version
                  dependency<br>
                  * 71c1de4b0c8 x86-64: Add GLIBC_ABI_DT_X86_64_PLT
                  version dependency<br>
                  * b0fe5c23780 x86: Add GLIBC_ABI_GNU2_TLS version
                  dependency<br>
                  * d5945a221ff x86: Copy
                  non_got_ref_without_indirect_extern_access<br>
                  <br>
                  Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a><br>
                  ---<br>
                  =C2=A0.../binutils/binutils-2.45.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 6
                  +-<br>
                  =C2=A0...-system-directories-when-cross-linki.patch |=C2=
=A0=C2=A0 48
                  +-<br>
                  =C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1827
                  ++++++++---------<br>
                  =C2=A03 files changed, 832 insertions(+), 1049 deletions(=
-)<br>
                  .<br>
                  .<br>
                  .<br>
                </div>
              </span></font></div>
        </blockquote>
        Here&#39;s the binutils test results summary:<br>
        <br>
        Test Results:<br>
        =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Before=C2=A0
        =C2=A0 =C2=A0 After=C2=A0 =C2=A0 =C2=A0 Diff<br>
        No. of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 317=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 318=C2=A0 =C2=A0 =
=C2=A0 =C2=A0
        =C2=A0+1<br>
        No. of unexpected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=
=A0 =C2=A0 =C2=A0
        =C2=A0 =C2=A0-1<br>
        No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05=C2=
=A0 =C2=A0 =C2=A0
        =C2=A0 =C2=A0 =C2=A0 0<br>
        No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08=C2=
=A0 =C2=A0 =C2=A0 =C2=A0
        =C2=A0 =C2=A0 =C2=A00<br>
        <br>
        <br>
        The additional passing test case is, &quot;replacing
        non-deterministic member&quot; after Ross&#39;s fix:<br>
        <a href=3D"https://git.openembedded.org/openembedded-core/commit/?i=
d=3D7ea5d2c5aadb1852aff23616e973b382df44c8d0" target=3D"_blank">https://git=
.openembedded.org/openembedded-core/commit/?id=3D7ea5d2c5aadb1852aff23616e9=
73b382df44c8d0</a><br>
        <br>
        <br>
        Regards,<br>
        Yash=C2=A0 </div>
      <br>
    </div>
  </div>

</blockquote></div></div>

--000000000000cfad8e06469fbc15--

