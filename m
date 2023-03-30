Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0563C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:39:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.23823.1680179971970164701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QeQQQgYI;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680179972;
  x=1711715972;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=QA6em6C9cGzodPknsuYfrH9obPyubK1Jdlc6gXzrZlk=;
  b=QeQQQgYIn77D0zcU3WhY7+Jlp6MbAGCmOmUPPBL51/L5PQcZE0N+7s5c
   uBjM9GP6q2yqcfYvWsblbLT4x9gTx1c5IDo1bA0Cp+z/ZxCfewi3ttdwc
   QbBLlsG51e1dwEnveCKE5iLBliP77lw2XHF+fnQ6KyofdtltDrlxK5veF
   ujQQqEtC3uzM8jH/FRwyqqJ7IZF0MwZW+2RDyBI1dWC9cR7VtCIgv7DYI
   nCAt0fvkFkrl0Q+3ADvHND+a7m2TRpldblNPo98ZT4NRj0oKNGtYrn4aL
   Zwt+nIaxrY97ggpMdPfj2bOBdqPRH3giJ8lCxpAF+S7lKdY5yuRjLjmS2
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTDDk3U2ZAAqZEgCeIMCgQ398unkjab3JzkKYq5uSIh+mWQVKIEl8i7FmHVeezBaDd1XaTQVCqEH6xNwBd7v8AXSTcHlJbsUQlxHd+f+4qrIN3/vgtpbxf/sOOzlOgn2Q/GboAlm/zUxr0UBhlI6/e67+kGjg0wK3/0C57h5/V7KJAgufx2edHjg1l8H8aNIQiTlM29XPBJCMwQ5AGWC8F30fImelhq26MnCtMv1j7142pP5GYeySp3aK7i2kMBLYgzdXqvHNGpAO2CnKJLaIQMrvltb+MNPbBA3kXDDofuzXfT1Oe0VBfEjtDhCHkn6nbMj8p/zK7lzxPp+7PR5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA6em6C9cGzodPknsuYfrH9obPyubK1Jdlc6gXzrZlk=;
 b=OCpeKTgE3cA4nVmKwJQMjuVwMl+Q6mitimUaNHW4qHYf1fJYjmo9h85ZumT1/zove7L1CwGIxZXh+MfQCeyyTXPElHD755+wgU4Tv6qC3zQkQx5oJM5ubCMokA9UlHR8RqqcSHEkbit5YqZY0UFwKACv4JOBbADKAkklt96wL8c4bjq2ueemOdClV5EDN3dL7kp3lNh+4rJSmWmH0UBeX6A7vphTCJdBeHQir1nUYfA7UDN4u+B4TUNW1pXFzi7X3Lr2ncgp8zm9ArgP3Zq6FTVQIFTpoTBySxxl85c4gozmDIyj+bgffT08WA970Mi14LT6r8l7/dC+MgfvcH6dTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA6em6C9cGzodPknsuYfrH9obPyubK1Jdlc6gXzrZlk=;
 b=VJWEKfpEP2Kvc2/RhaSF+tQKybNYrBBKP4VbV36DSzVxG/S7N3LiNXp1v3KBbegj48HOq8lIWXJU9JVTzlO2qVKDPM6Bae9qTzOjapQJiYa3pasYDR4GHQ5RusZQX1tvkZRti/XEyD81OKMIaYGAhWFBU6Q5rByQDCD+1ASr21c=
From: Tobias Hagelborn <Tobias.Hagelborn@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
Thread-Topic: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
Thread-Index: AQHZYud08uMpTKb83UC6QFsAWhwivK8TQtSo
Date: Thu, 30 Mar 2023 12:39:26 +0000
Message-ID: <DU0PR02MB8897F982DDDF6DE06309640BEC8E9@DU0PR02MB8897.eurprd02.prod.outlook.com>
References: <20230323100847.3740485-1-tobiasha@axis.com>
	 <1751049D3A378E36.12651@lists.openembedded.org>
 <208af449dd70c4d88af9e9259413c823d83e0302.camel@linuxfoundation.org>
