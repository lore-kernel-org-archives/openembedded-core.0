Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBBE772A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:26:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Feb 2016 02:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="909304965"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2016 02:26:41 -0800
Message-ID: <1456223200.2298.41.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 12:26:40 +0200
In-Reply-To: <ccea554cd4fef5dcffc2e9edfb69a8b606907716.1455895912.git.adrian.ratiu@ni.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
	<ccea554cd4fef5dcffc2e9edfb69a8b606907716.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH v6 2/4] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
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
X-List-Received-Date: Tue, 23 Feb 2016 10:26:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Resending as my I got a strange "Only members may post to the list."
error yesterday...

On Fri, 2016-02-19 at 17:43 +0200, Ioan-Adrian Ratiu wrote:
> Starting from v2.1 passing passwords directly to gpg does not work
> anymore [1], instead a loopback interface must be used otherwise
> gpg >2.1 will error out with:
> "gpg: signing failed: Inappropriate ioctl for device"
> 
> gpg <2.1 does not work with the new --pinentry-mode arg and gives an
> invalid option error, so we detect what is the running version of gpg
> and pass it accordingly.
> 
> [1] https://wiki.archlinux.org/index.php/GnuPG#Unattended_passphrase
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/lib/oe/gpg_sign.py | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ef47d1a..9f6b0f0 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -66,6 +66,12 @@ class LocalSigner(object):
>          if armor:
>              cmd += ['--armor']
>  
> +        #gpg > 2.1 supports password pipes only through the loopback
> interface
> +        #gpg < 2.1 errors out if given unknown parameters
> +        gpg_ver = self.get_gpg_version()
> +        if gpg_ver > 2.1:
> +            cmd += ['--pinentry-mode', 'loopback']
> +

As far as I can tell get_gpg_version returns a string. However, you
compare that with a float. This should give more correct behavior:
+        if gpg_ver > "2.1":



Thanks,
  Markus


>          try:
>              keypipe = os.pipe()
>  
> @@ -99,6 +105,20 @@ class LocalSigner(object):
>              raise Exception("Failed to sign '%s'" % input_file)
>  
>  
> +    def get_gpg_version(self):
> +        """Return the gpg version"""
> +        import subprocess
> +
> +        job = subprocess.Popen([self.gpg_bin, "--version"],
> stdout=subprocess.PIPE)
> +        (stdout, _) = job.communicate()
> +
> +        if job.returncode:
> +            raise bb.build.FuncFailed("Could not get gpg version (is
> %s installed?)" %
> +                                      self.gpg_bin)
> +
> +        return stdout.split()[2]
> +
> +
>      def verify(self, sig_file):
>          """Verify signature"""
>          cmd = self.gpg_bin + " --verify "

