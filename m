Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6400C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:40:40 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.4146.1737754838811012248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 13:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMuujXz+;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso22853856d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 13:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737754838; x=1738359638; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OoiCX0odwXMF4C3nHTFHRC0/Dnv07cplV98DWPecJoM=;
        b=CMuujXz+odvILCe9//Sf0kNJeKbLmPtJpKuBBRLWnYrvBtSN32RbdsjqjJxvh/miLp
         T81+Cqq1VmkkTAYQ9JnGCsVK/hnUB69gV5TvDipPvByVA3b/0cP5PM+4NrNA/f7UxqmE
         Y8HKsR8keSAtaIxzMhp7pxNAwghYG6J2ssvrLOt2s+BmIiZWlx+MstBT5u4whYQaxTC8
         pWvUJCFHD7ZhuzOp4ROlWoKYYwbYV9IRN3gp1NQMQiGd0LqWiHnJh2TslJVLlo2Dkajd
         CHpAaG16hucKa6WH4ch75VWUbCQbM+oJtJl8M23Nck9FltfCe87Mg8ODtXm2JUsQI1dA
         mGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737754838; x=1738359638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoiCX0odwXMF4C3nHTFHRC0/Dnv07cplV98DWPecJoM=;
        b=bdshgp117WKn3a6i8v4iiAB0r6Xf8QGaZfPY8229YExoSGPZwiLOfhXCt2VoVhFtQc
         5AkdGzkZ1xbTJDWhSWLQ9PDTDQ02FsDIPqcYaZDGHcNoxsGbi5ViKRqvTtp8k5a7cmKk
         EiY7Z7EgjxWEt6URjsNe03lBm9vIAj/A7R9Y2idr2gpCzN0pTJIfLD0EfPJIawFS41CT
         z6K4ZvStzwDFd3a6JuIFd7OAx2KuLDvA0Rswb/MPcEhv+jOXOqpJPixzDWjSSPzy+ZWK
         z0V0psXtI6OUBtl5w8WvGvctuwR/h+tCEHr+t1E7lZ4nl1NQKzy1aIc3dF9aavFdDaQ4
         B0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXybDCCNNz79zv9n7ZyYtdtFM4nfdYQQaELG+ej0DiK+2jgcpooPK7m3sGynhrgFuTaklXar5SY6X7kFGavyoDvKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZvQODzHYQcJ5XEC33Ghl9AUmnrgyhOk+AuDCVF55eIdxz1Zqj
	HBjKINOU2DuDOfgS+yBXWjPnMnTJzC/f8bqdnluvxUiJXhD5ygO4ZgPb1hwJa9W+C2YLpWV44Lh
	kfFrSObJ5u+fzGv0CLt55F11YVFY=
X-Gm-Gg: ASbGncv4sn8RiayACn2W/SfrBiFv1Mc8UfJOh4jqt7PCAJT5uSWfyDdMJA55nUPuZSi
	i/fz5wtsHVmyYjgbBXA1EgXvOLNZYTfcjcNbJK65gR7AR28J/jbYUjuPKmDwNq+msTYfLviiTWy
	C1NAnUJCYmxMX1gtAmj0M5
X-Google-Smtp-Source: AGHT+IHj4ULN5sYqWfgJMDbwOZ+d7746wYv/4zKifo+1WKWUnnpZoE5JTFxgR5tJ67VFd1LDF80DFPDgoA69KxcqvGU=
X-Received: by 2002:a05:6214:2b0b:b0:6d8:b371:6a0f with SMTP id
 6a1803df08f44-6e1b220c7cbmr453019076d6.31.1737754837704; Fri, 24 Jan 2025
 13:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
 <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
 <CAB3asfiqa5Qc_e5kYbXqXUsFLNiEjKwHXUZUHSovTqhxmfT3eA@mail.gmail.com> <DM4PR11MB6067DF326AC69B39476ED5A893E32@DM4PR11MB6067.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6067DF326AC69B39476ED5A893E32@DM4PR11MB6067.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 22:40:27 +0100
X-Gm-Features: AWEUYZlXouewPd0dtT3xWU_BMM7YOuaS23nKw-oz01Byq9e9wwvwxK2gjwFCl6A
Message-ID: <CANNYZj8fHvF5Xi4ZyNSdjZiOUP_n3CHM2t5q5=KpvHzF5Fey2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
To: "Sandu, Beniamin" <Beniamin.Sandu@windriver.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cee6e6062c7a9354"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210254

--000000000000cee6e6062c7a9354
Content-Type: text/plain; charset="UTF-8"

You probably should look into improving buildhistory. Or-core needs
maintainers for things that already exist, not addition of new things that
partially overlap in functionality.

Alex

