Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2863E9DE60
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:54:53 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127465.1775721284807778954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jJ0PiFAG;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: ernstp@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66d24c6963bso1004551a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 00:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775721283; cv=none;
        d=google.com; s=arc-20240605;
        b=VnToozZrRlJKthn09eMdTxwULVWYTfFkg2NpF4ULqg3MM5y989FF26Uk8yzTMxQvk5
         JfHi+urAECLauE+itjzPH7T30R7TU1re++dZmRLw1GwFORaAG5I0VgYdZ4M8L/sYqA0J
         +7EhNu1S31sZUACCthxcVRBuCrOXt3wcJATFxMtqyg7zUI/UYY9IjV063LRVOOLUt5P1
         0lTgQx5WZgt2a7kwKGoMRa000IIRvep/Up9rtPIyu3vFWmI61uy/DOO/zjsG8t8UKLsr
         VRIVCiA5EQyDItWvhA+8WLJmJVMjBSSwAarIf8u/GrlK1I3vCmHU7c3CmTICm4dlNerN
         dSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HD3frI4iESRYet5KTHcdC/5cNjKF2lMAtT1f9/PAtJA=;
        fh=rlbhNh9gcJiINQfW3PQRywlttkQ23LkFGl5iAUzcBfo=;
        b=DJiSxkLue/V7RMDuVYXsrCncsw2Ka0v1kXhGNIqILFPxl1EJpTZoixaJeuBlw10R9f
         2CegMkMlAC6C4TiUEalY5N4vLH6TmzZrtUrsMZtjHaMUdII9smkj6GiHFyVj8jYTM4dv
         cay0xTN3f+pcFZ06bW4Ee9eCYtnweXnlAE9jZhW9FrkFwuzTTK08QcXWELWdRpcd3DxK
         8zHLLMNMd1MxLb6xP8x8kVGx7Wjy5eSqHR2rbMk0bnZRsw2e2sYmurde+tTAbh+P0p5f
         n+KhNOYnd6aSNatlb5+Yb/DHstA84KYCtmig3GG8JhVMdLTAoXWXCR5nMES/p24r2Pr1
         ed4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775721283; x=1776326083; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HD3frI4iESRYet5KTHcdC/5cNjKF2lMAtT1f9/PAtJA=;
        b=jJ0PiFAGw4O81cscRfvAIZciGnM4+bRLTqwZ8KUz6dzKyixxEVanrVZ5GC3nGkIcxj
         TmmguCf8WO0M8MA/X2iiq3Gh2enTce3mDCuzG9gZxjN2SdDphvLt+Bu055Vb+Rt+ygfL
         c5qNojY4XfaVco/ZZwly2pYlJwBQVhbRHF7kixVxGN5w5e9ABpCfWDrpjlzoTs+NRzQj
         ISY5gP/t7LeLGpnCa1njswWcNyFgepO2BC6quSBifd5QbhdqGW/lW/NN083W73E6Oh6k
         xvQQPgwjZpVNmfoMmYy18h+PqLWWcnijFLZL6tu7f2r/aIwa7fevGQCVQrfErSVgnvqj
         Rcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721283; x=1776326083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD3frI4iESRYet5KTHcdC/5cNjKF2lMAtT1f9/PAtJA=;
        b=HKgyeg8Tsomb6QduHt3qCpGQGNmTtf2pZS0avlxzrF4xAKdjvSMLdTaYR59kTEzsfT
         VmbIZVo4LE225wG5iPY2sI4jehoqaoSMTNh6w16ZW0avD4GQ+dUeMcvZVtHkfFIQxcFL
         qdgzAinxFHMMntuLyxgCJyZRNvcJxfVhw5QBKX8a461vZSZLsPqkCOhCUQSTu53ElbLA
         7u5x3c1L3ixfFk8CmFg8KPuvtt9Vcc7LYN/40r2ZZewXOsJNk1ZFDnL3yFr212fplp1v
         mYrfK/e483h39WbtGFc+qh/3wcVx03lvZhsf+dDj0lrLLVvUOxt5NHmkG6ltstFYAkmR
         lX7g==
X-Forwarded-Encrypted: i=1; AJvYcCVhGG5vcQCJcMthY1HjwembdA5KZQSLEdNfeYQOcAhQhlNTIgsfZIn9G08Zl/tn6o2ex/yTif7I2RYn9+8urTI5eQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjhIk72gc9AuUzAIGPR/osvucMzjgSAhSULtek+tPU0JFIdCZp
	zKq9245eUgfqWuohUwSFh58EkRD6DSO3384/KVz75nIEP0lZVntTH09YDYSsaNM5dDA62f4yltG
	b8WPfTMz0xSnH4uGLEhSdONsMYK2ycs8=
