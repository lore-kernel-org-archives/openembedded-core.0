Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 52B3D6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 22:52:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2016 15:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,417,1473145200"; d="scan'208";a="885252771"
Received: from ramanand-mobl.amr.corp.intel.com (HELO
	mescala-mobl5.amr.corp.intel.com) ([10.255.230.82])
	by orsmga003.jf.intel.com with ESMTP; 29 Sep 2016 15:52:24 -0700
Date: Thu, 29 Sep 2016 15:52:24 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20160929225224.GA45542@mescala-mobl5.amr.corp.intel.com>
References: <20160929213405.27018-1-stephano.cetola@linux.intel.com>
	<20160929213405.27018-3-stephano.cetola@linux.intel.com>
	<CABcZANnQTPjvEXnbbPwU1aF57m9oibeVu6BBxtKpu=NL1DH9xA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnQTPjvEXnbbPwU1aF57m9oibeVu6BBxtKpu=NL1DH9xA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] utils.py: gut python 2 commands in favor of subprocess.run
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
X-List-Received-Date: Thu, 29 Sep 2016 22:52:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 09/29, Christopher Larson wrote:
> On Thu, Sep 29, 2016 at 2:34 PM, Stephano Cetola <
> stephano.cetola@linux.intel.com> wrote:
> 
> > getstatusoutput is a wrapper around subprocess.getstatusouput() in
> > Py3, which is basically deprecated and behaves almost entirely unlike
> > run().
> >
> > [ YOCTO #9342 ]
> >
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  meta/lib/oe/utils.py | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > index d6545b1..265f733 100644
> > --- a/meta/lib/oe/utils.py
> > +++ b/meta/lib/oe/utils.py
> > @@ -1,9 +1,4 @@
> > -try:
> > -    # Python 2
> > -    import commands as cmdstatus
> > -except ImportError:
> > -    # Python 3
> > -    import subprocess as cmdstatus
> > +import subprocess
> >
> >  def read_file(filename):
> >      try:
> > @@ -144,7 +139,9 @@ def packages_filter_out_system(d):
> >      return pkgs
> >
> >  def getstatusoutput(cmd):
> > -    return cmdstatus.getstatusoutput(cmd)
> > +    compproc = subprocess.run(cmd, stdout=subprocess.PIPE,
> > +            universal_newlines=True, stderr=subprocess.STDOUT, shell=True)
> > +    return (compproc.returncode, compproc.stdout)
> >
> 
> This is wrong, we can’t use subprocess.run until we bump our minimum python
> version. We only require 3.4, not 3.5.

Removed this and resubmitted.

--stephano

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

