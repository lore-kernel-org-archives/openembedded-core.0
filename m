Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 53B6371DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:02:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 08:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="933343277"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Feb 2017 08:01:50 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<cb62217431175ee1029d3d223e9940886aa0e637.1486997986.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYjW=pgmayQ-kb+Caae7OJggiPf2hQHn3gnboSFZscdpg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c5c82e1e-9290-1273-825d-9620e180c9b3@linux.intel.com>
Date: Mon, 13 Feb 2017 18:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjW=pgmayQ-kb+Caae7OJggiPf2hQHn3gnboSFZscdpg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 30/36] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Mon, 13 Feb 2017 16:02:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2017 05:36 PM, Burton, Ross wrote:
>              runCmd('bitbake -c cleanall man xcursor-transparent-theme')
>     -        result = runCmd('bitbake man xcursor-transparent-theme -k',
>     ignore_status=True)
>     +        result = runCmd('bitbake -c unpack -k man
>     xcursor-transparent-theme', ignore_status=True)
>
>
> It's still doing a cleanall, which is removing stuff from DL_DIR.
>
> If the test adds a function between fetch and unpack then it won't need
> to do anything apart from bitbake -c unpack -f to run the test, and then
> a cleanup -cclean to remove the tainted hashes.

The test is forcing its own private DL_DIR, so I really don't see why we 
should be concerned about avoiding doing cleanall:

     @testcase(1035)
     def test_continue(self):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
SSTATE_DIR = \"${TOPDIR}/download-selftest\"
INHERIT_remove = \"report-error\"
""")


Alex

