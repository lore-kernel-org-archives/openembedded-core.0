Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEBCC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 13:59:51 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.11537.1739455191176649385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 05:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X6pfjX20;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc11834404so1020234a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455190; x=1740059990; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5moaafKeCmHLwxFEXP6UbCOC9gmPnH5ETWP4GoiIhK0=;
        b=X6pfjX20eMnn8wQU5y4unlfTP4AmhTICTTgjDg5z5zATIg8I53c6B76SrAQ3Ume1UO
         pKcCauyHEgeVRx5RsNzrIKI1zauIWclO0+OTqONgBMbTRWL+LYY75yilHwRHXjuhaiiI
         bdXY85NY1P7AKf58E5F4mEUx+4dMgWrLu6lkdMPCH+pspGdOY0xQrizfEHHqZ5lVrZE0
         YbnukCUfAUt/Mpw2XDsq4grKszoXrhaffVZKMvjhvEu74gw8VsfRltZ/+CDUTs9oJ7ZN
         M37pMlEyb7oeiedZ3Ti4VOHhvJwdyYOFUcIEmdVIDvDzxlNZ2F+RHcVs1oE3Cwf51sPM
         zFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455190; x=1740059990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5moaafKeCmHLwxFEXP6UbCOC9gmPnH5ETWP4GoiIhK0=;
        b=Wt0WEtkcxxFqaWDIa3PSzRruPwGcFdq/Vaw/f9C8PFaih7OTaLjUEEyZMMaK062NNc
         xrfLn/sfPK2aYtw2T8f9VUWPznvHB3RmdjQ+NpCJoe3NeMuQE1mL5sBqdawc3/mXB29a
         2/RzNMN3iSLkzY9ROhKz9NHqoDJSuptkYH6m3fG1uI+0Jfit9UFzeYAySEEMMDTmx/Dv
         0HjHuCW9ZhUSCVAklPYvWSQrA0iOC94rACtWbYJMSPGTTxXAZCvR/hR8vrBwdRti+u/5
         MgKkW9fqvbjnHGHmmbJ47yZ1j7jmD3fhfN/Ll3tczjOff2SfHSx1yMy7pV2qaujQQYml
         LR6w==
X-Gm-Message-State: AOJu0YyDsOI8suw9c+u5+o16AgHVQHURqlFGJk+cCbUM2bQcoCW2W/VK
	BxUsYvFJ4Wd/gLYdkcmJk3ZQgzknmCLmV9BkuQqmxm+yUElQOq8LBjaGu+wLZyUenR9JEP//VL8
	LFTBVwM/9iUbeqxFcuP+LEeSFi4s=
X-Gm-Gg: ASbGncvg0v7inyoNOKXAF9VeAWaLszQX7NWkcc9nsqnRq8u5QQaZmJka3t39PVqdZ0+
	Vcs1dfVIt50JdF6qmUT7iGsy+/I8a2QIw4YJa4HzIX0Siz4Iyc0Q/TCt8tEyrfHjMx5klbpmj4I
	s=
X-Google-Smtp-Source: AGHT+IH9y1yR0iEs2KqiH6nV+azyCagaCjWJOdN1AiXipkf4jdF3MTOxq5VPNneRgoFuTfG2wAZTb39EBTZ1pPBfYMo=
X-Received: by 2002:a17:90a:d884:b0:2f5:88bb:118 with SMTP id
 98e67ed59e1d1-2fbf5c5a234mr9443122a91.22.1739455190499; Thu, 13 Feb 2025
 05:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20250205143439.38233-1-marta.rybczynska@ygreky.com> <D5B706C8-F7EF-42AF-97D1-30A876C70496@arm.com>
