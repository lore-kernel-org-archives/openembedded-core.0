Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD0BC5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 08:07:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31181.1787818059885032176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 01:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OFSLgy2e;
 spf=pass (domain: mvista.com, ip: 209.85.208.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so560366a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 01:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787818058; cv=none;
        d=google.com; s=arc-20260327;
        b=iTjkaf3vcPaLrTyjHvjurAq/4nF5V4p35NRHulh/VqwKdaE+XQyZuguD2foQrI0brw
         Hl7z+z64drmIcSSLJqnjYwA2A6p24tp4hV1G8AGTCJnE0x3pS7vTSNwHAuMiw90d9/3u
         X50svYiN+8UratnKIEP5tdDZe2RU/qIs46mfbpdVTbSbXIZxQCkDodPOCYpT79YG2ABt
         NpcRPU+cnP/FNMYx5niONTM4hWMmPy33dRGbpdrUvGOukstNzJ3b5e62ONmLnzrrgWCS
         JKRxlCf9O9k8p9bal2p8XN5WVPGsBXfu6byJzw565l5HvhXkoNyzacBhvuSDPR52FEB9
         YBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4EukIXjQaoYAADrEOIT7O0RClK36JAxTxlGFZUyBMBo=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=sbfTE1e3TDYS8PNJhCLC/POck1vB0GPJsCOZO7RRXSt3ORYjUife3WvEDa8UIy/tmh
         6Du2OoEkQkOXreGGWg/I5HFB4YL+vHR7Mof28m7mvXBWkmjwky9RBRFZeGVyLJY7tKx7
         lby2ExxQYFTDofft6Fy2gOx6JxWKGxI6EnmUT6CsVG4RZ3OzncuqaXnfVukLiFZ7lyrj
         tzTHcoykIkrRZMTgZkvE708DKocNBgf1NAewEvd2EatabLECmqrOBdhJl5u5D1d9R0/X
         zuOHsERvpK3HTsWLKzYRdNyYlRnqvR5OtG9rjLbYYDlldWX8d9Ns4RvBOz3Sbkm9gr0o
         1hSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787818058; x=1788422858; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EukIXjQaoYAADrEOIT7O0RClK36JAxTxlGFZUyBMBo=;
        b=OFSLgy2eXMtM3TKsxQP9TyDqv62vBd8oBVVamlKnaPATt6HwiOFH70imOf+7H0gO3/
         iJp0a15BTb8ZZ1IHcl7N3GfvkIosVsswVdL/jxMyCQboufa8YEpL53XaKQ5P7DeDHKp3
         zul1AhuBeMfhNZR6M1oAxG85/OTIF/YC1Dg0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818058; x=1788422858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4EukIXjQaoYAADrEOIT7O0RClK36JAxTxlGFZUyBMBo=;
        b=NtSq7K5y9JSj6YDl7y5rJBrxWT+XF7d7hEzKdazpIQM64r4v1e8XnVArRFi1tYFpMr
         KyIMGOlO38p5P7KaTPtp7A0o9R/cW1sqrbCM7yiFh0xopf6HsdHC705iHs2KdC6xQBFK
         CNfbTJmzTe54Ic1YqJ9RavvOsQ+QCEdqzNkZZnRiC2LdjeKhE+OIyVuPVmsP9DxyCezO
         eChYXl0/V+9Zg2IVYO40+9hZcxqIf+rFp++Aa6DUPXeEuHmCxouGznL8fSh+7N9ivohX
         eo6xUooQ3RZtJR08leYORYyBW4VvBS7Nqp8/B1W/GZZydolm9om0k3pJjjinbDnW+9Qz
         0xOA==
X-Gm-Message-State: AFuF++k24iM14sSWXqxN1i/maztSN31PrQGHMaVPID+BkAuEmjYE8EZE
	ASIQet34z6YaJm3aiWBxdUZQuaaKDJH4MREfEA/uHOdCdeFhcTT17t9+QsC41zgABwIb6F/SRKc
	E0lOYVQrx3kKTz4u3v9zQvzvSIPXBywyXUFDdwNgvJg==
X-Gm-Gg: AR+sD11oE7XKNDVu1cLZISS69KuFpQZKYOipTdsHMpWEmPB35rtgMR4n5Ynel3hGDa2
	npzb2UE0Ij3eS6Y95WQS0wUMTEqTzeTcLQpg73oDOgNkjoVdZhK1y6D70qDpbgG9d85pirnKAxc
	7j3aYujz8SmKBaEiMx7tinmC+93NeG9V3MPc2dm6iGU8Kn/yProuNTsaUQjMlttwXLZbAtYStJS
	GsWpi+pM/Wh2kifQ6vnFdCLu1QfZZuL/movSNxO/jF1xVDg5FHsVmpVa/+XCLzFefuTwOnx7Lvn
	e/PdKzwwSG26RNrU0NukjQ/EcPxS6Jg2yAPGKMmJojxt
X-Received: by 2002:a05:6402:3244:b0:6a5:defb:c9dd with SMTP id
 4fb4d7f45d1cf-6a5df62e513mr12842127a12.11.1787818057231; Thu, 27 Aug 2026
 01:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <18CF994DF64EF24D.642712@lists.openembedded.org>
In-Reply-To: <18CF994DF64EF24D.642712@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 27 Aug 2026 13:37:23 +0530
X-Gm-Features: AcwNN1VJ2j1bjQUctU9SD7zKmINnGvsCRIsL-zdvSpoZL25d5VCoXaEzlINnjao
Message-ID: <CANQUz1_OvZx+BUhAEjBrZNGrx5sE5j9c2H1EoVX3GgkzD3hepg@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 1/3] perl: Fix CVE-2026-13221
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000397f33065a02d432"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 08:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244470

