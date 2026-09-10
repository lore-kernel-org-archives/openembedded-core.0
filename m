Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E59C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:29:43 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7785.1789021779563370957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ueh03rzr;
 spf=pass (domain: mvista.com, ip: 209.85.208.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so11012247a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 23:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021778; cv=none;
        d=google.com; s=arc-20260327;
        b=syusmT3rjMO1LagktrYS/SXGBnpuIx4HupVd0nTnlTO5koLetD2cBOPAMcVC33igGg
         BVexmt13f7A1d/mWm4I8vLzyV5Tz9bFbQa0RlIZSMSR4LLsWfVTrbLGeSmYAlvJKBZGB
         JrtMx2E5CPBExKvRsEkyy/gROXNgULymwYgVc72r59C3RgeEMftAsLFqoCU8parlHE+y
         EbhpfK95/dChPrjhdFD7aGRdzrvqYKqfeZ1YbtYbwM9FZlvdy0iFZg581MtCj+syNzP7
         hPGC1EXTEv8nTrJ62wgvu+H3zdTOoaOT2xVfJT5rWH//xg/YvP+SrcrxJJhfFz2BAguM
         u6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r+6RTDmKlLLSMSh+sciG58sFovRZy5FPfcraWYQcNx0=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=TFfe7oImcB40BhqDsyUsxCJQ4OtiR7mgC2eDCVBhzKsm9zYFhUeeh5DGvovFzKzA0w
         D86QNRWxgCv4WsGCxf25XpZcWF5r4hjkCGrfn82DV3BQPqsr2HNYG+wtulm87up/R6oN
         pxeURQ3qPolbYlsW39mBuFzWQVHrzvKC4wDoUGR+DSW7dc4Hr5yXqQS7G491MHt7r3Hy
         WGeXjJKfHDq+hhSRDIGPouw1/aKJg0YBLCurQnRv+nZzWlz2ZabYRvG7Yok7T40ju0c+
         bLMfMuh6t0BX1vMdRhDJVeNAY2CyIWV33d+dVICsbfoWJk24kf1hFZ9Fekbf1VM8pYjH
         cwqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789021778; x=1789626578; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+6RTDmKlLLSMSh+sciG58sFovRZy5FPfcraWYQcNx0=;
        b=Ueh03rzrq0qyd0MXN9AismEPzVToUFTHUTNlT7z3XrN7/oRQvjX7LUCfWPbZds507a
         Ip2vpU14ZI3tUBsZKy1yrm4haZ7FXGo5Z39U5FpXR30InSZuLs1kc4d11yUl8a9Eb6P3
         Mc6pOME0F1Gyt+EsJ5dzCuiZ5IdRt3C0ai568=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021778; x=1789626578;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r+6RTDmKlLLSMSh+sciG58sFovRZy5FPfcraWYQcNx0=;
        b=T5M07IZnpeScxlilI1Irr9zNnUr+K+XARthHpD6tCZRki2eIya037BkWXxJXBqrOx4
         2UNJ/ACTjiJ0tgRjVsfayPgLGYzkF+DT6PCo+Rm1+VdUmjUP7AHPksqxrXGXUqtyHZ4Y
         MQpqNb8OWLS9BXGeYnkPLeYp4gAWdnpDR0KEizTAHni48cDGPKinFZFc9QogSHmkDqpw
         aynWPzPYnBt1xpiFUr0Ad5SZgVQHy/Zf0qkmiTuIACyN3+DAhkcxrI+Ec3qH9U2A3Tf+
         zbOgViSfjPLcr+7O71cHaxqqCOHXsgkXkiKIAffyhF+7t/1rbZII5TDO4xuzif4JaN7q
         4Hwg==
X-Gm-Message-State: AFuF++mu+9tITw/IiKy4Ghs5813YUUZsb9+D6hZVYjjAjC3pyfO77Cqd
	DrL8v/VqlqzKU4noaefkHc9XxFK7ix224jYoJ3RzNw3e4U3fOetROBKyrxTSW8sQbW6AriEqdn0
	/fU9gKTe1CLZ4zFPmQMoYgaiWmmWUJ8Si5maZV/JyHQ==
X-Gm-Gg: AYBFou3ZcVkoRGm1mh/GAzFstlN0L5xdWxyM+EjYGYeqdxFsCmdU/sUDO5JyKc6O31K
	Wi7933SzAl55o1F7dOTraijTfot4rFo0l7SzFku889FaA+5c7UpmtHtUavbZws4DN2n63fUBLlQ
	2xhyUYv6tCUX/UUfNuo7FqX/HIU3kobAsek+/K/87gKetw3X22tIsEYmH7ZiupWEvJeHZS+MQg+
	9N3PEz9rMg6vHK/kxxUnIaHEfyf55c4olYKS/Q6zOC/2tHta+YTa9JHcXyhNCJRxCFTVkzhO7Ds
	AC6b/QqLinJ+I6pMm4jMDcXksqHrz34F/ICTOwezJvO0Fut+aRH1Cw4=
X-Received: by 2002:a05:6402:428a:b0:6a8:372:edbd with SMTP id
 4fb4d7f45d1cf-6a80372f234mr10411653a12.10.1789021776598; Wed, 09 Sep 2026
 23:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260826081324.65559-1-vanusuri@mvista.com> <DLA00SM0KMT2.1CWHEJAO2J870@smile.fr>
In-Reply-To: <DLA00SM0KMT2.1CWHEJAO2J870@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 10 Sep 2026 11:59:24 +0530
X-Gm-Features: AcwNN1Wk74YZrnNAqlnovJI5agm8iDkSzqPB1S3B_ik4IcANWCLP7JXdB50poF8
Message-ID: <CANQUz1807YxnBxVQMeJn8N1mhC698-NEk_tE8XQqRxwa8ke9Vw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] kbd: Fix CVE-2026-72693
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007d68ab065b1b17dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245539