On Fri 24. Jan 2025 at 22.25, Sandu, Beniamin <Beniamin.Sandu@windriver.com>
wrote:

> Hey folks,
>
> Thanks for the feedback.
>
> The main idea behind this class, was to have an easy way to extract rootfs
> information, mostly focused on sizes.  A common scenario on my side was
> upgrading a set of layers to a different yocto version, building for a
> system, and ending up with quite different and usually bigger final image.
> On systems where rootfs size is still a top priority, this can add on quite
> some tedious extra work of identifying where all the extra space is coming
> from.
>
> I had a quick look at the current classes, and some issues that I found
> (especially for this use case), are:
>
> For spdx:
> - there is a lot of information generated, and could not find any on
> package/file sizes
> - spread over a lot of files
> - impossible to read with the naked eye
>
> For buildhistory:
> - a lot of information, spread over a lot of files
> - different output formats in the generated data
>
> To that end, I wanted something that:
> - is fast to generate
> - is easy to read/follow with the naked eye if needed
> - all the relevant information is in one file
> - has a consistent and easy to parse format
>
> Now a script with relatively minimal logic (parsing a single json file)
> can generate very detailed rootfs reports, e.g. sorting packages by size,
> information on added/removed pacakges or files,  other changes in list of
> installed files for a specific package, etc.
>
> Let me know what you think.
>
> Cheers,
> Beni
> ________________________________________
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
> Sent: 24 January 2025 21:41
> To: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Sandu, Beniamin <Beniamin.Sandu@windriver.com>; OE-core <
> openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
>
> Hi Beniamin
>
> I was also thinking about buildhistory and spdx when reading this.
>
> Regards,
> Adrian
>
> Alexander Kanavin via lists.openembedded.org <alex.kanavin=
> gmail.com@lists.openembedded.org> schrieb am Fr., 24. Jan. 2025, 20:30:
> Isn't this what spdx already does?
> E.g.
> tmp/deploy/spdx/3.0.1/qemux86_64/rootfs/core-image-full-cmdline-qemux86-64-rootfs.spdx.json
>
> Alex
>
> On Fri, 24 Jan 2025 at 17:29, Beniamin Sandu via
> lists.openembedded.org
> <beniamin.sandu=windriver.com@lists.openembedded.org> wrote:
> >
> > The rootfs-footprint class can be inherited by image recipes to generate
> > a .json footprint file. This file contains a list of all installed
> packages,
> > with the following format:
> >
> > {
> >     "package_name": "busybox-udhcpc",
> >     "version": "1.37.0",
> >     "total_size": 2701,
> >     "installed_files": {
> >         "/etc/udhcpc.d/50default": 2652,
> >         "/usr/share/udhcpc/default.script": 49
> >     }
> > }
> >
> > The data can be used with other tools/scripts to generate detailed
> > rootfs reports or perform relevant comparisons.
> >
> > Signed-off-by: Beniamin Sandu <beniamin.sandu@windriver.com>
> > ---
> >  meta/classes/rootfs-footprint.bbclass | 54 +++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 meta/classes/rootfs-footprint.bbclass
> >
> > diff --git a/meta/classes/rootfs-footprint.bbclass
> b/meta/classes/rootfs-footprint.bbclass
> > new file mode 100644
> > index 0000000000..247db0b709
> > --- /dev/null
> > +++ b/meta/classes/rootfs-footprint.bbclass
> > @@ -0,0 +1,54 @@
> > +# Generates a json footprint file with the list of packages installed
> in the rootfs image,
> > +# with the following format:
> > +#
> > +# {
> > +#     "package_name": "busybox-syslog",
> > +#     "version": "1.37.0",
> > +#     "total_size": 2824,
> > +#     "installed_files": {
> > +#         "/etc/init.d/syslog": 2104,
> > +#         "/etc/syslog-startup.conf": 651,
> > +#         "/etc/syslog.conf": 69
> > +#     }
> > +# }
> > +#
> > +# Copyright (C) 2024 Wind River Systems, Inc.
> > +# Author: Beniamin Sandu <beniamin.sandu@windriver.com>
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +ROOTFS_POSTPROCESS_COMMAND:append = " create_rootfs_footprint; "
> > +ROOTFS_FOOTPRINT_FILE ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.footprint.json"
> > +
> > +python create_rootfs_footprint() {
> > +    from oe.rootfs import image_list_installed_packages
> > +    import oe.packagedata
> > +    import json
> > +
> > +    footprint_file = d.getVar('ROOTFS_FOOTPRINT_FILE')
> > +    pkg_info_dic = {}
> > +    pkg_dic = dict(package_name="", version="", total_size=0,
> installed_files="")
> > +    pkg_list = sorted(image_list_installed_packages(d))
> > +
> > +    pkg_data_list = []
> > +
> > +    for pkg in pkg_list:
> > +        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
> 'runtime-reverse', pkg)
> > +        pkg_name = os.path.basename(os.readlink(pkg_info))
> > +        pkg_info_dic[pkg_name] =
> oe.packagedata.read_pkgdatafile(pkg_info)
> > +
> > +        pkg_dic["package_name"] = pkg_name
> > +        pkg_dic["version"] = pkg_info_dic[pkg_name]["PV"]
> > +        pkg_dic["total_size"] = int(pkg_info_dic[pkg_name]["PKGSIZE:" +
> pkg_name])
> > +        pkg_dic["installed_files"] =
> json.loads(pkg_info_dic[pkg_name]["FILES_INFO:" + pkg_name])
> > +
> > +        pkg_data_list.append(pkg_dic.copy())
> > +
> > +    with open(footprint_file, 'w') as f:
> > +        json.dump(pkg_data_list, f, indent=4)
> > +
> > +    footprint_link = os.path.join(d.getVar('IMGDEPLOYDIR'),
> "%s.footprint.json" % d.getVar('IMAGE_LINK_NAME'))
> > +    if os.path.lexists(footprint_link):
> > +        os.remove(footprint_link)
> > +    os.symlink(os.path.basename(footprint_file), footprint_link)
> > +}
> > --
> > 2.39.5
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210246):
> https://lists.openembedded.org/g/openembedded-core/message/210246
> Mute This Topic: https://lists.openembedded.org/mt/110791960/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--000000000000cee6e6062c7a9354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You probably should look into improving buildhistory. Or-=
core needs maintainers for things that already exist, not addition of new t=
hings that partially overlap in functionality.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 24. Jan 2025 a=
t 22.25, Sandu, Beniamin &lt;<a href=3D"mailto:Beniamin.Sandu@windriver.com=
">Beniamin.Sandu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hey=
 folks,<br>
