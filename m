Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26513EC1EB2
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 12:58:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20022.1770296298976477609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 04:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGauZkY8;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81f4e136481so522308b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 04:58:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770296298; cv=none;
        d=google.com; s=arc-20240605;
        b=lJrkzTT1F13dG1T5Ar1RDhGUtFzBdYNYygUf6lXbgBHfmDCBYK9jDyf83XPDLXA823
         YwZkzf+vaiDhYnu8awUGfDkBcJ/GMtJzVIQGOA3MUpBgwfp2z1QqVFPWToRXg4zYvZiF
         xVrOBRmitq2oLl3gMIvjBsCPL8xMemjR5sPWYJ1Ru2kd0P/EpLiMiBLtvZUrmzWV0vcV
         1luzV4kr4q1bylpmZ+mjOLB1SL4qZimMfBkqeHBlJKK5MLPBNYEYUbtWRjF2Lt6c/XtJ
         fautVBBXBSAZqXYb0NaKitdwf4DKp5szfgKXp86GbFrqX7VD5qNi1beM1nHV/tkidKj2
         KJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z6H2mYLqv5aKcVirI2/jgL3t2cPdqcIw1xb60gm0usY=;
        fh=t/XKYveILH7nNtdUwlyJKHti+UFSZur1p9OUonJ2EtA=;
        b=RRL8WSKgwENigiIoe+ag7w0Z8sWzr8bB7/Ob4hTxiFy0zi0a5OQ/bVHavIYk/cVM2L
         nogN69K9qA6IHkSrRBaUAIiMSGeSksegsyJxoUczd4puUQYTrhiEtaEUQLZLfDbPU9gz
         sfB/UmtxLOiiOH/ETqYjpzbnFh54OB9mafqXNISNKtVusxqb3kCiiVIbEeH15N43cK6e
         27Jws+h9pk67b2sOzBnJnqIbrR0j3RsGo5C/ROFxhVQxh5ylEccKO1LKenWSjMs3lQTs
         xEfejtHnkYAMj7LY0LejFehgAkvWV2N86mAUDjDJSKWlFBkhIUg4N9g5aqZfXMFqpAJQ
         ey/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770296298; x=1770901098; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z6H2mYLqv5aKcVirI2/jgL3t2cPdqcIw1xb60gm0usY=;
        b=hGauZkY8IgA/9KLbW+z2fvYdNS6YoH7BXc+3bZ/ORr6GqaBR1kmGqGFnuRiIhliyyq
         i4Dp8kLMMuKQFUuq7q8jPGGpAyZ/9ckfxwgtbHQYpvrIb9MlGJpMi76CW066mEHX5OI8
         PYJsX5RHD8iq35CQG620qgHTyYGsLdKv+LTOzHS1B+QCHLNebcdgo90/pwocw2Ih6N6L
         R2hGqpIMROyhs0bcNgd0taIwvNN8nONSRIAWd5LLIBTE7Se3plNB+xhVUclxM1sudsvQ
         /K+ZlkVjOFTbPYl3ZAL4B466nTsw9GM0kWrw1aqK9Ub+VE+C9YDhWhk5lwN0wkOaW0NY
         GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770296298; x=1770901098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6H2mYLqv5aKcVirI2/jgL3t2cPdqcIw1xb60gm0usY=;
        b=iWtvmKFkxJezSFxOKw6YyPhOUho2Cx7n1xtKT/7PFSl1yhE52gIhsLPHV+xW5Nxr5d
         zZZZwkjbSI4tElRyjsZ42emL45QsFWIZhaDoIpGm5qQhpX3Exx36WzDY/QSd6yI8bHDO
         HxkqPvcufbVtrtDEERpiLJrbsEtRLNK/HjzfkQBulmUefCv+z2rJIAo2r2pCfjpX1y3k
         aERUKQrWfMtJXHCmpbLszeq2A6j75QmxwzNb2kxYD4Em506TfdkuhljKdzj0hleHu7qm
         I0jjl/Wkrvvv2fLU7njrlNmtGw0Qu0/y1htXEOqgV49DcH8S6MiUt+gp0FaKeFAtpDiJ
         2FBA==
