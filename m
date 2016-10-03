Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1141865C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 09:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 758AF1816D;
	Mon,  3 Oct 2016 11:53:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xhh2fYJvRWRZ; Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4A09C180E9;
	Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 350F81E085;
	Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 250EE1E084;
	Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 17C21590;
	Mon,  3 Oct 2016 11:53:08 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 3 Oct 2016 11:53:08 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 3 Oct 2016 11:53:07 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Mon, 3 Oct 2016 11:53:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/1] Avoid unnecessary dependency on awk in
	devtool deploy-target
Thread-Index: AQHSHQdJfEUcx5yAM0avlNFyJRvr1qCWcEEg
Date: Mon, 3 Oct 2016 09:53:08 +0000
Message-ID: <3c84918d2e4142168711a8649f217ed5@XBOX02.axis.com>
References: <cover.1475265162.git.pkj@axis.com>
	<BDFF4C48-609C-4318-A6F6-55CE0950A5DC@gmail.com>
In-Reply-To: <BDFF4C48-609C-4318-A6F6-55CE0950A5DC@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Avoid unnecessary dependency on awk in devtool deploy-target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2016 09:53:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: den 3 oktober 2016 01:47
> To: Peter Kjellerstedt
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] Avoid unnecessary dependency on awk
> in devtool deploy-target
>=20
> > On Sep 30, 2016, at 12:53 PM, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> >
> > After updating to Krogoth, our developers were faced with the
> > following error message when using devtool deploy-target:
> >
> > /tmp/devtool_deploy.sh: line 23: awk: not found
> >
> > This is of course due to the fact that we do not have awk installed
> > in our products. However, the use of awk in devtool deploy-target is
> > completely unnecessary. It is already using sed, and sed is fully
> > capable of extracting the information that awk was used for.
>=20
> sed or awk both are individual packages, some other user may complain
> they don't have sed installed. it would be good to know if we document=20
> this dependency for using devtool.
>=20
> > //Peter

I find it much less likely to have a system without sed than awk, but=20
you are right that the dependencies should be documented somewhere,=20
unless they already are... After my fix, devtool deploy requires the=20
following commands: cat (can be replaced by letting sed read the file=20
itself), df, dirname (can be replaced with a parameter expansion), find,=20
head (can be replaced with sed), mkdir, mv, rm, rmdir, sed, sh and tar.

//Peter


