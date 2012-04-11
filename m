Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHwKb-0000bK-Rs for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:07:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBw7HT007847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:58:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07356-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:58:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BBvxHR007839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:58:00 +0100
Message-ID: <1334145478.10826.171.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 12:57:58 +0100
In-Reply-To: <CAK18fxGMGA0Q=k4r27JjB2_wButvJWPDHjxEJtrYs7pN=oXvGg@mail.gmail.com>
References: <cover.1333720467.git.andrei@gherzan.ro>
	<4803097570d9e27eb3931388eb76fe6d3d00591a.1333720467.git.andrei@gherzan.ro>
	<1334048565.6861.1.camel@ted>
	<CAK18fxGMGA0Q=k4r27JjB2_wButvJWPDHjxEJtrYs7pN=oXvGg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] package.bbclass: needs_ldconfig from linux_so is needed in global namespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 12:07:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 18:34 +0300, Andrei Gherzan wrote:
> On Tue, Apr 10, 2012 at 12:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Fri, 2012-04-06 at 16:57 +0300, Andrei Gherzan wrote:
>         > "The suite of statements in a function definition executes
>         with a local namespace
>         > that is different from the global namespace. This means that
>         all variables created
>         > within a function are local to that function. When the suite
>         finishes, these
>         > working variables are discarded."
>         >
>         > In this way the needs_ldconfig variable in linux_so never
>         gets True in the statements
>         > below this function. As global statement is generally
>         discouraged, a return value
>         > would be a clean and fast way to solve this issue.
>         >
>         > [YOCTO #2205]
>         >
>         > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>         > ---
>         >  meta/classes/package.bbclass |    4 +++-
>         >  1 files changed, 3 insertions(+), 1 deletions(-)
>         >
>         > diff --git a/meta/classes/package.bbclass
>         b/meta/classes/package.bbclass
>         > index d35667a..c98e8fa 100644
>         > --- a/meta/classes/package.bbclass
>         > +++ b/meta/classes/package.bbclass
>         > @@ -1263,6 +1263,7 @@ python package_do_shlibs() {
>         >       lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
>         >
>         >       def linux_so(root, path, file):
>         > +             needs_ldconfig = False
>         >               cmd = d.getVar('OBJDUMP', True) + " -p " +
>         pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
>         >               cmd = "PATH=\"%s\" %s" % (d.getVar('PATH',
>         True), cmd)
>         >               fd = os.popen(cmd)
>         > @@ -1283,6 +1284,7 @@ python package_do_shlibs() {
>         >                                       needs_ldconfig = True
>         >                               if snap_symlinks and (file !=
>         this_soname):
>         >
>         renames.append((os.path.join(root, file), os.path.join(root,
>         this_soname)))
>         > +             return needs_ldconfig
>         >
>         >       def darwin_so(root, path, file):
>         >               fullpath = os.path.join(root, file)
>         > @@ -1382,7 +1384,7 @@ python package_do_shlibs() {
>         >                               if targetos == "darwin" or
>         targetos == "darwin8":
>         >                                       darwin_so(root, dirs,
>         file)
>         >                               elif os.access(path, os.X_OK)
>         or lib_re.match(file):
>         > -                                     linux_so(root, dirs,
>         file)
>         > +                                     needs_ldconfig =
>         linux_so(root, dirs, file)
>         
>         
>         Shouldn't this be something like:
>         
>         ldconfig = linux_so(root, dirs, file)
>         needs_ldconfig = needs_ldconfig or ldconfig
>         
>         or can this only get called once?
>         
>  
> As i recall this is called once but if you want i can amend with your
> hint.

I've checked and it is called multiple times as I suspected. It needs
the fix I described. I've gone ahead, tweaked and merged this I'd like
this fixed in the release.

Cheers,

Richard