In-Reply-To: <D5B706C8-F7EF-42AF-97D1-30A876C70496@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Feb 2025 14:59:38 +0100
X-Gm-Features: AWEUYZnwnFid6WaNXvOfOQw0W3ru6sng_YT4bZk0WU9AVsfsor4pf_O2frCRxtE
Message-ID: <CAApg2=S+6F_sEZAbsnPuWUC+8AVWOS2rgORoNp5NjNg9-3+wGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3][OE-core 0/4] cve-check: allow feed selection
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="000000000000bb8c92062e0678f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211333

--000000000000bb8c92062e0678f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 9:50=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 5 Feb 2025, at 14:34, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This series is allowing choice of the NVD feed to use, you can
> > configure them using the NVD_DB_VERSION variable in local.conf
> >
> > Available feeds:
> > - NVD2 (default) - the current NVD API v2 feed
> > - NVD1 - the old NVD feed (deprecated, but still working)
> > - FKIE - the NVD feed restoration from FKIE-CAD
>
> Something broke.  If I pick FKIE:
>
> $ bitbake core-image-sato --runall cve_check
> =E2=80=A6
> WARNING: cve-update-db-native-1.0-r0 do_fetch:
> /work/ross/build/tmp/sysroots/CVE_CHECK/temp_nvdcve_1.1.db
> [ I added that warning to show the path that it is trying to use ]
>
> ERROR: cve-update-db-native-1.0-r0 do_fetch: Error executing a python
> function in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure
> was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_fetch(d)
>      0003:
> File: '/home/rosbur01/Yocto/poky/meta/recipes-core/meta/
> cve-update-db-native.bb', lineno: 70, function: do_fetch
>      0066:    bb.utils.mkdirhier(db_dir)
>      0067:    if os.path.exists(db_file):
>      0068:        shutil.copy2(db_file, db_tmp_file)
>      0069:
>  *** 0070:    if update_db_file(db_tmp_file, d) =3D=3D True:
>      0071:        # Update downloaded correctly, can swap files
>      0072:        shutil.move(db_tmp_file, db_file)
>      0073:    else:
>      0074:        # Update failed, do not modify the database
> File: '/home/rosbur01/Yocto/poky/meta/recipes-core/meta/
> cve-update-db-native.bb', lineno: 152, function: update_db_file
>      0148:    is_nvd =3D d.getVar("NVD_DB_VERSION") =3D=3D "NVD1"
>      0149:
>      0150:    # Connect to database
>      0151:    bb.warn(db_tmp_file)
>  *** 0152:    conn =3D sqlite3.connect(db_tmp_file)
>      0153:    initialize_db(conn)
>      0154:
>      0155:    with bb.progress.ProgressHandler(d) as ph,
> open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
>      0156:        total_years =3D date.today().year + 1 - YEAR_START
> Exception: sqlite3.OperationalError: unable to open database file
>
>
There was a quite hard to hit issue caused by the fact that the temporary
file wasn't in the same directory as the final downloaded file. I've
changed that in v4, as it makes sense to keep them together, and is also
the same as the NVD2 fetcher does.

I think, however, that you would be able to hit this only when moving
between different versions of the patchset. I've tested with various
combinations of removed directories and it works fine now from this end.

Kind regards,
Marta

--000000000000bb8c92062e0678f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10,=
 2025 at 9:50=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 5 Feb 2025, at 14:34, Marta Rybczynska via <a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">l=
