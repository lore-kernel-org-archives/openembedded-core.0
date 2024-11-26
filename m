Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA7DD3B98D
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 13:02:52 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.45290.1732626171988637813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 05:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZWjHd+d;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ea45abb4e1so912979b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 05:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732626171; x=1733230971; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clEFaJnYKHs5b2u5DEBSr/mfUVVZeje8vggxEFM3wH8=;
        b=AZWjHd+dyzKPXFb/3BSj5gvMqe3migpQkh/q4Vr6nQrJGDMsHahkyo/fm6VeNPUnXy
         vyGJJcZM0zOHGZjUevr5QzGP18NDeVOj0vB7A2CpUnVd7s5yfhZrzyh3b+Rhe49jrh7r
         TAdxgiClrI1BFivjtodNCxkQMLoCzGY7nHhlpGFiQB/cVhCVRMOYAt9vkaMsILvC9dTW
         804uI3V6B3/Mnl4LG1L2VgIM86H5iidW844SLPZn0QG8OHxDrdsGn4DnDTWcQ1xkIKBf
         R2L+L9kTyfGbx8uloCHP7X3PKgRgeFCp2DYG8jjP8wT/e3FsJm4xhSBBYSmO5njpcKk8
         vsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732626171; x=1733230971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clEFaJnYKHs5b2u5DEBSr/mfUVVZeje8vggxEFM3wH8=;
        b=LUDEhDwDOYop5jmL2jURp3BDm80KiHN4G1YmyAE4cOKWJ+j6QUB5FgKkdTQeVpwDTt
         Do3Axf0JRJQWpsz0WLG+yc5D9W7pektm21TsMRmMfFvtM8V7J9vyQxafKAbtV54JKx6Y
         LG+nCziFv5/HkKrQiEXH3RVax+8UsCsqA2UCYfrCZJkx5ebg1ZJNRZGuAJmfUigWC85v
         2KFIyFqWXhl+yybsml99JWwrYz6xA6PAVNAFTQx9MXJKlES/UmPTE6mVsh8apzJ2rE11
         ifDPIY9F/HRi1xlBpc9IFicL5UhxIZUUSSOojL62M6dCwlVR/bTVloVWXB3sP9fUXGd4
         68Vw==
X-Gm-Message-State: AOJu0YzsrPrGviimvG7htY7X+e/v0vjHW/bw+GPTTstQP3ZTJ9auj1bL
	V90Po6ejPwCz2sG0CUZ6OkJL/5BftZWcgNFj2Sa/Y80C6q0uXIwFlMMzZiAsriGXoTTyC3T7h+q
	NWyV60Rts3TSp4cfPdahUkaWHGypefYhm
X-Gm-Gg: ASbGncvpRtaS1OGRMooDKS/vAvc6h4fXUPCUM4LBO37gxx4eM8bEQNjhdOWD0d8Pe63
	qawTezAyvS6VLeSOYaHjF83Tn8b06UA==
X-Google-Smtp-Source: AGHT+IGI2dKwM4W/pbJG6UMnfUVMM8vyH32AYvy4fwmymOVzt7RBi0jS4I4gIlIQ4ezO1N4UFq0bxkrQmDsGqVjACFc=
X-Received: by 2002:a05:6808:1a23:b0:3e7:e8de:44ec with SMTP id
 5614622812f47-3e9158770d5mr16328581b6e.22.1732626168551; Tue, 26 Nov 2024
 05:02:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730950520.git.steve@sakoman.com> <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
In-Reply-To: <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 26 Nov 2024 14:02:37 +0100
Message-ID: <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the
 database during builds
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 13:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207851

Hello,

I'm wondering if I'm the only one who couldn't complete do_fetch of
cve-update-nvd2-native with maximum retries on CVE API?
I tried with or without API Key, from several different machines, I
also tried to increase retries number etc, without success.

I see on the NVD status page the following warning :
"Due to changes described below, a large number of CVE records have
recently been updated, resulting in a large increase in API requests.
We are aware of the issue and are working to mitigate it. Thank you
for your patience."

I see the Buildroot switched from NVD to alternative FKIE github
database due to that API 2.0 inconsistency :/

I'm not sure what are my options here, quite odd that cybersecurity
organisation get impacted by DDoS :D

Best regards,
Vincent

Le jeu. 7 nov. 2024 =C3=A0 04:38, Steve Sakoman via lists.openembedded.org
<steve=3Dsakoman.com@lists.openembedded.org> a =C3=A9crit :
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Rtaher than trying to use a sqlite database over NFS from DL_DIR, work fr=
om
> a local copy in STAGING DIR after fetching.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 03596904392d257572a905a182b92c780d636744)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/cve-check.bbclass                 |  7 ++++---
>  .../meta/cve-update-nvd2-native.bb             | 18 +++++++++++++-----
>  2 files changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index d287cf1457..ed219bf472 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -31,8 +31,9 @@
>  CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>
> -CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
> -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
> +CVE_CHECK_DB_FILENAME ?=3D "nvdcve_2-2.db"
> +CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
> +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
>  CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
>
>  CVE_CHECK_LOG ?=3D "${T}/cve.log"
> @@ -198,7 +199,7 @@ python do_cve_check () {
>  }
>
>  addtask cve_check before do_build
> -do_cve_check[depends] =3D "cve-update-nvd2-native:do_fetch"
> +do_cve_check[depends] =3D "cve-update-nvd2-native:do_unpack"
>  do_cve_check[nostamp] =3D "1"
>
>  python cve_check_cleanup () {
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index 92177712dc..5fbe9095cc 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -8,7 +8,6 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>
>  inherit native
>
> -deltask do_unpack
>  deltask do_patch
>  deltask do_configure
>  deltask do_compile
> @@ -35,7 +34,9 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>  # Number of attempts for each http query to nvd server before giving up
>  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
>
> -CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
> +CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAM=
E}"
> +CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
> +CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
>
>  python () {
>      if not bb.data.inherits_class("cve-check", d):
> @@ -52,9 +53,9 @@ python do_fetch() {
>
>      bb.utils.export_proxies(d)
>
> -    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
> +    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
>      db_dir =3D os.path.dirname(db_file)
> -    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
> +    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
>
>      cleanup_db_download(db_file, db_tmp_file)
>      # By default let's update the whole database (since time 0)
> @@ -77,6 +78,7 @@ python do_fetch() {
>          pass
>
>      bb.utils.mkdirhier(db_dir)
> +    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
>      if os.path.exists(db_file):
>          shutil.copy2(db_file, db_tmp_file)
>
> @@ -89,10 +91,16 @@ python do_fetch() {
>          os.remove(db_tmp_file)
>  }
>
> -do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
>  do_fetch[file-checksums] =3D ""
>  do_fetch[vardeps] =3D ""
>
> +python do_unpack() {
> +    import shutil
> +    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_C=
HECK_DB_FILE"))
> +}
> +do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FIL=
E_LOCK}"
> +
>  def cleanup_db_download(db_file, db_tmp_file):
>      """
>      Cleanup the download space from possible failed downloads
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206820): https://lists.openembedded.org/g/openembedde=
d-core/message/206820
> Mute This Topic: https://lists.openembedded.org/mt/109438548/3616779
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [vi=
ncent.prince.fr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

