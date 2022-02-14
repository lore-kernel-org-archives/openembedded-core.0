Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <eed52e0d2088af59342bbe761c694ab7af19694d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add COMMON_LICENSE_DIR to BB_HASHEXCLUDE_COMMON
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 14 Feb 2022 10:32:07 +0000
In-Reply-To: <0067cca67f2541aaa5522c52fce70660@axis.com>
References: <20220213203454.28551-1-pkj@axis.com>
	 <587c1931ebdcc8db37e4cef079130e5c64be6471.camel@linuxfoundation.org>
	 <0067cca67f2541aaa5522c52fce70660@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Sun, 2022-02-13 at 22:36 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 13 februari 2022 22:44
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] bitbake.conf: Add COMMON_LICENSE_DIR to
> > BB_HASHEXCLUDE_COMMON
> > 
> > On Sun, 2022-02-13 at 21:34 +0100, Peter Kjellerstedt wrote:
> > > Differences in COMMON_LICENSE_DIR should not affect the task hashes.
> > > 
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index fba99e8f0c..47c8cb39f9 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -922,7 +922,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD
> > > BB_TASKHASH BBPATH BBSERVER DL_DI
> > >      BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot
> > > DEPLOY_DIR \
> > >      SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
> > >      SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE
> > > GIT_CEILING_DIRECTORIES \
> > > -    OMP_NUM_THREADS BB_CURRENTTASK"
> > > +    OMP_NUM_THREADS BB_CURRENTTASK COMMON_LICENSE_DIR"
> > >  BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS
> > > BUILDHISTORY_DIR \
> > >      SSTATE_DIR SOURCE_DATE_EPOCH"
> > >  BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME
> > > SSH_AGENT_PID \
> > 
> > I think this has been discussed before and I'm very uneasy at the idea. Some
> > users would expect that if they add "their" version of a license in a layer
> > with
> > higher priority, they'd expect the hashes to change.
> 
> If the value was a relative path I could buy that, but not for an 
> absolute path.

True, however my concern is more that if you're changing this you are changing
the configuration and you'd expect the hashes to change as a result. Adding it
to the exclusion list hides that.

> > Where is this causing an issue?
> 
> Due to the huge number of licenses in meta/files/common-licenses after 
> all SPDX licenses were added, we cannot use that directory anymore as 
> it triples the recipe parsing time for us (since we define 
> INCOMPATIBLE LICENSE as AVAILABLE_LICENSES minus COMPATIBLE_LICENSES, 
> and the license code doesn't really handle having many hundreds of 
> licenses in INCOMPATIBLE LICENSE). Thus as a workaround I have had to 
> create a common-licenses directory in one of our layers which only has 
> symbolic links to the licenses in meta that we need. Then we set:
> 
> COMMON_LICENSE_DIR := "${LAYERDIR}/files/common-licenses"
> 
> in that layer's layer.conf, but since ${LAYERDIR} varies from build host 
> to build host, our whole global sstate was now only useable on the build 
> servers and not for local developer builds.

So shouldn't you just add COMMON_LICENSE_DIR to BB_HASHEXCLUDE_COMMON in your
config?

Cheers,

Richard


