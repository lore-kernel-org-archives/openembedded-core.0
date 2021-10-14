X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Thu, 14 Oct 2021 17:51:43 +0100
From: "Mike Crowe" <mac@mcrowe.com>
Subject: Re: [OE-core] Installing licence files for static/header-only libraries into images
Message-ID: <YWhgH+IBiNYPBZ1P@mcrowe.com>
References: <YWbn1yCqxTGskn+s@mcrowe.com>
 <CAMKF1soqvKJyAcTykqAfP1aYtXsPq6FtFo6cUo-mi2-OSqcESg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soqvKJyAcTykqAfP1aYtXsPq6FtFo6cUo-mi2-OSqcESg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

On Wednesday 13 October 2021 at 13:32:03 -0700, Khem Raj wrote:
> On Wed, Oct 13, 2021 at 7:06 AM Mike Crowe via lists.openembedded.org <mac=
> mcrowe.com@lists.openembedded.org> wrote:
> 
> > We're using:
> >
> >  EXTRA_IMAGE_FEATURES += "lic-pkgs"
> >
> > to install the corresponding licence packages for all the packages
> > installed in our image. This works very well for binaries and dynamic
> > libraries. However, I've recently noticed that it doesn't install licence
> > files for any static or header-only libraries used during the build.
> >
> > The corresponding -lic packages are built for such packages, but nothing
> > causes them to be installed since they are not runtime dependencies of
> > anything that is installed.
> >
> > I thought that I could solve this problem by something like:
> >
> > def lic_deps(d):
> >     deps = []
> >     for f in d.getVar('DEPENDS').split():
> >         if not f.endswith("-native") and not f.startswith("virtual/"):
> >             deps.append(f + "-lic")
> >     return ' '.join(deps)
> 
> 
> It will work but in some cases it will be do more than what’s needed
> Build time dependencies are not necessarily also runtime dependencies eg it
> could be using a tool from that package during build

Yes. I was attempting to avoid that to a certain extent by excluding
-native packages.

> > RDEPENDS_${PN}-lic += "${@lic_deps(d)}"
> >
> > but this fails for recipes that use PROVIDES or other shenanigans which
> > means that just appending -lic to whatever is in DEPENDS is insufficient.
> >
> > For the time being I can add the required packages by hand, but this is
> > brittle in the longer term.
> >
> > Is there a better way to solve this problem?

The deficiencies in this solution made me hope that there was a better one.
It doesn't sound like there is. :(

Thanks.

Mike.
