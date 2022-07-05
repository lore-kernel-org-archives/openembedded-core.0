Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929EDC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 11:00:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.82566.1657018821969353985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 04:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JsqNg2L3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id n185so6792091wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=b2kOZDofrdYooEb4YQ/4xdWWHNtdDPPqWljFPWL7aL0=;
        b=JsqNg2L3gIs4nGros16fmoxh06rjHYJ1/itg9ibkExQKDRFc1GWo24v0Vf+STjKrh+
         5DWtOkXPlCXhmBkT9r/6qI3/qg/1qILg9jbwo0J4bKaLgRk5b+3B++Mra32Cxtwj5ZuM
         wz3cWpRDcB5sCu/o1aaPyXdrOFLquePJN6yY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=b2kOZDofrdYooEb4YQ/4xdWWHNtdDPPqWljFPWL7aL0=;
        b=sdbNT3qMLkcYTA22oJIbYy/l/jV5Vwp3l8efjTiWZykImkTlfP+Fsc0Alb5oDcNM57
         YIAelqcOi4IOb9GddbrN63MrpJajJ5VOIEcrAdnSLUzOzNtLogHeXbdQvgHq/IOtWVz1
         SqQZP/vD/GJv6HpQIJKU6sU3HdT7/x98tXwD3Swh9ZI6IXFGvfcUAFoMPEoy86klW/9B
         3gC4oNZJCuYS72eDmWjpmmYvFcI2tdU3sVY00oSJBdFnpw47bjNzOdZOYm1B582GzoCo
         WK+vvt7h+ng27vHqRsDEjCGhsbnJLgDnPLlqHKApimDRDLAZ39RHsBtvB6SnVIrhDSnb
         y/PQ==
X-Gm-Message-State: AJIora8leWsyDUK4Qe9/rgyzk8CsZ9r8FxgsNdDedrt0BJZDkRR1clC4
	ljqf1fok8B1PZhkqBczXzl3+qA==
X-Google-Smtp-Source: 
 AGRyM1tTrRx3u8R0ZGpq7vDLJrsEvT6ko+bdSW5f4ncd+91s/N55PHwYwlBOzOBRIQohhT9SgT/2iA==
X-Received: by 2002:a05:600c:600d:b0:3a1:967a:770c with SMTP id
 az13-20020a05600c600d00b003a1967a770cmr16842692wmb.144.1657018820309;
        Tue, 05 Jul 2022 04:00:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b003a039054567sm21542956wms.18.2022.07.05.04.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:00:19 -0700 (PDT)
Message-ID: 
 <daa0ee87582751bd86366cc467d22e1cdd1e6d5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gperf: Add a patch to work around
 reproducibility issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Jul 2022 12:00:18 +0100
In-Reply-To: <02d29713-0c1a-19f7-6494-100c7524bf81@gmail.com>
References: <20220704132504.913976-1-richard.purdie@linuxfoundation.org>
	 <02d29713-0c1a-19f7-6494-100c7524bf81@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 11:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167649

On Tue, 2022-07-05 at 06:36 +0200, Jacob Kroon wrote:
> On 7/4/22 15:25, Richard Purdie wrote:
> > Add a patch to avoid writing the full pathname to gperf into source
> > files which leads to reproducibility issues.
> >=20
> > This fixes issues with systemd reproducibility in particular.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   .../gperf/gperf/reproducibility.patch         | 26 ++++++++++++++++++=
+
> >   meta/recipes-extended/gperf/gperf_3.1.bb      |  2 ++
> >   2 files changed, 28 insertions(+)
> >   create mode 100644 meta/recipes-extended/gperf/gperf/reproducibility.=
patch
> >=20
> > diff --git a/meta/recipes-extended/gperf/gperf/reproducibility.patch b/=
meta/recipes-extended/gperf/gperf/reproducibility.patch
> > new file mode 100644
> > index 00000000000..9f80828dbd7
> > --- /dev/null
> > +++ b/meta/recipes-extended/gperf/gperf/reproducibility.patch
> > @@ -0,0 +1,26 @@
> > +By default gperf puts a header into generated files with the full path=
 to
> > +the tool along with the commandline used. This patch removes the path =
to
> > +the binary, allowing reproducible source files (which can be included =
in
> > +debug source packages).
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +
> > +Index: gperf-3.1/src/options.cc
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gperf-3.1.orig/src/options.cc
> > ++++ gperf-3.1/src/options.cc
> > +@@ -280,6 +280,13 @@ Options::print_options () const
> > +     {
> > +       const char *arg =3D _argument_vector[i];
> > +
> > ++      if (i =3D=3D 0) {
> > ++          const char *shortarg =3D strrchr(arg, '/');
> > ++          if (shortarg) {
> > ++              arg =3D shortarg + 1;
> > ++          }
> > ++      }
> > ++
> > +       /* Escape arg if it contains shell metacharacters.  */
> > +       if (*arg =3D=3D '-')
> > +         {
> > diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-ex=
tended/gperf/gperf_3.1.bb
> > index 82750fca05c..3564ac0805b 100644
> > --- a/meta/recipes-extended/gperf/gperf_3.1.bb
> > +++ b/meta/recipes-extended/gperf/gperf_3.1.bb
> > @@ -9,6 +9,8 @@ SRC_URI  =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> >   SRC_URI[md5sum] =3D "9e251c0a618ad0824b51117d5d9db87e"
> >   SRC_URI[sha256sum] =3D "588546b945bba4b70b6a3a616e80b4ab466e3f33024a3=
52fc2198112cdbb3ae2"
> >  =20
> > +SRC_URI:append =3D " file://reproducibility.patch"
> > +
>=20
> Can I ask if :append was really necessary here, couldn't we just have=20
> used +=3D ? I'm a little saddened with all these :append/:prepend/:remove=
=20
> creeping in to OE-Core.

I agree, I should and usually do better. I'll take a patch to fix it.

Cheers,

Richard


