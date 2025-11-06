Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67348CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 10:54:57 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11990.1762426496964597104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 02:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3YoKTeu;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso451082a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 02:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762426496; x=1763031296; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7XtnzGSiZYTSSmUQlHxB/jNbV/Y6azSTF/UrAfd8xI=;
        b=R3YoKTeufR0F4wWH8HsvsTmGCjCdUT6++LVlvptYSxelgEXzhYEwp5+mbUywq3Qgkl
         FUZZ3MA90S6RfPW7VoOQU0tVoI1JTNBafmjn0u+IE7eC2oHrFd2saYqNqfs68TFP7WeB
         92WmrMYkOJiffJTD4Lw6tCQNyz6kFs3QX+D+1NINEZJHnayaY0ToghkMN/QNjUyq4FAL
         13JwRvKrBdttKCT14yyMAX+WZsPuyYzaTrFq3wPWUTaqxd2F2HqPXx8IHvMd9s04kJ4k
         6gJMvXSRHcVeoT3nTSAAnAr2SILxff9oxP5K5q3F654DnNwdnQpM3GiYngqhIAFD2cOu
         eNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426496; x=1763031296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7XtnzGSiZYTSSmUQlHxB/jNbV/Y6azSTF/UrAfd8xI=;
        b=NDhqQSMfHwIV2LLxDB7phvJP7DnmTAgUEstv31V5W8zZc82AtQnUCGtPCaK+95H8aB
         XxW2w3sVn4GBEE30BQ4HrrpyVl6haYajg24C61IkjTeu+1QGIvHA07JBed/0sxWpmVo7
         lTfd7YoOOCqFSEHVclROYjqNqf2ORfyeIqoeVrxGZnqyKS4tm+BTCFz5v/t4IwJV44XT
         0t8UL4O3pIAXrVaZS8UoYtnGT55bIcfn/Pz3RluVJ/viaPriX1KTeCIewREexhnIy1k3
         YbaVN30VznkEhcF4P7neVQqeaakZkcrg6icKY6bpTLWhXilQgjJTt9EFJ77Op5IfwbpV
         0BUw==
X-Gm-Message-State: AOJu0YwYz7AvBrTUSHZq3tZGgcchwre/OU0ofgyGlAveBVVW75R9Pvou
	JpObOdWgXSNkGGCOdFz5TuUQ8h7kS21yKW4He9m50YHkcroflDEV/q2YPF28vr2+snPMffEIvxJ
	+Dxogmuxg++kSsF8q2lnBqukTXSy4fRA=
X-Gm-Gg: ASbGncvoI6htwwuvlrh+MPvAIlaq+80htR7jxvQrdWECZef5V73l1N3o+UqJIEUuleC
	5WKI2wA1lzvrfzEnX2dGybpRyp3V77U17dRDm5hyU+m7wvcVUGkrGMrKDazFW7Ltx8Af59fIn6C
	yV051ajEuPP9jotyBJmdJ/DFbT8LwWw9uqzmyGq2/2YquBE4dlB3B3KOT/LExoL4Ac6O+NeJAw7
	Fwfyqgv0YXAUgan1oDzKWXPc5B2p9w9XRswmXi9LF1j2+M4T6k9WX64D6RqVKHSnk0CqUnU
X-Google-Smtp-Source: AGHT+IFv2UXEqV7ZnIHKSIeZebw4jaN7rpY/vw3lndw62AC8nXBbiXSYGaYH+lphkOPbXwEgB0p1wqMaeHANI8B/vZE=
X-Received: by 2002:a05:6a21:9986:b0:343:3d3c:4669 with SMTP id
 adf61e73a8af0-34f846fe122mr8714402637.17.1762426495529; Thu, 06 Nov 2025
 02:54:55 -0800 (PST)
MIME-Version: 1.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
 <42a078860d319a90ff0a346546a70dd972c28613.1762154252.git.joerg.sommer@navimatix.de>
In-Reply-To: <42a078860d319a90ff0a346546a70dd972c28613.1762154252.git.joerg.sommer@navimatix.de>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 6 Nov 2025 11:54:43 +0100
X-Gm-Features: AWmQ_bkgeuzPgjQ3fcp5XvAD_Kyabtbax-SyhMPfxZSU4AF2HmNT8MADzuO8kvk
Message-ID: <CAApg2=TKg+kvyLK6vytZ9QnYJ7_71O+_2_Hvu4KrddUYmJfjRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/18] glib-2.0: Upgrade 2.86.0 -> 2.86.1
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003578c30642eae5a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 10:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225970

--0000000000003578c30642eae5a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I'm favorable for taking this patch to the release. Some of the fixes look
like potential security issues (even if I do not see any CVEs for now).

Kind regards,
Marta

