Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B21FB71A84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 22:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u95MF9mk011418; Wed, 5 Oct 2016 23:15:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kFlM-Ed4vhHq; Wed,  5 Oct 2016 23:15:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u95MF7jt011411
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 5 Oct 2016 23:15:08 +0100
Message-ID: <1475705707.30475.498.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ulf Magnusson <ulfalizer@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2016 23:15:07 +0100
In-Reply-To: <CAFkk2KQHNzLOTfMPf_-V+a+2W1Rp81t7VmbstpsOJq=hXYH3PQ@mail.gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
	<1475290031-20568-23-git-send-email-ulfalizer@gmail.com>
	<CAFkk2KQHNzLOTfMPf_-V+a+2W1Rp81t7VmbstpsOJq=hXYH3PQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 22/22] cmake: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Wed, 05 Oct 2016 22:15:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-10-05 at 22:26 +0200, Ulf Magnusson wrote:
> On Sat, Oct 1, 2016 at 4:47 AM, Ulf Magnusson <ulfalizer@gmail.com>
> wrote:
> > 
> > This sets a good example and avoids unnecessarily contributing to
> > perceived complexity and cargo culting.
> > 
> > Motivating quote below:
> > 
> > < kergoth> the *original* intent was for the function/task to error
> > via
> >            whatever appropriate means, bb.fatal, whatever, and
> >            funcfailed was what you'd catch if you were calling
> >            exec_func/exec_task. that is, it's what those functions
> >            raise, not what metadata functions should be raising
> > < kergoth> it didn't end up being used that way
> > < kergoth> but there's really never a reason to raise it yourself
> > 
> > FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
> > argument, which also shows that the original purpose got lost.
> > 
> > Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake_3.6.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> > b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> > index 67ba9c4..850d6de 100644
> > --- a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> > +++ b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
> > @@ -14,7 +14,7 @@ python () {
> >      docdir=d.getVar("docdir", True)
> > 
> >      if not docdir.startswith(prefix):
> > -        raise bb.build.FuncFailed('docdir must contain prefix as
> > its prefix')
> > +        bb.fatal('docdir must contain prefix as its prefix')
> > 
> >      docdir_stripped = docdir[len(prefix):]
> >      if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
> > --
> > 2.7.4
> > 
> Thanks for merging these!
> 
> There's now some documentation that mentions FuncFailed as well:
> https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-use
> r-manual.html#bitbake-style-python-functions-versus-python-functions

It did break one of the tests in oe-selftest but we've fixed that...

Cheers,

Richard

