Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 476877CB4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:50:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2IHnoi5022702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2019 10:50:00 -0700
Received: from yow-masselst-lx1.localnet (128.224.22.2) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 18 Mar 2019 10:49:39 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Mar 2019 13:49:38 -0400
Message-ID: <5395233.36Y4EdQobu@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <20190318164028.GD1994@jama>
References: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
	<1552922513-21915-2-git-send-email-mark.asselstine@windriver.com>
	<20190318164028.GD1994@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v3][PATCH 2/2] goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()
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
X-List-Received-Date: Mon, 18 Mar 2019 17:50:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, March 18, 2019 12:40:28 PM EDT Martin Jansa wrote:
> On Mon, Mar 18, 2019 at 11:21:53AM -0400, Mark Asselstine wrote:
> > Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> > cross building for ARMv5, ARMv6 and ARMv7. The current approach of
> > using TUNE_FEATURES can be error prone, as we can see today when
> > attempting to build for Cortex-A7 which results in GOARM=''.
> > 
> > Since the value of MACHINEOVERRIDES already consolidates the values of
> > TUNE_FEATURES into something more consistent we can use the overrides
> > mechanism to set GOARM, leaving just a little bit of logic in
> > go_map_arm() to trigger off the arch (basically target vs host)
> > for the setting of GOARM.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > V2
> > * Cover all ARMv7 Cortex* variants
> > 
> > V3
> > * Switch to using MACHINEOVERRIDES/overrides mechanism
> > 
> >  meta/classes/goarch.bbclass | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > index 39fea5e..8fdb443 100644
> > --- a/meta/classes/goarch.bbclass
> > +++ b/meta/classes/goarch.bbclass
> > @@ -3,18 +3,26 @@ BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'),
> > d)}"> 
> >  BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
> >  HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
> >  HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> > 
> > -HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'),
> > d.getVar('TUNE_FEATURES'), d)}" +HOST_GOARM =
> > "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('BASE_GOARM'), d)}"> 
> >  HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'),
> >  d.getVar('TUNE_FEATURES'), d)}" HOST_GOMIPS =
> >  "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> >  HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
> >  TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
> >  TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> > 
> > -TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'),
> > d.getVar('TUNE_FEATURES'), d)}" +TARGET_GOARM =
> > "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('BASE_GOARM'), d)}"> 
> >  TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'),
> >  d.getVar('TUNE_FEATURES'), d)}" TARGET_GOMIPS =
> >  "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
> >  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
> >  GO_BUILD_BINDIR =
> >  "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') ==
> >  d.getVar('HOST_GOTUPLE')]}"> 
> > +# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO via
> > GOARM. +# This is combined with *_ARCH to set HOST_GOARM and
> > TARGET_GOARM. +BASE_GOARM = ''
> > +BASE_GOARM_armv7ve = '7'
> > +BASE_GOARM_armv7a = '7'
> > +BASE_GOARM_armv6 = '6'
> > +BASE_GOARM_armv5 = '5'
> > +
> > 
> >  # Go supports dynamic linking on a limited set of architectures.
> >  # See the supportsDynlink function in
> >  go/src/cmd/compile/internal/gc/main.go GO_DYNLINK = ""
> > 
> > @@ -74,12 +82,7 @@ def go_map_arch(a, d):
> >  def go_map_arm(a, f, d):
> >      import re
> > 
> >      if re.match('arm.*', a):
> > -        if 'armv7' in f:
> > -            return '7'
> > -        elif 'armv6' in f:
> > -            return '6'
> > -        elif 'armv5' in f:
> > -            return '5'
> > +        return f
> > 
> >      return ''
> 
> Is this function still useful? Cannot you set TARGET_GOARM and
> HOST_GOARM with arm override (to simulate the effect of "re.match('arm.*',
> a)")?

No. Attempting to use the override will not result in the same result for 
HOST_GOARM. The overrides will represent the target and not the host. Unless 
you have an implementation to backup your suggestion and I am just not seeing 
it.

MarkA

> 
> Regards,
> 
> >  def go_map_386(a, f, d):





