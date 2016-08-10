Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F0C1A77139;
	Wed, 10 Aug 2016 10:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7AAgaUV029934; Wed, 10 Aug 2016 11:42:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WKiw0qc5wNiX; Wed, 10 Aug 2016 11:42:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7AAgYgU029931
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Aug 2016 11:42:35 +0100
Message-ID: <1470825754.18638.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org, "Maxin B. John"
	<maxin.john@intel.com>
Date: Wed, 10 Aug 2016 11:42:34 +0100
In-Reply-To: <20160810095921.fzwuugxh525z5e4u@jama>
References: <20160810094725.20395.91512@opal.openembedded.org>
	<20160810094727.589E850200@opal.openembedded.org>
	<20160810095921.fzwuugxh525z5e4u@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/51: piglit: fix build failure with gold linker
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
X-List-Received-Date: Wed, 10 Aug 2016 10:42:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-10 at 11:59 +0200, Martin Jansa wrote:
> On Wed, Aug 10, 2016 at 09:47:26AM +0000, git@git.openembedded.org wr
> ote:
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> > 
> > commit 79005ff905f8c82a8766af5a927b9a0f8929e24f
> > Author: Maxin B. John <maxin.john@intel.com>
> > AuthorDate: Mon Aug 1 18:34:49 2016 +0300
> > 
> >     piglit: fix build failure with gold linker
> >     
> >     When we use gold linker while DISTRO set to "nodistro", piglit
> > build
> >     fails with the following error:
> >     
> >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > reference to
> >     'dlsym'
> >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > reference to
> >     'dlerror'
> >     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined
> > reference to
> >     'dlopen'
> >     | collect2: error: ld returned 1 exit status
> >     
> >     Fix it by providing '-ldl' to LDFLAGS.
> >     
> >     [YOCTO #9851]
> >     
> >     Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-graphics/piglit/piglit_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> > b/meta/recipes-graphics/piglit/piglit_git.bb
> > index 811f7af..df90c4d 100644
> > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > @@ -30,6 +30,8 @@ do_compile[dirs] =+ "${B}/temp/"
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,
> > -DPIGLIT_USE_GLUT=0,freeglut,"
> >  
> > +LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is
> > -gold', '-ldl', '', d)}"
> 
> There was request to fix it properly in piglit code, why was this
> version merged instead?

Accidentally. It made it into mut and I'd assumed this was a v2. Sadly
I don't keep all patch context in my head. I can revert it.

Cheers,

Richard

