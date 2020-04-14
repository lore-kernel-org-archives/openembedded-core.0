Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
 by mx.groups.io with SMTP id smtpd.web11.921.1586890475567679575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ILdMpW7F;
 spf=pass (domain: gmail.com, ip: 209.85.221.193, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f193.google.com with SMTP id g129so262692vkh.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eh+VR5kUqvdpv6SLbwNj49P+H1J9NrJJxyu2Tov/HwM=;
        b=ILdMpW7F+LGtZ1yvq2qszNEptTaOJwR7wKjfx2PReroEeu9doZbq4eb4ovl2pg5gAc
         EQsn5GvgVEhSq9JfqR1qKKgfMjkOvd0xcGRYpvGGTvCbp5JXD0bq+RXYgJpiYi/EJm9n
         dab6KXLyUgIebKztn4S6X1qsbmo20gt03e1sizs1PC1j2vFluxyfGl4GW1ztg6MZvkAF
         2RaoIrAcxleDxuqrh2JqRJqySCQ0COEXbG28ms+WO6JDxg/M/fN3TrBivisYIP8D25YO
         u73PcH8i2hqZC144Lgn7WFXLgAnMpHGR7p47AySwDsBJB3FMSLZ/2z5JHfjl1d4/6cEn
         vd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eh+VR5kUqvdpv6SLbwNj49P+H1J9NrJJxyu2Tov/HwM=;
        b=QE/9jFY43xJkrlkId378vtOuM+JYmBfhTcvCdfszfRc5q1uvsmNBCiNgm5AjonGJYd
         3f9Q6EL7yrzCs3IRmrddArLjHQlrT24ZB2aasZ3JZ/vVh+9nOUmx6ChupvGCKpRjx0Qf
         z6YFDbwC2BV53FwwMl9G45Luukqk1SeoznmdCEP+E6eFO2ZCtl2ExvT/PdEbeXsUxBVc
         QT3VoZSovjjtH5mlb/ToanbH4cGprEq09RjZJRtjQEqK8CCJZzkjpsxJYvm0oHAv3OSh
         ggkJEeju6bV3zSt2b0/g9KkAGCF27+AKaAdlVxPWFcO4QRJd7j4o6nGRIaSrHQfAgMbN
         Zanw==
X-Gm-Message-State: AGi0Pub/Co4vOTH+PU0qm2gugD6sD5jOQpn+4gNvvRhqKf32hzuyV7BB
	+9WgXhDAthJq3BL/ZM+Tkx66ODI+b9W+8THZtqk=
X-Google-Smtp-Source: APiQypI48Mlu8CgVe/Emr1HW9XVjH6jIif3LASvVPQloDhpFZMOMGFW61iLsI6ARZLKljrRGz8yOGccZ58PP/KE+rwU=
X-Received: by 2002:a1f:bf08:: with SMTP id p8mr10645988vkf.43.1586890474476;
 Tue, 14 Apr 2020 11:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586887105.git.mwillard@izotope.com> <908ebd3f3e9c539593802c0b81780f9292bcfd2d.1586887105.git.mwillard@izotope.com>
In-Reply-To: <908ebd3f3e9c539593802c0b81780f9292bcfd2d.1586887105.git.mwillard@izotope.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 14 Apr 2020 11:54:22 -0700
Message-ID: <CAJ86T=UMrR=5a7Ym4TrnDdOVa4=m2tWoPMWPM+k7xDWOianTEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] insane.bbclass: Warning for so file version mismatch
To: Mike Willard <mwillard@izotope.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 14, 2020 at 11:08 AM Mike Willard <mwillard@izotope.com> wrote:
>
> Adds a warning if a package produces a .so file with a
> version that doesn't match the package PV.

These versions are not expected to match and it's easy to find
examples where they do not, e.g. curl 7.69.1 creates libcurl.so.4.6.0.

> Signed-off-by: Mike Willard <mwillard@izotope.com>
> ---
>  meta/classes/insane.bbclass | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 478240fa57..bb7f625667 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>              pn-overrides infodir build-deps src-uri-bad \
>              unknown-configure-option symlink-to-sysroot multilib \
>              invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
> -            mime mime-xdg \
> +            mime mime-xdg so-file-version \
>              "
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -488,6 +488,24 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
>                  trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
>                  package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
>
> +QAPATHTEST[so-file-version] = "package_qa_check_so_file_version"
> +def package_qa_check_so_file_version(path, name, d, elf, messages):
> +    """
> +    Check for ".so" files that do not match the package version
> +    """
> +    import re
> +
> +    pv = d.getVar('PV')
> +    # Search for .so file with version number following
> +    prog = re.compile(r'.*\.so\.(\d+\.\d+\.\d+)')
> +    matches = prog.findall(path)
> +    if len(matches) > 0:
> +        so_file_version = matches[0]
> +        if so_file_version != pv:
> +            package_qa_add_message(messages, "so-file-version",
> +                ".so file version does not match package version:\nFile: {}\nFile version:\t{}\nPV:\t\t{}\n".format(
> +                    path, so_file_version, pv))
> +
>  # Check license variables
>  do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
>  python populate_lic_qa_checksum() {
> --
> 2.17.1
>
> 