--0000000000007d68ab065b1b17dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for reviewing the patch.

Yes, the fix intentionally makes the process matching in openvt -u more
restrictive. The upstream change updates the matching logic so that both of
the following conditions are satisfied:

   - The process owner matches the current VT owner.
   - The process has the current VT as its controlling terminal.

It also prevents root from being selected as the pre-authenticated target.

This behavior change is intended to address the security issue in the
previous implementation, where an unprivileged process holding an inherited
file descriptor for the VT could potentially be incorrectly identified as
the VT owner. In certain privileged kbrequest/init configurations, this
could lead to passwordless root login.

I also checked how this CVE has been handled downstream. Redhat & Oracle
Linux has backported the same fix to kbd 2.4.0 and 2.6.4 .

I agree that this changes the behavior of openvt -u. However, the change
appears to be directly related to preventing the privilege escalation
rather than being an unrelated behavioral change.

Thanks & Regards,

Vijay


On Tue, Sep 8, 2026 at 7:49=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Wed Aug 26, 2026 at 10:13 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [1]
> >
> > [1] https://security-tracker.debian.org/tracker/CVE-2026-72693
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
> > [3] https://access.redhat.com/security/cve/cve-2026-72693
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
> >  meta/recipes-core/kbd/kbd_2.9.0.bb            |   1 +
> >  2 files changed, 156 insertions(+)
> >  create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
> >
> > diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
> b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
> > new file mode 100644
> > index 0000000000..06b8c195a5
> > --- /dev/null
> > +++ b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
> > @@ -0,0 +1,155 @@
> > +From 78d5ae119742e87baa7dbe0f5c4107e7533fd698 Mon Sep 17 00:00:00 2001
> > +From: Alexey Gladkov <legion@kernel.org>
> > +Date: Tue, 12 May 2026 10:20:50 +0200
> > +Subject: [PATCH] openvt: make -u process matching more conservative
> > +
> > +The -u mode relies on the current VT owner to decide which user should
> > +be used for the new login session. Make that check stricter by requiri=
ng
> > +a matching process owner and controlling terminal instead of relying o=
n
> > +the ownership of an inherited file descriptor.
> > +
> > +Also reject root as a pre-authenticated target and document the tighte=
r
> > +behavior in the man page.
> > +
> > +Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/legionus/kbd/commit/78d5ae119742e87baa7dbe0f5c4107e753=
3fd698
> ]
> > +CVE: CVE-2026-72693
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + docs/man/man1/openvt.1 | 10 +++++++
> > + src/openvt.c           | 64 +++++++++++++++++++++++++++++++++++++----=
-
> > + 2 files changed, 67 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/docs/man/man1/openvt.1 b/docs/man/man1/openvt.1
> > +index 8f1244f..404e4a0 100644
> > +--- a/docs/man/man1/openvt.1
> > ++++ b/docs/man/man1/openvt.1
> > +@@ -36,6 +36,8 @@ will be made the new current VT.
> > + \fB\-u\fR, \fB\-\-user\fR
> > + Figure out the owner of the current VT, and run login as that user.
> > + Suitable to be called by init. Shouldn't be used with \fI\-c\fR or
> \fI\-l\fR.
> > ++This option refuses to pre-authenticate root and requires a process
> owned by
> > ++the VT owner whose controlling terminal is the current VT.
> > + .TP
> > + \fB\-l\fR, \fB\-\-login\fR
> > + Make the command a login shell. A \- is prepended to the name of the
> command
> > +@@ -64,6 +66,14 @@ If
> > + is compiled with a getopt_long() and you wish to set
> > + options to the command to be run, then you must supply
> > + the end of options \-\- flag before the command.
> > ++.PP
> > ++The
> > ++.B \-u
> > ++option uses
> > ++.BR "login -f"
> > ++and therefore bypasses normal password authentication for the detecte=
d
> user.
> > ++It is intended only for controlled init or keyboard-request
> configurations.
> > ++Use a normal authenticated login command when authentication is
> required.
> > + .SH EXAMPLES
> > + .B openvt
> > + can be used to start a shell on the next free VT, by using the comman=
d:
> > +diff --git a/src/openvt.c b/src/openvt.c
> > +index a94392b..ddd9239 100644
> > +--- a/src/openvt.c
> > ++++ b/src/openvt.c
> > +@@ -57,6 +57,51 @@ usage(int rc, const struct kbd_help *options)
> > +     exit(rc);
> > + }
> > +
> > ++static int
> > ++proc_pid_stat(const char *pid, uid_t *uid, dev_t *tty)
> > ++{
> > ++    char filename[NAME_MAX + 12];
> > ++    char line[BUFSIZ];
> > ++    char *lp, *rp;
> > ++    FILE *fp;
> > ++    struct stat st;
> > ++    long tty_nr;
> > ++
> > ++    snprintf(filename, sizeof(filename), "/proc/%s/stat", pid);
> > ++    fp =3D fopen(filename, "r");
> > ++    if (!fp)
> > ++            return -1;
> > ++
> > ++    if (fstat(fileno(fp), &st)) {
> > ++            fclose(fp);
> > ++            return -1;
> > ++    }
> > ++
> > ++    if (!fgets(line, sizeof(line), fp)) {
> > ++            fclose(fp);
> > ++            return -1;
> > ++    }
> > ++    fclose(fp);
> > ++
> > ++    rp =3D strrchr(line, ')');
> > ++    if (!rp)
> > ++            return -1;
> > ++
> > ++    /*
> > ++     * /proc/<pid>/stat fields after comm are:
> > ++     * state ppid pgrp session tty_nr ...
> > ++     */
> > ++    if (!rp || sscanf(rp + 1, " %*c %*d %*d %*d %ld", &tty_nr) !=3D 1=
)
> > ++            return -1;
> > ++
> > ++    if (tty_nr <=3D 0)
> > ++            return -1;
> > ++
> > ++    *uid =3D st.st_uid;
> > ++    *tty =3D (dev_t) tty_nr;
> > ++    return 0;
> > ++}
> > ++
> > + /*
> > +  * Support for Spawn_Console: openvt running from init
> > +  * added by Joshua Spoerri, Thu Jul 18 21:13:16 EDT 1996
> > +@@ -88,8 +133,7 @@ authenticate_user(int curvt)
> > +     DIR *dp;
> > +     struct dirent *dentp;
> > +     struct stat buf;
> > +-    dev_t console_dev;
> > +-    ino_t console_ino;
> > ++    dev_t console_rdev;
> > +     uid_t console_uid;
> > +     char filename[NAME_MAX + 12];
> > +     struct passwd *pwnam;
> > +@@ -109,10 +153,12 @@ authenticate_user(int curvt)
> > +                     kbd_error(EXIT_FAILURE, errsv, "%s", filename);
> > +             }
> > +     }
> > +-    console_dev =3D buf.st_dev;
> > +-    console_ino =3D buf.st_ino;
> > ++    console_rdev =3D buf.st_rdev;
> > +     console_uid =3D buf.st_uid;
> > +
> > ++    if (console_uid =3D=3D 0)
> > ++            kbd_error(EXIT_FAILURE, 0, _("Refusing to pre-authenticat=
e
> root on current tty."));
>
> Hello,
>
> Isn't this a change in befavior that might break some use-case?
> I don't know how legitimate and/or unsafe it is though...
> Do you know?
>
> I'll hold this in the meantime.
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000007d68ab065b1b17dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Yoann,<br><br><p><span>Thanks for reviewing the pa=
tch.</span></p><p><span>Yes, the fix intentionally makes the process matchi=
ng in openvt -u=C2=A0</span><span>more restrictive. The upstream change upd=
ates the matching logic so that both of the following conditions are satisf=
ied:</span></p><ul><li><span>The process owner matches the current VT owner=
.</span></li><li><span>The process has the current VT as its controlling te=
rminal.</span></li></ul><p><span>It also prevents root from being selected =
as the pre-authenticated target.</span></p><p><span>This behavior change is=
 intended to address the security issue in the previous implementation, whe=
re an unprivileged process holding an inherited file descriptor for the VT =
could potentially be incorrectly identified as the VT owner. In certain pri=
vileged </span><code dir=3D"ltr"><span>kbrequest</span></code><span>/init c=
onfigurations, this could lead to passwordless root login.</span></p><p><sp=
an>I also checked how this CVE has been handled downstream. Redhat &amp; Or=
acle Linux has backported the same fix to kbd 2.4.0 and 2.6.4 .</span></p><=
p><span>I agree that this changes the behavior of openvt -u.</span><span>=
=C2=A0However, the change appears to be directly related to preventing the =
privilege escalation rather than being an unrelated behavioral change.<br><=
br></span></p><p><span>Thanks &amp; Regards,<br></span></p><p><span>Vijay</=
span></p><br></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, 2026 at 7:49=E2=80=AFPM Y=
oann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile=
.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Wed Aug 26, 2026 at 10:13 AM CEST, Vijay Anusuri via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; Pick patch according to [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-72=
693" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-72693</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-72693" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-72=
693</a><br>
&gt; [3] <a href=3D"https://access.redhat.com/security/cve/cve-2026-72693" =
rel=3D"noreferrer" target=3D"_blank">https://access.redhat.com/security/cve=
/cve-2026-72693</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-core/kbd/<a href=3D"http://kbd_2.9.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">kbd_2.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 156 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patc=
h<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/rec=
ipes-core/kbd/kbd/CVE-2026-72693.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..06b8c195a5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch<br>
&gt; @@ -0,0 +1,155 @@<br>
&gt; +From 78d5ae119742e87baa7dbe0f5c4107e7533fd698 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexey Gladkov &lt;<a href=3D"mailto:legion@kernel.org" target=
=3D"_blank">legion@kernel.org</a>&gt;<br>
&gt; +Date: Tue, 12 May 2026 10:20:50 +0200<br>
&gt; +Subject: [PATCH] openvt: make -u process matching more conservative<b=
r>
&gt; +<br>
&gt; +The -u mode relies on the current VT owner to decide which user shoul=
d<br>
&gt; +be used for the new login session. Make that check stricter by requir=
ing<br>
&gt; +a matching process owner and controlling terminal instead of relying =
on<br>
&gt; +the ownership of an inherited file descriptor.<br>
&gt; +<br>
&gt; +Also reject root as a pre-authenticated target and document the tight=
er<br>
&gt; +behavior in the man page.<br>
&gt; +<br>
&gt; +Signed-off-by: Alexey Gladkov &lt;<a href=3D"mailto:legion@kernel.org=
" target=3D"_blank">legion@kernel.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/legionus/kbd=
/commit/78d5ae119742e87baa7dbe0f5c4107e7533fd698" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/legionus/kbd/commit/78d5ae119742e87baa7dbe0f=
5c4107e7533fd698</a>]<br>
&gt; +CVE: CVE-2026-72693<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + docs/man/man1/openvt.1 | 10 +++++++<br>
&gt; + src/openvt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 64 ++++++++++=
+++++++++++++++++++++++++++-----<br>
&gt; + 2 files changed, 67 insertions(+), 7 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/docs/man/man1/openvt.1 b/docs/man/man1/openvt.1<br>
&gt; +index 8f1244f..404e4a0 100644<br>
&gt; +--- a/docs/man/man1/openvt.1<br>
&gt; ++++ b/docs/man/man1/openvt.1<br>
&gt; +@@ -36,6 +36,8 @@ will be made the new current VT.<br>
&gt; + \fB\-u\fR, \fB\-\-user\fR<br>
&gt; + Figure out the owner of the current VT, and run login as that user.<=
br>
&gt; + Suitable to be called by init. Shouldn&#39;t be used with \fI\-c\fR =
or \fI\-l\fR.<br>
&gt; ++This option refuses to pre-authenticate root and requires a process =
owned by<br>
&gt; ++the VT owner whose controlling terminal is the current VT.<br>
&gt; + .TP<br>
&gt; + \fB\-l\fR, \fB\-\-login\fR<br>
&gt; + Make the command a login shell. A \- is prepended to the name of the=
 command<br>
&gt; +@@ -64,6 +66,14 @@ If<br>
&gt; + is compiled with a getopt_long() and you wish to set<br>
&gt; + options to the command to be run, then you must supply<br>
&gt; + the end of options \-\- flag before the command.<br>
&gt; ++.PP<br>
&gt; ++The<br>
&gt; ++.B \-u<br>
&gt; ++option uses<br>
&gt; ++.BR &quot;login -f&quot;<br>
&gt; ++and therefore bypasses normal password authentication for the detect=
ed user.<br>
&gt; ++It is intended only for controlled init or keyboard-request configur=
ations.<br>
&gt; ++Use a normal authenticated login command when authentication is requ=
ired.<br>
&gt; + .SH EXAMPLES<br>
&gt; + .B openvt<br>
&gt; + can be used to start a shell on the next free VT, by using the comma=
nd:<br>
&gt; +diff --git a/src/openvt.c b/src/openvt.c<br>
&gt; +index a94392b..ddd9239 100644<br>
&gt; +--- a/src/openvt.c<br>
&gt; ++++ b/src/openvt.c<br>
&gt; +@@ -57,6 +57,51 @@ usage(int rc, const struct kbd_help *options)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0exit(rc);<br>
&gt; + }<br>
&gt; + <br>
&gt; ++static int<br>
&gt; ++proc_pid_stat(const char *pid, uid_t *uid, dev_t *tty)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 char filename[NAME_MAX + 12];<br>
&gt; ++=C2=A0 =C2=A0 char line[BUFSIZ];<br>
&gt; ++=C2=A0 =C2=A0 char *lp, *rp;<br>
&gt; ++=C2=A0 =C2=A0 FILE *fp;<br>
&gt; ++=C2=A0 =C2=A0 struct stat st;<br>
&gt; ++=C2=A0 =C2=A0 long tty_nr;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 snprintf(filename, sizeof(filename), &quot;/proc/%s/st=
at&quot;, pid);<br>
&gt; ++=C2=A0 =C2=A0 fp =3D fopen(filename, &quot;r&quot;);<br>
&gt; ++=C2=A0 =C2=A0 if (!fp)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (fstat(fileno(fp), &amp;st)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (!fgets(line, sizeof(line), fp)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 fclose(fp);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 rp =3D strrchr(line, &#39;)&#39;);<br>
&gt; ++=C2=A0 =C2=A0 if (!rp)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* /proc/&lt;pid&gt;/stat fields after comm are:<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* state ppid pgrp session tty_nr ...<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (!rp || sscanf(rp + 1, &quot; %*c %*d %*d %*d %ld&q=
uot;, &amp;tty_nr) !=3D 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (tty_nr &lt;=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 *uid =3D st.st_uid;<br>
&gt; ++=C2=A0 =C2=A0 *tty =3D (dev_t) tty_nr;<br>
&gt; ++=C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +=C2=A0 * Support for Spawn_Console: openvt running from init<br>
&gt; +=C2=A0 * added by Joshua Spoerri, Thu Jul 18 21:13:16 EDT 1996<br>
&gt; +@@ -88,8 +133,7 @@ authenticate_user(int curvt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DIR *dp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dirent *dentp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stat buf;<br>
&gt; +-=C2=A0 =C2=A0 dev_t console_dev;<br>
&gt; +-=C2=A0 =C2=A0 ino_t console_ino;<br>
&gt; ++=C2=A0 =C2=A0 dev_t console_rdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uid_t console_uid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char filename[NAME_MAX + 12];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct passwd *pwnam;<br>
&gt; +@@ -109,10 +153,12 @@ authenticate_user(int curvt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kbd_error(EXIT_FAILURE, errsv, &quot;%s&quot;, filename);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 console_dev =3D buf.st_dev;<br>
&gt; +-=C2=A0 =C2=A0 console_ino =3D buf.st_ino;<br>
&gt; ++=C2=A0 =C2=A0 console_rdev =3D buf.st_rdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0console_uid =3D buf.st_uid;<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 if (console_uid =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kbd_error(EXIT_FAILURE, 0,=
 _(&quot;Refusing to pre-authenticate root on current tty.&quot;));<br>
<br>
Hello,<br>
<br>
Isn&#39;t this a change in befavior that might break some use-case?<br>
I don&#39;t know how legitimate and/or unsafe it is though...<br>
Do you know?<br>
<br>
I&#39;ll hold this in the meantime.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000007d68ab065b1b17dd--

