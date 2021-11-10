Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f815b01f00eb3271ea947442cd6837fa27cefb3f.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial recipe for repo 2.17.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Nov 2021 12:46:48 +0000
In-Reply-To: <3101a847508371b09b2949434f9ca09c672a7097.camel@iris-sensing.com>
References: <20211105133104.19895-1-jasper@fancydomain.eu>
	 <AM9PR09MB4642AA3727D430C698E95EE5A88E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <b8897c8a436f384ef0a41d708816c2f61f9e22c7.camel@iris-sensing.com>
	 <d87ff011218f55d97e5aa48ff9b06d216f6d477a.camel@iris-sensing.com>
	 <029d18fa589265e32476c7cc45c9977f7b4bb9aa.camel@linuxfoundation.org>
	 <3101a847508371b09b2949434f9ca09c672a7097.camel@iris-sensing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "kweihmann@outlook.com" <kweihmann@outlook.com>, "jasper@fancydomain.eu" <jasper@fancydomain.eu>
Cc: "martin@mko.dev" <martin@mko.dev>, "Daniel.Baumgart@iris-sensing.net" <Daniel.Baumgart@iris-sensing.net>, "bitbake-devel@lists.openembedded.org" <bitbake-devel@lists.openembedded.org>

On Tue, 2021-11-09 at 11:26 +0000, Jasper Orschulko wrote:
> 
> 
> > e) fetcher output is deterministic
> >  (i.e. if you fetch configuration XXX now it will match in future
> > exactly in 
> >  a clean build with a new DL_DIR)
> 
> check. When a fixed refspec is set within the recipe, the fetcher will
> check, if all repositories in the repo manifest are set to a fixed
> refspec as well and otherwise throw an error.

When you say "fixed refspec", will that be a definitive sha revision or a tag?
We always force resolution of tags as they tend to cause problems and can change
even if it is bad form.

> > f) network access is expected to work with the standard linux proxy
> > variables
> >  environment but only in the do_fetch tasks)
> 
> this should work, as we keep the GIT_PROXY_COMMAND environment and run
> repo via runfetchcmd(). Not further tested though.

If you're using runfetchcmd that should work.

> 
> > g) access during parsing has to be minimal, a "git ls-remote" for an
> > AUTOREV 
> >  git recipe might be ok but you can't expect to checkout a git tree
> 
> unfortunately, do to the nature of repo, we need to clone the manifest
> repo, so that we can run "git ls-remote" on the referenced git repos
> and therefore ensure that 

This is potentially a big issue. Cloning operations during parsing is pretty
horrible. We'd not expect any thing being written out like that during a parse.
It would probably work "ok" for one recipe but if you start getting the hundreds
of git recipes we have in some layers, it wouldn't scale if we allowed that :(.

Not sure what to recommend here but it is definitely problematic.

> 
Cheers,

Richard


