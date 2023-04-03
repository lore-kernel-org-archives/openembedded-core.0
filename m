Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6B0C77B6C
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 14:46:35 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.72330.1680533186579211715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 07:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rLupx3fY;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id cn12so118383189edb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680533185; x=1683125185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGSkbTJr0YgGqen4Kr93j+cx8yMWICH+h+ZqTEc5SwI=;
        b=rLupx3fYUiCwJ0+rABMhJDKvw2EASPVDmuFH39N/RXh5NPAS2cYRwA7zKeTxaKpouJ
         zwWvFmD9bvKvzsM3iEepdsVV52zK3srXgY3vRsh5hW2vIMg9NsdPQF0fOkt295BsKamE
         9MjPZS/f0Hlo99V23/Q+GNr1IhxtZQ2Zov6ttJBSkPqDaHlfFo+aZ67tGS/zbMKb4/2O
         +dekjAYOFp9dsEjHfrgrQuI2FrizYtlg5aAGODRwNSHCqQ7FVzGgFl/Tg8YE3tk4TnH2
         8hjWHY/tqUp+AhOhft5+561dRA8QqSSlaxbenSNWY4XI1ePPPhWHHSf3m1LtySS/zb1/
         9FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680533185; x=1683125185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGSkbTJr0YgGqen4Kr93j+cx8yMWICH+h+ZqTEc5SwI=;
        b=Z7YC9NNinN3zrugGd8kBah7xQcPGTXtTHlhk6LoEnZxzxbKZe812XYF8oBT0NsSr1R
         fF3P+49U9XwC9BjxEJz0XCLxAMoqK/qu5sVoWRS9fpdE4QLMYRz/WP8VvIfNk3mwWKB1
         lL+vW/ntaeqPjxP4JbJIY5Eq2IHI1IV3MFhFQ6ISNDslaI6zhanQ+FH2iiUgRXBbyML4
         zHOfYfTMxyREFZH9Nl1Wm7xH9E6umQ6M09qOzi/b80GmZFDdt/uZ+QpdRXYHfcEJZ/bJ
         uLkjCEC7waUFummBxUSVPhrKy6V7CyQesdq851Q4EWwHrKk07XCAcbY0UDuNywfcOXpz
         OC3Q==
X-Gm-Message-State: AAQBX9cQm202Z9fh0MsL8rzCUIpHbz8eQlleqoDeXIVnVsdBFsG2/Cji
	EK4qKm7d8Nxxs6rIcXDA0fNGPHad7iasx+e0g8KHjw==
X-Google-Smtp-Source: AKy350ZFoF+gVCc9k9gYXleQkTa/AATtXfLc3emt2KOaQuvYOkrXHbvcOzvuZm7Li+Gcc0YsAfFgUcRL3U/BYGXxEIk=
X-Received: by 2002:a17:906:ee89:b0:92e:a234:110a with SMTP id
 wt9-20020a170906ee8900b0092ea234110amr18412744ejb.3.1680533184876; Mon, 03
 Apr 2023 07:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <175095E37B8161A1.14179@lists.openembedded.org> <CAKzga+zqPYSa-yOupL3S5OeM_+GRFCRECZRw7soprgWHaSNTjg@mail.gmail.com>
In-Reply-To: <CAKzga+zqPYSa-yOupL3S5OeM_+GRFCRECZRw7soprgWHaSNTjg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Apr 2023 04:46:14 -1000
Message-ID: <CAOSpxdYGx5jcxPoXmdJrPSy3vL8yqdC0-ZBpUNVN0p4sVYz7sw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go-runtime: Security fix for CVE-2022-41723
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179637

On Mon, Apr 3, 2023 at 12:19=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> Hi Steve,
>
> I think you missed the patch for the Kirkstone branch. It's showing an Un=
patched in the latest CVE metrics for kirkstone.
>
> I had sent patches for CVE-2022-41723 in separate emails for both dunfell=
 & kirkstone with different subjects (mentioned branch). Dunfell patch is a=
lready merged into dunfell-nut. I am not sure how kirkstone patch mail is s=
howing as a reply on dunfell patch mail. In the mail details as well as on =
the list, it's showing the correct subject: https://lists.openembedded.org/=
g/openembedded-core/message/179232
>
> Apologies for the inconvenience caused. Please consider this patch for ki=
rkstone to fix CVE-2022-41723 golang.org/x/net/http2: avoid quadratic compl=
exity in HPACK decoding.