On Mon, Nov 3, 2025 at 8:27=E2=80=AFAM J=C3=B6rg Sommer via lists.openembed=
ded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Overview of changes in GLib 2.86.1, 2025-10-21
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * Bugs fixed:
>   - #3745 GIRepository: union fields offsets for compiled typelibs all ha=
ve
>     offset 0xffff (unknown) (Philip Chimento)
>   - #3780 `gio/tests/socket-listener` requires dlsym
>   - #3781 GLib.OptionContext's get_help() includes width of invisible
> options
>     (FeRD (Frank Dana))
>   - #3783 [CI] Pipeline on 'main' failed for commit c31c4a52 (Tobias
> Stoeckmann)
>   - #3784 Memory leak related to g_get_home_dir (Michael Catanzaro)
>   - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with
> non-existent
>     paths (Philip Withnall)
>   - #3803 GNetworkMonitor's netlink backend doesn't notify connectivity
> change
>     (Philip Withnall)
>   - https://gitlab.gnome.org/Infrastructure/Infrastructure/-/issues/
>   - !4755 ghash: Fix entry_is_big for CHERI architecture
>   - !4756 ghash: Handle all table sizes in iterator
>   - !4760 gbookmarkfile: Escape icon href and mime-type
>   - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code
>   - !4775 Update Ukrainian translation
>   - !4776 Update Catalan translation
>   - !4777 Update Lithuanian translation
>   - !4778 tests: Fix clang compilation warnings
>   - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul
>   - !4780 Update Brazilian Portuguese translation
>   - !4781 Update eu translation
>   - !4782 Update Korean translation
>   - !4785 Update Japanese translation
>   - !4786 Update Galician translations
>   - !4787 Update Hungarian translation
>   - !4791 gstrfuncs: Check string length in g_strescape
>   - !4800 gutils: Improve load_user_special_dirs' user-dirs.dirs parser
>   - !4802 Update Turkish translation
>   - !4809 Trivial backport of "gutils: Handle singletons in unlocked
> functions"
>     to glib-2-86 branch
>   - !4814 Backport translation updates to glib-2-86
>   - !4821 Backport !4820 =E2=80=9Cgio/tests: Fix a race condition in
>     /gdbus/connection/flush=E2=80=9D to glib-2-86
>   - !4828 Backport !4827 =E2=80=9Cghostutils: Treat 0x80 (and above) as n=
on-ASCII=E2=80=9D
> to
>     glib-2-86
>   - !4834 Backport !4810 and !4819, various fixes to user-dirs.dirs
> handling in
>     gutils
>   - !4836 Backport !4835 =E2=80=9CUpdate Portuguese translation=E2=80=9D =
to glib-2-86
>   - !4839 Update Romanian translation
>   - !4842 Backport "girnode: Fix computation of union member offsets" to
>     glib-2-86
>   - !4848 Update British English translation (2.86)
>   - !4865 Backport !4859 =E2=80=9Cgopenuriportal: Fix a crash when the fi=
le can=E2=80=99t
> be
>     opened=E2=80=9D to glib-2-86
>   - !4867 Backport !4792 =E2=80=9Cgtype: Use transfer none for types (un)=
ref
> functions=E2=80=9D
>     to glib-2-86
>   - !4872 Fix macOS and msys2 CI builds on glib-2-86 branch
>   - !4873 Backport !4871 =E2=80=9Cgnetworkmonitorbase: Add missing
> notify::connectivity
>     signal=E2=80=9D to glib-2-86
>
> * Translation updates:
>   - Basque (Asier Saratsua Garmendia)
>   - Catalan (Jordi Mas)
>   - English (United Kingdom) (Bruce Cowan)
>   - Esperanto (Kristjan ESPERANTO)
>   - Galician (Fran Dieguez)
>   - Hungarian (Bal=C3=A1zs =C3=9Ar)
>   - Japanese (Makoto Sakaguchi)
>   - Korean (Changwoo Ryu)
>   - Lithuanian (Aurimas =C4=8Cernius)
>   - Portuguese (Hugo Carvalho)
>   - Portuguese (Brazil) (Rafael Fontenelle)
>   - Romanian (Antonio Marin)
>   - Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=
=B2=D0=B8=D1=9B)
>   - Turkish (Sabri =C3=9Cnal)
>   - Ukrainian (Yuri Chornoivan)
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../{glib-2.0-initial_2.86.0.bb =3D> glib-2.0-initial_2.86.1.bb}  | 0
>  .../glib-2.0/{glib-2.0_2.86.0.bb =3D> glib-2.0_2.86.1.bb}         | 0
>  meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.0.bb =3D>
> glib-2.0-initial_2.86.1.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.0.bb =3D>
> glib-2.0_2.86.1.bb} (100%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
> b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.1.bb
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb
> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> index 2e8dde2820..5909851896 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -236,7 +236,7 @@ SRC_URI:append:class-native =3D "
> file://relocate-modules.patch \
>
>  file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
>                                "
>
> -SRC_URI[archive.sha256sum] =3D
> "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408e4d1faea580d6d"
> +SRC_URI[archive.sha256sum] =3D
> "119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57"
>
>  # Find any meson cross files in FILESPATH that are relevant for the
> current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225603):
> https://lists.openembedded.org/g/openembedded-core/message/225603
> Mute This Topic: https://lists.openembedded.org/mt/116094110/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003578c30642eae5a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I&#39;m favorable for taking this pa=
tch to the release. Some of the fixes look like potential security issues (=
even if I do not see any CVEs for now).</div><div><br></div><div>Kind regar=
ds,</div><div>Marta<br></div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 3, 2025 at 8=
:27=E2=80=AFAM J=C3=B6rg Sommer via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimati=
x.de@lists.openembedded.org">navimatix.de@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: J=C3=
=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de" target=3D"_bl=
ank">joerg.sommer@navimatix.de</a>&gt;<br>
<br>
Overview of changes in GLib 2.86.1, 2025-10-21<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
* Bugs fixed:<br>
=C2=A0 - #3745 GIRepository: union fields offsets for compiled typelibs all=
 have<br>