--000000000000397f33065a02d432
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Please ignore this series.

I just saw the fixes for CVE-2026-13221 , CVE-2026-57432 in the wrynose-nut
branch.

I will send v2 patch for CVE-2026-57433 .

Thanks & Regards,
Vijay

On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> Pick patch according to [2]
>
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-13221
> [2] https://security-tracker.debian.org/tracker/CVE-2026-13221
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../perl/files/CVE-2026-13221.patch           | 76 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
> b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
> new file mode 100644
> index 0000000000..211aabd7ef
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
> @@ -0,0 +1,76 @@
> +From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001
> +From: Karl Williamson <khw@cpan.org>
> +Date: Thu, 26 Mar 2026 10:13:49 -0600
> +Subject: [PATCH] regcomp_study: Don't create a trie that would overflow
> +
> +This addresses GH #23388
> +
> +The design of the trie compiling code is to batch extra long tries into
> +smaller chunks that fit into whatever limitations there are.  However,
> +this ticket shows that that isn't always being done.
> +
> +In this case, a bunch of branches that have TAIL operands can be
> +combined together, and the final TAIL is used.  And the code requires
> +that the delta between the first branch and this final TAIL fit into a
> +16-bit field.  That is the root cause of this bug.
> +
> +I'm not familiar enough with the trie construction code to easily
> +understand why the final tail needs to be used here.  So this patch
> +simply doesn't optimize a sequence of branches into a trie that would
> +overflow.
> +
> +This could be revisited by someone who knows more about this than I, or
> +earlier in the development cycle.
> +
> +Upstream-Status: Backport [
> https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28=
c4c7
> ]
> +CVE: CVE-2026-13221
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + regcomp_study.c     | 10 ++++++++++
> + t/re/pat_advanced.t |  9 +++++++++
> + 2 files changed, 19 insertions(+)
> +
> +diff --git a/regcomp_study.c b/regcomp_study.c
> +index 05f1b01..644fbfe 100644
> +--- a/regcomp_study.c
> ++++ b/regcomp_study.c
> +@@ -1841,6 +1841,16 @@ Perl_study_chunk(pTHX_
> +                             tail =3D regnext( tail );
> +                         }
> +
> ++                      /* The code below currently saves the difference
> from
> ++                       * start to finish in a 16-bit field, causing
> ++                       * GH #23388.  This defeats the design of batchin=
g
> ++                       * tries into chunks that each fit.  khw thinks i=
t
> is
> ++                       * too late in the 5.44 cycle to relook at the
> design,
> ++                       * so for now anyway, don't make a trie that woul=
d
> ++                       * overflow */
> ++                      if (tail - startbranch >=3D U16_MAX) {
> ++                          continue;
> ++                      }
> +
> +                         DEBUG_TRIE_COMPILE_r({
> +                             regprop(RExC_rx, RExC_mysv, tail, NULL,
> pRExC_state);
> +diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
> +index 4d62f62..a3460fc 100644
> +--- a/t/re/pat_advanced.t
> ++++ b/t/re/pat_advanced.t
> +@@ -2713,6 +2713,15 @@ EOF_DEBUG_OUT
> +         $x =3D~ s/^[\x{0301}\x{030C}]+//;
> +     }
> +
> ++    { # GH #23388
> ++      fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
> ++          my $x =3D join "|", "aaa".."mzz";
> ++          my $y =3D join "|", "naa".."zzz";
> ++          use re 'Debug';
> ++          "fnord" =3D~ m/(?:$x)|(?:$y)/;
> ++          PROG
> ++    }
> ++
> +
> +     # !!! NOTE that tests that aren't at all likely to crash perl shoul=
d
> go
> +     # a ways above, above these last ones.  There's a comment there
> that, like
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb
> b/meta/recipes-devtools/perl/perl_5.42.0.bb
> index 1833b7a352..1a3451b747 100644
> --- a/meta/recipes-devtools/perl/perl_5.42.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "
> https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl \
>
> file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
>             file://CVE-2026-8376-01.patch \
>             file://CVE-2026-8376-02.patch \
> +           file://CVE-2026-13221.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://perl-configpm-switch.patch \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244465):
> https://lists.openembedded.org/g/openembedded-core/message/244465
> Mute This Topic: https://lists.openembedded.org/mt/120953088/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000397f33065a02d432
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi=C2=A0Yoann,<br><br></div>Pleas=
e ignore this series.<br><br></div>I just saw the fixes for CVE-2026-13221 =
,=C2=A0CVE-2026-57432 in the wrynose-nut branch.<br><br></div>I will send v=
2 patch for=C2=A0CVE-2026-57433 .<br><br></div>Thanks &amp;=C2=A0Regards,<b=
r></div>Vijay</div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM =
Vijay Anusuri via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.=
org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Pick patch according to [2]<br>
<br>
[1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-13221" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-13221</=
a><br>
[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-13221" =
rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tr=
acker/CVE-2026-13221</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../perl/files/CVE-2026-13221.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 76 +++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A02 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-13221.patch<br>
new file mode 100644<br>
index 0000000000..211aabd7ef<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch<br>
@@ -0,0 +1,76 @@<br>
+From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001<br>
+From: Karl Williamson &lt;<a href=3D"mailto:khw@cpan.org" target=3D"_blank=
">khw@cpan.org</a>&gt;<br>
+Date: Thu, 26 Mar 2026 10:13:49 -0600<br>
+Subject: [PATCH] regcomp_study: Don&#39;t create a trie that would overflo=
w<br>
+<br>
+This addresses GH #23388<br>
+<br>
+The design of the trie compiling code is to batch extra long tries into<br=
>
+smaller chunks that fit into whatever limitations there are.=C2=A0 However=
,<br>
+this ticket shows that that isn&#39;t always being done.<br>
+<br>
+In this case, a bunch of branches that have TAIL operands can be<br>
+combined together, and the final TAIL is used.=C2=A0 And the code requires=
<br>
+that the delta between the first branch and this final TAIL fit into a<br>
+16-bit field.=C2=A0 That is the root cause of this bug.<br>
+<br>
+I&#39;m not familiar enough with the trie construction code to easily<br>
+understand why the final tail needs to be used here.=C2=A0 So this patch<b=
r>
+simply doesn&#39;t optimize a sequence of branches into a trie that would<=
br>
+overflow.<br>
+<br>
+This could be revisited by someone who knows more about this than I, or<br=
>
+earlier in the development cycle.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/Perl/perl5/commit=
/03f74bbbd3a68350d926ee93d56ee4808c28c4c7" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808=
c28c4c7</a>]<br>
+CVE: CVE-2026-13221<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ regcomp_study.c=C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
+ t/re/pat_advanced.t |=C2=A0 9 +++++++++<br>
+ 2 files changed, 19 insertions(+)<br>
+<br>
+diff --git a/regcomp_study.c b/regcomp_study.c<br>
+index 05f1b01..644fbfe 100644<br>
+--- a/regcomp_study.c<br>
++++ b/regcomp_study.c<br>
+@@ -1841,6 +1841,16 @@ Perl_study_chunk(pTHX_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tail =3D regnext( tail );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* The code below currently saves the difference from<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* start to finish in a 16-bit field, causing<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* GH #23388.=C2=A0 This defeats the design of batching<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* tries into chunks that each fit.=C2=A0 khw thinks it is<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* too late in the 5.44 cycle to relook at the design,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* so for now anyway, don&#39;t make a trie that would<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* overflow */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tail - startbranch &gt;=3D U16_MAX) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0DEBUG_TRIE_COMPILE_r({<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regprop(RExC_rx, RExC_mysv, tail, NULL, pREx=
C_state);<br>
+diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t<br>
+index 4d62f62..a3460fc 100644<br>
+--- a/t/re/pat_advanced.t<br>
++++ b/t/re/pat_advanced.t<br>
+@@ -2713,6 +2713,15 @@ EOF_DEBUG_OUT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$x =3D~ s/^[\x{0301}\x{030C}]+//;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 { # GH #23388<br>
++=C2=A0 =C2=A0 =C2=A0 fresh_perl_is(&lt;&lt;~&#39;PROG&#39;, , &quot;&quot=
;, {}, &quot;Avoid trie overflow&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $x =3D join &quot;|&quot;, &quot;aa=
a&quot;..&quot;mzz&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $y =3D join &quot;|&quot;, &quot;na=
a&quot;..&quot;zzz&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use re &#39;Debug&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fnord&quot; =3D~ m/(?:$x)|(?:$y)=
/;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROG<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# !!! NOTE that tests that aren&#39;t at all likely to=
 crash perl should go<br>
+=C2=A0 =C2=A0 =C2=A0# a ways above, above these last ones.=C2=A0 There&#39=
;s a comment there that, like<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.0.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.42.0.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.42.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.42.0.bb</a><br>
index 1833b7a352..1a3451b747 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.0.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.42.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.42.0.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.cpan.org/src/5.0=
/perl-$%7BPV%7D.tar.gz;name=3Dperl" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cpan-Sys-Syslog-Makef=
ile.PL-Fix-_PATH_LOG-for-determ.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-8376-01.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-8376-02.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-13221.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perl-configpm-switch.patch=
 \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#244465): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244465" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/244465</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120953088/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120953088/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000397f33065a02d432--

