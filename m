Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8E560851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:35:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 06:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,427,1508828400"; 
   d="scan'208";a="3949770"
Received: from $_hostname.zpn.intel.com (HELO lsandov1-mobl2.zpn.intel.com)
	([10.219.128.134])
	by orsmga007.jf.intel.com with ESMTP; 19 Dec 2017 06:35:40 -0800
Date: Tue, 19 Dec 2017 08:45:14 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20171219084514.4d359635@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <CAJ86T=XEeM364CYatGqTi6K-zJyXkghOg1rMXb4ORQdUDJf=gQ@mail.gmail.com>
References: <20171218174347.92919-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171218174347.92919-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJ86T=XEeM364CYatGqTi6K-zJyXkghOg1rMXb4ORQdUDJf=gQ@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] parallel-oe-selftest.sh: runs oe-selftest in parallel
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
X-List-Received-Date: Tue, 19 Dec 2017 14:35:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Dec 2017 12:26:32 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Dec 18, 2017 at 9:43 AM,
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> >
> > Parallelize oe-selftest execution using GNU/Parallel: for each test
> > defined, a job will be launched and at any time at maximun of jobs will  
> 
> Typo.
> 
> > be executing (defaults to 4).
> >
> > 1. Run all modules
> >
> >     parallel-oe-selftest.sh
> >
> > 2. Run certaing modules and print results in order (see parallel man page for  
> 
> Typo.
> 
> > more info)
> >
> >     parallel-oe-selftest.sh wic bblayers
> >
> > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > ---
> >  scripts/contrib/parallel-oe-selftest.sh | 80 +++++++++++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100755 scripts/contrib/parallel-oe-selftest.sh
> >
> > diff --git a/scripts/contrib/parallel-oe-selftest.sh b/scripts/contrib/parallel-oe-selftest.sh
> > new file mode 100755
> > index 0000000000..b2690f34fd
> > --- /dev/null
> > +++ b/scripts/contrib/parallel-oe-selftest.sh
> > @@ -0,0 +1,80 @@
> > +#!/bin/sh
> > +
> > +# paralell-oe-selftest: executes oe-selftest in 'parallel'. The tests (modules, clases or test methods, same  
> 
> Two typos.
> 
> > +# as oe-selftest --run-tests) to be executed can be piped to this script; if this is not the case, all modules
> > +# are executed
> > +#
> > +# Copyright (c) 2013-2017 Intel Corporation
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License version 2 as
> > +# published by the Free Software Foundation.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License along
> > +# with this program; if not, write to the Free Software Foundation, Inc.,
> > +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > +#
> > +
> > +# Before anything else, check oe-core environment
> > +if [ -z "$BUILDDIR" ]; then
> > +    echo "Please initialize the OE-Core environment through oe-init-build-env script"
> > +    exit 1
> > +fi
> > +
> > +usage() {
> > +CMD=$(basename $0)
> > +cat <<EOM
> > +Usage: $CMD [-h] [-j jobs] [test1 test2 ..]
> > +  -j jobs             Number of jobs to be running concurrently
> > +  -h                  Display this help message
> > +
> > + Examples:
> > +   # run all found testcases
> > +   $CMD
> > +
> > +   # just run wic and bblayers
> > +   $CMD wic bblayers
> > +
> > +EOM
> > +}
> > +
> > +JOBS=4
> > +# Parse and validate arguments
> > +while getopts "hj:" OPT; do
> > +       case $OPT in
> > +       j)
> > +               JOBS="$OPTARG"
> > +               ;;
> > +       h)
> > +               usage
> > +               exit 0
> > +               ;;
> > +       --)
> > +               shift
> > +               break
> > +               ;;
> > +       esac
> > +done
> > +
> > +
> > +shift "$((OPTIND - 1))"
> > +TESTCASES="$@"
> > +
> > +# Parallelization is done through GNU/Paralell, so it must be present in host machine  
> 
> Typo.
> 
> > +which parallel 2>&1 >/dev/null || { echo "Please install GNU/Parallel"; exit 1; }
> > +
> > +# no test cases given, running all found
> > +if [ -z "$TESTCASES" ]; then
> > +    TESTCASES="$(oe-selftest -m | awk '{ print $NF } ' | grep -v ':')"
> > +fi
> > +
> > +if [ -z "$TESTCASES" ]; then
> > +    echo $TESTCASES | time parallel --keep-order --progress --jobs $JOBS oe-selftest -r  
> 
> Since $TESTCASES is an empty variable here, why echo it?

you are right. Sending a v3. also, I will enable my flyspell-mode in emacs!

Leo

> 
> > +else
> > +    time parallel -d ' ' --keep-order --progress --jobs $JOBS oe-selftest -r ::: $TESTCASES
> > +fi
> > --
> > 2.12.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core  