X-Gm-Gg: AeBDieubUSk1F89tUiA+4AMsy4HZ00i5TNbVuQkSV4EYWJXEM3V3+bR9VZKLPQmG2Rq
	aFeX80r6eeSbEpa1YgRyJqV0cWCGQOcv4JZIXYRIC3Fc7xuEqG09ws1szB5eK3vaA+3fJhkRbvr
	DOdnkPDUBLMK+/ryGbVVDvxfaux9K+tMi0l6TJdZ0plqM3WCNuYAIAJTIcD9faCZUNwYjmcC7xP
	4ALRJ/Goo+U7dWy14GtljWGxqr5GS+F+J7JteE1VGRY9lX+qchMxCOaPlx9DDXwkrfCat6vOOYg
	2wm2769S33SC5eaeo4ioA0LyBexPjeKVKFX4C6I4IoA1TdbljNVepTf8k+lKP2He/BgPUNYRVXK
	CMeuOltcuFllirCHG6erZQlUq69tpTJT1ZJ32F4094vO/pfFa9oem3Rnc709R2vUciBuwY0a/a0
	gKyO9cGQeBr/JQ+ZHZGiFGxj/lTHLeS+JlgOg2V42l4mbzXRo3eBffP7Ddq0CJSnDa0pCA
X-Received: by 2002:a05:6402:241d:b0:669:cc03:334a with SMTP id
 4fb4d7f45d1cf-67003fef397mr1442517a12.11.1775721282685; Thu, 09 Apr 2026
 00:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260323053041.7848-1-hprajapati@mvista.com> <DHDXTZVTX375.10CYDEYY8UJK9@smile.fr>
In-Reply-To: <DHDXTZVTX375.10CYDEYY8UJK9@smile.fr>
From: Ernst Persson <ernstp@gmail.com>
Date: Thu, 9 Apr 2026 09:54:29 +0200
X-Gm-Features: AQROBzCMf_FPSbvg6UDhQwYao7qTG8HOeo-8q8jy-PqHulDLFu5ul6KEFeZMC4o
Message-ID: <CAD=4a=XhNPQY+RJDRnBsTqOGVPf0gWKFtiowVucWQR-TtpEMaQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157, CVE-2026-26158
To: yoann.congal@smile.fr
Cc: hprajapati@mvista.com, openembedded-core@lists.openembedded.org, 
	Jinfeng.Wang.CN=windriver.com@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000465025064f025440"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 07:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234891

--000000000000465025064f025440
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But, as far as I can tell, this CVE also applies to whinlatter and
master. You need to send the fix there before I can take it for
scarthgap and kirkstone.


What's the best fix for the master branch? Is it time to switch from 1.37
to a git snapshot?
1.37 is soon 2 years old. Or we just keep patching the CVEs there also.



Den l=C3=B6r 28 mars 2026 kl 00:02 skrev Yoann Congal via lists.openembedde=
d.org
<yoann.congal=3Dsmile.fr@lists.openembedded.org>:

> On Mon Mar 23, 2026 at 6:30 AM CET, Hitendra Prajapati via
> lists.openembedded.org wrote:
> > Pick up patch from NVD report.
> >
> > More details :
> > [1]: https://nvd.nist.gov/vuln/detail/CVE-2026-26157
> > [2]: https://nvd.nist.gov/vuln/detail/CVE-2026-26158
> >
> > Note:
> > We use patch from busybox mirror that looks trustworthy
> https://gogs.librecmc.org/OWEALS/busybox.
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
>
> Hello,
>
> Thank you for this new patch, it looks good now.
> But, as far as I can tell, this CVE also applies to whinlatter and
> master. You need to send the fix there before I can take it for
> scarthgap and kirkstone.
>
> Regards,
>
> >  .../CVE-2026-26157-CVE-2026-26158-01.patch    | 198 ++++++++++++++++++
> >  .../CVE-2026-26157-CVE-2026-26158-02.patch    |  37 ++++
> >  meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
> >  3 files changed, 237 insertions(+)
> >  create mode 100644
> meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
> >  create mode 100644
> meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
> >
> > diff --git
> a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patc=
h
> b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patc=
h
> > new file mode 100644
> > index 0000000000..cdc2394794
> > --- /dev/null
> > +++
> b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patc=
h
> > @@ -0,0 +1,198 @@
> > +From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 2001
> > +From: Denys Vlasenko <vda.linux@googlemail.com>
> > +Date: Thu, 29 Jan 2026 11:48:02 +0100
> > +Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does
> the same
> > +
> > +Defends against files like these (python reproducer):
> > +
> > +import tarfile
> > +ti =3D tarfile.TarInfo("leak_hosts")
> > +ti.type =3D tarfile.LNKTYPE
> > +ti.linkname =3D "/etc/hosts"  # or "../etc/hosts" or ".."
> > +ti.size =3D 0
> > +with tarfile.open("/tmp/hardlink.tar", "w") as t:
> > +     t.addfile(ti)
> > +
> > +function                                             old     new   del=
ta
> > +skip_unsafe_prefix                                     -     127    +1=
27
> > +get_header_tar                                      1752    1754      =
+2
> > +.rodata                                           106861  106856      =
-5
> > +unzip_main                                          2715    2706      =
-9
> > +strip_unsafe_prefix                                  102      18     -=
84
> >
> +------------------------------------------------------------------------=
------
> > +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total:
> 31 bytes
> > +
> > +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> > +
> > +CVE: CVE-2026-26157, CVE-2026-26158
> > +Upstream-Status: Backport [
> https://git.busybox.net/busybox/commit/?id=3D3fb6b31c716669e12f75a2accd31=
bb7685b1a1cb
> ]
> > +(Alternative mirrored URL:
> https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2acc=
d31bb7685b1a1cb
> )
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + archival/libarchive/data_extract_all.c      |  7 +++--
> > + archival/libarchive/get_header_tar.c        | 11 ++++++--
> > + archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++---=
-
> > + archival/libarchive/unsafe_symlink_target.c |  1 +
> > + archival/tar.c                              |  2 +-
> > + archival/unzip.c                            |  2 +-
> > + include/bb_archive.h                        |  3 ++-
> > + 7 files changed, 42 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/archival/libarchive/data_extract_all.c
> b/archival/libarchive/data_extract_all.c
> > +index 8a69711..b84b960 100644
> > +--- a/archival/libarchive/data_extract_all.c
> > ++++ b/archival/libarchive/data_extract_all.c
> > +@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t
> *archive_handle)
> > +     }
> > + #endif
> > + #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
> > +-    /* Strip leading "/" and up to last "/../" path component */
> > +-    dst_name =3D (char *)strip_unsafe_prefix(dst_name);
> > ++    /* Skip leading "/" and past last ".." path component */
> > ++    dst_name =3D (char *)skip_unsafe_prefix(dst_name);
> > + #endif
> > + // ^^^ This may be a problem if some applets do need to extract
> absolute names.
> > + // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
> > +@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t
> *archive_handle)
> > +
> > +             /* To avoid a directory traversal attack via symlinks,
> > +              * do not restore symlinks with ".." components
> > +-             * or symlinks starting with "/", unless a magic
> > +-             * envvar is set.
> > ++             * or symlinks starting with "/"
> > +              *
> > +              * For example, consider a .tar created via:
> > +              *  $ tar cvf bug.tar anything.txt
> > +diff --git a/archival/libarchive/get_header_tar.c
> b/archival/libarchive/get_header_tar.c
> > +index cc6f3f0..1c40ece 100644
> > +--- a/archival/libarchive/get_header_tar.c
> > ++++ b/archival/libarchive/get_header_tar.c
> > +@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t
> *archive_handle)
> > + #endif
> > +
> > +     /* Everything up to and including last ".." component is stripped
> */
> > +-    overlapping_strcpy(file_header->name,
> strip_unsafe_prefix(file_header->name));
> > +-//TODO: do the same for file_header->link_target?
> > ++    strip_unsafe_prefix(file_header->name);
> > ++    if (file_header->link_target) {
> > ++            /* GNU tar 1.34 examples:
> > ++             * tar: Removing leading '/' from hard link targets
> > ++             * tar: Removing leading '../' from hard link targets
> > ++             * tar: Removing leading 'etc/../' from hard link targets
> > ++             */
> > ++            strip_unsafe_prefix(file_header->link_target);
> > ++    }
> > +
> > +     /* Strip trailing '/' in directories */
> > +     /* Must be done after mode is set as '/' is used to check if it's
> a directory */
> > +diff --git a/archival/libarchive/unsafe_prefix.c
> b/archival/libarchive/unsafe_prefix.c
> > +index 6670811..89a371a 100644
> > +--- a/archival/libarchive/unsafe_prefix.c
> > ++++ b/archival/libarchive/unsafe_prefix.c
> > +@@ -5,11 +5,11 @@
> > + #include "libbb.h"
> > + #include "bb_archive.h"
> > +
> > +-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
> > ++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
> > + {
> > +     const char *cp =3D str;
> > +     while (1) {
> > +-            char *cp2;
> > ++            const char *cp2;
> > +             if (*cp =3D=3D '/') {
> > +                     cp++;
> > +                     continue;
> > +@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const
> char *str)
> > +                     cp +=3D 3;
> > +                     continue;
> > +             }
> > +-            cp2 =3D strstr(cp, "/../");
> > ++            cp2 =3D cp;
> > ++ find_dotdot:
> > ++            cp2 =3D strstr(cp2, "/..");
> > +             if (!cp2)
> > +-                    break;
> > +-            cp =3D cp2 + 4;
> > ++                    break; /* No (more) malicious components */
> > ++
> > ++            /* We found "/..something" */
> > ++            cp2 +=3D 3;
> > ++            if (*cp2 !=3D '/') {
> > ++                    if (*cp2 =3D=3D '\0') {
> > ++                            /* Trailing "/..": malicious, return "" *=
/
> > ++                            /* (causes harmless errors trying to
> create or hardlink a file named "") */
> > ++                            return cp2;
> > ++                    }
> > ++                    /* "/..name" is not malicious, look for next "/..=
"
> */
> > ++                    goto find_dotdot;
> > ++            }
> > ++            /* Found "/../": malicious, advance past it */
> > ++            cp =3D cp2 + 1;
> > +     }
> > +     if (cp !=3D str) {
> > +             static smallint warned =3D 0;
> > +@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char
> *str)
> > +     }
> > +     return cp;
> > + }
> > ++
> > ++void FAST_FUNC strip_unsafe_prefix(char *str)
> > ++{
> > ++    overlapping_strcpy(str, skip_unsafe_prefix(str));
> > ++}
> > +diff --git a/archival/libarchive/unsafe_symlink_target.c
> b/archival/libarchive/unsafe_symlink_target.c
> > +index f8dc803..d764c89 100644
> > +--- a/archival/libarchive/unsafe_symlink_target.c
> > ++++ b/archival/libarchive/unsafe_symlink_target.c
> > +@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
> > +                             *list->data ? "hard" : "sym",
> > +                             list->data + 1, target
> > +                     );
> > ++                    /* Note: GNU tar 1.34 errors out only _after_ all
> links are (attempted to be) created */
> > +             }
> > +             list =3D list->link;
> > +     }
> > +diff --git a/archival/tar.c b/archival/tar.c
> > +index 9de3759..cf8c2d1 100644
> > +--- a/archival/tar.c
> > ++++ b/archival/tar.c
> > +@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct
> recursive_state *state,
> > +     DBG("writeFileToTarball('%s')", fileName);
> > +
> > +     /* Strip leading '/' and such (must be before memorizing
> hardlink's name) */
> > +-    header_name =3D strip_unsafe_prefix(fileName);
> > ++    header_name =3D skip_unsafe_prefix(fileName);
> > +
> > +     if (header_name[0] =3D=3D '\0')
> > +             return TRUE;
> > +diff --git a/archival/unzip.c b/archival/unzip.c
> > +index 691a2d8..5844215 100644
> > +--- a/archival/unzip.c
> > ++++ b/archival/unzip.c
> > +@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)
> > +             unzip_skip(zip.fmt.extra_len);
> > +
> > +             /* Guard against "/abspath", "/../" and similar attacks *=
/
> > +-            overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
> > ++            strip_unsafe_prefix(dst_fn);
> > +
> > +             /* Filter zip entries */
> > +             if (find_list_entry(zreject, dst_fn)
> > +diff --git a/include/bb_archive.h b/include/bb_archive.h
> > +index e0ef8fc..1dc77f3 100644
> > +--- a/include/bb_archive.h
> > ++++ b/include/bb_archive.h
> > +@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t
> *archive_handle) FAST_FUNC;
> > + void seek_by_jump(int fd, off_t amount) FAST_FUNC;
> > + void seek_by_read(int fd, off_t amount) FAST_FUNC;
> > +
> > +-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
> > ++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
> > ++void strip_unsafe_prefix(char *str) FAST_FUNC;
> > + void create_or_remember_link(llist_t **link_placeholders,
> > +             const char *target,
> > +             const char *linkname,
> > +--
> > +2.50.1
> > +
> > diff --git
> a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patc=
h
> b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patc=
h
> > new file mode 100644
> > index 0000000000..00a276fa4f
> > --- /dev/null
> > +++
> b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patc=
h
> > @@ -0,0 +1,37 @@
> > +From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 2001
> > +From: Radoslav Kolev <radoslav.kolev@suse.com>
> > +Date: Mon, 16 Feb 2026 11:50:04 +0200
> > +Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
> > + symlinks
> > +
> > +commit 3fb6b31c7 introduced a check for unsafe components in
> > +tar archive hardlinks, but it was being applied to symlinks too
> > +which broke "Symlinks and hardlinks coexist" tar test.
> > +
> > +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> > +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> > +
> > +CVE: CVE-2026-26157, CVE-2026-26158
> > +Upstream-Status: Backport [
> https://git.busybox.net/busybox/commit/?id=3D599f5dd8fac390c18b79cba4c14c=
334957605dae
> ]
> > +(Alternative mirrored URL:
> https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c=
14c334957605dae
> )
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + archival/libarchive/get_header_tar.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/archival/libarchive/get_header_tar.c
> b/archival/libarchive/get_header_tar.c
> > +index 1c40ece..606d806 100644
> > +--- a/archival/libarchive/get_header_tar.c
> > ++++ b/archival/libarchive/get_header_tar.c
> > +@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t
> *archive_handle)
> > +
> > +     /* Everything up to and including last ".." component is stripped
> */
> > +     strip_unsafe_prefix(file_header->name);
> > +-    if (file_header->link_target) {
> > ++    if (file_header->link_target && !S_ISLNK(file_header->mode)) {
> > +             /* GNU tar 1.34 examples:
> > +              * tar: Removing leading '/' from hard link targets
> > +              * tar: Removing leading '../' from hard link targets
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb
> b/meta/recipes-core/busybox/busybox_1.36.1.bb
> > index d870e2ee10..228bfdadd3 100644
> > --- a/meta/recipes-core/busybox/busybox_1.36.1.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> > @@ -62,6 +62,8 @@ SRC_URI =3D "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
> >             file://CVE-2025-46394-01.patch \
> >             file://CVE-2025-46394-02.patch \
> >             file://CVE-2025-60876.patch \
> > +           file://CVE-2026-26157-CVE-2026-26158-01.patch \
> > +           file://CVE-2026-26157-CVE-2026-26158-02.patch \
> >             "
> >  SRC_URI:append:libc-musl =3D " file://musl.cfg "
> >  # TODO
> http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
>
>
> --
> Yoann Congal
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234107):
> https://lists.openembedded.org/g/openembedded-core/message/234107
> Mute This Topic: https://lists.openembedded.org/mt/118460290/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000465025064f025440
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_default gmail_q=
uote"><span class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif"></span>
But, as far as I can tell, this <span>CVE</span> also applies to whinlatter=
 and<br>
master. You need to send the fix there before I can take it for<br>
scarthgap and kirkstone.

</blockquote><div><br></div><div><div style=3D"font-family:arial,helvetica,=
sans-serif" class=3D"gmail_default">What&#39;s the best fix for the master =
branch? Is it time to switch from 1.37 to a git snapshot?</div><div style=
=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_default">1.37 is=
 soon 2 years old. Or we just keep patching the CVEs there also.</div><br><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Den l=C3=B6r 28 mars 2026 kl 00:02 skrev Yoann Congal via=
 <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembe=
dded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedd=
ed.org" target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Mar 23, 2026 at 6=
:30 AM CET, Hitendra Prajapati via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; Pick up patch from NVD report.<br>
&gt;<br>
&gt; More details :<br>
&gt; [1]: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-26157" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026=
-26157</a><br>
&gt; [2]: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-26158" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026=
-26158</a><br>
&gt;<br>
&gt; Note:<br>
&gt; We use patch from busybox mirror that looks trustworthy <a href=3D"htt=
ps://gogs.librecmc.org/OWEALS/busybox" rel=3D"noreferrer" target=3D"_blank"=
>https://gogs.librecmc.org/OWEALS/busybox</a>.<br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
Thank you for this new patch, it looks good now.<br>
But, as far as I can tell, this CVE also applies to whinlatter and<br>
master. You need to send the fix there before I can take it for<br>
scarthgap and kirkstone.<br>
<br>
Regards,<br>
<br>
&gt;=C2=A0 .../CVE-2026-26157-CVE-2026-26158-01.patch=C2=A0 =C2=A0 | 198 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../CVE-2026-26157-CVE-2026-26158-02.patch=C2=A0 =C2=A0 |=C2=A0 =
37 ++++<br>
&gt;=C2=A0 meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +<br>
&gt;=C2=A0 3 files changed, 237 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26=
157-CVE-2026-26158-01.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26=
157-CVE-2026-26158-02.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026=
-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026=
-26158-01.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cdc2394794<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-=
01.patch<br>
&gt; @@ -0,0 +1,198 @@<br>
&gt; +From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com" =
target=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
&gt; +Date: Thu, 29 Jan 2026 11:48:02 +0100<br>
&gt; +Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does=
 the same<br>
&gt; +<br>
&gt; +Defends against files like these (python reproducer):<br>
&gt; +<br>
&gt; +import tarfile<br>
&gt; +ti =3D tarfile.TarInfo(&quot;leak_hosts&quot;)<br>
&gt; +ti.type =3D tarfile.LNKTYPE<br>
&gt; +ti.linkname =3D &quot;/etc/hosts&quot;=C2=A0 # or &quot;../etc/hosts&=
quot; or &quot;..&quot;<br>
&gt; +ti.size =3D 0<br>
&gt; +with tarfile.open(&quot;/tmp/hardlink.tar&quot;, &quot;w&quot;) as t:=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0t.addfile(ti)<br>
&gt; +<br>
&gt; +function=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0old=C2=A0 =C2=A0 =C2=A0new=C2=A0 =C2=A0delta<br>
&gt; +skip_unsafe_prefix=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0127=C2=A0 =C2=A0 +127<br>
&gt; +get_header_tar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1752=C2=A0 =C2=A0 1754=C2=A0 =C2=A0 =C2=A0 +2<br>
&gt; +.rodata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0106861=C2=A0 106856=C2=A0 =C2=A0 =C2=A0 -5<br>
&gt; +unzip_main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 2715=C2=A0 =C2=A0 2706=C2=A0 =C2=A0 =C2=A0 -9<br>
&gt; +strip_unsafe_prefix=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 102=
=C2=A0 =C2=A0 =C2=A0 18=C2=A0 =C2=A0 =C2=A0-84<br>
&gt; +---------------------------------------------------------------------=
---------<br>
&gt; +(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Total: 31 bytes<br>
&gt; +<br>
&gt; +Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlem=
ail.com" target=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-26157, CVE-2026-26158<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.busybox.net/busybox=
/commit/?id=3D3fb6b31c716669e12f75a2accd31bb7685b1a1cb" rel=3D"noreferrer" =
target=3D"_blank">https://git.busybox.net/busybox/commit/?id=3D3fb6b31c7166=
69e12f75a2accd31bb7685b1a1cb</a>]<br>
&gt; +(Alternative mirrored URL: <a href=3D"https://gogs.librecmc.org/OWEAL=
S/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb" rel=3D"noreferre=
r" target=3D"_blank">https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b3=
1c716669e12f75a2accd31bb7685b1a1cb</a>)<br>
&gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + archival/libarchive/data_extract_all.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7=
 +++--<br>
&gt; + archival/libarchive/get_header_tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11=
 ++++++--<br>
&gt; + archival/libarchive/unsafe_prefix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 30 +++++++++++++++++----<br>
&gt; + archival/libarchive/unsafe_symlink_target.c |=C2=A0 1 +<br>
&gt; + archival/tar.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + archival/unzip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + include/bb_archive.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt; + 7 files changed, 42 insertions(+), 14 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/archival/libarchive/data_extract_all.c b/archival/libarc=
hive/data_extract_all.c<br>
&gt; +index 8a69711..b84b960 100644<br>
&gt; +--- a/archival/libarchive/data_extract_all.c<br>
&gt; ++++ b/archival/libarchive/data_extract_all.c<br>
&gt; +@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *a=
rchive_handle)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + #endif<br>
&gt; + #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION<br>
&gt; +-=C2=A0 =C2=A0 /* Strip leading &quot;/&quot; and up to last &quot;/.=
./&quot; path component */<br>
&gt; +-=C2=A0 =C2=A0 dst_name =3D (char *)strip_unsafe_prefix(dst_name);<br=
>
&gt; ++=C2=A0 =C2=A0 /* Skip leading &quot;/&quot; and past last &quot;..&q=
uot; path component */<br>
&gt; ++=C2=A0 =C2=A0 dst_name =3D (char *)skip_unsafe_prefix(dst_name);<br>
&gt; + #endif<br>
&gt; + // ^^^ This may be a problem if some applets do need to extract abso=
lute names.<br>
&gt; + // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).<br=
>
&gt; +@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t =
*archive_handle)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* To avoid a directo=
ry traversal attack via symlinks,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * do not restore sym=
links with &quot;..&quot; components<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or symlinks starti=
ng with &quot;/&quot;, unless a magic<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* envvar is set.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or symlinks starti=
ng with &quot;/&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * For example, consi=
der a .tar created via:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 $ tar cvf bu=
g.tar anything.txt<br>
&gt; +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchi=
ve/get_header_tar.c<br>
&gt; +index cc6f3f0..1c40ece 100644<br>
&gt; +--- a/archival/libarchive/get_header_tar.c<br>
&gt; ++++ b/archival/libarchive/get_header_tar.c<br>
&gt; +@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *=
archive_handle)<br>
&gt; + #endif<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Everything up to and including last &quot;..&q=
uot; component is stripped */<br>
&gt; +-=C2=A0 =C2=A0 overlapping_strcpy(file_header-&gt;name, strip_unsafe_=
prefix(file_header-&gt;name));<br>
&gt; +-//TODO: do the same for file_header-&gt;link_target?<br>
&gt; ++=C2=A0 =C2=A0 strip_unsafe_prefix(file_header-&gt;name);<br>
&gt; ++=C2=A0 =C2=A0 if (file_header-&gt;link_target) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GNU tar 1.34 examples:<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing lead=
ing &#39;/&#39; from hard link targets<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing lead=
ing &#39;../&#39; from hard link targets<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* tar: Removing lead=
ing &#39;etc/../&#39; from hard link targets<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strip_unsafe_prefix(file_h=
eader-&gt;link_target);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Strip trailing &#39;/&#39; in directories */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Must be done after mode is set as &#39;/&#39; =
is used to check if it&#39;s a directory */<br>
&gt; +diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchiv=
e/unsafe_prefix.c<br>
&gt; +index 6670811..89a371a 100644<br>
&gt; +--- a/archival/libarchive/unsafe_prefix.c<br>
&gt; ++++ b/archival/libarchive/unsafe_prefix.c<br>
&gt; +@@ -5,11 +5,11 @@<br>
&gt; + #include &quot;libbb.h&quot;<br>
&gt; + #include &quot;bb_archive.h&quot;<br>
&gt; + <br>
&gt; +-const char* FAST_FUNC strip_unsafe_prefix(const char *str)<br>
&gt; ++const char* FAST_FUNC skip_unsafe_prefix(const char *str)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *cp =3D str;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cp2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *cp2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*cp =3D=3D &#39;/=
&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cp++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const c=
har *str)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cp +=3D 3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D strstr(cp, &quot;/=
../&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D cp;<br>
&gt; ++ find_dotdot:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 =3D strstr(cp2, &quot;=
/..&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cp2)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D cp2 + 4;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break; /* No (more) malicious components */<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We found &quot;/..somet=
hing&quot; */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp2 +=3D 3;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*cp2 !=3D &#39;/&#39;)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (*cp2 =3D=3D &#39;\0&#39;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Trailing &quot;/..&quot;: malicious, ret=
urn &quot;&quot; */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* (causes harmless errors trying to create=
 or hardlink a file named &quot;&quot;) */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cp2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* &quot;/..name&quot; is not malicious, look for next &quot;/..&quot; =
*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto find_dotdot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Found &quot;/../&quot;:=
 malicious, advance past it */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D cp2 + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cp !=3D str) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static smallint warne=
