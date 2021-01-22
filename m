Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.6292.1611303843188793294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tO9SyTOH;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id d13so9484700ioy.4
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 00:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y51nxCe4t5GcSW88zry7KU0TUKfmTxMYGGFCuI3TXvg=;
        b=tO9SyTOHKSloI4D+90k1pF6cUBrU1YQf7pHWY1Nim1XXfEzu7C4J1CvA0VJOgBjUIb
         BceP1z/ZqhAT6fG/HC/uPcz5DTG1NtPqmcBV4gzkWXjFsYk0BPLWz5hUjghouUnn65cs
         +v37/kUctyZSnx18srDVCwrw0y65uSzNSUMH3hC2I2ijJZiHS5Zv+GXHjTUB9VfEbZ0y
         ecadRsuJZ7S8H2rClh8dz/ZZ8nDFq6IM2lR7UvPL2SVtRfMkivmVMB8C5S3hMrXF1nmQ
         bUhDt8FgqnRWIqAHn76YJE5hwh16OtYs4AFMKoDJOMpXsPVeV+hooSXvSTLi8u0aWk3e
         BtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y51nxCe4t5GcSW88zry7KU0TUKfmTxMYGGFCuI3TXvg=;
        b=C7ZadMpCUFLQMHoYMIhQY+Oo7YQKvyme2NgWAJ/guJ83nHJI6J0es4eHihqnHxjhd4
         E+wBMGk9y8ZBEFIH3NrcRToqWl0EWwCMGKV6EjzMxvAoZBXthfGAlwHcZve3m+labmn6
         dycpNXwkvq87Urg89f6qvah/sef6riRuPdivtG6/QerJ4UVBmTj6mCFd40u/lNAlnp39
         rPBQyE7ogPg2UT0mX0062PQxDCZOllXOGturvLTAo04FNIFvpDlty6ZKGnEs9OXlQejx
         UJ5Lh49RhFIIAM16GHtUmS3acWfaF88+Wg7ViJ98sSbDfKHIwTWLflqZVt/qubHyWb1G
         EGMA==
X-Gm-Message-State: AOAM530Q9ZnqzzfswLoH+XQPcE5wvRE8w4hh+ppOzvvyNQ8LHcf4pXnp
	WV6DVlxLxzHQirU/xMhkrX23bgW27QDplEtRKDc=
X-Google-Smtp-Source: ABdhPJw2tfS3l2AyG2iPOAEtvm4Hjj5PqSK/PZoXshMUUGhT3Frxh9S/Q8tImgkocWsi4CUdiJ1Pj5bKW6CSSEp+CWE=
X-Received: by 2002:a92:c242:: with SMTP id k2mr3094247ilo.12.1611303842519;
 Fri, 22 Jan 2021 00:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20210121223153.1347-1-tomasz.dziendzielski@gmail.com> <6ce04c3ac3f5106a2dd7740f6145e62401bef312.camel@linuxfoundation.org>
In-Reply-To: <6ce04c3ac3f5106a2dd7740f6145e62401bef312.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Fri, 22 Jan 2021 09:25:10 +0100
Message-ID: <CAJkqNs336rRuE_qFuuafWyKM7cOa7cFtwcKD_2P921Mx9694fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] devtool: Fix file:// fetcher symlink directory structure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028a0ed05b978e942"

--00000000000028a0ed05b978e942
Content-Type: text/plain; charset="UTF-8"

>Are there some extra test cases we should be adding to account for some
>of these changes? They suggest we have some missing coverage.
>
>oe-selftest -r devtool
>
>and see meta/lib/oeqa/selftest/cases/

It seems in test_devtool_update_recipe_local_files we only check if
modifying files under oe-local-files/ will result in modified recipe files
after running "devtool update-recipe". Because recipe files are updated
based on oe-local-files/ broken symlinks under src "root" directory don't
impact this test. It's worth mentioning this test doesn't check files under
subdirectories (oe-local-files/dir/foo) - it's working correctly but it may
be good to cover it.
But there is no test checking if after "devtool modify" directory structure
in src "root" is preserved and symlinks are not broken.

Best regards,
Tomasz Dziendzielski

--00000000000028a0ed05b978e942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"auto"><span style=3D"font-fa=
mily:sans-serif">&gt;Are there some extra test cases we should be adding to=
 account for some</span><br style=3D"font-family:sans-serif"><span style=3D=
"font-family:sans-serif">&gt;of these changes? They suggest we have some mi=
ssing coverage.</span><br style=3D"font-family:sans-serif">&gt;<br style=3D=
"font-family:sans-serif"><span style=3D"font-family:sans-serif">&gt;oe-self=
test -r devtool</span><br style=3D"font-family:sans-serif">&gt;<br style=3D=
"font-family:sans-serif"><span style=3D"font-family:sans-serif">&gt;and see=
 meta/lib/oeqa/selftest/cases/</span><span style=3D"font-family:sans-serif"=
><br></span></div><span style=3D"font-family:sans-serif"><div dir=3D"auto">=
<span style=3D"font-family:sans-serif"><br></span></div>It seems in test_de=
vtool_update_recipe_</span><span style=3D"font-family:sans-serif">local_fil=
es</span>=C2=A0we only check if modifying files under=C2=A0oe-local-files/ =
will result in modified recipe files after running &quot;devtool update-rec=
ipe&quot;. Because recipe files are updated based on oe-local-files/ broken=
 symlinks under src &quot;root&quot; directory don&#39;t impact this test. =
It&#39;s worth mentioning this test doesn&#39;t check files under subdirect=
ories (oe-local-files/dir/foo) - it&#39;s working correctly but it may be g=
ood to cover it.</div><div dir=3D"auto">But there is no test checking if af=
ter &quot;devtool modify&quot; directory structure in src &quot;root&quot; =
is preserved and symlinks are not broken.</div><div dir=3D"auto"><br></div>=
<div>Best regards,</div><div>Tomasz Dziendzielski<br></div>
</div>

--00000000000028a0ed05b978e942--