=C2=A0 =C2=A0 offset 0xffff (unknown) (Philip Chimento)<br>
=C2=A0 - #3780 `gio/tests/socket-listener` requires dlsym<br>
=C2=A0 - #3781 GLib.OptionContext&#39;s get_help() includes width of invisi=
ble options<br>
=C2=A0 =C2=A0 (FeRD (Frank Dana))<br>
=C2=A0 - #3783 [CI] Pipeline on &#39;main&#39; failed for commit c31c4a52 (=
Tobias Stoeckmann)<br>
=C2=A0 - #3784 Memory leak related to g_get_home_dir (Michael Catanzaro)<br=
>
=C2=A0 - #3798 Gio.AppInfo.launch_default_for_uri_async crashes with non-ex=
istent<br>
=C2=A0 =C2=A0 paths (Philip Withnall)<br>
=C2=A0 - #3803 GNetworkMonitor&#39;s netlink backend doesn&#39;t notify con=
nectivity change<br>
=C2=A0 =C2=A0 (Philip Withnall)<br>
=C2=A0 - <a href=3D"https://gitlab.gnome.org/Infrastructure/Infrastructure/=
-/issues/" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/In=
frastructure/Infrastructure/-/issues/</a><br>
=C2=A0 - !4755 ghash: Fix entry_is_big for CHERI architecture<br>
=C2=A0 - !4756 ghash: Handle all table sizes in iterator<br>
=C2=A0 - !4760 gbookmarkfile: Escape icon href and mime-type<br>
=C2=A0 - !4773 docs: Add Luca Bacci as a co-maintainer of the Windows code<=
br>
=C2=A0 - !4775 Update Ukrainian translation<br>
=C2=A0 - !4776 Update Catalan translation<br>
=C2=A0 - !4777 Update Lithuanian translation<br>
=C2=A0 - !4778 tests: Fix clang compilation warnings<br>
=C2=A0 - !4779 gmem: Replace SIZE_OVERFLOWS with g_size_checked_mul<br>
=C2=A0 - !4780 Update Brazilian Portuguese translation<br>
=C2=A0 - !4781 Update eu translation<br>
=C2=A0 - !4782 Update Korean translation<br>
=C2=A0 - !4785 Update Japanese translation<br>
=C2=A0 - !4786 Update Galician translations<br>
=C2=A0 - !4787 Update Hungarian translation<br>
=C2=A0 - !4791 gstrfuncs: Check string length in g_strescape<br>
=C2=A0 - !4800 gutils: Improve load_user_special_dirs&#39; user-dirs.dirs p=
arser<br>
=C2=A0 - !4802 Update Turkish translation<br>
=C2=A0 - !4809 Trivial backport of &quot;gutils: Handle singletons in unloc=
ked functions&quot;<br>
=C2=A0 =C2=A0 to glib-2-86 branch<br>
=C2=A0 - !4814 Backport translation updates to glib-2-86<br>
=C2=A0 - !4821 Backport !4820 =E2=80=9Cgio/tests: Fix a race condition in<b=
r>
=C2=A0 =C2=A0 /gdbus/connection/flush=E2=80=9D to glib-2-86<br>
=C2=A0 - !4828 Backport !4827 =E2=80=9Cghostutils: Treat 0x80 (and above) a=
s non-ASCII=E2=80=9D to<br>
=C2=A0 =C2=A0 glib-2-86<br>
=C2=A0 - !4834 Backport !4810 and !4819, various fixes to user-dirs.dirs ha=
ndling in<br>
=C2=A0 =C2=A0 gutils<br>
=C2=A0 - !4836 Backport !4835 =E2=80=9CUpdate Portuguese translation=E2=80=
=9D to glib-2-86<br>
=C2=A0 - !4839 Update Romanian translation<br>
=C2=A0 - !4842 Backport &quot;girnode: Fix computation of union member offs=
ets&quot; to<br>
=C2=A0 =C2=A0 glib-2-86<br>
=C2=A0 - !4848 Update British English translation (2.86)<br>
=C2=A0 - !4865 Backport !4859 =E2=80=9Cgopenuriportal: Fix a crash when the=
 file can=E2=80=99t be<br>
