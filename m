Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 749F8607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 21:41:44 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1a6mUX-0004Q8-Tt; Wed, 09 Dec 2015 22:41:42 +0100
Message-ID: <1449697295.2002.37.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: akuster <akuster@mvista.com>
Date: Wed, 09 Dec 2015 21:41:35 +0000
In-Reply-To: <566891A3.4040300@mvista.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-2-git-send-email-akuster808@gmail.com>
	<56670658.3070109@gmail.com> <1449597115.1472.179.camel@pbcl.net>
	<56674604.3030900@mvista.com> <1449614049.2002.11.camel@pbcl.net>
	<566891A3.4040300@mvista.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ldconfig: add method to extend ldconfig search dirs
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
X-List-Received-Date: Wed, 09 Dec 2015 21:41:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-12-09 at 12:40 -0800, akuster wrote:
> On 12/08/2015 02:34 PM, Phil Blundell wrote:
> > On Tue, 2015-12-08 at 13:05 -0800, akuster wrote:
> >> This is for ldconfig-native. The homebrew OE created. It has hard coded
> >> search patches. So OE only supports the standard /usr/* /lib* paths in
> >> the native part of the build.
> > 
> > In that case, given that you're talking about image construction, isn't
> > the right thing to make ldconfig-native respect whatever search paths
> > it's given by /etc/ld.so.conf in the image filesystem?
> 
> I am most likely missing something really simple here. This is more
> about solving a problem than the fix I submitted. How would you solve
> this issue?

Well, I suspect I'm not understanding the whole problem.  But here's my
view.

Firstly, it's not entirely obvious to me that individual recipes have
any business fiddling with the shared library search paths in the first
place.  If they want to install their own libraries somewhere odd,
that's what rpath is for.  But of course, if the distro wants to add
something to the library search path then it is entitled to do so.

Secondly, ldconfig is only a performance optimisation (or pessimisation,
depending on your point of view) and the system ought to work correctly
without it.  Your proposed patch seems like it will not work if ldconfig
is not in use, because the ld.so.conf generation is conditioned on
USE_LDCONFIG.

Thirdly, on systems which do have ldconfig the user might re-run it on
the target at any time.  This means that you can't rely on the output
from ldconfig-native remaining intact forever: instead, the directories
with libraries in them need to be mentioned in the
image's /etc/ld.so.conf, either directly or indirectly.  The most
scalable way to do that is for the distro to put a line in that file
that reads "include /etc/ld.so.conf.d/*.conf" or some such, and then
individual recipes can just drop their own files into /etc/ld.so.conf.d.
But if individual distros want to just ship a static ld.so.conf file
then that ought to be fine as well. 

Fourthly, if we do accept that random packages can modify the search
path, whatever mechanism is used to deal with this needs also to work
for runtime package management.  Anything that relies on creating
ld.so.conf statically during image creation may not going to be
sufficient in the general case, otherwise packages that put libraries in
odd places will be unusable if installed afterwards.

Fifthly, given the above, there oughtn't to be any need for a separate
mechanism to tell ldconfig-native what paths to search: it should just
read the same /etc/ld.so.conf in the image (and things included from it)
as ldconfig will read at run time.  If it isn't doing that then I would
argue this is just a bug and ought to be fixed there.

Sixthly, whatever we do ought to be deterministic.  Your proposed patch
looks like it will hoover up everything from STAGING_LDSO_CONF_DIR and
put it in the image, irrespective of whether the package that created
any particular file in STAGING_LDSO_CONF_DIR is actually being installed
in the current image or not.  That is, if I do:

$ rm -rf tmp-glibc
$ bitbake core-image
$ bitbake opie-image
$ bitbake core-image

then I would expect the two core-image outputs to be the same, even
though some opie packages might have inveigled themselves into
STAGING_LDSO_CONF_DIR in the meantime.

So in summary I think we need to either:

a) accept that arbitrary recipes can modify the ld.so search path and
figure out a way to make that work correctly in all situations; or

b) decide that the ld.so search path is basically a piece of static
image configuration, in which case all we need is a variable that the
distro or image can set and that image.bbclass will write
into /etc/ld.so.conf.  In this situation there is no need for a new
class or a folder inside the staging area.

Maybe it'd help if you could provide a couple of concrete examples of
the real problem that you're trying to solve.

p.