X-Forwarded-Encrypted: i=1; AJvYcCWkXmrvB/W2EZFunnNjKIXZ36Z7+XWRScKwOkTT2bHUGUCJ3ETof+Kfgcl95Qn9QXxklQjz4j/U0YVrr+9xZAPyaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbK1yc30f+u8P/aOtKDikV3x+NBWOBjT8gkhew+F/Iv4+66NEh
	8N/fTniV2XNgZaUkxh21TOKdmnbakVd7XE4fJ8ieq4CDS9YVS8edPj8jog1Xxx/tZSdikAMfdPM
	OuJ4BmxI2ZxBu09h7hqawxFiX8hHEv80=
X-Gm-Gg: AZuq6aJte4tioVFHYBuIf7coZIOQSKoUo6pZ1RGkYlobpTvav+zv1GAgTegD2etzyW1
	l2nf1PgdoKUL5j8Rtts9ikgOxGN7OOtFd/Se5P6ihS+iP6aKPw+FZ0vUILpbXh87tAlSdFD4/A0
	8it91FGDgQhu1KylDkx4ElCvFClBDqxYeRwP0Sukh/nfXFqFAwnKf0M4mStvxL/RioZsz4M82lJ
	DMyQljx8aKie7/TUyPDOed1pKkYO9fIGvsraoyZIdlH/1Kmn/5qDNru3Jtil274YJPDCvN6jfBs
	cVswrTuK+So89exhsG3wRHncQLeb
X-Received: by 2002:a05:6a21:138e:b0:38d:ebdc:3555 with SMTP id
 adf61e73a8af0-393724b8ba9mr5834448637.66.1770296298180; Thu, 05 Feb 2026
 04:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20260204020908.864912-1-kai.kang@windriver.com>
 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
 <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
 <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
 <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org> <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
In-Reply-To: <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Feb 2026 07:58:06 -0500
X-Gm-Features: AZwV_QgkzFz-uirTQvPzERgCKbKmY8G85RcMji4M42mJ0zBADKx9-hgb7jN1Wag
Message-ID: <CADkTA4NcH0vUdX6FcJ6+rigGN5cR4zBCgcsYyL-Y44bq2-GTMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES set
To: Kai <kai.kang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000001252064a133aa2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 12:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230578

--000000000000001252064a133aa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 4:08=E2=80=AFAM Kai <kai.kang@windriver.com> wrote:

> On 2/4/26 23:53, Richard Purdie wrote:
>
> On Wed, 2026-02-04 at 09:10 -0500, Bruce Ashfield wrote:
>
> On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie<richard.purdie@linu=
xfoundation.org> <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
>
> On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie<richard.purdie@linu=
xfoundation.org> <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield vialists.openembedded.o=
rg wrote:
>
> On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang vialists.openembedded.org=
<kai.kang=3Dwindriver.com@lists.openembedded.org> <kai.kang=3Dwindriver.com=
@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com> <kai.kang@windriver.com>
>
> Check whether kernel config CONFIG_MODULES set or not
> before do_compile
> and do_install in module.bbclass. If not set, it cannot
> build and
> install external modules.
>
>
> This isn't the place to do that check.
>
> If modules are disabled get modules_do_compile out of the
> tasks.
>
> Does it make sense to have something including module.bbclass
> which
> doesn't have CONFIG_MODULES set?
>
> Yes, that's what I'm trying to say.
>
> Don't even include it if you can't build modules. That puts
> the conditional in a single place, and keeps the code cleaner
> in the class.
>
> I think we're talking cross purposes a bit.
>
> The issue is that if you ever reach do_compile in something using
> module.bbclass which does not have CONFIG_MODULES set, that is a
> problem and a hard error.
>
> So I'd argue that:
>
> * we only need the check in do_compile
> * it should be a fatal exit hard error, not a warning
>
> which means the patch needs tweaking but not as you're suggesting.
>
>
>
> I don't have a strong opinion, so won't object.
>
> I just don't think adding any conditionals for module support in
> moduldes.bbclass makes sense. So one versus two checks
> is a wash for me.
>
> I agree the warn conditional isn't quite right. I think it should be:
>
> if [ CONFIG_MODULES not set in config ];
>     bberror Broken config, CONFIG_MODULES not set
>     exit 1
> fi
>
> so it is basically a sanity test that the config is valid.
>
> I'm a bit worried about what I'm missing though :/
>
> The original problem is kernel config_modules is disabled, then external
> modules such as lttng-modules can't be built.
>
> Recipe lttng-tools RRECOMMENDS on lttng-modules. If install lttng-tools
> into image, it fails to build lttng-modules.
>
> Kernel config CONFIG_MODULES couldn't be checked whether enabled or
> disabled after bitbake parse. Then there is no chance to remove
> lttng-module from the dependencies. That why I check the config during th=
e
> do_compile and do_install with bbnote and generate empty rpm package.
>

