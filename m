Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D119E6093E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 08:34:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1B8YUDF027916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Feb 2018 00:34:30 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.240) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 11 Feb 2018 00:34:21 -0800
To: Joshua Watt <jpewhacker@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180131170230.7183-1-JPEWhacker@gmail.com>
	<20180131194956.23938-1-JPEWhacker@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57e7aa56-8823-4083-1812-fada355d1eb0@windriver.com>
Date: Sun, 11 Feb 2018 16:35:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180131194956.23938-1-JPEWhacker@gmail.com>
Cc: jslater@windriver.com, stefan.agner@toradex.com
Subject: Re: [PATCH v2] waf.bbclass: cd to ${S} before checking version
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
X-List-Received-Date: Sun, 11 Feb 2018 08:34:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joshua,

This one causes the following 2 recipes failed to build:

meta-openembedded/meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb:do_configure
meta-openembedded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb:do_configure

The error messages are similar:

File: '/usr/lib/python3.4/subprocess.py', lineno: 1457, function: _execute_child
      1453:                                # The error must be from chdir(cwd).
      1454:                                err_msg += ': ' + repr(cwd)
      1455:                            else:
      1456:                                err_msg += ': ' + repr(orig_executable)
  *** 1457:                    raise child_exception_type(errno_num, err_msg)
      1458:                raise child_exception_type(err_msg)
      1459:
      1460:
      1461:        def _handle_exitstatus(self, sts, _WIFSIGNALED=os.WIFSIGNALED,
Exception: FileNotFoundError: [Errno 2] No such file or directory: 
'/path/to/tmp-glibc/work/i586-wrs-linux/libtdb/1.3.15-r0/tdb-1.3.15/waf'

// Robert

On 02/01/2018 03:49 AM, Joshua Watt wrote:
> waf requires that the current working directory be the project root (in
> this case ${S} when it is invoked. The check to get the waf version was
> being executed as a prefunc for do_configure, which meant it was
> executed before the current working directory was switched to ${S}, and
> thus would fail with some recipes. Fix this by changing to ${S} before
> executing "waf --version"
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/waf.bbclass | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c3e744e5dec..bdbdc56767c 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -26,16 +26,17 @@ def get_waf_parallel_make(d):
>       return ""
>   
>   python waf_preconfigure() {
> +    import subprocess
>       from distutils.version import StrictVersion
> -    srcsubdir = d.getVar('S')
> -    wafbin = os.path.join(srcsubdir, 'waf')
> -    status, result = oe.utils.getstatusoutput(wafbin + " --version")
> -    if status != 0:
> -        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
> -        return
> -    version = result.split()[1]
> -    if StrictVersion(version) >= StrictVersion("1.8.7"):
> -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
> +    subsrcdir = d.getVar('S')
> +    wafbin = os.path.join(subsrcdir, 'waf')
> +    try:
> +        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> +        version = result.decode('utf-8').split()[1]
> +        if StrictVersion(version) >= StrictVersion("1.8.7"):
> +            d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
> +    except subprocess.CalledProcessError as e:
> +        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
>   }
>   
>   do_configure[prefuncs] += "waf_preconfigure"
> 