=C2=A0 =C2=A0 opened=E2=80=9D to glib-2-86<br>
=C2=A0 - !4867 Backport !4792 =E2=80=9Cgtype: Use transfer none for types (=
un)ref functions=E2=80=9D<br>
=C2=A0 =C2=A0 to glib-2-86<br>
=C2=A0 - !4872 Fix macOS and msys2 CI builds on glib-2-86 branch<br>
=C2=A0 - !4873 Backport !4871 =E2=80=9Cgnetworkmonitorbase: Add missing not=
ify::connectivity<br>
=C2=A0 =C2=A0 signal=E2=80=9D to glib-2-86<br>
<br>
* Translation updates:<br>
=C2=A0 - Basque (Asier Saratsua Garmendia)<br>
=C2=A0 - Catalan (Jordi Mas)<br>
=C2=A0 - English (United Kingdom) (Bruce Cowan)<br>
=C2=A0 - Esperanto (Kristjan ESPERANTO)<br>
=C2=A0 - Galician (Fran Dieguez)<br>
=C2=A0 - Hungarian (Bal=C3=A1zs =C3=9Ar)<br>
=C2=A0 - Japanese (Makoto Sakaguchi)<br>
=C2=A0 - Korean (Changwoo Ryu)<br>
=C2=A0 - Lithuanian (Aurimas =C4=8Cernius)<br>
=C2=A0 - Portuguese (Hugo Carvalho)<br>
=C2=A0 - Portuguese (Brazil) (Rafael Fontenelle)<br>
=C2=A0 - Romanian (Antonio Marin)<br>
=C2=A0 - Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=
=D0=B2=D0=B8=D1=9B)<br>
=C2=A0 - Turkish (Sabri =C3=9Cnal)<br>
=C2=A0 - Ukrainian (Yuri Chornoivan)<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://glib-2.0-initial_2.86.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">glib-2.0-initial_2.86.0.bb</a> =3D&gt; <a href=3D"http:/=
/glib-2.0-initial_2.86.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-=
initial_2.86.1.bb</a>}=C2=A0 | 0<br>
=C2=A0.../glib-2.0/{<a href=3D"http://glib-2.0_2.86.0.bb" rel=3D"noreferrer=
" target=3D"_blank">glib-2.0_2.86.0.bb</a> =3D&gt; <a href=3D"http://glib-2=
.0_2.86.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.1.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
-<br>
=C2=A03 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0-initial=
_2.86.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.0.bb=
</a> =3D&gt; <a href=3D"http://glib-2.0-initial_2.86.1.bb" rel=3D"noreferre=
r" target=3D"_blank">glib-2.0-initial_2.86.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2.86.0.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.0.bb</a> =3D&gt; <a =
href=3D"http://glib-2.0_2.86.1.bb" rel=3D"noreferrer" target=3D"_blank">gli=
b-2.0_2.86.1.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0-initial_=
2.86.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.0.bb<=
/a> b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0-initial_2.86.1.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0-initial_2=
.86.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.0.bb</=
a><br>
rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0-initial_2.8=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0-initial_2.86.1.bb</a>=
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.86.0.b=
b" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.0.bb</a> b/meta/recip=
es-core/glib-2.0/<a href=3D"http://glib-2.0_2.86.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">glib-2.0_2.86.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.86.0.bb=
" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.0.bb</a><br>
rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.86.1.bb" =
rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.86.1.bb</a><br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc<br>
index 2e8dde2820..5909851896 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
+++ b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -236,7 +236,7 @@ SRC_URI:append:class-native =3D &quot; file://relocate-=
modules.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.build-do-not=
-enable-pidfd-features-on-native-g.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[archive.sha256sum] =3D &quot;b5739972d737cfb0d6fd1e7f163dfe650e2e0=
3740bb3b8d408e4d1faea580d6d&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;119d1708ca022556d6d2989ee90ad1b82bd9c=
0d1667e066944a6d0020e2d5e57&quot;<br>
<br>
=C2=A0# Find any meson cross files in FILESPATH that are relevant for the c=
urrent<br>
=C2=A0# build (using siteinfo) and add them to EXTRA_OEMESON.<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225603" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116094110/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116094110/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003578c30642eae5a2--

