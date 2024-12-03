Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876CCE6C5F0
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 02:42:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.10640.1733193752237691047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 18:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h+jXVGwL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IMVSr021908
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 02:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+sgutxkMsYb+KhTeVS6tX+AhzMaFZzThQvQaCVBC0M=; b=h+jXVGwLdr1yo0kL
	77o87CH1EItYm4LwhdrFXGh2DDePB21dz5BxMADcAdxitg7fmVO4KJzuiQyJ5aZ7
	UIvh0q5V+t/mX4zwzSqeXh4SkhxwdC1kt4yDYncIBBi5xP5/Wy1XsD0XVxnjqMVi
	tXIuEnOXx6cGlv67eSQhNlZNxjr1HVMbjqkZQT2YtBl9hxgx8EE2rCxQnMqG9ezm
	RVwY+ryUZeNqe92N4FYLbXweTzajClz24Hq64Thmd8ulUZkxor9yqJktga3yvtZI
	Dg/6gClxkZyXjEnk3qg70xBUmDCwvHVHzEjBwHF/cbzml1sFM+u7asmrtmyPUnDy
	SJZ5AA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437rdees63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 02:42:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6ef8494edb2so19434247b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 18:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733193750; x=1733798550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+sgutxkMsYb+KhTeVS6tX+AhzMaFZzThQvQaCVBC0M=;
        b=G8Jx1+4NAeJukI7mObKPZHXtQNANe0ifoNYqpLM9Y1E1FOmg2kGguZUmrpF3AxkscS
         DsY2PzQO1rmTCXZ7GoBtv/t9rtFLGvIDhWKhyKMeh8iA+ZRsDciFVm7/9ZfNYMX0NrxA
         okQjOoKCZb+Fi0sGmzeNBNYbnnGgJ6FxpWRz4Ti8dib8oWUibfaL2yLHERv05YqXbfsz
         lyz3HAbDqyzVAT+OWiI2vrq+ChOII0WNagM4Yss/X9u8YGkfHNzqrPqlTabldLAxgEui
         ipHbf0N/6t1TAI0ekNf5JAPThdI67YNs8cEJI6mL0X5XO9ApxcneLqFHSOsowtgZmcsU
         xLhQ==
X-Gm-Message-State: AOJu0YyvhF2R6CvcbGLZSoa07TzxM4Hmz18z9zZjDxCuvhiRQfSsVc5F
	gGbzN33ZfhhMd9Om6NxtB2syIo8vg0t7lMGN/6Gwk0o/pcF6jKchuxQg+atMriyhBX2Dn9cET5g
	EOTDIiPqZb2EVeawYzZz4Eyv9+1mKhZiQQDmo3lkZTa2zu8L3Fh/icEH+Gype69PtPFKrs5FYck
	xiQbE4jKM06B8fRObqm8H2FefYngKMicNupQFKFADaxszuaTbF++fqi9OrFlSKPA==
X-Gm-Gg: ASbGncuj2tzFPrdirENfUAhaawDMfPTCoGIIhtNKWZhHpPZGTtljmN6/nlVSZbjCWqc
	N1R+DeiASah/379KeJ5TcjG21+OZcIfd4ig==
X-Received: by 2002:a05:690c:b1b:b0:6ef:4ed2:7df4 with SMTP id 00721157ae682-6efad1b518dmr12980647b3.33.1733193750395;
        Mon, 02 Dec 2024 18:42:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGZg8m/+FzXq7NLaiqc4h9LjNVGMCPq24jHYFBZDCeiIYpDIyEs0tQj92vJuZ5gn8+dmpeIZUVxH/fR9EUZhY=
X-Received: by 2002:a05:690c:b1b:b0:6ef:4ed2:7df4 with SMTP id
 00721157ae682-6efad1b518dmr12980537b3.33.1733193750085; Mon, 02 Dec 2024
 18:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20241129033654.1275825-1-ricardo.salveti@oss.qualcomm.com> <DB5PR02MB102136B5A51F5964FFE6DC3ADEF352@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102136B5A51F5964FFE6DC3ADEF352@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 23:41:53 -0300
