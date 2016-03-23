Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C26306B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:46:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 23 Mar 2016 14:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="917487001"
Received: from bitbang.jf.intel.com (HELO [10.7.199.89]) ([10.7.199.89])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 14:46:12 -0700
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1458779522-3127-1-git-send-email-humberto.ibarra.lopez@intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <56F30EA4.8040207@linux.intel.com>
Date: Wed, 23 Mar 2016 14:46:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458779522-3127-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: Re: [PATCH] scripts:/oe-selftest: Use timestamp instead of test names in coverage data file
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
X-List-Received-Date: Wed, 23 Mar 2016 21:46:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2016 05:32 PM, Humberto Ibarra wrote:
> This fixes the problem by changing the name to the coverage data file,
> using the timestamp as an identifier.

Fixes what problem?

>
> The name for the coverage data file is constructed based on the tests
> ran; this has created a couple of issues so far, affecting coverage report.
>
> If --run-tests-by option is given, the data file name won't have any
> identifier, causing following runs to overwrite themselves. On the
> other hand, if too many tests are given, the file name exceeds linux
> limits and fails to store the coverage data all together.
>
> [Yocto #9253]
>
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> ---
>   scripts/oe-selftest | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> index d18348d..9b61bfa 100755
> --- a/scripts/oe-selftest
> +++ b/scripts/oe-selftest
> @@ -364,16 +364,21 @@ def list_tags():
>
>       print 'Tags:\t%s' % ', '.join(str(x) for x in tags)
>
> -def coverage_setup(run_tests, run_all_tests, coverage_source, coverage_include, coverage_omit):
> +def coverage_setup(coverage_source, coverage_include, coverage_omit):
>       """ Set up the coverage measurement for the testcases to be run """
> +    import datetime
> +    import subprocess
>       builddir = os.environ.get("BUILDDIR")
> +    pokydir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
> +    curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"])
>       coveragerc = "%s/.coveragerc" % builddir
>       data_file = "%s/.coverage." % builddir
> -    data_file += ((run_tests and '.'.join(run_tests)) or
> -        (run_all_tests and "all_tests") or "")
> +    data_file += datetime.datetime.now().strftime('%Y%m%dT%H%M%S')
>       if os.path.isfile(data_file):
>           os.remove(data_file)
>       with open(coveragerc, 'w') as cps:
> +        cps.write("# Generated with command '%s'\n" % " ".join(sys.argv))
> +        cps.write("# HEAD commit %s\n" % curcommit.strip())
>           cps.write("[run]\n")
>           cps.write("data_file = %s\n" % data_file)
>           cps.write("branch = True\n")
> @@ -586,7 +591,7 @@ def buildResultClass(args):
>                   # value indicates where the coverage configuration file resides
>                   # More info on https://pypi.python.org/pypi/coverage
>                   if not os.environ.get('COVERAGE_PROCESS_START'):
> -                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.run_tests, args.run_all_tests, args.coverage_source, args.coverage_include, args.coverage_omit)
> +                    os.environ['COVERAGE_PROCESS_START'] = coverage_setup(args.coverage_source, args.coverage_include, args.coverage_omit)
>
>                   # Use default site.USER_SITE and write corresponding config file
>                   site.ENABLE_USER_SITE = True
>