<br>
Thanks for the feedback.<br>
<br>
The main idea behind this class, was to have an easy way to extract rootfs =
information, mostly focused on sizes.=C2=A0 A common scenario on my side wa=
s upgrading a set of layers to a different yocto version, building for a sy=
stem, and ending up with quite different and usually bigger final image. On=
 systems where rootfs size is still a top priority, this can add on quite s=
ome tedious extra work of identifying where all the extra space is coming f=
rom.<br>
<br>
I had a quick look at the current classes, and some issues that I found (es=
pecially for this use case), are:<br>
<br>
For spdx:<br>
- there is a lot of information generated, and could not find any on packag=
e/file sizes<br>
- spread over a lot of files<br>
- impossible to read with the naked eye<br>
<br>
For buildhistory:<br>
- a lot of information, spread over a lot of files<br>
- different output formats in the generated data<br>
<br>
To that end, I wanted something that:<br>
- is fast to generate<br>
- is easy to read/follow with the naked eye if needed<br>
- all the relevant information is in one file<br>
- has a consistent and easy to parse format<br>
<br>
Now a script with relatively minimal logic (parsing a single json file) can=
 generate very detailed rootfs reports, e.g. sorting packages by size, info=
rmation on added/removed pacakges or files,=C2=A0 other changes in list of =
installed files for a specific package, etc.<br>
<br>
Let me know what you think.<br>
<br>
Cheers,<br>
Beni<br>
________________________________________<br>
From:=C2=A0Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.co=
m" target=3D"_blank">adrian.freihofer@gmail.com</a>&gt;<br>
Sent:=C2=A024 January 2025 21:41<br>
To:=C2=A0Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Cc:=C2=A0Sandu, Beniamin &lt;<a href=3D"mailto:Beniamin.Sandu@windriver.com=
" target=3D"_blank">Beniamin.Sandu@windriver.com</a>&gt;; OE-core &lt;<a hr=
ef=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">op=
enembedded-core@lists.openembedded.org</a>&gt;<br>
Subject:=C2=A0Re: [OE-core] [PATCH] classes: add rootfs-footprint<br>
<br>
Hi Beniamin<br>
<br>
I was also thinking about buildhistory and spdx when reading this.<br>
<br>
Regards,<br>
Adrian<br>
<br>
Alexander Kanavin via <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a>=C2=A0&lt;alex.kanavin=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; schrieb am Fr., 24. Jan. 2025, 20:30=
:<br>
Isn&#39;t this what spdx already does?<br>
E.g. tmp/deploy/spdx/3.0.1/qemux86_64/rootfs/core-image-full-cmdline-qemux8=
6-64-rootfs.spdx.json<br>
<br>
Alex<br>
<br>
On Fri, 24 Jan 2025 at 17:29, Beniamin Sandu via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;beniamin.sandu=3D<a href=3D"mailto:windriver.com@lists.openembedded.org=
" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The rootfs-footprint class can be inherited by image recipes to genera=
te<br>
&gt; a .json footprint file. This file contains a list of all installed pac=
kages,<br>
&gt; with the following format:<br>
&gt;<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;package_name&quot;: &quot;busybox-udhcpc&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;version&quot;: &quot;1.37.0&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;total_size&quot;: 2701,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;installed_files&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/etc/udhcpc.d/50default&quot;: =
2652,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/usr/share/udhcpc/default.scrip=
t&quot;: 49<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt;<br>
&gt; The data can be used with other tools/scripts to generate detailed<br>
&gt; rootfs reports or perform relevant comparisons.<br>
&gt;<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniamin.sandu@win=
driver.com" target=3D"_blank">beniamin.sandu@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/rootfs-footprint.bbclass | 54 +++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/classes/rootfs-footprint.bbclass<br>
&gt;<br>
&gt; diff --git a/meta/classes/rootfs-footprint.bbclass b/meta/classes/root=
fs-footprint.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..247db0b709<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes/rootfs-footprint.bbclass<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +# Generates a json footprint file with the list of packages installed=
 in the rootfs image,<br>
