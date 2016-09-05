Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD67773AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 14:47:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u85Elk0E005299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Sep 2016 07:47:46 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 07:47:45 -0700
To: Joshua Lock <joshuagloe@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
	<6180658762c54732ad9d8db624f2f0502996ff9b.1473083836.git.joshua.g.lock@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a08a52ab-c834-d104-695f-491d297a4e1d@windriver.com>
Date: Mon, 5 Sep 2016 22:47:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6180658762c54732ad9d8db624f2f0502996ff9b.1473083836.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 4/4] runqemu: get NATIVE dirs from env when in source OE build dir
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
X-List-Received-Date: Mon, 05 Sep 2016 14:47:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Josh,

Thanks for fixing this, I got errors when test this patch:

$ runqemu tmp/deploy/images/qemux86/
runqemu - INFO - Running bitbake -e...
Traceback (most recent call last):
   File "/buildarea/lyang1/poky/scripts/runqemu", line 864, in <module>
     ret = main()
   File "/buildarea/lyang1/poky/scripts/runqemu", line 851, in main
     config.read_qemuboot()
   File "/buildarea/lyang1/poky/scripts/runqemu", line 536, in read_qemuboot
     self.qemuboot = qbs.split[0]
AttributeError: 'list' object has no attribute 'split'

And after your patches, it always need run "bitbake -e", this makes
us can't use runqemu when another build is running:
ERROR: Only one copy of bitbake should be run against a build directory

Maybe we check STAGING_DIR_NATIVE, STAGING_BINDIR_NATIVE
and STAGING_DIR_HOST, if they are existed, then we don't need run bitbake -e.

And please see my comments below.

On 09/05/2016 09:59 PM, Joshua Lock wrote:
> When we're running from a sourced OE build directory parse the
> STAGING_* directories from the bitbake environment, rather than
> using those hard-coded in the conf file.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  scripts/runqemu | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index cfe7bff..5a97802 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -555,6 +555,16 @@ class BaseConfig(object):
>                  logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
>                  self.set('DEPLOY_DIR_IMAGE', imgdir)
>
> +        # When we're running from a sourced OE environment use the STAGING_*
> +        # directories from the environment.
> +        if self.bitbake_e:
> +            native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
> +            for nv in native_vars:
> +                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
> +                if s and s.group(1) != self.get(nv):
> +                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
> +                    self.set(nv, s.group(1))
> +
>      def print_config(self):
>          logger.info('Continuing with the following parameters:\n')
>          if not self.fstype in self.vmtypes:
> @@ -815,6 +825,17 @@ class BaseConfig(object):
>              shutil.rmtree(self.nfs_dir)
>              shutil.rmtree('%s.pseudo_state' % self.nfs_dir)
>
> +    def check_sourced_env(self):
> +        bitbake = shutil.which('bitbake')
> +        if bitbake and not self.bitbake_e:
> +            mach = self.get('MACHINE')
> +            if mach:
> +                cmd = 'MACHINE=%s bitbake -e' % mach
> +            else:
> +                cmd = 'bitbake -e'
> +            logger.info('Running %s...' % cmd)
> +            self.bitbake_e = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')

I think that we need check whether the command is successed
or not, and print errors if it is failed to run.

// Robert

> +
>  def main():
>      if len(sys.argv) == 1 or "help" in sys.argv:
>          print_usage()
> @@ -826,6 +847,7 @@ def main():
>          logger.error(esc)
>          logger.error("Try 'runqemu help' on how to use it")
>          return 1
> +    config.check_sourced_env()
>      config.read_qemuboot()
>      config.check_and_set()
>      config.print_config()
>