ists.openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br>
&gt; <br>
&gt; This series is allowing choice of the NVD feed to use, you can<br>
&gt; configure them using the NVD_DB_VERSION variable in local.conf<br>
&gt; <br>
&gt; Available feeds:<br>
&gt; - NVD2 (default) - the current NVD API v2 feed<br>
&gt; - NVD1 - the old NVD feed (deprecated, but still working)<br>
&gt; - FKIE - the NVD feed restoration from FKIE-CAD<br>
<br>
Something broke.=C2=A0 If I pick FKIE:<br>
<br>
$ bitbake core-image-sato --runall cve_check<br>
=E2=80=A6<br>
WARNING: cve-update-db-native-1.0-r0 do_fetch: /work/ross/build/tmp/sysroot=
s/CVE_CHECK/temp_nvdcve_1.1.db<br>
[ I added that warning to show the path that it is trying to use ]<br>
<br>
ERROR: cve-update-db-native-1.0-r0 do_fetch: Error executing a python funct=
ion in exec_func_python() autogenerated:<br>
<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, function: &lt;=
module&gt;<br>
=C2=A0 =C2=A0 =C2=A00001:<br>
=C2=A0*** 0002:do_fetch(d)<br>
=C2=A0 =C2=A0 =C2=A00003:<br>
File: &#39;/home/rosbur01/Yocto/poky/meta/recipes-core/meta/<a href=3D"http=
://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update=
-db-native.bb</a>&#39;, lineno: 70, function: do_fetch<br>
=C2=A0 =C2=A0 =C2=A00066:=C2=A0 =C2=A0 bb.utils.mkdirhier(db_dir)<br>
=C2=A0 =C2=A0 =C2=A00067:=C2=A0 =C2=A0 if os.path.exists(db_file):<br>
=C2=A0 =C2=A0 =C2=A00068:=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(db_file, =
db_tmp_file)<br>
=C2=A0 =C2=A0 =C2=A00069:<br>
=C2=A0*** 0070:=C2=A0 =C2=A0 if update_db_file(db_tmp_file, d) =3D=3D True:=
<br>
=C2=A0 =C2=A0 =C2=A00071:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update downloaded co=
rrectly, can swap files<br>
=C2=A0 =C2=A0 =C2=A00072:=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(db_tmp_fil=
e, db_file)<br>
=C2=A0 =C2=A0 =C2=A00073:=C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A00074:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update failed, do no=
t modify the database<br>
File: &#39;/home/rosbur01/Yocto/poky/meta/recipes-core/meta/<a href=3D"http=
://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update=
-db-native.bb</a>&#39;, lineno: 152, function: update_db_file<br>
=C2=A0 =C2=A0 =C2=A00148:=C2=A0 =C2=A0 is_nvd =3D d.getVar(&quot;NVD_DB_VER=
SION&quot;) =3D=3D &quot;NVD1&quot;<br>
=C2=A0 =C2=A0 =C2=A00149:<br>
=C2=A0 =C2=A0 =C2=A00150:=C2=A0 =C2=A0 # Connect to database<br>
=C2=A0 =C2=A0 =C2=A00151:=C2=A0 =C2=A0 bb.warn(db_tmp_file)<br>
=C2=A0*** 0152:=C2=A0 =C2=A0 conn =3D sqlite3.connect(db_tmp_file)<br>
=C2=A0 =C2=A0 =C2=A00153:=C2=A0 =C2=A0 initialize_db(conn)<br>
=C2=A0 =C2=A0 =C2=A00154:<br>
=C2=A0 =C2=A0 =C2=A00155:=C2=A0 =C2=A0 with bb.progress.ProgressHandler(d) =
as ph, open(os.path.join(d.getVar(&quot;TMPDIR&quot;), &#39;cve_check&#39;)=
, &#39;a&#39;) as cve_f:<br>
=C2=A0 =C2=A0 =C2=A00156:=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_years =3D date.t=
oday().year + 1 - YEAR_START<br>
Exception: sqlite3.OperationalError: unable to open database file<br>
<br></blockquote><div><br></div><div>There was a quite hard to hit issue ca=
used by the fact that the temporary file wasn&#39;t in the same directory a=
s the final downloaded file. I&#39;ve changed that in v4, as it makes sense=
 to keep them together, and is also the same as the NVD2 fetcher does.</div=
><div><br></div><div>I think, however, that you would be able to hit this o=
nly when moving between different versions of the patchset. I&#39;ve tested=
 with various combinations of removed directories and it works fine now fro=
m this end.</div><div><br></div><div>Kind regards,</div><div>Marta<br></div=
></div></div>

--000000000000bb8c92062e0678f3--

