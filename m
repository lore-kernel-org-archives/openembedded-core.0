Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8rWi-0007ix-BF for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 12:10:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2HB1XFN014527;
	Sat, 17 Mar 2012 11:01:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13325-04; Sat, 17 Mar 2012 11:01:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2HB1Pl4014521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 17 Mar 2012 11:01:27 GMT
Message-ID: <1331982087.18586.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 17 Mar 2012 11:01:27 +0000
In-Reply-To: <1331944203.18586.217.camel@ted>
References: <1331154474-17257-1-git-send-email-obi@opendreambox.org>
	<4F5E3949.7050307@linux.intel.com> <4F5E4CF9.3070104@opendreambox.org>
	<1331944203.18586.217.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][resend] python-native: distutils: don't use libdir, remove dead code path
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
X-List-Received-Date: Sat, 17 Mar 2012 11:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-17 at 00:30 +0000, Richard Purdie wrote:
> On Mon, 2012-03-12 at 20:22 +0100, Andreas Oberritter wrote:
> > On 12.03.2012 18:58, Saul Wold wrote:
> > > On 03/07/2012 01:07 PM, Andreas Oberritter wrote:
> > >> * Coming from OE-classic it was surprising that python-native now
> > >>    requires 'libdir' to be exported. Otherwise autoconf would fail
> > >>    to detect python libraries. This happend using a customized
> > >>    environment setup script to use OE's compiler and libs without
> > >>    bitbake.
> > >> * Use sys.lib instead of libdir's suffix.
> > >> * While at it, simplify redundant if/and-statments.
> > >>
> > >> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> > >> ---
> > >> * This patch hasn't been commented since its first submission
> > >>    on Feb 21st.
> > >> * Original patch URL: http://patches.openembedded.org/patch/21481/
> > >>
> > >>   ...2-distutils-prefix-is-inside-staging-area.patch |   15
> > >> +++++----------
> > >>   1 files changed, 5 insertions(+), 10 deletions(-)
> > >>
> > > This will need a PR bump so the modified patch will be noticed, I know
> > > this patch was put in a while ago.
> > 
> > Right. I'm waiting before resubmitting it. See below.
> > 
> > > I am not so sure about the changes though, I have been meaning to dig
> > > into this, the orignial code looks strange in that it includes
> > > plat_specific in the else clause!  You are also dropping the EXEC_PREFIX
> > 
> > I'm dropping EXEC_PREFIX, because it's dead code.
> > 
> > The code from the original patch can be rewritten as:
> > 
> > if plat_specific:
> > 	if plat_specific:
> > 		prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
> > else:
> > 	if plat_specific:
> > 		prefix = EXEC_PREFIX
> > 	else:
> > 		prefix = PREFIX
> > 
> > Does this make it clear?
> >  
> > > How have you tested this change?
> > 
> > I built from scratch and also runtime tested it, but without multilib. 
> > 
> > As I'm currently investing a different problem in python, digging into
> > python internals, I doubt that sys.lib really contains the correct
> > value for multilib, unless multilib builds have multiple python-natives.
> > 
> > I think it would be better to just drop the last element of STAGING_LIBDIR,
> > i.e.:
> > 
> > if plat_specific:
> > 	prefix = '/'.join(os.environ['STAGING_LIBDIR'].split('/')[:-1])
> > else:
> > 	prefix = PREFIX
> > 
> > Do you think this would be OK?
> 
> Whilst we merged this patch, its now creating all kinds of issues and is
> breaking builds. As a small testcase:
> 
> libdir=2 BUILD_SYS=1 HOST_SYS=2 /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/python -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='foorbar'))"
> Traceback (most recent call last):
>   File "<string>", line 1, in <module>
>   File "/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", line 113, in get_python_lib
>     lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
>   File "/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/UserDict.py", line 23, in __getitem__
>     raise KeyError(key)
> KeyError: 'STAGING_LIBDIR'
> 
> which leads to packaging warnings from xcb-proto's python module
> components due to pythondir not being set to anything. Its looking
> likely I'll have to revert this whilst the impact of that patch is
> better understood.
> 
> Yes, I appreciate you could export STAGING_LIBDIR everywhere but we
> never used to have to do that and I'd really prefer we didn't have to.

I've tracked down what is happening and why I'm getting very confused
over the builds. The proposed automake update changes the python m4
macros in a way which is incompatible with the way we're been using
them. The changes would imply that we'd have to inherit distutils for
every recipe using the python macros since otherwise the exports like
BUILD_SYS and HOST_SYS are not available.

I'm therefore not going to revert this patch but ensure we look into the
automake update to resolve the problems there.

Sorry about the confusion.

Cheers,

Richard




