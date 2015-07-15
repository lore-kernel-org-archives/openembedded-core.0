Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7379975877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:42:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F7gFdx022629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 00:42:15 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 15 Jul 2015 00:42:14 -0700
Message-ID: <55A60F08.3080701@windriver.com>
Date: Wed, 15 Jul 2015 15:43:04 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1436368635-6078-1-git-send-email-daniel.alexandrux.istrate@intel.com>
In-Reply-To: <1436368635-6078-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [PATCH] oeqa/runtime: Added 4 new runtime test cases
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
X-List-Received-Date: Wed, 15 Jul 2015 07:42:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2015 11:17 PM, Daniel Istrate wrote:
> bash:    (240) check bash in image
> connman: (223) Only one connmand in background
>           (963) test connmand file
> rpm:     (195) Check rpm install/removal log file size
>
> Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> ---
>   meta/lib/oeqa/runtime/bash.py    | 23 +++++++++++++++++++++++
>   meta/lib/oeqa/runtime/connman.py | 40 ++++++++++++++++++++++++++++++++++++++++
>   meta/lib/oeqa/runtime/rpm.py     | 37 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 100 insertions(+)
>   create mode 100644 meta/lib/oeqa/runtime/bash.py
>
> diff --git a/meta/lib/oeqa/runtime/bash.py b/meta/lib/oeqa/runtime/bash.py
> new file mode 100644
> index 0000000..2a261a3
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/bash.py
> @@ -0,0 +1,23 @@
> +from oeqa.oetest import oeRuntimeTest
> +from oeqa.utils.decorators import *
> +
> +
> +class BashTest(oeRuntimeTest):
> +
> +    @testcase(240)
> +    @skipUnlessPassed("test_ssh")
> +    def test_check_bash_in_image(self):
> +        """
> +        Summary:     check bash in image
> +        Expected:    bash command should exist in image
> +        Product:     BSPs
> +        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        cmd = 'which bash'
> +        expected_ret = '/bin/bash'
> +
> +        (status, output) = self.target.run(cmd)
> +        self.assertEqual(0, status, 'Failed to send cmd "{}"'.format(cmd))
> +        self.assertEqual(str(output), expected_ret, 'Found "{}", instead of "{}"'.format(output, expected_ret))
> diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
> index cc537f7..70ead4e 100644
> --- a/meta/lib/oeqa/runtime/connman.py
> +++ b/meta/lib/oeqa/runtime/connman.py
> @@ -28,3 +28,43 @@ class ConnmanTest(oeRuntimeTest):
>           if status != 0:
>               print self.service_status("connman")
>               self.fail("No connmand process running")
> +
> +    @testcase(223)
> +    def test_only_one_connmand_in_background(self):
> +        """
> +        Summary:     Only one connmand in background
> +        Expected:    There will be only one connmand instance in background.
> +        Product:     BSPs
> +        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        # Make sure that 'connmand' is running in background
> +        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
> +        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
> +
> +        # Start a new instance of 'connmand'
> +        (status, output) = self.target.run('connmand')
> +        self.assertEqual(0, status, 'Failed to start a new "connmand" process.')
> +
> +        # Make sure that only one 'connmand' is running in background
> +        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand | wc -l')
> +        self.assertEqual(0, status, 'Failed to find "connmand" process running in background.')
> +        self.assertEqual(1, int(output), 'Found {} connmand processes running, expected 1.'.format(output))
> +
> +    @testcase(963)
> +    def test_connmand_file(self):
> +        """
> +        Summary:     test connmand file
> +        Expected:    connman-applet should be ELF32 binary
> +        Product:     BSPs
> +        Author:      Lucian Musat <georgex.l.musat@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +
> +        cmd = "readelf -h /usr/bin/connman-applet | sed -n '3p' | awk '{print $2}'"
> +        expected_ret = 'ELF32'
> +
> +        (status, output) = self.target.run(cmd)
> +        self.assertEqual(0, status, 'Failed to send cmd "{}"'.format(cmd))
> +        self.assertEqual(expected_ret, str(output), "Expected {}, found instead {}".format(expected_ret, output))


https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/50/steps/Running%20Sanity%20Tests/logs/stdio

Please look at the above failure.

Regards,
Chen Qi

> diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
> index 4ca193b..32aae24 100644
> --- a/meta/lib/oeqa/runtime/rpm.py
> +++ b/meta/lib/oeqa/runtime/rpm.py
> @@ -58,6 +58,43 @@ class RpmInstallRemoveTest(oeRuntimeTest):
>           (status, output) = self.target.run('sudo -u test1 rpm -qa')
>           self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa" % status)
>   
> +    @testcase(195)
> +    @skipUnlessPassed('test_rpm_install')
> +    def test_check_rpm_install_removal_log_file_size(self):
> +        """
> +        Summary:     Check rpm install/removal log file size
> +        Expected:    There should be some method to keep rpm log in a small size .
> +        Product:     BSPs
> +        Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
> +        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
> +        """
> +        db_files_cmd = 'ls /var/lib/rpm/__db.*'
> +        get_log_size_cmd = "du /var/lib/rpm/log/log.* | awk '{print $1}'"
> +
> +        # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
> +        (status, output) = self.target.run(db_files_cmd)
> +        self.assertEqual(0, status, 'Failed to find database files under /var/lib/rpm/ as __db.xxx')
> +
> +        # Remove the package just in case
> +        self.target.run('rpm -e rpm-doc')
> +
> +        # Install/Remove a package 10 times
> +        for i in range(10):
> +            (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
> +            self.assertEqual(0, status, "Failed to install rpm-doc package. Reason: {}".format(output))
> +
> +            (status, output) = self.target.run('rpm -e rpm-doc')
> +            self.assertEqual(0, status, "Failed to remove rpm-doc package. Reason: {}".format(output))
> +
> +        # Get the size of log file
> +        (status, output) = self.target.run(get_log_size_cmd)
> +        self.assertEqual(0, status, 'Failed to get the final size of the log file.')
> +
> +        # Compare each log size
> +        for log_file_size in output:
> +            self.assertLessEqual(int(log_file_size), 11264,
> +                                   'Log file size is greater that expected (~10MB), found {} bytes'.format(log_file_size))
> +
>       @classmethod
>       def tearDownClass(self):
>           oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')


