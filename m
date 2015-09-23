Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED3CC76903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 16:05:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2015 09:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="775392922"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.127])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2015 09:04:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Sep 2015 17:04:34 +0100
Message-ID: <1794995.XFMYy99IqN@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CABcZANnYmSQeh9YtOs+4k6XmiybG+5dLW+8HRpQX8mnTh-s96A@mail.gmail.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
	<4f3ba0dba496671c2d229be52debce6ab01a6b71.1443002672.git.paul.eggleton@linux.intel.com>
	<CABcZANnYmSQeh9YtOs+4k6XmiybG+5dLW+8HRpQX8mnTh-s96A@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] devtool: second fix for running from a different directory
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
X-List-Received-Date: Wed, 23 Sep 2015 16:05:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 23 September 2015 08:09:37 Christopher Larson wrote:
> On Wed, Sep 23, 2015 at 3:05 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > -def setup_tinfoil(config_only=False):
> > 
> > +def setup_tinfoil(config_only=False, basepath=None):
> >      """Initialize tinfoil api from bitbake"""
> >      import scriptpath
> > 
> > +    orig_cwd = os.path.abspath(os.curdir)
> > +    if basepath:
> > +        os.chdir(basepath)
> > 
> >      bitbakepath = scriptpath.add_bitbake_lib_path()
> >      
> >      if not bitbakepath:
> >          logger.error("Unable to find bitbake by searching parent
> > 
> > directory of this script or PATH")
> > 
> > @@ -108,6 +111,7 @@ def setup_tinfoil(config_only=False):
> >      tinfoil = bb.tinfoil.Tinfoil()
> >      tinfoil.prepare(config_only)
> >      tinfoil.logger.setLevel(logger.getEffectiveLevel())
> > 
> > +    os.chdir(orig_cwd)
> > 
> >      return tinfoil
> 
> Just from a correctness standpoint, this will not go back to orig_cwd if an
> exception is raised. We should be using a try/finally block for things like
> this.

That is a good point yes. I can send out a v3.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

