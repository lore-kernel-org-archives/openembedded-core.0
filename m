Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3CA6B9A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:41:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 08:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,942,1367996400"; d="scan'208";a="392270680"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.235])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 08:41:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Date: Fri, 23 Aug 2013 16:41:16 +0100
Message-ID: <1509485.XBvO8KBohd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <6d7bb8409eb99b415d2500c5146a6b0c7eac2e7f.1377269486.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
	<6d7bb8409eb99b415d2500c5146a6b0c7eac2e7f.1377269486.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/21] lib/oeqa: add a restart method for base class and use it for build tests
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
X-List-Received-Date: Fri, 23 Aug 2013 15:41:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 August 2013 18:31:01 Stefan Stanacar wrote:
> This can be used by tests to restart the target
> (useful for passing extra qemuparams, like more RAM)
> 
> Build projects like cvs/iptables can take 15min+ on
> qemu targets with the default RAM, and sudoku fails
> with out of memory, so use this there.
> 
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> ---
>  meta/lib/oeqa/oetest.py                | 7 +++++++
>  meta/lib/oeqa/runtime/buildcvs.py      | 2 ++
>  meta/lib/oeqa/runtime/buildiptables.py | 2 ++
>  meta/lib/oeqa/runtime/buildsudoku.py   | 2 ++
>  4 files changed, 13 insertions(+)
> 
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index e694c0b..c9dc5dc 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -81,6 +81,13 @@ class oeRuntimeTest(unittest.TestCase):
>          else:
>              return False
> 
> +    @classmethod
> +    def restartTarget(self,params=None):
> +
> +        if oeRuntimeTest.tc.qemu.restart(params):
> +            oeRuntimeTest.tc.target.host = oeRuntimeTest.tc.qemu.ip
> +        else:
> +            raise Exception("Restarting target failed")
> 
> 
>  def getmodule(pos=2):
> diff --git a/meta/lib/oeqa/runtime/buildcvs.py
> b/meta/lib/oeqa/runtime/buildcvs.py index 9bf764d..f024dfa 100644
> --- a/meta/lib/oeqa/runtime/buildcvs.py
> +++ b/meta/lib/oeqa/runtime/buildcvs.py
> @@ -10,6 +10,7 @@ class BuildCvsTest(oeRuntimeTest):
> 
>      @classmethod
>      def setUpClass(self):
> +        self.restartTarget("-m 512")
>          self.project = TargetBuildProject(oeRuntimeTest.tc.target,
>                         
> "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2"
> ) self.project.download_archive()
> @@ -28,3 +29,4 @@ class BuildCvsTest(oeRuntimeTest):
>      @classmethod
>      def tearDownClass(self):
>          self.project.clean()
> +        self.restartTarget()
> diff --git a/meta/lib/oeqa/runtime/buildiptables.py
> b/meta/lib/oeqa/runtime/buildiptables.py index 50faf5d..88ece3b 100644
> --- a/meta/lib/oeqa/runtime/buildiptables.py
> +++ b/meta/lib/oeqa/runtime/buildiptables.py
> @@ -10,6 +10,7 @@ class BuildIptablesTest(oeRuntimeTest):
> 
>      @classmethod
>      def setUpClass(self):
> +        self.restartTarget("-m 512")
>          self.project = TargetBuildProject(oeRuntimeTest.tc.target,
>                         
> "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
> self.project.download_archive()
> @@ -28,3 +29,4 @@ class BuildIptablesTest(oeRuntimeTest):
>      @classmethod
>      def tearDownClass(self):
>          self.project.clean()
> +        self.restartTarget()
> diff --git a/meta/lib/oeqa/runtime/buildsudoku.py
> b/meta/lib/oeqa/runtime/buildsudoku.py index 61dc1ff..0a7306d 100644
> --- a/meta/lib/oeqa/runtime/buildsudoku.py
> +++ b/meta/lib/oeqa/runtime/buildsudoku.py
> @@ -10,6 +10,7 @@ class SudokuTest(oeRuntimeTest):
> 
>      @classmethod
>      def setUpClass(self):
> +        self.restartTarget("-m 512")
>          self.project = TargetBuildProject(oeRuntimeTest.tc.target,
>                         
> "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudok
> u-savant-1.3/sudoku-savant-1.3.tar.bz2") self.project.download_archive()
> @@ -25,3 +26,4 @@ class SudokuTest(oeRuntimeTest):
>      @classmethod
>      def tearDownClass(self):
>          self.project.clean()
> +        self.restartTarget()

Could you please you move the function addition earlier in the series and 
merge the test changes into the earlier commits that added them?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

