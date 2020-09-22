Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7579.1600779353105863991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 05:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fsZVRCV3;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id c18so16945720wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAP0K189ryNm418GSPrGqBKtQUL7xyATZxnOBCcd7iw=;
        b=fsZVRCV3d9i002fk21nWxyiHLK/Rrt+BplnBXr+IkAZxKJLQ1K1uhODk2b5SkhHu0h
         tv8KqA0PMsLppq33xENnZnvK5lFWiXt9NADUFFrtM8XLCDhBY21bSH8c9gl2CzcVrUAM
         Km5nyEBPOJXJ+jwbEerKh6oetcMhhZdDUtO/5ZQRfh63nXFxII1tIhyqtsyR9veuwbaO
         Lu1rDczOf2QM1TDaDmFwwhJrTJhSWeJlX6RI0m514D9l1Qhl9lfY2qClZkSpagFynlQG
         X99fPeOTMr8QFlDE5QQC9VbsAaV+fGXXAVqnBN1nukwXYvL+wd+q7PLlSUhkXsc4Uu9+
         dZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAP0K189ryNm418GSPrGqBKtQUL7xyATZxnOBCcd7iw=;
        b=dKq2ReuVAb8CLvuENJJZsLATaHHt1zA5S9N4yPK7nl/zGbxTkp1gWywYjthzyS66/B
         DlqCV7Pd3VcAUia1u1njbBkER+IGAA3OE1MqPae2ZDOgtehP5SKyO0o8hwkhhy1mQMbO
         9J41bM5E/YlUZbRQrJ2+1YaOo0J0h7LUm+cs/Uex33ypFZBcZeBsU5O/W+8UUz4HnO/T
         l4YC66EeEaMScvRyj1vIiu8ScbKjeTImjOkKKkDFqZeYJElk36APkoRIqI/1HsrpSy+3
         wlRClc3yEHYBJ//tT1aBWPkXou4ngKa3Y4LndwLNwjfcJP2cGe1p694qw264TNGx60Qa
         ifRA==
X-Gm-Message-State: AOAM531OHZwqa8QBrIFnm2lT/wr9rGgg/U+DQDDNJCWxJ/8fL+4jHQpT
	FgvVo/A4u1wJh8SCPXimXyNeLxBw/DRSZNEVHfw=
X-Google-Smtp-Source: ABdhPJwS9D86PIlv/aD7rUyzWfeadYyHAXneDYB709foCFZL6KV3RNrH0urN85Lh5doM5I2I14NYKnMmGIXyN78ZiO8=
X-Received: by 2002:adf:dccc:: with SMTP id x12mr5292269wrm.241.1600779351273;
 Tue, 22 Sep 2020 05:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200922004455.21335-1-JPEWhacker@gmail.com> <CAMKF1spi8rWm5J4URo+iM5r8A_AgEDXLgiXdOhZxVFR7=KdB_w@mail.gmail.com>
In-Reply-To: <CAMKF1spi8rWm5J4URo+iM5r8A_AgEDXLgiXdOhZxVFR7=KdB_w@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 22 Sep 2020 07:55:39 -0500
Message-ID: <CAJdd5GZKZ8mD3D6umVPopUxrPoS6rzRW8wyQ2_QNb+xOtZnQBw@mail.gmail.com>
Subject: Re: [OE-core][RFC] openssh: Start key generation in multi-user mode
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alex Kiernan <alex.kiernan@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000098b65f05afe67ca0"

