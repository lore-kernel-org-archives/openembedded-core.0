Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <06508a1bf3fc6e8ea170885eea2fb66de83733bd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] multilib_global.bbclass: fix setting preferred version for canadian recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 02 Mar 2022 11:17:55 +0000
In-Reply-To: <6e10eedc-d789-5189-6c65-1747a1d94665@windriver.com>
References: <20220301081218.25469-1-Qi.Chen@windriver.com>
	 <9ee751152333845c93c411b467090f007d63c9b3.camel@linuxfoundation.org>
	 <6e10eedc-d789-5189-6c65-1747a1d94665@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org, Ross Burton <ross@burtonini.com>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>

On Wed, 2022-03-02 at 09:59 +0800, ChenQi wrote:
> On 3/2/22 08:20, Richard Purdie wrote:
> > On Tue, 2022-03-01 at 16:12 +0800, Chen Qi wrote:
> > > Currently the TRANSLATED_TARGET_ARCH is not changed when trying
> > > to set preferred version for canadian recipes.
> > > 
> > > e.g.
> > > ```
> > > bitbake core-image-minimal -c populate_sdk -e > env
> > > grep ^PREFERRED_VERSION_gcc-cross-canadian env
> > > ```
> > > The result is:
> > > """
> > > PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> > > """
> > > 
> > > We need to explictly change DEFAULTTUNE to ensure TRANSLATED_TARGET_ARCH is
> > > changed when trying to set the preferred version for multilib version of
> > > the canadian recipes.
> > > 
> > > e.g.
> > > ```
> > > bitbake core-image-minimal -c populate_sdk -e > env
> > > grep ^PREFERRED_VERSION_gcc-cross-canadian env
> > > ```
> > > The result is:
> > > """
> > > PREFERRED_VERSION_gcc-cross-canadian-i686="11.%"
> > > PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> > > """
> > > 
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >   meta/classes/multilib_global.bbclass | 3 +++
> > >   1 file changed, 3 insertions(+)
> > This seems to break multilib builds:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844
> > 
> > Cheers,
> > 
> > Richard
> > 
> Hi Richard and Ross,
> 
> I looked at the above failure. It's not caused by this patch. It's 
> caused by the one below.
> 
>    package: do_package should depend on binutils
> 
> I could reproduce this problem by cherry-picking this commit to latest 
> master branch. See detailed console output below.

Sorry, it does look like it is Ross' change and not yours!

Ross: I think yours may also be causing the sstate sigs issue in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3233/steps/14/logs/stdio

Cheers,

Richard

