Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web08.11793.1631291795701865597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 09:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=fpAGHUrm;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id OjVvm78GVrasdOjVwmHo57; Fri, 10 Sep 2021 17:36:34 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=dIE9ZNRb c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=7QKq2e-ADPsA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=VqxmPqALgtJd6tlHLs0A:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=GMin5xvkqNTNWQeGCOcPzVy2MmNAcTUDxWkn5HCLyTc=; b=fpAGH
	Urm8uBppZEAivLXDxKdIM/+ylEs1S0WO3B68ydOu+kFx5LADtDEM1M25F47/KPvdt98Vzlz32p/R9
	PHVwS35rJToQs4ft11Y2Kul3P4V4glef3LChzLLKQUPqWd/upm3lenDc1dQPXhP67yd8usgMpsk73
	YFbOqWeWCw+M+UAFNHaSupAKM6yvFF3td3xru4syhr3Ga3mtWVItp8jQU+jaVg2wzxGZbEvznxxKQ
	3259/udq+JVMVJaUWiVClEMhJM0LTXW9kgWL2PeF8GwwaL6RnWmRfsoWxrwQLMEVn4BtaYjjaYXPF
	olS/3n3jP0zwNPnLLJuqGGa2LVzTg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mOjVv-004nBE-9a; Fri, 10 Sep 2021 17:36:31 +0100
Date: Fri, 10 Sep 2021 17:36:31 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH v2] fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ
Message-ID: <YTuJj9dxbuF/36ug@mcrowe.com>
References: <169AD8EBF1055369.13770@lists.openembedded.org>
 <16A248F6B42CACC2.5565@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <16A248F6B42CACC2.5565@lists.openembedded.org>
X-CMAE-Envelope: MS4wfIlma5lRt+j9By6f6YO4S1p2xS5SoWYeIwfWd8TkiSDrFWoZzcSfrHXnD00T1e5qsoN3mBtql+FTZ1/tXrRVXig5aY2ZM2uJTKEpINK+Kgo21wEWT76B
 CgN8Ul3/JIfUr7ZzLO3+zVNGabS74rVxjniB0ucdeAN4YBJJrmA7d61O/59FmM0qCzx4VeZlJrV4+g==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 06 September 2021 at 17:37:14 +0100, Mike Crowe via lists.openembedded.org wrote:
> On Friday 13 August 2021 at 12:05:09 +0100, Mike Crowe via lists.openembedded.org wrote:
> > When running the test suite on my Debian 11 box I see many occurrences
> > of:
> > 
> >  unknown fcntl argument 1032, assuming long argument.
> > 
> > (for example from test-execl.sh.)
> > 
> > It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> > add it and the corresponding F_SETPIPE_SZ too to avoid the warning
> > messages.
> > 
> > F_SETPIPE_SZ accepts an int argument, which strictly speaking isn't the
> > same as the long that the wrapper expects. However, this is also true
> > for F_DUPFD which seems to be working correctly on all the targets that
> > people care about.
> > 
> > We need to define the command constants if the system headers don't
> > provide them to ensure that a binary built on an old system works
> > without the new commands works correctly only a newer one that tries to
> > use them. If the system values differ from the expected ones then such a
> > binary would also be incompatible, so fail the build in that case too.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  Makefile.in              |  1 +
> >  ports/linux/guts/fcntl.c | 21 +++++++++++++++
> >  test/test-fcntl.c        | 58 ++++++++++++++++++++++++++++++++++++++++
> >  test/test-fcntl.sh       |  5 ++++
> >  4 files changed, 85 insertions(+)
> >  create mode 100644 test/test-fcntl.c
> >  create mode 100755 test/test-fcntl.sh

Hi Richard & Seebs,

It looks like only part of this change landed as
328452d74917ce9314c8c4afe2bd277473a4c076:

|  Makefile.in              |  1 +
|  ports/linux/guts/fcntl.c | 21 +++++++++++++++++++++

This means that the tests no longer pass:

cc: error: test/test-fcntl.c: No such file or directory

It looks like something similar happened with test-statx leading to
https://lists.openembedded.org/g/openembedded-core/message/154797 so I
wonder whether there's some sort of tooling fault somewhere?

Thanks.

Mike.
