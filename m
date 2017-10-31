Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 552BC71A82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 07:15:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2017 00:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,322,1505804400"; d="scan'208";a="915727600"
Received: from aklett-mobl2.ger.corp.intel.com (HELO [10.252.56.133])
	([10.252.56.133])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2017 00:15:50 -0700
User-Agent: Microsoft-MacOutlook/f.27.0.171010
Date: Tue, 31 Oct 2017 09:15:52 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>,
	Konrad Scherer <Konrad.Scherer@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <9CB13C08-90ED-4213-98B1-81DD4223E5CC@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 05/10] bitbake.conf: add ip and scp to
	HOSTTOOLS unconditionally
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
	<E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
	<ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
In-Reply-To: <ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Tue, 31 Oct 2017 07:15:50 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,

Please see the 6th patch ("devtools/images: add python-pgo-image") in my patchset for python-pgo-image.

I'd like the profiling to work out-of-the-box, without requiring some strange-ish (i.e. modification of HOSTTOOLS) changes in local.conf. The required utilities, ip and scp, are rather standard tools, anyway. And, they used to be in HOSTTOOLS, unconditionally, before.

Thanks,
   Markus



On 31/10/2017, 8.33, "ChenQi" <Qi.Chen@windriver.com> wrote:

    Konrad,
    
    I've sent out a patch to fix the problem you encountered.
    
    Markus,
    
    I kind of understand what you are doing. You are trying to use library 
    functions in oeqa. And that requires scp and ip available. Right?
    To be clear, I don't have any objection to the any change to HOSTTOOLS. 
    Just one thing, we need to keep doc in sync.
    And one more thing, I cannot find python-pgo-image.
    
    HOSTTOOLS has its default value set in bitbake.conf, and we could modify 
    it in other conf files like distro conf or local.conf. Could this 
    possibly be your solution?
    
    Best Regards,
    Chen Qi
    
    On 10/30/2017 10:42 PM, Markus Lehtonen wrote:
    > Hi,
    >
    > I do not run any runtime tests, I just use the available library functions to run python profiling task on the device. No changes to local.conf are / should be required.
    >
    > Cheers,
    >    Markus
    >
    > On 30/10/2017, 15.56, "Konrad Scherer" <Konrad.Scherer@windriver.com> wrote:
    >
    >      On 10/30/2017 06:51 AM, Markus Lehtonen wrote:
    >      > Hi,
    >      >
    >      > What that tries state is that the image uses facilities written for
    >      > runtimetest (i.e. oeqa.targetcontrol) to run binaries on the target
    >      > machine. The new image introduced (i.e. python-pgo-image) uses this
    >      > to run the profiling task on device.
    >      
    >      I ran into something very similar. When using 'TEST_IMAGE = 1' (which
    >      uses testimage-auto), the conditional in bitbake.conf doesn't work and
    >      ip and ping are not available in tmp/hosttools.
    >      
    >      When using just 'INHERIT += "testimage"' the conditional works but the
    >      tests are not run automatically.
    >      
    >      If I use both 'TEST_IMAGE = 1' and 'INHERIT += "testimage"' together,
    >      the hosttools are found and the tests are run successfully.
    >      
    >      This is unexpected because classes/testimage-auto.bbclass does contain
    >      'inherit testimage'.
    >      
    >      What config options are you putting in local.conf to trigger the tests?
    >      
    >      --
    >      Konrad Scherer, MTS, Linux Products Group, Wind River
    >      
    >
    >
    >
    
    