d =3D 0;<br>
&gt; +@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const cha=
r *str)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return cp;<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++void FAST_FUNC strip_unsafe_prefix(char *str)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 overlapping_strcpy(str, skip_unsafe_prefix(str));<br>
&gt; ++}<br>
&gt; +diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/l=
ibarchive/unsafe_symlink_target.c<br>
&gt; +index f8dc803..d764c89 100644<br>
&gt; +--- a/archival/libarchive/unsafe_symlink_target.c<br>
&gt; ++++ b/archival/libarchive/unsafe_symlink_target.c<br>
&gt; +@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*list-&gt;data ? &quot;hard&quot; : &quo=
t;sym&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;data + 1, target<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Note: GNU tar 1.34 errors out only _after_ all links are (attempted =
to be) created */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list =3D list-&gt;lin=
k;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/archival/tar.c b/archival/tar.c<br>
&gt; +index 9de3759..cf8c2d1 100644<br>
&gt; +--- a/archival/tar.c<br>
&gt; ++++ b/archival/tar.c<br>
&gt; +@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct re=
cursive_state *state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DBG(&quot;writeFileToTarball(&#39;%s&#39;)&quot;,=
 fileName);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Strip leading &#39;/&#39; and such (must be be=
fore memorizing hardlink&#39;s name) */<br>
&gt; +-=C2=A0 =C2=A0 header_name =3D strip_unsafe_prefix(fileName);<br>
&gt; ++=C2=A0 =C2=A0 header_name =3D skip_unsafe_prefix(fileName);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (header_name[0] =3D=3D &#39;\0&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt; +diff --git a/archival/unzip.c b/archival/unzip.c<br>
&gt; +index 691a2d8..5844215 100644<br>
&gt; +--- a/archival/unzip.c<br>
&gt; ++++ b/archival/unzip.c<br>
&gt; +@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unzip_skip(zip.fmt.ex=
tra_len);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Guard against &quo=
t;/abspath&quot;, &quot;/../&quot; and similar attacks */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 overlapping_strcpy(dst_fn,=
 strip_unsafe_prefix(dst_fn));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strip_unsafe_prefix(dst_fn=
);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Filter zip entries=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (find_list_entry(z=
reject, dst_fn)<br>
&gt; +diff --git a/include/bb_archive.h b/include/bb_archive.h<br>
&gt; +index e0ef8fc..1dc77f3 100644<br>
&gt; +--- a/include/bb_archive.h<br>
&gt; ++++ b/include/bb_archive.h<br>
&gt; +@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_=
handle) FAST_FUNC;<br>
&gt; + void seek_by_jump(int fd, off_t amount) FAST_FUNC;<br>
&gt; + void seek_by_read(int fd, off_t amount) FAST_FUNC;<br>
&gt; + <br>
&gt; +-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;<br>
&gt; ++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;<br>
&gt; ++void strip_unsafe_prefix(char *str) FAST_FUNC;<br>
&gt; + void create_or_remember_link(llist_t **link_placeholders,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *target,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *linkname,=
<br>
&gt; +-- <br>
&gt; +2.50.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026=
-26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026=
-26158-02.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..00a276fa4f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-=
02.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Radoslav Kolev &lt;<a href=3D"mailto:radoslav.kolev@suse.com" t=
arget=3D"_blank">radoslav.kolev@suse.com</a>&gt;<br>
&gt; +Date: Mon, 16 Feb 2026 11:50:04 +0200<br>
&gt; +Subject: [PATCH] tar: only strip unsafe components from hardlinks, no=
t<br>
&gt; + symlinks<br>
&gt; +<br>
&gt; +commit 3fb6b31c7 introduced a check for unsafe components in<br>
&gt; +tar archive hardlinks, but it was being applied to symlinks too<br>
&gt; +which broke &quot;Symlinks and hardlinks coexist&quot; tar test.<br>
&gt; +<br>
&gt; +Signed-off-by: Radoslav Kolev &lt;<a href=3D"mailto:radoslav.kolev@su=
se.com" target=3D"_blank">radoslav.kolev@suse.com</a>&gt;<br>
&gt; +Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlem=
ail.com" target=3D"_blank">vda.linux@googlemail.com</a>&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2026-26157, CVE-2026-26158<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.busybox.net/busybox=
/commit/?id=3D599f5dd8fac390c18b79cba4c14c334957605dae" rel=3D"noreferrer" =
target=3D"_blank">https://git.busybox.net/busybox/commit/?id=3D599f5dd8fac3=
90c18b79cba4c14c334957605dae</a>]<br>
&gt; +(Alternative mirrored URL: <a href=3D"https://gogs.librecmc.org/OWEAL=
S/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae" rel=3D"noreferre=
r" target=3D"_blank">https://gogs.librecmc.org/OWEALS/busybox/commit/599f5d=
d8fac390c18b79cba4c14c334957605dae</a>)<br>
&gt; +Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + archival/libarchive/get_header_tar.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchi=
ve/get_header_tar.c<br>
&gt; +index 1c40ece..606d806 100644<br>
&gt; +--- a/archival/libarchive/get_header_tar.c<br>
&gt; ++++ b/archival/libarchive/get_header_tar.c<br>
&gt; +@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *a=
rchive_handle)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Everything up to and including last &quot;..&q=
uot; component is stripped */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0strip_unsafe_prefix(file_header-&gt;name);<br>
&gt; +-=C2=A0 =C2=A0 if (file_header-&gt;link_target) {<br>
&gt; ++=C2=A0 =C2=A0 if (file_header-&gt;link_target &amp;&amp; !S_ISLNK(fi=
le_header-&gt;mode)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GNU tar 1.34 examp=
les:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * tar: Removing lead=
ing &#39;/&#39; from hard link targets<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * tar: Removing lead=
ing &#39;../&#39; from hard link targets<br>
&gt; +-- <br>
&gt; +2.50.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.=
1.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a> b/meta/rec=
ipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">busybox_1.36.1.bb</a><br>
&gt; index d870e2ee10..228bfdadd3 100644<br>
&gt; --- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a><br>
&gt; +++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" r=
el=3D"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a><br>
&gt; @@ -62,6 +62,8 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/dow=
nloads/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=
=3D"_blank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarb=
all</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-46394-0=
1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-46394-0=
2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-60876.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-26157-CVE-20=
26-26158-01.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-26157-CVE-20=
26-26158-02.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI:append:libc-musl =3D &quot; file://musl.cfg &quot;<br>
&gt;=C2=A0 # TODO <a href=3D"http://lists.busybox.net/pipermail/busybox/202=
3-January/090078.html" rel=3D"noreferrer" target=3D"_blank">http://lists.bu=
sybox.net/pipermail/busybox/2023-January/090078.html</a><br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234107): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234107" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234107</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118460290/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118460290/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000465025064f025440--

