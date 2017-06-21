Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDFE719A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 14:51:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 21 Jun 2017 07:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,369,1493708400"; d="scan'208";a="870300409"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2017 07:51:55 -0700
Message-ID: <1498057264.31575.22.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 10:01:04 -0500
In-Reply-To: <CAHiDW_F6Q9aNgRz5=HntGAMJQNLiMURUDW=ym=FojmTErA30zw@mail.gmail.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAHiDW_F6Q9aNgRz5=HntGAMJQNLiMURUDW=ym=FojmTErA30zw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Wed, 21 Jun 2017 14:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-21 at 13:56 +0300, Jussi Kukkonen wrote:
> On 19 June 2017 at 17:39, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
> >
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> >
> > Do not mix the stderr into stdout, allowing test cases to query
> > the specific output.
> 
> I wonder if this patch could be related to the strange selftest
> failures where command output seems to be missing completely, e.g.
>     AssertionError: '' != 'ERROR: Unable to find any package producing
> path /not/exist'
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/349/steps/Running%20oe-selftest/logs/stdio


I double check this series on local AB and I saw green in all tests, so
I am not sure what is going on.

This patch basically separates stdout and stderr, so now tests look into
stderr for errors instead of stdout.

Leo

> 
> Jussi
> 
> >
> > [YOCTO #9693]
> >
> > Signed-off-by: Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com>
> > ---
> >  meta/lib/oeqa/utils/commands.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/utils/commands.py
> b/meta/lib/oeqa/utils/commands.py
> > index 57286fcb10..4ef0e874ff 100644
> > --- a/meta/lib/oeqa/utils/commands.py
> > +++ b/meta/lib/oeqa/utils/commands.py
> > @@ -29,7 +29,7 @@ class Command(object):
> >
> >          self.defaultopts = {
> >              "stdout": subprocess.PIPE,
> > -            "stderr": subprocess.STDOUT,
> > +            "stderr": subprocess.PIPE,
> >              "stdin": None,
> >              "shell": False,
> >              "bufsize": -1,
> > --
> > 2.12.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



