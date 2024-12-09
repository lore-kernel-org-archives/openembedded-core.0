Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A88AE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:22:22 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.102654.1733754139197730761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 06:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xy4kBA0w;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: colinmca242@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso4307639a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 06:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733754137; x=1734358937; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64vIlUdY2MyiP/ZWGJuaiOPyX6TSOdPvP67BLx8LtiU=;
        b=Xy4kBA0wssdte5DEzq8te4fKjEnBjmgcP2QxHB9W19mTbNs+uXbtjcs+Nscky16QrD
         ZaNTJ8L25h8W2RGx4lgFeErhm39pAOWQGBPhoPumkR2Hc98i2bsHXRH6pyrUs0iNHtrS
         DhFbeARBqB+ASjdUS4pmdakQ6FOJdbZnQbJKbvSGV/yKiLFy8E6dKtw1JtIgO/IQhUaJ
         dHQGupS3rTVHUz04cX45wmeQW7L3dzA+s79b4p4qB60wG0m15ZkqxB3GBAgYvJINRcll
         buvKWGpp7Amx44yVrBwxaoL3l7gsN07UtlzI1sj/nGRkAfQ7pbY8m0WUTSiBSDCM8n3y
         Wq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754137; x=1734358937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64vIlUdY2MyiP/ZWGJuaiOPyX6TSOdPvP67BLx8LtiU=;
        b=CRmijC3RBsedqCUY+ZxoJKonKS6JGnBBIpLGoJBqv/ROuI0o+v5CWRz40Rf7wJE4Rr
         xthfVz5a82Gkgs2ck1Vf0fGLvZlPzMmvpHq0Btrqc4bJ/GJO9/QXkpKLf43iEXCjaq9E
         3AXieVu+xBZ0mg2HGKtbXtvU+AWS+OR3Dw6QyFYbUXCy/VpptHq+50QcXDiFtcuC3Trh
         S/5szZ4XnR4Fcp0a5VOXcO9OjWY/69kgmt87yfzbn46Dc87oHvHgcWpinqcv0iQYQN7L
         CgqqQYdg/sknOvHXRXPSWmsuapc7VL6UQdgbKoXZDYCWvUCsyumwxEDg7Cj9NZX9qYuA
         NeCg==
X-Forwarded-Encrypted: i=1; AJvYcCUqHgeHQXltwUCtWC+wrPMYTkK8aTCqmskIgwkhFzSRAWefngMUVzdL3/PHLnQ67nO6LyO5lqQk5KeFvitJu9Ukyw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzo8mdOROScBfghPI16aM5Uca7LSJ+Osif4ts0usKEf3dj06KHJ
	tzuiChcYPupTMz5oUjSsO0xNyt8GPAAC5eKKBMwQM3gYWca/wfVAakG6jDRTCUpOupqkoQFejBj
	UGXD9pU4fX4JN5F6yqkYQshPUL7I=
X-Gm-Gg: ASbGncs8lBZe9OaDtBqyYGU1gHEiN4pZ/G0cYjf92pzGTQpobNvytoGnvcGNX3ZJj1K
	fhYFZx0E7a2udUwHq6KBhyNRhboU0E0Ys
X-Google-Smtp-Source: AGHT+IEXubbhCgtyqm7hqL2rhAAU+CaiP20Lj8SjYWdTuxP9V7gPg2jjHfD2dCA1tGlxEoqp6C60TJe1VgsCUtnqgBM=
X-Received: by 2002:a05:6402:43c5:b0:5d0:b51c:8479 with SMTP id
 4fb4d7f45d1cf-5d3be680125mr13677684a12.10.1733754137216; Mon, 09 Dec 2024
 06:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20241130175038.870014-1-colinmca242@gmail.com>
 <Z02bDqe_cY6uqij-@bootlin-mathieu> <PA4PR10MB57070ADE2916F49300B63B4BFD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PA4PR10MB57070ADE2916F49300B63B4BFD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
From: Colin <colinmca242@gmail.com>
Date: Mon, 9 Dec 2024 08:22:09 -0600
Message-ID: <CAAyLwgQMUPkg_5i16nFchF32_2cZdnt88njRfVRZDjuHjWQfmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: Add versioned CVSS vector strings
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007a18000628d717a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 14:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208484

--0000000000007a18000628d717a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Would the tests be able to be run again? I think the API appears to be more
stable now. If the tests are still failing, I can rebase this patch on top
of a
commit that changes the retry attempts to a higher number and send in both
patches.

Besides the issue where the database fails to rebuild due to the NIST API's
stability, is there any other feedback or are there any concerns with this
patch?