Apologies on my end for not sorting this out!

I've got it now, thanks for the reminder.

Steve

> On Tue, Mar 28, 2023 at 6:14=E2=80=AFPM Shubham Kulkarni via lists.openem=
bedded.org <skulkarni=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Shubham Kulkarni <skulkarni@mvista.com>
>>
>> Disable cmd/internal/moddeps test, since this update includes PRIVATE
>> track fixes.
>>
>> Backport from https://github.com/golang/go/commit/5c3e11bd0b5c0a86e5beff=
cd4339b86a902b21c3
>>
>> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> ---
>>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>>  .../go/go-1.18/CVE-2022-41723.patch           | 156 ++++++++++++++++++
>>  2 files changed, 157 insertions(+)
>>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patc=
h
>>
>> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devt=
ools/go/go-1.17.13.inc
>> index 99662bd298..971e38a744 100644
>> --- a/meta/recipes-devtools/go/go-1.17.13.inc
>> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
>> @@ -20,6 +20,7 @@ SRC_URI +=3D "\
>>      file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch=
 \
>>      file://CVE-2022-41715.patch \
>>      file://CVE-2022-41717.patch \
>> +    file://CVE-2022-41723.patch \
>>  "
>>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1=
d1fc0c1d784ada0cd300fd"
>>
>> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch b/met=
a/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
>> new file mode 100644
>> index 0000000000..a93fa31dcd
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41723.patch
>> @@ -0,0 +1,156 @@
>> +From 451766789f646617157c725e20c955d4a9a70d4e Mon Sep 17 00:00:00 2001
>> +From: Roland Shoemaker <bracewell@google.com>
>> +Date: Mon, 6 Feb 2023 10:03:44 -0800
>> +Subject: [PATCH] net/http: update bundled golang.org/x/net/http2
>> +
>> +Disable cmd/internal/moddeps test, since this update includes PRIVATE
>> +track fixes.
>> +
>> +Fixes CVE-2022-41723
>> +Fixes #58355
>> +Updates #57855
>> +
>> +Change-Id: Ie870562a6f6e44e4e8f57db6a0dde1a41a2b090c
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1728939
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Reviewed-by: Julie Qiu <julieqiu@google.com>
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/468118
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +Run-TryBot: Michael Pratt <mpratt@google.com>
>> +Auto-Submit: Michael Pratt <mpratt@google.com>
>> +Reviewed-by: Than McIntosh <thanm@google.com>
>> +
>> +Upstream-Status: Backport [https://github.com/golang/go/commit/5c3e11bd=
0b5c0a86e5beffcd4339b86a902b21c3]
>> +CVE: CVE-2022-41723
>> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> +---
>> + src/vendor/golang.org/x/net/http2/hpack/hpack.go | 79 +++++++++++++++-=
--------
>> + 1 file changed, 49 insertions(+), 30 deletions(-)
>> +
>> +diff --git a/src/vendor/golang.org/x/net/http2/hpack/hpack.go b/src/ven=
dor/golang.org/x/net/http2/hpack/hpack.go
>> +index 85f18a2..02e80e3 100644
>> +--- a/src/vendor/golang.org/x/net/http2/hpack/hpack.go
>> ++++ b/src/vendor/golang.org/x/net/http2/hpack/hpack.go
>> +@@ -359,6 +359,7 @@ func (d *Decoder) parseFieldLiteral(n uint8, it ind=
exType) error {
>> +
>> +       var hf HeaderField
>> +       wantStr :=3D d.emitEnabled || it.indexed()
>> ++      var undecodedName undecodedString
>> +       if nameIdx > 0 {
>> +               ihf, ok :=3D d.at(nameIdx)
>> +               if !ok {
>> +@@ -366,15 +367,27 @@ func (d *Decoder) parseFieldLiteral(n uint8, it i=
ndexType) error {
>> +               }
>> +               hf.Name =3D ihf.Name
>> +       } else {
>> +-              hf.Name, buf, err =3D d.readString(buf, wantStr)
>> ++              undecodedName, buf, err =3D d.readString(buf)
>> +               if err !=3D nil {
>> +                       return err
>> +               }
>> +       }
>> +-      hf.Value, buf, err =3D d.readString(buf, wantStr)
>> ++      undecodedValue, buf, err :=3D d.readString(buf)
>> +       if err !=3D nil {
>> +               return err
>> +       }
>> ++      if wantStr {
>> ++              if nameIdx <=3D 0 {
>> ++                      hf.Name, err =3D d.decodeString(undecodedName)
>> ++                      if err !=3D nil {
>> ++                              return err
>> ++                      }
>> ++              }
>> ++              hf.Value, err =3D d.decodeString(undecodedValue)
>> ++              if err !=3D nil {
>> ++                      return err
>> ++              }
>> ++      }
>> +       d.buf =3D buf
>> +       if it.indexed() {
>> +               d.dynTab.add(hf)
>> +@@ -459,46 +472,52 @@ func readVarInt(n byte, p []byte) (i uint64, rema=
in []byte, err error) {
>> +       return 0, origP, errNeedMore
>> + }
>> +
>> +-// readString decodes an hpack string from p.
>> ++// readString reads an hpack string from p.
>> + //
>> +-// wantStr is whether s will be used. If false, decompression and
>> +-// []byte->string garbage are skipped if s will be ignored
>> +-// anyway. This does mean that huffman decoding errors for non-indexed
>> +-// strings past the MAX_HEADER_LIST_SIZE are ignored, but the server
>> +-// is returning an error anyway, and because they're not indexed, the =
error
>> +-// won't affect the decoding state.
>> +-func (d *Decoder) readString(p []byte, wantStr bool) (s string, remain=
 []byte, err error) {
>> ++// It returns a reference to the encoded string data to permit deferri=
ng decode costs
>> ++// until after the caller verifies all data is present.
>> ++func (d *Decoder) readString(p []byte) (u undecodedString, remain []by=
te, err error) {
>> +       if len(p) =3D=3D 0 {
>> +-              return "", p, errNeedMore
>> ++              return u, p, errNeedMore
>> +       }
>> +       isHuff :=3D p[0]&128 !=3D 0
>> +       strLen, p, err :=3D readVarInt(7, p)
>> +       if err !=3D nil {
>> +-              return "", p, err
>> ++              return u, p, err
>> +       }
>> +       if d.maxStrLen !=3D 0 && strLen > uint64(d.maxStrLen) {
>> +-              return "", nil, ErrStringLength
>> ++              // Returning an error here means Huffman decoding errors
>> ++              // for non-indexed strings past the maximum string lengt=
h
>> ++              // are ignored, but the server is returning an error any=
way
>> ++              // and because the string is not indexed the error will =
not
>> ++              // affect the decoding state.
>> ++              return u, nil, ErrStringLength
>> +       }
>> +       if uint64(len(p)) < strLen {
>> +-              return "", p, errNeedMore
>> +-      }
>> +-      if !isHuff {
>> +-              if wantStr {
>> +-                      s =3D string(p[:strLen])
>> +-              }
>> +-              return s, p[strLen:], nil
>> ++              return u, p, errNeedMore
>> +       }
>> ++      u.isHuff =3D isHuff
>> ++      u.b =3D p[:strLen]
>> ++      return u, p[strLen:], nil
>> ++}
>> +
>> +-      if wantStr {
>> +-              buf :=3D bufPool.Get().(*bytes.Buffer)
>> +-              buf.Reset() // don't trust others
>> +-              defer bufPool.Put(buf)
>> +-              if err :=3D huffmanDecode(buf, d.maxStrLen, p[:strLen]);=
 err !=3D nil {
>> +-                      buf.Reset()
>> +-                      return "", nil, err
>> +-              }
>> ++type undecodedString struct {
>> ++      isHuff bool
>> ++      b      []byte
>> ++}
>> ++
>> ++func (d *Decoder) decodeString(u undecodedString) (string, error) {
>> ++      if !u.isHuff {
>> ++              return string(u.b), nil
>> ++      }
>> ++      buf :=3D bufPool.Get().(*bytes.Buffer)
>> ++      buf.Reset() // don't trust others
>> ++      var s string
>> ++      err :=3D huffmanDecode(buf, d.maxStrLen, u.b)
>> ++      if err =3D=3D nil {
>> +               s =3D buf.String()
>> +-              buf.Reset() // be nice to GC
>> +       }
>> +-      return s, p[strLen:], nil
>> ++      buf.Reset() // be nice to GC
>> ++      bufPool.Put(buf)
>> ++      return s, err
>> + }
>> +--
>> +2.7.4
>> --
>> 2.33.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179232): https://lists.openembedded.org/g/openembedd=
ed-core/message/179232
>> Mute This Topic: https://lists.openembedded.org/mt/97904222/7032091
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kulkarni@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

