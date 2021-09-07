Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.32491.1630998414710660882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kXxuWYXJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id l10so17643578lfg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UvocYlt8oNM9IUdH9RGMYr19rqzaYrmsv9KDN3p4p6M=;
        b=kXxuWYXJaszbSpbA2z/qP8R5KgUnB8C1x2oofhEEV45cSIlVM5DVKHxrLtXq1BRxDF
         csU3RIF6DDUa0HylCv8OF8R1cRy7JyVM76Cr43Z0dNvQojH+AllpNtnObOm4DvH+Yvo0
         x3PMsHlLsdXPYs+GO+oXPWkDewS48Ul9okSXZqdldg2De70kt7iWrtjgAK8UWj7QQWHC
         +a9XzCNdJtAxq3pKTfv7e3qgqzXHvC97Ep9iPlpFVOIYOCPUUqcpYSDuQp2DiMPUHxgH
         5wSEwzkiu4j2E/DqvS2bitg5g675/HNxFAzYHxUwbGNe8Ajf5AMqOYgXTh5HAFCW6AcO
         gZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvocYlt8oNM9IUdH9RGMYr19rqzaYrmsv9KDN3p4p6M=;
        b=KNTHhqfpwXMmiimqXWUc65w6KMJhT7/asNv54efgIxE/P994iQ64kdcmlhX+rP+GA0
         mY5vx/UgyXoyRDNC9U40xWrJ3J/zgNolDa2+LPW9HSQxehs6wBjaexmhBdxl9jfBqTcH
         i66oKvP6gMmaSkpvATL8+NMhFVpNRmYG+S3o3aj+KZbxafemR9qf1UgwxwJCccwaa+we
         XbqMptQnCxo52r2zU7AKfjdl6KOnTceTRrOuY19V7caqiIENkqEZElAE1zqj1SigCGTJ
         6E2GfTOcKuWuiuKMDz35cRsncjhf6y2V1OWvpekj4hUNAfsmEOO7y9JAxoI4IRWRkxK7
         5aBA==
X-Gm-Message-State: AOAM530lLcLpySzTfnPg3RUmbUguJbJhgWug+CU0TuIlghGmYoEf+FG+
	vRbSEiPMUL8fS3eoU/jS8OA3DxK6WJRHb7GvLkIRZcoPsmk=
X-Google-Smtp-Source: ABdhPJxmd7u6fpBHcZgP1llzG78+NDH0EaI0xF82B1Pa3LAPwb50ccsPN4CHnCl8nbK7Grnykr3FwyuPCpwOPOOvTxQ=
X-Received: by 2002:a05:6512:3194:: with SMTP id i20mr10309821lfe.241.1630998412489;
 Tue, 07 Sep 2021 00:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <131c1b19-2676-211e-c2db-a3827d597094@crashcourse.ca>
In-Reply-To: <131c1b19-2676-211e-c2db-a3827d597094@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 7 Sep 2021 00:06:36 -0700
Message-ID: <CAJ86T=WPxc0CwcPTmqcg+fc=56F01zjhuCdf4pmcfrernb8jqA@mail.gmail.com>
Subject: Re: [OE-core] minor curiosity related to libdir vs base_libdir and shared libs
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 1:02 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   a minor oddity i stumbled over digging into the proper installation
> of shared libraries ... building core-image-minimal for qemuarm64 and,
> for the most part, recipes from oe-core that install shared libs put
> all three artifacts (real name, so name and linker name) under
> /usr/lib, as in:
>
>   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so
>   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3
>   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3.0.0
>
> however, the *occasional* recipe chooses to -- for whatever reason --
> distinguish between libdir and base_libdir. for example, here's the
> result of installing tcp-wrappers' shared libs in its ${D} directory:
>
>   ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0.7.6
>   ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0
>   ./tcp-wrappers/7.6-r10/image/usr/lib/libwrap.so
>
> this is due to the following manual override in tcp-wrappers_7.6.bb:
>
>   do_install () {
>         oe_libinstall -a libwrap ${D}${libdir}
>         oe_libinstall -C shared -so libwrap ${D}${base_libdir}
>
>         if [ "${libdir}" != "${base_libdir}" ] ; then
>                 rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
>                 libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
>                 ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
>                 rm -f ${D}${base_libdir}/libwrap.so
>         fi
>         ...
>
> so this recipe -- after doing the *default* shared lib installation
> via oe_libinstall() -- conditionally chooses to override that.

git blame is often the best starting point for understanding why
things are done in a certain way. In this case the comment from the
original comment (from 11 years ago..) references portmap, which is no
longer supported by oe-core:

  https://git.openembedded.org/openembedded-core/commit/?id=6ffc4f2e04f2d405b14f198220a3613d386489e7

>   another recipe that is even odder is libcap-ng:
>
>   ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0.0.0
>   ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0
>   ./libcap-ng/0.8.2-r0/image/usr/lib/libcap-ng.so
>   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0
>   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so
>   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0.0.0
>
> which seems odd since it does that override for *one* of the shared
> libs that it generates, but not the other:
>
>   do_install:append() {
>         # Moving libcap-ng to base_libdir
>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>                 mkdir -p ${D}/${base_libdir}/
>                 mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
>                 relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
>                 ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
>         fi
>   }

The original commit from 2013 gives a few more clues in this case:

  https://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/commit/?id=587fdba43a7747992995029a88d3051ef0efe7f6

It's not explicit which QA test was being triggered but presumably it
was "unsafe-references-in-binaries", which has since been dropped from
oe-core:

  https://git.openembedded.org/openembedded-core/commit/?id=a6af5bbf3dad6f0951c67a0aae13ef86a8906893

So... it looks like these examples of moving libs to base_libdir are
obsolete and can be dropped.

Some comments in insane.bbclass left behind when the
unsafe-references-in-binaries and unsafe-references-in-scripts QA
tests were removed can be dropped too.

> given that almost all other recipes seem happy to just stuff all that
> under /usr/lib, what is the rationale for the above occasional
> difference? it pretty clearly doesn't affect functionality; it just
> looks strange.
>
> rday
>
> 
>
