Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 36DFA779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 14:00:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 11 Aug 2017 07:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,358,1498546800"; d="scan'208";a="1161684704"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2017 07:00:16 -0700
Message-ID: <1502460536.29285.36.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Fri, 11 Aug 2017 09:08:56 -0500
In-Reply-To: <4eb7062b1b49a2e67dd84a274e371234021b3ce5.1502447434.git.markus.lehtonen@linux.intel.com>
References: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
	<4eb7062b1b49a2e67dd84a274e371234021b3ce5.1502447434.git.markus.lehtonen@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] dnf: expand dnf selftest to test signed package feeds
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
X-List-Received-Date: Fri, 11 Aug 2017 14:00:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-11 at 13:51 +0300, Markus Lehtonen wrote:
> [YOCTO #12099]

seems that the bugzilla ID does not exit.

> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta-selftest/files/signing/key.passphrase          |  1 +
>  meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 12 ++++++++++++
>  meta/lib/oeqa/selftest/cases/runtime_test.py        | 13 ++++++++++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta-selftest/files/signing/key.passphrase
> 
> diff --git a/meta-selftest/files/signing/key.passphrase b/meta-selftest/files/signing/key.passphrase
> new file mode 100644
> index 0000000000..5271a52680
> --- /dev/null
> +++ b/meta-selftest/files/signing/key.passphrase
> @@ -0,0 +1 @@
> +test123
> diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
> index 68e56f2c5e..3a299c75f6 100644
> --- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
> +++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
> @@ -31,12 +31,24 @@ class DnfSelftest(DnfTest):
>          temp_file = os.path.join(self.temp_dir.name, 'tmp.repo')
>          self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
>          fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
> +        fixed_config += 'repo_gpgcheck=1\n'
>          with open(temp_file, "w") as f:
>              f.write(fixed_config)
>          self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
>  
> +        # First try should fail as the gpg pubkey is not available for dnf
>          import re
>          output_makecache = self.dnf('makecache')
> +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is not None, msg = "dnf makecache should have failed: %s" %(output_makecache))
> +
> +        # Add public key to dnf config -> now we should succeed
> +        fixed_config += 'gpgkey=file:///etc/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s\n' % self.tc.td['DISTRO_VERSION']
> +        with open(temp_file, "w") as f:
> +            f.write(fixed_config)
> +        self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
> +
> +        output_makecache = self.dnf('-y makecache')
> +        self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
>          self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
>  
>          output_repoinfo = self.dnf('repoinfo')
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 07d05b5972..e603c71f90 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqem
>  from oeqa.core.decorator.oeid import OETestID
>  import os
>  import re
> +import tempfile
>  
>  class TestExport(OESelftestTestCase):
>  
> @@ -143,7 +144,17 @@ class TestImage(OESelftestTestCase):
>          # in at the start of the on-image test
>          features += 'PACKAGE_FEED_URIS = "http://bogus_ip:bogus_port"\n'
>          features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
> -        features += 'PACKAGE_CLASSES = "package_rpm"'
> +        features += 'PACKAGE_CLASSES = "package_rpm"\n'
> +
> +        # Enable package feed signing
> +        self.gpg_home = tempfile.TemporaryDirectory(prefix="oeqa-feed-sign-")
> +        signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
> +        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home.name, os.path.join(signing_key_dir, 'key.secret')))
> +        features += 'INHERIT += "sign_package_feed"\n'
> +        features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
> +        features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
> +        features += 'GPG_PATH = "%s"\n' % self.gpg_home.name
> +        features += 'IMAGE_INSTALL_append  = "signing-keys-packagefeed"\n'
>          self.write_config(features)
>  
>          # Build core-image-sato and testimage
> -- 
> 2.12.3
> 



