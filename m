Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.12790.1604061032117202571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 05:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=aEZQDnl3;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1844; q=dns/txt; s=iport;
  t=1604061032; x=1605270632;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=he7gE6XXK0PowMXdJAtCmLi/2oRqVBghPW19LwrontI=;
  b=aEZQDnl3VG2p0Da2vESFtcWzw6LHMTTggisPfgG8kMAwXK2et5XKG1mv
   Or1u8bLFe2aUXkPay09VB0H+dSF/Vrav5gMSxg1MeyQgtGJ+f8qvItCPE
   lG5+8DoTALfuie3iur+wAWF26fot8tVkeiI/pgtJ46V1elAQiOUXjEEV9
   s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BxCQAjB5xf/5pdJa1iHgEBCxIMQIN?=
 =?us-ascii?q?5cFkvLgqVS4EEmyQLAQEBDQEBHw4CBAEBhEoCggcCJTgTAgMBAQsBAQUBAQE?=
 =?us-ascii?q?CAQYEcYVhDIVzAQQBeRACAQghJQ8jJQIEDgWDJ4JcIK4xdIE0hVeFCIE4jTo?=
 =?us-ascii?q?bgUE/gRGBFIFJNT6EPoV2BJw1m2gKIIJMiQiRfSKhZrQGAhEVgTM4I4FXcBW?=
 =?us-ascii?q?DJAlHFwINkGuLfXQ4AgYKAQEDCXyMOwGBEAEB?=
X-IronPort-AV: E=Sophos;i="5.77,433,1596499200"; 
   d="scan'208";a="612628002"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Oct 2020 12:30:31 +0000
Received: from XCH-RCD-002.cisco.com (xch-rcd-002.cisco.com [173.37.102.12])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 09UCUUUa008880
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 30 Oct 2020 12:30:31 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-RCD-002.cisco.com
 (173.37.102.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Oct
 2020 07:30:30 -0500
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Fri, 30 Oct 2020 07:30:30 -0500
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
Thread-Topic: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for
 arm64
Thread-Index: AQHWrejRVNz5C+744kaUUDNWNcIlOamwE3Fk
Date: Fri, 30 Oct 2020 12:30:30 +0000
Message-ID: <1604061028970.9082@cisco.com>
References: <20201029114052.23141-1-dzagorui@cisco.com>,<CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>
In-Reply-To: <CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.14]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.12, xch-rcd-002.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > .vdso-offsets.h.cmd contains command that was used to produce vdso-offs=
ets.h.=0A=
> > It breaks reproducibility because it has an absolute path in it. There =
is no=0A=
> > any value to package such files so it can be dropped.=0A=
> >=0A=
> =0A=
> Have you confirmed that an on-target 'make scripts prepare' property=0A=
> regenerates the file without triggering and oldconfig ?=0A=
> =0A=
> Otherwise, the change looks fine to me.=0A=
> =0A=
> Bruce=0A=
=0A=
Yes, confirmed that oldconfig wont be triggered.=0A=
=0A=
Thanks,=0A=
Denys=0A=
=0A=
> =0A=
> > Signed-off-by: Denys Zagorui <dzagorui@cisco.com>=0A=
> > ---=0A=
> > meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++=0A=
> >  1 file changed, 4 insertions(+)=0A=
> >=0A=
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-=
kernel/linux/kernel-devsrc.bb=0A=
> > index aa8e162f4f..f8c750beaa 100644=0A=
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb=0A=
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb=0A=
> > @@ -113,6 +113,10 @@ do_install() {=0A=
> >         # but without this file, we get a forced syncconfig run in v5.8=
+, which prompts and=0A=
> >         # breaks workflows.=0A=
> >         cp -a --parents include/generated/autoconf.h $kerneldir/build 2=
>/dev/null || :=0A=
> > +=0A=
> > +       if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; the=
n=0A=
> > +           rm $kerneldir/include/generated/.vdso-offsets.h.cmd=0A=
> > +       fi=0A=
> >      )=0A=
> >=0A=
> >      # now grab the chunks from the source tree that we need=0A=
> > --=0A=
> > 2.19.0.dirty=0A=
> >=0A=
> >=0A=
> >=0A=
> >=0A=
=0A=
=0A=
--=0A=
- Thou shalt not follow the NULL pointer, for chaos and madness await=0A=
thee at its end=0A=
- "Use the force Harry" - Gandalf, Star Trek II=0A=