In-Reply-To: <208af449dd70c4d88af9e9259413c823d83e0302.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB8897:EE_|AS8PR02MB6629:EE_
x-ms-office365-filtering-correlation-id: 58b7fec2-83b9-49ae-f7a5-08db311bcc3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8Ys9+bJI53dmAdK6gPtbNFmb3S1QSmJ71S3THfLD8KUN0I5tYpPKjGOO3ASvkMt7RnX7a94/Ym9rlAxh+bPJnXdn2DEd7Jwf09fZokCe7hzxasfVXW2vnt7wt32DB1on5ofjgGbIBaPVBmS9D8qlPhUAYDWMgEm99TaThPHD6ToO3musKXm7I33nhc13SFZ+taYyBqbwSiRV4lDNNFlYPeydkDi9VCa2z8aeRKIQhaElpzqjc7syEDCm3UOWHKFoSJOCC36A/llRmrEhd7h55fGggOBS9lIzj0sn1UC3Ol64DEw+Ei+kWmM2VoFwK3hnPyN0U0A2S710yESLDKuD7ZR1eYSg5J+4MdYJniY8OiyggAOqz7vzEV/yAJj1l/BSM7Rcu+zOn+QZV7nwE59AAjisCsQYaE5iY1fmrf0Biyu8Wo53KnMvlAy3pyDZbcDlCohjmOhcaoESzOB5qSKcRma49AI5VV7+IeuHlKXG2r7qVi1GMwcRgtxK8znoqzhogBs1NaiWOci5kJRcKdS81dzWiGUhWBCQimevwf2chZMeRvoQa6wgw8kX0E4arUJVR2upqofmoyZgg8TFC32CFXogHGIyBI63CyEIHR1VQtB7nLd5zeCZudbJQ8H0UBh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8897.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(91956017)(966005)(83380400001)(478600001)(71200400001)(316002)(186003)(7696005)(53546011)(9686003)(6506007)(2906002)(26005)(5660300002)(8936002)(38100700002)(33656002)(6916009)(122000001)(76116006)(55016003)(66946007)(66446008)(41300700001)(64756008)(8676002)(66556008)(66476007)(52536014)(166002)(38070700005)(86362001)(19627405001)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XHDn9fKDdzsG7PYHgbMVMERAYhICHnw+s8VkuELyjEAr1T+mmUJWQ2H8GPNQ?=
 =?us-ascii?Q?hfF6J2rf0N4jFkZJ0bnKNJmXmQp+8fGhLwWeBlvtnZfdM+h+Mz5MfDAoPZD8?=
 =?us-ascii?Q?sKAf3ZeBBHrBB0kGO1TvZUK/O6MJjJIaWTg0MayE1BGQnk9lSoQ8jjo+b5wF?=
 =?us-ascii?Q?4sA85B1MD64ng0gZbiQhNnw08xsklU5RloZaT3lj1rA4NdMkwpc3c+ciKn8m?=
 =?us-ascii?Q?OCqKO9koHKnbSgBVrgkMVVJ8ErnxUi/s/9AONyHnnhVs9k8U0QMTeO9zINgg?=
 =?us-ascii?Q?dsIgq6e/t6+A1I24TqvNvm/9S1ViLKu+uZz0FQwHU7unVnrBk1+8EWTtUme+?=
 =?us-ascii?Q?Fs+jApMirmlNTpxIlMv11MV+GimjfFz/YysxQFC2UfvZlSl3MLbxC74Kmx7d?=
 =?us-ascii?Q?Xnp/r/qfY2IPHoWGQ91OzM8fjWJ7W305/rfh4QQ+udgAB20XUToNuM9nUeHz?=
 =?us-ascii?Q?hM8molEgpu/1n2UdZ3zEdvY8wBu6avDPaLM0FDQcuhtzXgn76qIb1ev/ntVQ?=
 =?us-ascii?Q?HxMSd4QEjlZB1o6dKYFvuYsrp3k7nrnnNoit8KaAofmGPlOyb3kA+vRmkrmK?=
 =?us-ascii?Q?R1rEZOz8kesYuQbc5SMKbNkrY59uF/QhlTfb6piXd0BU8k9WvbjJrHuN2RYF?=
 =?us-ascii?Q?xkUv8J29m7biS8oQOy3sk5ZzTTqhFFGD4GTHgKD0zIxUt+zHzMnIuXhSCGXt?=
 =?us-ascii?Q?VfB00NOjUC5vc7wWRAPPn/Z4fUV2liN7uSTMFz2XjKPJ1RQz0fPb2//8W/wm?=
 =?us-ascii?Q?kw2R/IG7wmtmgAE3kNAFimxYxGORhVD6raMh7IPh9rXh4JhiNUC+sGEmrag4?=
 =?us-ascii?Q?EDgsiOvHioTPBvBFfegIWkoJZBy5+MqWtwQJFfA8hfXCIorkg0MUfjx7bv/f?=
 =?us-ascii?Q?UX9CHE/NYDelztDsCDGryhtGCRbdUs4wgOtZeTS5Im/PUsogaZc729Iy96Hg?=
 =?us-ascii?Q?5MBSpKhBQe11IWVwkTM3hy3p+E1iA8ASB1rFiMnbCmmZxSjdmPYupbWrMM7j?=
 =?us-ascii?Q?m3NxYNCXLyWZwf1of2TyMV16eSuABOw+VysfqpfTZCn67E4EkRhGr+rhtJ2H?=
 =?us-ascii?Q?mZ7P+PB+uLqBnedkw06gN/AiI3ppd6dgTK50+EtkL3/tJ4sLJkFc5/xFjm9S?=
 =?us-ascii?Q?ZgzuyjYnxBpK+Tqr3FI36sULWkYiFtnspFHynWSVxQaV8fpOE8pFrxOq8fpV?=
 =?us-ascii?Q?9hD+qsqW1TNPOSDj88v44OLiDzn91qvPuQM7xOdN3b9hmLLSm6gszX/z+PAi?=
 =?us-ascii?Q?bBH670W8lM8NKaA11z1W94Ev9FvUa3B4UA0r3tGAAdLsdneqBosxCS+QaZJ6?=
 =?us-ascii?Q?3+WSs3+RTmrG3/PtvLa3E/+8/9GGsFnVnpmGqL5F6vlnhb7ULguAyGPfrd5F?=
 =?us-ascii?Q?c7biFGb72B7UOVy6fWYQ8P7b+n1yiG9+mVxTluvAIldMhQ4dDyOM/pllBQX/?=
 =?us-ascii?Q?533kDTYELAAgD/bYAqoUlPTkkWWqk2bVAaeuqRlpqwupi5KmKAFZfGsq3dbj?=
 =?us-ascii?Q?3O3m0a4qQeKgm6/zhkE3IARilQh/XLPnkAB/DGb3iIRu/eJY8sB9aQL0jOM/?=
 =?us-ascii?Q?Ex86S3rP9xVWWdjQXHY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU0PR02MB8897F982DDDF6DE06309640BEC8E9DU0PR02MB8897eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8897.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b7fec2-83b9-49ae-f7a5-08db311bcc3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 12:39:26.2969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozxfHyedJcMY3fvVIhrFmuZY6zK9skx1WELNmqcKiEW424jCwvw1Qmqd5CFtjUrokIvbaTK00Ph0bIHqnqR/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6629
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 12:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179317

