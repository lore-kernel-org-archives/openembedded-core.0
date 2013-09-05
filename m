Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 79F0F6B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:40:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85BrbGR006184; Thu, 5 Sep 2013 12:53:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ix7fWXIeQHy3; Thu,  5 Sep 2013 12:53:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85BrVt6006175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 12:53:32 +0100
Message-ID: <1378381217.32427.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 05 Sep 2013 12:40:17 +0100
In-Reply-To: <20130828083339.GI3544@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<20130828083339.GI3544@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/4] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Thu, 05 Sep 2013 11:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-28 at 10:33 +0200, Martin Jansa wrote:
> On Sun, Jul 07, 2013 at 01:13:04AM +0200, Martin Jansa wrote:
> > * prepare for reading shlibs providers only from dependency tree of
> >   current recipe
> > 
> > [YOCTO #4628]
> 
> Any comment on this patchset?
> 
> I'm using first 3 commits for some time in world builds and they helped
> me to discover some unexpected shlib providers (and fix them by setting
> PRIVATE_LIBS).

I've run some tests with this and I do like the patches however there
are some issues. Some are minor and easily fixed, some are more
problematic but I'll try and list them:

* Patch 1/4 is missing a () from a funciton. Easily fixed, mentioned 
  for completeness
* In 2/4, I locally removed the continue from the "ignoring xxx" loop 
  since it doesn't make the build any more deterministic, its still a 
  race over which package builds first but it is a change in 
  behaviour. We may decide to change behaviour but that should be a 
  separate patch. Also need to update the message after the change.
* In 3/4, the regexp is not anchored. Libraries places in subdirs of 
  libdir should not match this code, neither should things in /foo/lib. 
  The tweaks below ensure the regexp matches the correct things and 
  avoids modules in ${libdir}/${PN}/. This is correct but gives another 
  problem I'll come back to.
* 4/4 isn't complete. Again I like the idea but we probably need help 
  from bitbake for it. Its the wrong point in the development cycle to 
  start thinking about it.

The problem in 3/4 is clear with something like gstreamer verses
gstreamer1.0. These install into ${libdir}/PN/ so they are safe well
behaved recipes but they trigger spurious warnings with the patch :(. We
can "fix" with:

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 569599c..5fc6cda 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1337,7 +1337,7 @@ python package_do_shlibs() {
             dir = dir[1:]
         if shlibs_search_dirs_re_txt:
             shlibs_search_dirs_re_txt += "|"
-        shlibs_search_dirs_re_txt += "(^.*/%s/.*$)" % dir
+        shlibs_search_dirs_re_txt += "(^/%s/[^/]*$)" % dir
     shlibs_search_dirs_re = re.compile(shlibs_search_dirs_re_txt)
     bb.debug(2, "will use following RE to search for provides sonames %s" % shlibs_search_dirs_re_txt)
 
@@ -1398,12 +1398,13 @@ python package_do_shlibs() {
             if m:
                 this_soname = m.group(1)
                 if not this_soname in sonames:
-                    if shlibs_search_dirs_re.match(file):
+                    targetfile = file.replace(pkgdest + "/" + pkg, "")
+                    if shlibs_search_dirs_re.match(targetfile):
                         # if library is private (only used by package) then do not build shlib for it
                         if not private_libs or -1 == private_libs.find(this_soname):
                             sonames.append(this_soname)
                     else:
-                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, file, shlibs_search_dirs_re_txt))
+                        bb.debug(2, "ignoring soname %s from %s, because path doesn't match %s" % (this_soname, targetfile, shlibs_search_dirs_re_txt))
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
                 if snap_symlinks and (os.path.basename(file) != this_soname):

So this is nice, however the shlibs code doesn't just handle the libs in
the default search path. Its also used when say something in
${libdir}/${PN} links against something else in that directory. Bitbake
looks up the soname and then adds in RDEPENDS on the appropriate
packages. This does assume there is a valid RPATH in the library but
that is usually the case.

So by including this code as it stands, we'd drop a number of
autogenerated RDEPENDS for more unusual libraries in the system outside
of ${libdir}. We can't do that.

So what can we do? When we process shlibs, we need to record the paths
of the things providing given sonames. They're either in the default
search path, or in specific directories. When we then process another
library, we can look at the RPATH it uses and then only match things in
the search paths (default or otherwise).

Sadly, this is fairly major surgery to the shlibs code and at the
current point of the release cycle, not something we can start.

So in summary, I do like the patchset at lot and it is showing up real
problems (emgd conflicting with mesa is something my builds are
currently corrupted with) however I don't think the patches are right
yet and we may need some more involved changes to get them there. I do
think its worth doing but its probably 1.6 material.

Cheers,

Richard



