Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CEEF177E65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:38:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 22 Jun 2017 13:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,374,1493708400"; d="scan'208";a="984128468"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2017 13:38:37 -0700
Message-ID: <1498164469.31575.64.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 22 Jun 2017 15:47:49 -0500
In-Reply-To: <1498153154.22706.38.camel@intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
	<1498148311.31575.56.camel@linux.intel.com>
	<1498153154.22706.38.camel@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 22 Jun 2017 20:38:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 19:39 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-22 at 11:18 -0500, Leonardo Sandoval wrote:
> > On Thu, 2017-06-22 at 17:59 +0200, Patrick Ohly wrote:
> > > On Thu, 2017-06-22 at 10:37 -0500, Leonardo Sandoval wrote:
> > > > On Thu, 2017-06-22 at 17:14 +0200, Patrick Ohly wrote:
> > > > > On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> > > > > > On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > > > > > > On Mon, 2017-06-19 at 07:39 -0700,
> > > > > > > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > > > > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > > > > > > > 
> > > > > > > > Do not mix the stderr into stdout, allowing test cases to query
> > > > > > > > the specific output.
> > > > > > > 
> > > > > > > This changes the behavior of functions that are also used outside of
> > > > > > > OE-core in a way that won't be easy to notice. I also don't think that
> > > > > > > it is the right default. For example, for bitbake it is easier to
> > > > > > > understand where an error occurred when stderr goes to the same stream
> > > > > > > as stdout.
> > > > > > 
> > > > > > how would that make it easier?
> > > > > 
> > > > > Because then output will be properly interleaved, as it would be on a
> > > > > console.
> > > > > 
> > > > > Actually, the entire error reporting in runCmd() only prints
> > > > > result.output, so with stderr going to result.error by default, you
> > > > > won't get the actual errors reported anymore at all, will you? 
> > > > > 
> > > > 
> > > > process stderr will go into result.error and process stdout into
> > > > result.output. So when the process is executed ignoring the return
> > > > status, then test must check result.error. I find the latter cleaner
> > > > that checking errors into stdout.
> > > 
> > > It depends on how the result is used. That you prefer split output for
> > > some tests does not mean that everyone wants the same in their tests. I
> > > don't want it in my own usage of runCmd() or bitbake() because I don't
> > > care about where a message was printed. I just want it in proper order.
> > > 
> > > If you change the default, then you will also have to enhance runCmd()'s
> > > error handling to include results.error. That's currently missing in
> > > your patch.
> > 
> > it is not missing, it is on 2/2
> 
> I'm talking about this code:
> 
> def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
>           native_sysroot=None, limit_exc_output=0, **options):
> ...
>     if result.status and not ignore_status:
>         exc_output = result.output
>         if limit_exc_output > 0:
>             split = result.output.splitlines()
>             if len(split) > limit_exc_output:
>                 exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
>                              '\n'.join(split[-limit_exc_output:])
>         if assert_error:
>             raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
>         else:
>             raise CommandError(result.status, command, exc_output)
> 




> You are not extending that in either 2/2, are you? At the moment, when a
> command fails, one gets stdout+stderr. With your path, one only gets
> stdout, which typically won't have the error message that caused the
> non-zero status.

that is not true. I tested my patch and all tests are green. If you look
at the code, the  'if len(split) > limit)exc)output' body is not
changing the result object, so what you get from cmd.run() is what what
is it returned.

> 
> Here's my proposal:
>      1. drop the "commands: send stderr to a new pipe" path, because
>         that has much wider implications for everyone else
>      2. in "selftest/cases: use stderr data when querying for errors",
>         explicitly change the bitbake() calls so that they have
>         stderr=subprocess.PIPE
> 
> Example:
> 
>      @OETestID(105)
>      def test_bitbake_invalid_recipe(self):
> -        result = bitbake('-b asdf', ignore_status=True)
> -        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
> +        invalid = 'asdf'
> +        result = bitbake('-b %s' % invalid, ignore_status=True, stderr=subprocess.PIPE)
> +        self.assertTrue("ERROR: Unable to find any recipe file matching '%s'" % invalid in result.error, msg = "Though %s recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % (invalid, result.error))
> 
> 
> 



