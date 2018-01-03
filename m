Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AF52C6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 20:42:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 12:42:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,503,1508828400"; d="scan'208,217";a="21155482"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2018 12:42:31 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <9db5a39d-2057-01b7-67a3-09845a119fea@intel.com>
Date: Wed, 3 Jan 2018 12:42:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCHv2 1/3] runtime/cases/ptest.py: do not require ptest-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Wed, 03 Jan 2018 20:42:30 -0000
Content-Type: multipart/alternative;
	boundary="------------9FD800DAA38A5E62998D070A"
Content-Language: en-US

--------------9FD800DAA38A5E62998D070A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Looks like it doesn't skip the test correctly:

| NOTE: test_ptestrunner (ptest.PtestRunnerTest) | DEBUG: Checking if 
ptest is in DISTRO_FEATURES or IMAGE_FEATURES | DEBUG: [Running]$ ssh -l 
root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o 
LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; 
which ptest-runner | DEBUG: Data from SSH call: which: no ptest-runner 
in (/usr/sbin:/sbin:/usr/bin:/bin) | DEBUG: [Command returned '1' after 
0.10 seconds] | DEBUG: Command: which ptest-runner | Output: which: no 
ptest-runner in (/usr/sbin:/sbin:/usr/bin:/bin) | | DEBUG: [Running]$ 
ssh -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 
-o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; 
ptest-runner | DEBUG: Data from SSH call: sh: ptest-runner: command not 
found | DEBUG: [Command returned '127' after 0.10 seconds] | DEBUG: 
Command: ptest-runner | Output: sh: ptest-runner: command not found | | 
NOTE: ... FAIL 
https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/673/steps/Running%20Sanity%20Tests/logs/stdio 
Thanks, Cal

On 12/21/2017 04:44 AM, Alexander Kanavin wrote:
> Doing so means that all available ptests for packages in the image
> will be installed and run; some of them may be broken, never finish,
> take a very long time or simply irrelevant to the user who wants to
> check ptests of only a few specific packages, and does so by listing
> them explicitly via IMAGE_INSTALL_append or similar.
>
> Conversely, do not run the test if ptest-runner is not installed
> (which means there are no ptests available, as they pull it in via a
> dependency).
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/lib/oeqa/runtime/cases/ptest.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
> index ec8c038a566..63e119530dc 100644
> --- a/meta/lib/oeqa/runtime/cases/ptest.py
> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> @@ -48,9 +48,12 @@ class PtestRunnerTest(OERuntimeTestCase):
>   
>       @OETestID(1600)
>       @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
> -    @skipIfNotFeature('ptest-pkgs', 'Test requires ptest-pkgs to be in IMAGE_FEATURES')
>       @OETestDepends(['ssh.SSHTest.test_ssh'])
>       def test_ptestrunner(self):
> +        status, output = self.target.run('which ptest-runner', 0)
> +        if len(output) == 0:
> +            self.skipTest("No -ptest packages are installed in the image")
> +
>           import datetime
>   
>           test_log_dir = self.td.get('TEST_LOG_DIR', '')


--------------9FD800DAA38A5E62998D070A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Looks like it doesn't skip the test correctly:</tt><br>
    <pre><span class="stdout">| NOTE: test_ptestrunner (ptest.PtestRunnerTest)
| DEBUG: Checking if ptest is in DISTRO_FEATURES or IMAGE_FEATURES
| DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; which ptest-runner
| DEBUG: Data from SSH call: which: no ptest-runner in (/usr/sbin:/sbin:/usr/bin:/bin)
| DEBUG: [Command returned '1' after 0.10 seconds]
| DEBUG: Command: which ptest-runner
| Output:  which: no ptest-runner in (/usr/sbin:/sbin:/usr/bin:/bin)
| 
| DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.2 export PATH=/usr/sbin:/sbin:/usr/bin:/bin; ptest-runner
| DEBUG: Data from SSH call: sh: ptest-runner: command not found
| DEBUG: [Command returned '127' after 0.10 seconds]
| DEBUG: Command: ptest-runner
| Output:  sh: ptest-runner: command not found
| 
| NOTE:  ... FAIL

<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/673/steps/Running%20Sanity%20Tests/logs/stdio">https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/673/steps/Running%20Sanity%20Tests/logs/stdio</a>

Thanks,
Cal
</span></pre>
    <div class="moz-cite-prefix">On 12/21/2017 04:44 AM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20171221124500.29810-1-alexander.kanavin@linux.intel.com">
      <pre wrap="">Doing so means that all available ptests for packages in the image
will be installed and run; some of them may be broken, never finish,
take a very long time or simply irrelevant to the user who wants to
check ptests of only a few specific packages, and does so by listing
them explicitly via IMAGE_INSTALL_append or similar.

Conversely, do not run the test if ptest-runner is not installed
(which means there are no ptests available, as they pull it in via a
dependency).

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alexander.kanavin@linux.intel.com">&lt;alexander.kanavin@linux.intel.com&gt;</a>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index ec8c038a566..63e119530dc 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -48,9 +48,12 @@ class PtestRunnerTest(OERuntimeTestCase):
 
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @skipIfNotFeature('ptest-pkgs', 'Test requires ptest-pkgs to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ptestrunner(self):
+        status, output = self.target.run('which ptest-runner', 0)
+        if len(output) == 0:
+            self.skipTest("No -ptest packages are installed in the image")
+
         import datetime
 
         test_log_dir = self.td.get('TEST_LOG_DIR', '')
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9FD800DAA38A5E62998D070A--