--00000000000098b65f05afe67ca0
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2020, 12:14 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Sep 21, 2020 at 5:45 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > The sshkeygen uses a lot of CPU time which delays booting (especially in
> > the case where no SSH connection is going to happen), but we also want
> > to be proactive about generating it early so that the first SSH login
> > doesn't have to wait a long time.
> >
> > Starting the key generation when the sockets are created (which is
> > pretty early in the boot process) slows down the boot due to high CPU
> > usage, so as a compromise start it no later than multi-user mode when
> > things have typically settled down. Note that if an SSH connection comes
> > in before multi-user.target is reached, key generation will be started
> > immediately.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh/sshd.socket        | 1 -
> >  meta/recipes-connectivity/openssh/openssh/sshd@.service      | 1 +
> >  .../recipes-connectivity/openssh/openssh/sshdgenkeys.service | 5 +++++
> >  3 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket
> b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> > index 8d76d62309..12c39b26b5 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
> > @@ -1,6 +1,5 @@
> >  [Unit]
> >  Conflicts=sshd.service
> > -Wants=sshdgenkeys.service
> >
> >  [Socket]
> >  ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > index 9d9965e624..40fd38730a 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
> > @@ -1,5 +1,6 @@
> >  [Unit]
> >  Description=OpenSSH Per-Connection Daemon
> > +Wants=sshdgenkeys.service
> >  After=sshdgenkeys.service
> >
> >  [Service]
> > diff --git
> a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > index fd81793d51..52617ec275 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > @@ -7,3 +7,8 @@ ExecStart=@LIBEXECDIR@/sshd_check_keys
> >  Type=oneshot
> >  RemainAfterExit=yes
> >  Nice=10
> > +
> > +[Install]
> > +# Start key generation no later than multi-user mode so that we can
> hopefully
> > +# have it generated before the first SSH connection
> > +WantedBy=multi-user.target
>
> This looks better than what we have. Please do something similar for
> dropbearkey.service as well.
> I also wonder if we need After anchor but I would not worry too much about
> it.
>

Yes, it may need After=multi-user.target, otherwise it might start earlier
than you want


> > --
> > 2.28.0
> >
>

--00000000000098b65f05afe67ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Sep 22, 2020, 12:14 AM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Sep=
 21, 2020 at 5:45 PM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">jpewhacker@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; The sshkeygen uses a lot of CPU time which delays booting (especially =
in<br>
&gt; the case where no SSH connection is going to happen), but we also want=
<br>
&gt; to be proactive about generating it early so that the first SSH login<=
br>
&gt; doesn&#39;t have to wait a long time.<br>
&gt;<br>
&gt; Starting the key generation when the sockets are created (which is<br>
&gt; pretty early in the boot process) slows down the boot due to high CPU<=
br>
&gt; usage, so as a compromise start it no later than multi-user mode when<=
br>
&gt; things have typically settled down. Note that if an SSH connection com=
es<br>
&gt; in before multi-user.target is reached, key generation will be started=
<br>
&gt; immediately.<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/openssh/openssh/sshd.socket=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 meta/recipes-connectivity/openssh/openssh/sshd@.service=C2=A0 =
=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 .../recipes-connectivity/openssh/openssh/sshdgenkeys.service | 5=
 +++++<br>
&gt;=C2=A0 3 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/m=
eta/recipes-connectivity/openssh/openssh/sshd.socket<br>
&gt; index 8d76d62309..12c39b26b5 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/sshd.socket<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket<br>
&gt; @@ -1,6 +1,5 @@<br>
&gt;=C2=A0 [Unit]<br>
&gt;=C2=A0 Conflicts=3Dsshd.service<br>
&gt; -Wants=3Dsshdgenkeys.service<br>
&gt;<br>
&gt;=C2=A0 [Socket]<br>
&gt;=C2=A0 ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b=
/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; index 9d9965e624..40fd38730a 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service<br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 [Unit]<br>
&gt;=C2=A0 Description=3DOpenSSH Per-Connection Daemon<br>
&gt; +Wants=3Dsshdgenkeys.service<br>
&gt;=C2=A0 After=3Dsshdgenkeys.service<br>
&gt;<br>
&gt;=C2=A0 [Service]<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.ser=
vice b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service<br>
&gt; index fd81793d51..52617ec275 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service<br=
>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service<br=
>
&gt; @@ -7,3 +7,8 @@ ExecStart=3D@LIBEXECDIR@/sshd_check_keys<br>
&gt;=C2=A0 Type=3Doneshot<br>
&gt;=C2=A0 RemainAfterExit=3Dyes<br>
&gt;=C2=A0 Nice=3D10<br>
&gt; +<br>
&gt; +[Install]<br>
&gt; +# Start key generation no later than multi-user mode so that we can h=
opefully<br>
&gt; +# have it generated before the first SSH connection<br>
&gt; +WantedBy=3Dmulti-user.target<br>
<br>
This looks better than what we have. Please do something similar for<br>
dropbearkey.service as well.<br>
I also wonder if we need After anchor but I would not worry too much about =
it.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Yes, it may need After=3Dmulti-user.target, otherwise it might start ear=
lier than you want</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
</blockquote></div></div></div>

--00000000000098b65f05afe67ca0--
