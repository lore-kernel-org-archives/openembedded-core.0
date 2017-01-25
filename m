Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF0C71E5F
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PCdbbo028047; Wed, 25 Jan 2017 12:39:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CtPc7FMxedMs; Wed, 25 Jan 2017 12:39:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PCdVeH028043
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 12:39:32 GMT
Message-ID: <1485347971.30673.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kristian Amlie <kristian.amlie@mender.io>, OE-core
	<Openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2017 12:39:31 +0000
In-Reply-To: <2c3cfb1f-2a70-5733-07bf-b9c31612a3c3@mender.io>
References: <18981a79-4241-83a1-a1a8-3eddf941c346@mender.io>
	<1485343441.30673.84.camel@linuxfoundation.org>
	<2c3cfb1f-2a70-5733-07bf-b9c31612a3c3@mender.io>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Overriding fixmepath
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
X-List-Received-Date: Wed, 25 Jan 2017 12:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-25 at 13:22 +0100, Kristian Amlie wrote:
> On 25/01/17 12:24, Richard Purdie wrote:
> > 
> > On Wed, 2017-01-25 at 11:43 +0100, Kristian Amlie wrote:
> > Does this still work if you remove the
> > /home/jenkins/workspace/yoctobuild/build-qemu/tmp/sysroots-
> > components/x86_64/go-bootstrap-native directory before building go-
> > cross? I worry that its actually referencing the other location and
> > using files from there (a different recipe's workdir) and that
> > therefore there are a different set of other problems this recipe
> > also
> > has.
> You mean after executing prepare_recipe_sysroot, right? I tried this,
> but it made no difference to my previous results, so presumably it is
> looking in the right place.

Ok, that is good and probably means this should be easier to fix.

> > > Why the path replacement triggers an error I cannot say, but I
> > > suspect it has to do with the fact that Go object files are a bit
> > > special compared to C object files, and this operation in fact
> > > corrupts them. More mysterious still is why this happens only on
> > > some
> > > build machines, and not others, but once triggered it appears to
> > > be
> > > consistently triggered.
> > The fixmepath replacements only happen on text files. It could be
> > some
> > relocation is needed on the binaries too, perhaps through
> > configuration
> > on the commandline or perhaps through the environment. We have had
> > to
> > patch some tools to allow relocation in the past too.
> I see this happening to .a files as well. Aren't they normally object
> files? I have attached the fixmepath file for go-bootstrap-native,
> which
> go-cross uses to build itself.
> 
> Looking at one of the files from there, it has quite peculiar
> contents,
> probably something Go internal which we shouldn't mess with:
> 
>   $ ar t template.a
>   __.PKGDEF
>   _go_.6
> 
> > 
> > > 
> > > Any advice for what to do next? I could try to skip the fixmepath
> > > operation completely, but I'm not sure how, and it feels a bit
> > > like
> > > using a sledgehammer where I should be using a scalpel.
> > Try removing the path I suggested after copying and see if it still
> > works. If it does, I'd probably try and find which subset of the
> > files
> > breaks it, narrow down the issue. If removing it breaks things,
> > there
> > is a whole world of bigger issues :(
> > 
> > Its possible to add specific inclusions/exclusions from fixmepath
> > FWIW
> > but we need to understand more about what is happening first.
> Take a look at the attached file, to me the inclusion of .a files in
> the
> fixmepath file seems wrong, so I can start with that, unless you have
> better idea.

I think this is a very good lead. The code searches for replacements to
make with: "grep -Irl" (see sstate.bbclass) and it looks like its
matching these files and shouldn't. We may need to make sstate.bbclass
look something like:

SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
SSTATE_SCAN_CMD_NATIVE ?= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'

and then:
    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
        d.setVar('SSTATE_SCAN_CMD', '${SSTATE_SCAN_CMD_NATIVE}')

which means you'd be able to override the command being used to exclude
.a files?

Cheers,

Richard