--_000_DU0PR02MB8897F982DDDF6DE06309640BEC8E9DU0PR02MB8897eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the test feedback Richard!

I have not run the oe selftest properly on this one and will look in to the=
 self-test results.
(We have not used the signed rpm part for instance)

Cheers
Tobias

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, March 30, 2023 11:10 AM
To: Tobias Hagelborn <Tobias.Hagelborn@axis.com>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating=
 .sig files in detach_sign

On Wed, 2023-03-29 at 23:33 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:
> > Move the signature file into place only after it is successfully signed=
.
> > This to avoid race and corrupted .sig files in cases multiple onging
> > builds write to a shared sstate-cache dir.
> >
> > Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> > ---
> >  meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> > index 613dab8561..868846cdc5 100644
> > --- a/meta/lib/oe/gpg_sign.py
> > +++ b/meta/lib/oe/gpg_sign.py
> > @@ -5,11 +5,12 @@
> >  #
> >
> >  """Helper module for GPG signing"""
> > -import os
> >
> >  import bb
> > -import subprocess
> > +import os
> >  import shlex
> > +import subprocess
> > +import tempfile
> >
> >  class LocalSigner(object):
> >      """Class for handling local (on the build host) signing"""
> > @@ -73,8 +74,6 @@ class LocalSigner(object):
> >              cmd +=3D ['--homedir', self.gpg_path]
> >          if armor:
> >              cmd +=3D ['--armor']
> > -        if output_suffix:
> > -            cmd +=3D ['-o', input_file + "." + output_suffix]
> >          if use_sha256:
> >              cmd +=3D ['--digest-algo', "SHA256"]
> >
> > @@ -83,19 +82,25 @@ class LocalSigner(object):
> >          if self.gpg_version > (2,1,):
> >              cmd +=3D ['--pinentry-mode', 'loopback']
> >
> > -        cmd +=3D [input_file]
> > -
> >          try:
> >              if passphrase_file:
> >                  with open(passphrase_file) as fobj:
> >                      passphrase =3D fobj.readline();
> >
> > -            job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, std=
err=3Dsubprocess.PIPE)
> > -            (_, stderr) =3D job.communicate(passphrase.encode("utf-8")=
)
> > +            output_file =3D input_file + "." + (output_suffix or 'sig'=
)
>
> This doesn't match the behaviour of output_suffix as used above where
> it defaults to None. This forces it to a default of "sig" instead?
>
> If that intentional that should be in the commit message.
>
>
> > +            with tempfile.TemporaryDirectory(dir=3Dos.path.dirname(out=
put_file)) as tmp_dir:
> > +                tmp_file =3D os.path.join(tmp_dir, os.path.basename(ou=
tput_file))
> > +                cmd +=3D ['-o', tmp_file]
> > +
> > +                cmd +=3D [input_file]
> > +
> > +                job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE,=
 stderr=3Dsubprocess.PIPE)
