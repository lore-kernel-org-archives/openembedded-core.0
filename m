Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C79760190
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:22:20 +0000 (UTC)
Received: from hex ([192.168.3.46]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w729M46E023167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 2 Aug 2018 10:22:16 +0100
Message-ID: <92e7e92ca488e452bfa185d1f9b4747f3dcb5a94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, Alejandro Enedino Hernandez
	Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <257beb90-8a7d-2310-9c0e-ea18466fe1a6@intel.com>
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
	<12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
	<257beb90-8a7d-2310-9c0e-ea18466fe1a6@intel.com>
Date: Thu, 02 Aug 2018 09:53:12 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.28.1-2 
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 09:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-02 at 10:55 +0800, Anuj Mittal wrote:
> On 08/02/2018 07:30 AM, Alejandro Enedino Hernandez Samaniego wrote:
> > Hey Anuj,
> > 
> > 
> > On 08/01/2018 04:25 AM, Anuj Mittal wrote:
> > > On 07/31/2018 05:21 AM, Jaewon Lee wrote:
> > > > When using a recipe space kernel-meta, scc files are added
> > > > through
> > > > SRC_URI, but they may include corresponding kernel fragments
> > > > that are
> > > > not necessarily in SRC_URI.
> > > > 
> > > > For bitbake, this is not a problem because the kernel-yocto
> > > > class adds
> > > > the path where the .scc file was found to includes which
> > > > consequentially
> > > > makes the .cfg file available to the kernel build.
> > > > 
> > > > However, when using devtool, only files specified in SRC_URI
> > > > are copied
> > > > to oe-local-files in devtool's workspace. So if the cfg file is
> > > > not in
> > > > SRC_URI, it won't be copied, causing a kernel build failure
> > > > when trying
> > > > to find it.
> > > > 
> > > > This fix parses local .scc files in SRC_URI, copies the
> > > > corresponding .cfg
> > > > file to devtool's workdir, and also adds it to local_files so
> > > > it is
> > > > available when doing a devtool build for the kernel.
> > > > 
> > > > [YOCTO #12858]
> > > > 
> > > > Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> > > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@
> > > > xilinx.com>
> > > > ---
> > > >   meta/classes/devtool-source.bbclass | 12 ++++++++++++
> > > >   1 file changed, 12 insertions(+)
> > > > 
> > > > diff --git a/meta/classes/devtool-source.bbclass
> > > > b/meta/classes/devtool-source.bbclass
> > > > index 56882a4..c70fea2 100644
> > > > --- a/meta/classes/devtool-source.bbclass
> > > > +++ b/meta/classes/devtool-source.bbclass
> > > > @@ -90,11 +90,23 @@ python devtool_post_unpack() {
> > > >                           fname in files])
> > > >           return ret
> > > >   
> > > > +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto',
> > > > d)
> > > >       # Move local source files into separate subdir
> > > >       recipe_patches = [os.path.basename(patch) for patch in
> > > >                           oe.recipeutils.get_recipe_patches(d)]
> > > >       local_files = oe.recipeutils.get_recipe_local_files(d)
> > > >   
> > > > +    if is_kernel_yocto:
> > > > +      for key in local_files.copy():
> > > > +        if key.endswith('scc'):
> > > > +          sccfile = open(local_files[key], 'r')
> > > > +          for l in sccfile:
> > > > +            line = l.split()
> > > > +            if line and line[0] == 'kconf' and line[-
> > > > 1].endswith('.cfg'):
> > > > +              local_files[line[-1]] =
> > > > os.path.join(os.path.dirname(local_files[key]), line[-1])
> > > > +              shutil.copy2(os.path.join(os.path.dirname(local_
> > > > files[key]), line[-1]), workdir)
> > > > +          sccfile.close()
> > > > +
> > > 
> > > Would the patches included in these .scc files also need to be
> > > handled
> > > in the same way? Would this also work if there are other scc
> > > files
> > > included in a scc file?
> > 
> > Yes, I believe that the same mechanism should be used for patch
> > files as 
> > well,
> > basically anything that may be needed to build but that its not
> > necessarily
> > explicitly listed on SRC_URI.
> > 
> > I believe it will work for other scc files and it doesnt have to
> > be 
> > recursive,
> > because while cfg files arent required to be in SRC_URI , scc files
> > ARE 
> > required
> > to be SRC_URI, which means that this will eventually find the other
> > scc 
> > file on the list
> 
> I don't think they are required to be specified except for the top
> level
> one. At least, when I test it, I see problems. kernel-tools spp
> script
> parses them recursively and looks for a nested scc even if it is not
> specified as part of SRC_URI. That is how the top level sccs from
> kernel-cache are parsed too. Can you give it a try please?

What would be really great here would be some test cases in the qa
framework! It'd be a good way to both illustrate the problems and then
test we've fixed it and that it stays fixed.

Cheers,

Richard