&gt; +# with the following format:<br>
&gt; +#<br>
&gt; +# {<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&quot;package_name&quot;: &quot;busybox-syslog&q=
uot;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&quot;version&quot;: &quot;1.37.0&quot;,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&quot;total_size&quot;: 2824,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0&quot;installed_files&quot;: {<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/etc/init.d/syslog&quot;: 21=
04,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/etc/syslog-startup.conf&quo=
t;: 651,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/etc/syslog.conf&quot;: 69<b=
r>
&gt; +#=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +# }<br>
&gt; +#<br>
&gt; +# Copyright (C) 2024 Wind River Systems, Inc.<br>
&gt; +# Author: Beniamin Sandu &lt;<a href=3D"mailto:beniamin.sandu@windriv=
er.com" target=3D"_blank">beniamin.sandu@windriver.com</a>&gt;<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only<br>
&gt; +<br>
&gt; +ROOTFS_POSTPROCESS_COMMAND:append =3D &quot; create_rootfs_footprint;=
 &quot;<br>
&gt; +ROOTFS_FOOTPRINT_FILE ?=3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}.footpr=
int.json&quot;<br>
&gt; +<br>
&gt; +python create_rootfs_footprint() {<br>
&gt; +=C2=A0 =C2=A0 from oe.rootfs import image_list_installed_packages<br>
&gt; +=C2=A0 =C2=A0 import oe.packagedata<br>
&gt; +=C2=A0 =C2=A0 import json<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 footprint_file =3D d.getVar(&#39;ROOTFS_FOOTPRINT_FILE&=
#39;)<br>
&gt; +=C2=A0 =C2=A0 pkg_info_dic =3D {}<br>
&gt; +=C2=A0 =C2=A0 pkg_dic =3D dict(package_name=3D&quot;&quot;, version=
=3D&quot;&quot;, total_size=3D0, installed_files=3D&quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 pkg_list =3D sorted(image_list_installed_packages(d))<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pkg_data_list =3D []<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for pkg in pkg_list:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_info =3D os.path.join(d.getVar(&#39;P=
KGDATA_DIR&#39;), &#39;runtime-reverse&#39;, pkg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_name =3D os.path.basename(os.readlink=
(pkg_info))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_info_dic[pkg_name] =3D oe.packagedata=
.read_pkgdatafile(pkg_info)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_dic[&quot;package_name&quot;] =3D pkg=
_name<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_dic[&quot;version&quot;] =3D pkg_info=
_dic[pkg_name][&quot;PV&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_dic[&quot;total_size&quot;] =3D int(p=
kg_info_dic[pkg_name][&quot;PKGSIZE:&quot; + pkg_name])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_dic[&quot;installed_files&quot;] =3D =
json.loads(pkg_info_dic[pkg_name][&quot;FILES_INFO:&quot; + pkg_name])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_data_list.append(pkg_dic.copy())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 with open(footprint_file, &#39;w&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(pkg_data_list, f, indent=3D4)<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 footprint_link =3D os.path.join(d.getVar(&#39;IMGDEPLOY=
DIR&#39;), &quot;%s.footprint.json&quot; % d.getVar(&#39;IMAGE_LINK_NAME&#3=
9;))<br>
&gt; +=C2=A0 =C2=A0 if os.path.lexists(footprint_link):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(footprint_link)<br>
&gt; +=C2=A0 =C2=A0 os.symlink(os.path.basename(footprint_file), footprint_=
link)<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210246): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210246" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210246</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110791960/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110791960/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a>=C2=A0[<a href=3D"mailto:adrian.freihofer@gmai=
l.com" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--000000000000cee6e6062c7a9354--