> > +                (_, stderr) =3D job.communicate(passphrase.encode("utf=
-8"))
> >
> > -            if job.returncode:
> > -                bb.fatal("GPG exited with code %d: %s" % (job.returnco=
de, stderr.decode("utf-8")))
> > +                if job.returncode:
> > +                    bb.fatal("GPG exited with code %d: %s" % (job.retu=
rncode, stderr.decode("utf-8")))
> >
> > +                os.rename(tmp_file, output_file)
> >          except IOError as e:
> >              bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> >              raise Exception("Failed to sign '%s'" % input_file)

I've been struggling to confirm it but have now done so. This does
cause an oe-selftest failure as here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4950/step=
s/14/logs/stdio


i.e. from

oe-selftest -r runtime_test.TestImage.test_testimage_dnf

Cheers,

Richard



--_000_DU0PR02MB8897F982DDDF6DE06309640BEC8E9DU0PR02MB8897eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 10pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
Thanks for the test feedback Richard!<br>
<br>
I have not run the oe selftest properly on this one and will look in to the=
 self-test results.<br>
(We have not used the signed rpm part for instance)<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 10pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
Cheers<br>
Tobias<br>
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, March 30, 2023 11:10 AM<br>
<b>To:</b> Tobias Hagelborn &lt;Tobias.Hagelborn@axis.com&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when c=
reating .sig files in detach_sign</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2023-03-29 at 23:33 +0100, Richard Purdie =
via<br>
lists.openembedded.org wrote:<br>
&gt; On Thu, 2023-03-23 at 11:08 +0100, Tobias Hagelborn wrote:<br>
&gt; &gt; Move the signature file into place only after it is successfully =
signed.<br>
&gt; &gt; This to avoid race and corrupted .sig files in cases multiple ong=
ing<br>
&gt; &gt; builds write to a shared sstate-cache dir.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Tobias Hagelborn &lt;tobiasha@axis.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------<br>
&gt; &gt;&nbsp; 1 file changed, 15 insertions(+), 10 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py<br=
>
&gt; &gt; index 613dab8561..868846cdc5 100644<br>
&gt; &gt; --- a/meta/lib/oe/gpg_sign.py<br>
&gt; &gt; +++ b/meta/lib/oe/gpg_sign.py<br>
&gt; &gt; @@ -5,11 +5,12 @@<br>
&gt; &gt;&nbsp; #<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; &quot;&quot;&quot;Helper module for GPG signing&quot;&quot;=
&quot;<br>
&gt; &gt; -import os<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; import bb<br>
&gt; &gt; -import subprocess<br>
&gt; &gt; +import os<br>
&gt; &gt;&nbsp; import shlex<br>
&gt; &gt; +import subprocess<br>
&gt; &gt; +import tempfile<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; class LocalSigner(object):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;Class for handlin=
g local (on the build host) signing&quot;&quot;&quot;<br>
&gt; &gt; @@ -73,8 +74,6 @@ class LocalSigner(object):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cmd +=3D ['--homedir', self.gpg_path]<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if armor:<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cmd +=3D ['--armor']<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if output_suffix:<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; cmd +=3D ['-o', input_file + &quot;.&quot; + output_suffix]<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if use_sha2=
56:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cmd +=3D ['--digest-algo', &quot;SHA256&quot;]<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; @@ -83,19 +82,25 @@ class LocalSigner(object):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if self.gpg=
_version &gt; (2,1,):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cmd +=3D ['--pinentry-mode', 'loopback']<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd +=3D [input_file]=
<br>
&gt; &gt; -<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if passphrase_file:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(passphrase_file) as fobj:<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase =3D=
 fobj.readline();<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE, stderr=3Dsubproce=
ss.PIPE)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (_, stderr) =3D job.communicate(passphrase.encode(&quot;utf-8&quot;))<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; output_file =3D input_file + &quot;.&quot; + (output_suffix or 'sig')<br=
>
&gt; <br>
&gt; This doesn't match the behaviour of output_suffix as used above where<=
br>
&gt; it defaults to None. This forces it to a default of &quot;sig&quot; in=
stead?<br>
&gt; <br>
&gt; If that intentional that should be in the commit message.<br>
&gt; <br>
&gt; <br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; with tempfile.TemporaryDirectory(dir=3Dos.path.dirname(output_file)) as =
tmp_dir:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; tmp_file =3D os.path.join(tmp_dir, os.path.basen=
ame(output_file))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; cmd +=3D ['-o', tmp_file]<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; cmd +=3D [input_file]<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; job =3D subprocess.Popen(cmd, stdin=3Dsubprocess=
.PIPE, stderr=3Dsubprocess.PIPE)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; (_, stderr) =3D job.communicate(passphrase.encod=
e(&quot;utf-8&quot;))<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if job.returncode:<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&quot;GPG exited with code %d: %s&quot;=
 % (job.returncode, stderr.decode(&quot;utf-8&quot;)))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if job.returncode:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&quot;GPG exite=
d with code %d: %s&quot; % (job.returncode, stderr.decode(&quot;utf-8&quot;=
)))<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; os.rename(tmp_file, output_file)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; except IOEr=
ror as e:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; bb.error(&quot;IO error (%s): %s&quot; % (e.errno, e.strerror)=
)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; raise Exception(&quot;Failed to sign '%s'&quot; % input_file)<=
br>
<br>
I've been struggling to confirm it but have now done so. This does<br>
cause an oe-selftest failure as here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/4950/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/80/builds/4950/steps/14/logs/stdio</a><br>
<br>
<br>
i.e. from<br>
<br>
oe-selftest -r runtime_test.TestImage.test_testimage_dnf<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU0PR02MB8897F982DDDF6DE06309640BEC8E9DU0PR02MB8897eurp_--

