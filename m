Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCDE27C71C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 12:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2FCmOk0014088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 05:48:24 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.22.17) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 15 Mar 2019 05:48:23 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 08:48:21 -0400
Message-ID: <3105861.qMZ08JTR0j@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1srhabVFoLY8Wym7AN-K=rc8ckPjCUKHG-XwQQLsmkEMUg@mail.gmail.com>
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1srhabVFoLY8Wym7AN-K=rc8ckPjCUKHG-XwQQLsmkEMUg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 1/2] go.bbclass: Export GOARM
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
X-List-Received-Date: Fri, 15 Mar 2019 12:48:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, March 15, 2019 12:39:26 AM EDT Khem Raj wrote:
> On Thu, Mar 14, 2019 at 1:05 PM Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > When building GO packages for ARM (v5, v6, v7) it is expected that the
> > GOARM env variable is set during the build. Not having GOARM exported
> > will result in GO binaries which can't be executed on the target
> > (terminate with segfault). Per https://github.com/golang/go/wiki/GoArm
> > 
> > We already have the logic in goarch.bbclass to determine the correct
> > value of GOARM (see GOARM_TARGET), but currently this is only used to
> > build go itself (go-cross_1.*.bb requires go-cross.inc --> export
> > GOARM = "${TARGET_GOARM}").
> > 
> > Here we export GOARM but we do it such that it is only exported if we
> > are building for 'arm' and only when recipes requiring/inheriting
> > go.bbclass are be used to build for the target.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > V2
> > * Avoid potential undefined situations
> > 
> >  meta/classes/go.bbclass | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index af331f8..5af4c3e 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -8,6 +8,10 @@ GOROOT = "${STAGING_LIBDIR}/go"
> > 
> >  export GOROOT
> >  export GOROOT_FINAL = "${libdir}/go"
> > 
> > +GOARM[export] = "0"
> > +GOARM_arm_class-target = "${TARGET_GOARM}"
> > +GOARM_arm_class-target[export] = "1"
> > +
> 
> while this works, I think it would be nicer to handle it for all
> 
> export GOHOSTOS = "${BUILD_GOOS}"
> export GOHOSTARCH = "${BUILD_GOARCH}"
> export GOOS = "${TARGET_GOOS}"
> export GOARCH = "${TARGET_GOARCH}"
> export GOARM = "${TARGET_GOARM}"
> export GO386 = "${TARGET_GO386}"
> export GOMIPS = "${TARGET_GOMIPS}"
> 
> these should all be replicated into bbclass.

I had thought about doing this but was using GOARM as a trial balloon as I had 
a suitable build and testcase handy to sort through any issues. I will come 
back around to these as I get time, if that's OK with folks.

MarkA

> 
> >  DEPENDS_GOLANG_class-target = "virtual/${TUNE_PKGARCH}-go
> >  virtual/${TARGET_PREFIX}go-runtime" DEPENDS_GOLANG_class-native =
> >  "go-native"
> >  DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk
> >  virtual/${TARGET_PREFIX}go-runtime"> 
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core