Message-ID: <CAA_5yovo1N-5_BS1_G8OjrMETtgxHjfUiUaNpjBND9bVi3jfuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir,
 rootprefix and split-usr options
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LbPosbINbVtzHwSshrhdByciYdAIyOrZ
X-Proofpoint-GUID: LbPosbINbVtzHwSshrhdByciYdAIyOrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 02:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208171

On Mon, Dec 2, 2024 at 4:50=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Ricardo Salveti via lists.openembedded.org
> > Sent: den 29 november 2024 04:37
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/2] systemd: drop deprecated rootlibdir, roo=
tprefix and split-usr options
> >
> > Support for split-usr and unmerged-usr were both removed as part of the
> > systemd 255 release, so remove the current deprecated rootlibdir,
> > rootprefix and split-usr options from the recipe.
> >
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> > ---
> >  meta/recipes-core/systemd/systemd_256.8.bb | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-=
core/systemd/systemd_256.8.bb
> > index c17100a636a..26d2237ce3a 100644
> > --- a/meta/recipes-core/systemd/systemd_256.8.bb
> > +++ b/meta/recipes-core/systemd/systemd_256.8.bb
> > @@ -69,7 +69,7 @@ PAM_PLUGINS =3D " \
> >  "
> >
> >  PACKAGECONFIG ??=3D " \
> > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam =
pni-names selinux smack usrmerge polkit seccomp', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam =
pni-names selinux smack polkit seccomp', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump=
 elfutils', '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} =
\
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)=
} \
> > @@ -218,7 +218,6 @@ def build_epoch(d):
> >  PACKAGECONFIG[set-time-epoch] =3D "${@build_epoch(d)},-Dtime-epoch=3D0=
"
> >  PACKAGECONFIG[timedated] =3D "-Dtimedated=3Dtrue,-Dtimedated=3Dfalse"
> >  PACKAGECONFIG[timesyncd] =3D "-Dtimesyncd=3Dtrue,-Dtimesyncd=3Dfalse"
> > -PACKAGECONFIG[usrmerge] =3D "-Dsplit-usr=3Dfalse,-Dsplit-usr=3Dtrue"
> >  PACKAGECONFIG[sbinmerge] =3D "-Dsplit-bin=3Dfalse,-Dsplit-bin=3Dtrue"
> >  PACKAGECONFIG[userdb] =3D "-Duserdb=3Dtrue,-Duserdb=3Dfalse"
> >  PACKAGECONFIG[utmp] =3D "-Dutmp=3Dtrue,-Dutmp=3Dfalse"
> > @@ -240,14 +239,10 @@ CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TAR=
GET}"
> >
> >  # Helper variables to clarify locations.  This mirrors the logic in sy=
stemd's
> >  # build system.
> > -rootprefix ?=3D "${root_prefix}"
> > -rootlibdir ?=3D "${base_libdir}"
> > -rootlibexecdir =3D "${rootprefix}/lib"
> > +rootlibexecdir =3D "${nonarch_base_libdir}"
>
> Why use ${nonarch_base_libdir} here? ${nonarch_libdir} should be
> more appropriate now that usrmerge is removed.

Agree, will change on v2.

> >  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> >                    -Dnobody-group=3Dnogroup \
> > -                  -Drootlibdir=3D${rootlibdir} \
> > -                  -Drootprefix=3D${rootprefix} \
> >                    -Ddefault-locale=3DC \
> >                    -Dmode=3Drelease \
> >                    -Dsystem-alloc-uid-min=3D101 \
> > @@ -403,7 +398,7 @@ do_install() {
> >  }
> >
> >  python populate_packages:prepend (){
> > -    systemdlibdir =3D d.getVar("rootlibdir")
> > +    systemdlibdir =3D d.getVar("nonarch_base_libdir")
>
> This should be using base_libdir (or libdir as suggested above).

Yeah, nonarch will fail on cases where it is different than
base_libdir/libdir, as noticed by Mathieu. Will fix on v2.

Same for the other suggestions.

Thanks for the review.

Cheers,

Ricardo