That's exactly why we had a patch to the lttng source code.

Someone updated that patch recently, so it has probably caused a regression=
.

Bruce



> Regards,
> Kai
>
> Cheers,
>
> Richard
>
>
>
>
>
> --
> Kai Kang
> Wind River Linux
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000001252064a133aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 5, 2026 at 4:08=
=E2=80=AFAM Kai &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><u></u>

 =20
  <div>
    <div>On 2/4/26 23:53, Richard Purdie wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Wed, 2026-02-04 at 09:10 -0500, Bruce Ashfield wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">&lt=
;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
</pre>
          <blockquote type=3D"cite">
            <pre>On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">&lt=
;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre>On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> wrote:
</pre>
              <blockquote type=3D"cite">
                <pre>On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a>
<a href=3D"mailto:kai.kang=3Dwindriver.com@lists.openembedded.org" target=
=3D"_blank">&lt;kai.kang=3Dwindriver.com@lists.openembedded.org&gt;</a> wro=
te:
</pre>
                <blockquote type=3D"cite">
                  <pre>From: Kai Kang <a href=3D"mailto:kai.kang@windriver.=
com" target=3D"_blank">&lt;kai.kang@windriver.com&gt;</a>

Check whether kernel config CONFIG_MODULES set or not
before do_compile
and do_install in module.bbclass. If not set, it cannot
build and
install external modules.

</pre>
                </blockquote>
                <pre>This isn&#39;t the place to do that check.

If modules are disabled get modules_do_compile out of the
tasks.
</pre>
              </blockquote>
              <pre>Does it make sense to have something including module.bb=
class
which
doesn&#39;t have CONFIG_MODULES set?
</pre>
            </blockquote>
            <pre>Yes, that&#39;s what I&#39;m trying to say.

Don&#39;t even include it if you can&#39;t build modules. That puts
the conditional in a single place, and keeps the code cleaner
in the class.
</pre>
          </blockquote>
          <pre>I think we&#39;re talking cross purposes a bit.

The issue is that if you ever reach do_compile in something using
module.bbclass which does not have CONFIG_MODULES set, that is a
problem and a hard error.

So I&#39;d argue that:

* we only need the check in do_compile
* it should be a fatal exit hard error, not a warning

which means the patch needs tweaking but not as you&#39;re suggesting.


</pre>
        </blockquote>
        <pre>I don&#39;t have a strong opinion, so won&#39;t object.

I just don&#39;t think adding any conditionals for module support in
moduldes.bbclass makes sense. So one versus two checks
is a wash for me.
</pre>
      </blockquote>
      <pre>I agree the warn conditional isn&#39;t quite right. I think it s=
hould be:

if [ CONFIG_MODULES not set in config ];
    bberror Broken config, CONFIG_MODULES not set
    exit 1
fi

so it is basically a sanity test that the config is valid.

I&#39;m a bit worried about what I&#39;m missing though :/</pre>
    </blockquote>
    The original problem is kernel config_modules is disabled, then
    external modules such as lttng-modules can&#39;t be built.<br>
    <p>Recipe lttng-tools RRECOMMENDS on lttng-modules. If install
      lttng-tools into image, it fails to build lttng-modules.</p>
    <p>Kernel config=C2=A0<span style=3D"white-space:pre-wrap">CONFIG_MODUL=
ES couldn&#39;t be checked whether enabled or disabled after bitbake parse.=
 Then there is no
chance to remove lttng-module from the dependencies. That why I check the c=
onfig during the do_compile and do_install
with bbnote and generate empty rpm package.</span></p></div></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Th=
at&#39;s exactly why we had a patch to the lttng source code.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Someone updated that patch recently, s=
o it has probably caused a regression.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>
    <p>Regards,<br>
      Kai</p>
    <blockquote type=3D"cite">
      <pre>Cheers,

Richard



</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000001252064a133aa2--