Thanks,
Colin

On Mon, Dec 2, 2024 at 6:15=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

> This is due to current NVD DB stability issues.
> WARNING: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update fail=
ed
> This can happen only if API calls to NVD DB fail.
>
> So either valkyrie infrastructure needs to increase the retry settings to
> 20+
> (via CVE_DB_UPDATE_ATTEMPTS, I did that "temporarily" two weeks ago on ou=
r
> infra),
> or this change needs to wait until NVD DB infra is fixed (which can take =
a
> loooong time).
> Of course the increase of timeout may mean the update job may take 3-4
> hours more...
> But once it completes, the DB file will be cached and all should return t=
o
> normal.
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Mathieu Dubois-Briand via
> > lists.openembedded.org
> > Sent: Monday, December 2, 2024 12:34
> > To: colinmca242@gmail.com
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] cve-check: Add versioned CVSS vector
> strings
> >
> > On Sat, Nov 30, 2024 at 05:50:38PM +0000, Colin McAllister via
> > lists.openembedded.org wrote:
> > > Currently, cve-check includes a vector string for each CVE included i=
n
> > > the issue list for each package. This vector string is the lowest
> > > CVSS version that's available. For example, if a CVE has both a v2 an=
d
> > > v3.1 vector strint, the v2 vector string is only included.
> > >
> > > This patch adds each supported vector string (v2, v3, and v4). For v3=
,
> > > v3.1 is preferred over v3. If a vector string is not available for a
> > > given verison, the string will default to "UNKNOWN".
> > >
> > > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> >
> > Hi Colin,
> >
> > Thanks for your new patch. As for last week, it seems to be triggering
> > some issues on the autobuilder:
> >
> > ERROR: cve-update-nvd2-native-1.0-r0 do_unpack: Error executing a pytho=
n
> > function in exec_func_python() autogenerated:
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> >      0001:
> >  *** 0002:do_unpack(d)
> >      0003:
> > File: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipe=
s-
> > core/meta/cve-update-nvd2-native.bb', lineno: 105, function: do_unpack
> >      0101:do_fetch[vardeps] =3D ""
> >      0102:
> >      0103:python do_unpack() {
> >      0104:    import shutil
> >  *** 0105:    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"),
> > d.getVar("CVE_CHECK_DB_FILE"))
> >      0106:}
> >      0107:do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}
> > ${CVE_CHECK_DB_FILE_LOCK}"
> >      0108:
> >      0109:def cleanup_db_download(db_file, db_tmp_file):
> > File: '/usr/lib/python3.9/shutil.py', lineno: 264, function: copyfile
> >      0260:
> >      0261:    if not follow_symlinks and _islink(src):
> >      0262:        os.symlink(os.readlink(src), dst)
> >      0263:    else:
> >  *** 0264:        with open(src, 'rb') as fsrc, open(dst, 'wb') as fdst=
:
> >      0265:            # macOS
> >      0266:            if _HAS_FCOPYFILE:
> >      0267:                try:
> >      0268:                    _fastcopy_fcopyfile(fsrc, fdst,
> posix._COPYFILE_DATA)
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > '/srv/autobuilder/valkyrie.yocto.io/current_sources/CVE_CHECK2/nvdcve_2=
-
> > 3.db'
> >
> >
> https://valkyrie.yoctoproject.org/#/builders/76/builds/524/steps/15/logs/=
st
> > dio
> >
> https://valkyrie.yoctoproject.org/#/builders/35/builds/532/steps/14/logs/=
st
> > dio
> >
> > Is this something you can fix ?
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>

--0000000000007a18000628d717a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>Would the tests be able to be run again? I t=
hink the API appears to be more<br>stable now. If the tests are still faili=
ng, I can rebase this patch on top of a<br>commit that changes the retry at=
tempts to a higher number and send in both<br>patches.<br><br>Besides the i=
ssue where the database fails to rebuild due to the NIST API&#39;s<br>stabi=
lity, is there any other feedback or are there any concerns with this<br>pa=
tch?<br><br>Thanks,<br>Colin</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 2, 2024 at 6:=
15=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">P=
eter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This is due to current NVD DB stability issues.<br>
WARNING: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update failed=
<br>
This can happen only if API calls to NVD DB fail.<br>
<br>
So either valkyrie infrastructure needs to increase the retry settings to 2=
0+<br>
(via CVE_DB_UPDATE_ATTEMPTS, I did that &quot;temporarily&quot; two weeks a=
go on our infra),<br>
or this change needs to wait until NVD DB infra is fixed (which can take a =
loooong time).<br>
Of course the increase of timeout may mean the update job may take 3-4 hour=
s more...<br>
But once it completes, the DB file will be cached and all should return to =
normal.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Mathieu Dubois-Briand via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Monday, December 2, 2024 12:34<br>
&gt; To: <a href=3D"mailto:colinmca242@gmail.com" target=3D"_blank">colinmc=
a242@gmail.com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH] cve-check: Add versioned CVSS vector st=
rings<br>
&gt; <br>
&gt; On Sat, Nov 30, 2024 at 05:50:38PM +0000, Colin McAllister via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; Currently, cve-check includes a vector string for each CVE includ=
ed in<br>
&gt; &gt; the issue list for each package. This vector string is the lowest=
<br>
&gt; &gt; CVSS version that&#39;s available. For example, if a CVE has both=
 a v2 and<br>
