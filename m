Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9415A6CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 12:19:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Oct 2013 05:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,539,1378882800"; d="scan'208";a="420122917"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2013 05:18:57 -0700
Received: from [10.237.108.65] (apalalax-mobl.ger.corp.intel.com
	[10.237.108.65])
	by linux.intel.com (Postfix) with ESMTP id 989566A400F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 05:18:54 -0700 (PDT)
Message-ID: <52651BAF.9090309@linux.intel.com>
Date: Mon, 21 Oct 2013 15:18:55 +0300
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <1382289436-5818-1-git-send-email-alexandrux.palalau@linux.intel.com>
In-Reply-To: <1382289436-5818-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: Re: [PATCH] lib/oeqa/runtime: added rpm dependency test
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
X-List-Received-Date: Mon, 21 Oct 2013 12:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ignore this one...will send V2

On 10/20/2013 8:17 PM, Alexandru Palalau wrote:
> From: Alexandru Palalau <alexandrux.palalau@intel.com>
>
> Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
> ---
>   meta/lib/oeqa/runtime/rpm.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
> index 154cad5..7b48e4c 100644
> --- a/meta/lib/oeqa/runtime/rpm.py
> +++ b/meta/lib/oeqa/runtime/rpm.py
> @@ -29,15 +29,25 @@ class RpmInstallRemoveTest(oeRuntimeTest):
>       def setUpClass(self):
>           deploydir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
>           pkgdata = oe.packagedata.read_subpkgdata("rpm-doc", oeRuntimeTest.tc.d)
> +        pkgdata2 = oe.packagedata.read_subpkgdata("psplash-default", oeRuntimeTest.tc.d)
>           # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
>           testrpmfile = "rpm-doc-%s-%s.%s.rpm" % (pkgdata["PKGV"], pkgdata["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
> +        testpsplashfile = "psplash-default-%s-%s.%s.rpm" % (pkgdata2["PKGV"], pkgdata2["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
>           oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testrpmfile), "/tmp/rpm-doc.rpm")
> +        oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testpsplashfile), "/tmp/psplash-default.rpm")
>
>       @skipUnlessPassed('test_rpm_help')
>       def test_rpm_install(self):
>           (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
>           self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
>
> +    @skipUnlessPassed('test_rpm_help')
> +    def test_rpm_install_dependency(self):
> +        (status, output) = self.target.run('rpm -e psplash psplash-default')
> +        self.assertEqual(status, 0, msg="Failed to remove psplash and psplash-default packages. Output: %s" % output)
> +        (status, output) = self.target.run('rpm -ivh /tmp/psplash-default.rpm')
> +        self.assertEqual(status, 1, msg="Fail in using rpm install dependency command. Output: %s" % output)
> +
>       @skipUnlessPassed('test_rpm_install')
>       def test_rpm_remove(self):
>           (status,output) = self.target.run('rpm -e rpm-doc')
>


-- 
Alexandru Palalau

