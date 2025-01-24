Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C890C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:41:30 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.1643.1737747685509886828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 11:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTErsjT9;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29e2a50586dso1315464fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737747685; x=1738352485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wEFz75aQOxhtWRYgeKBdQkZq6G1BawQnzGMp3km1Grg=;
        b=GTErsjT9CCUFJ/wD+VpE5Y6yC+HfN79RXmu95sstwBNxP+Xqv2oyPLfHcXdU2xlTdA
         d/ffjD6w5vsS4G9SddXm0KrBMIpYmD1uACbu8OsnbIEmFs1Y7VOG8MotzE3+rEGN3Ouk
         cYQvMr8gvXSytrYY4AEd5K0bWKKEl77+fwp9Da/1L1PxIkNSq30Hl3aAymFIMK24gLDD
         qMQz5hQuhmnMvNi59OAnuFObwrJ6ZQpjhCYqBcsd0Kj/5STIR6SZqp1obIWbMuEIyBNJ
         t6XSB+UVUMt451/fa8RRholgE9us2o3L0ZRT/kuYEijDqBeHbKnJPINodS3lIpNM/S4J
         ZTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747685; x=1738352485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEFz75aQOxhtWRYgeKBdQkZq6G1BawQnzGMp3km1Grg=;
        b=aZqE6KgxMRIfLGgbiBE+NF8jCC9UOljG5uoDbvqNmfaT7+MLuh4GAr0ydo40EceKM2
         3BPME/V5rMyPzcVLq8b94OcR5Oe40g+98njwJ8AchVBBJlEJsi+dqNfu4n5jcW47p+Tn
         gJ0ou+DZP3fN0ueJwbpFfpJFaC1cBprFI2L1g+MdfF8GhBtL0wHqiFqDmUcfSBCq1Gz8
         SmVRTk2Eip8tC3SpKid2R1vv4FR3JYUmqlWzt5dy3xhkb9Q6C2DRwU6jMUlSYzNTBC+4
         1aU2xgF80Eq7Vkcd9oou6KHNzsnWfwpWv8WdelP/852smXkYoj9z5Dk9hmeC1aHu7jyP
         lUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPkWe1oadrluqfXg6hJE1Y1DSg6nbFfqYDFvWoKlTvYfQPYj/SyX7uG7ULukYjOVQG5QEYvUrPcn7UWDSHiDHC/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC5qMpsyUcgaHv14TzOP0j/g756z+3xFaDQdamUKntUw3i2sGt
	GcTl2+sy780AAiSbq6V2jX65uopbvbF9evdiJ+VWmh+hmQAxwUl22tx5S4EhfcSNKlAq6Z39i5V
	dFrZRZxF6dakgGQINC7/ik3jzi4A=
X-Gm-Gg: ASbGnctel5uV5jC4Ik629yV+Y/K13nkwiS0QQnfR636W/h9H/PkknQLZhKkFlOhN2j1
	W1O4Kh17IPBCApxq18IGV12li48Wkwr3rl6Q35hKfB7m4VgUoOSofnB/SVi+bJ18=
X-Google-Smtp-Source: AGHT+IEBwpcQy/ba81zfky00aaCJjyhQqbREPDUQgRmDrOqfMqXoSAl0fWvlxXxRbt8KoJHfyFKkyHdV6oBf3+LI6lQ=
X-Received: by 2002:a05:6870:b022:b0:29e:6096:c25f with SMTP id
 586e51a60fabf-2b1c0ab53f5mr17900741fac.23.1737747684748; Fri, 24 Jan 2025
 11:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20250124141852.2089467-1-beniamin.sandu@windriver.com> <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
In-Reply-To: <CANNYZj8v_gbjquwKafQHcczz7JX6v7HWmqKBi4WkAiucBKT-wQ@mail.gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Fri, 24 Jan 2025 20:41:15 +0100
X-Gm-Features: AWEUYZnNaqKgH1gOKOgIIwEXuhs5DgXnHobRewn9LD2V5_3R56VicH3BYNhvTFo
Message-ID: <CAB3asfiqa5Qc_e5kYbXqXUsFLNiEjKwHXUZUHSovTqhxmfT3eA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add rootfs-footprint
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: beniamin.sandu@windriver.com, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007575a2062c78e961"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 19:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210249

--0000000000007575a2062c78e961
Content-Type: text/plain; charset="UTF-8"

Hi Beniamin

I was also thinking about buildhistory and spdx when reading this.

Regards,
Adrian

Alexander Kanavin via lists.openembedded.org <alex.kanavin=
gmail.com@lists.openembedded.org> schrieb am Fr., 24. Jan. 2025, 20:30:

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
>

--0000000000007575a2062c78e961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Beniamin</div><div dir=3D"auto"><br>=
</div><div>I was also thinking about buildhistory and spdx when reading thi=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div di=
r=3D"auto">Adrian<br><br><div class=3D"gmail_quote gmail_quote_container" d=
ir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.=
kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lis=
ts.openembedded.org</a>&gt; schrieb am Fr., 24. Jan. 2025, 20:30:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Isn&#39;t this what spdx already does?<br>
E.g. tmp/deploy/spdx/3.0.1/qemux86_64/rootfs/core-image-full-cmdline-qemux8=
6-64-rootfs.spdx.json<br>
<br>
Alex<br>
<br>
On Fri, 24 Jan 2025 at 17:29, Beniamin Sandu via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;beniamin.sandu=3D<a href=3D"mailto:windriver.com@lists.openembedded.org=
" target=3D"_blank" rel=3D"noreferrer">windriver.com@lists.openembedded.org=
</a>&gt; wrote:<br>
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
driver.com" target=3D"_blank" rel=3D"noreferrer">beniamin.sandu@windriver.c=
om</a>&gt;<br>
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
er.com" target=3D"_blank" rel=3D"noreferrer">beniamin.sandu@windriver.com</=
a>&gt;<br>
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
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210246): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210246" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/210246</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110791960/445=
4582" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/110791960/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofe=
r@gmail.com" target=3D"_blank" rel=3D"noreferrer">adrian.freihofer@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000007575a2062c78e961--