&gt; &gt; v3.1 vector strint, the v2 vector string is only included.<br>
&gt; &gt;<br>
&gt; &gt; This patch adds each supported vector string (v2, v3, and v4). Fo=
r v3,<br>
&gt; &gt; v3.1 is preferred over v3. If a vector string is not available fo=
r a<br>
&gt; &gt; given verison, the string will default to &quot;UNKNOWN&quot;.<br=
>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Colin McAllister &lt;<a href=3D"mailto:colinmca242=
@gmail.com" target=3D"_blank">colinmca242@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Hi Colin,<br>
&gt; <br>
&gt; Thanks for your new patch. As for last week, it seems to be triggering=
<br>
&gt; some issues on the autobuilder:<br>
&gt; <br>
&gt; ERROR: cve-update-nvd2-native-1.0-r0 do_unpack: Error executing a pyth=
on<br>
&gt; function in exec_func_python() autogenerated:<br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;exec_func_python() autogenerated&#39;, lineno: 2, function:=
 &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt;=C2=A0 *** 0002:do_unpack(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt; File: &#39;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/r=
ecipes-<br>
&gt; core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er" target=3D"_blank">cve-update-nvd2-native.bb</a>&#39;, lineno: 105, func=
tion: do_unpack<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0101:do_fetch[vardeps] =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0102:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0103:python do_unpack() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0104:=C2=A0 =C2=A0 import shutil<br>
&gt;=C2=A0 *** 0105:=C2=A0 =C2=A0 shutil.copyfile(d.getVar(&quot;CVE_CHECK_=
DB_DLDIR_FILE&quot;),<br>
&gt; d.getVar(&quot;CVE_CHECK_DB_FILE&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0106:}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0107:do_unpack[lockfiles] +=3D &quot;${CVE_CHECK_D=
B_DLDIR_LOCK}<br>
&gt; ${CVE_CHECK_DB_FILE_LOCK}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0108:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0109:def cleanup_db_download(db_file, db_tmp_file)=
:<br>
&gt; File: &#39;/usr/lib/python3.9/shutil.py&#39;, lineno: 264, function: c=
opyfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0260:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0261:=C2=A0 =C2=A0 if not follow_symlinks and _isl=
ink(src):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0262:=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.rea=
dlink(src), dst)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0263:=C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 *** 0264:=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(src, &#39;rb&#39;=
) as fsrc, open(dst, &#39;wb&#39;) as fdst:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0265:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # m=
acOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0266:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
_HAS_FCOPYFILE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0267:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0268:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _fastcopy_fcopyfile(fsrc, fdst, posix._COPYFILE_DA=
TA)<br>
&gt; Exception: FileNotFoundError: [Errno 2] No such file or directory:<br>
&gt; &#39;/srv/autobuilder/<a href=3D"http://valkyrie.yocto.io/current_sour=
ces/CVE_CHECK2/nvdcve_2-" rel=3D"noreferrer" target=3D"_blank">valkyrie.yoc=
to.io/current_sources/CVE_CHECK2/nvdcve_2-</a><br>
&gt; 3.db&#39;<br>
&gt; <br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/76/builds/524/=
steps/15/logs/st" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoc=
toproject.org/#/builders/76/builds/524/steps/15/logs/st</a><br>
&gt; dio<br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/35/builds/532/=
steps/14/logs/st" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoc=
toproject.org/#/builders/35/builds/532/steps/14/logs/st</a><br>
&gt; dio<br>
&gt; <br>
&gt; Is this something you can fix ?<br>
&gt; <br>
&gt; --<br>
&gt; Mathieu Dubois-Briand, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
</blockquote></div>

--0000000000007a18000628d717a8--

