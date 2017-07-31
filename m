Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D060D78554
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:30:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 06:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="999137718"
Received: from msanabr1-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.51.199])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2017 06:30:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 31 Jul 2017 15:30:23 +0200
Message-ID: <5041187.DqVND4ltU0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <81100738981ef9b5640b16f804f5f89a76ec2a0c.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<81100738981ef9b5640b16f804f5f89a76ec2a0c.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/10] buildhistory.bbclass: add ptest_log
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
X-List-Received-Date: Mon, 31 Jul 2017 13:30:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

A few minor comments below.

On Monday, 31 July 2017 11:50:09 AM CEST Robert Yang wrote:
> The ptest log will be saved to buildhistory/ptest_log, we can easily get
> the regression result between builds by:
> $ git show HEAD ptest_log/pass.fail.skip.*
> 
> [YOCTO #11547]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/buildhistory.bbclass | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/
buildhistory.bbclass
> index a3e4c7a734a..26430a63d31 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -912,3 +912,31 @@ def write_latest_srcrev(d, pkghistdir):
>      else:
>          if os.path.exists(srcrevfile):
>              os.remove(srcrevfile)
> +
> +do_testimage[postfuncs] += "write_ptest_result"
> +do_testimage[vardepsexclude] += "write_ptest_result"
> +
> +python write_ptest_result() {
> +    write_latest_ptest_result(d, d.getVar('BUILDHISTORY_DIR'))
> +}
> +
> +def write_latest_ptest_result(d, histdir):
> +    import glob
> +    import subprocess
> +    test_log_dir = d.getVar('TEST_LOG_DIR')
> +    input_ptest_log = os.path.join(test_log_dir, 'ptest_log')
> +    output_ptest_log = os.path.join(histdir, 'ptest_log')

Would it be reasonable for this to just be "ptest"? To ask the question a 
different way, would you expect to save other types of ptest information into 
buildhistory, or is this likely to be it?

> +    if os.path.exists(input_ptest_log):
> +        # Lock it avoid race issue
> +        lock = bb.utils.lockfile(output_ptest_log + "/ptest_log.lock")
> +        bb.utils.mkdirhier(output_ptest_log)
> +        oe.path.copytree(input_ptest_log, output_ptest_log)
> +        # Sort test result
> +        for result in glob.glob('%s/pass.fail.*' % output_ptest_log):
> +            bb.debug(1, 'Processing %s' % result)
> +            cmd = "sort %s -o %s" % (result, result)
> +            bb.debug(1, 'Running %s' % cmd)
> +            ret = subprocess.call(cmd, shell=True)

As a matter of good practice and since it's easy to do here I'd suggest not 
using shell=True and passing the command as a list instead, that way there 
can't be any issues with spaces or other shell interpretations.

> +            if ret != 0:
> +                bb.error('Failed to run %s!' % cmd)
> +        bb.utils.unlockfile(lock)

Shouldn't you be using try...finally here to ensure the lockfile gets unlocked 
in the case of exceptions?

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

