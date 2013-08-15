Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8F06B834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:44:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 15 Aug 2013 02:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,884,1367996400"; d="scan'208";a="381308724"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 02:44:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: wenzong fan <wenzong.fan@windriver.com>
Date: Thu, 15 Aug 2013 10:44:44 +0100
Message-ID: <2523779.jWvvpX7hhR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <520C9F8A.7080703@windriver.com>
References: <520C9F8A.7080703@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 09:44:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Wenzong,

On Thursday 15 August 2013 17:29:46 wenzong fan wrote:
> We have seen some problems like this:
> 
> $ bitbake libcap
> 
> ld: warning: libaudit.so.1, needed by .../lib64/libpam.so, not found
> .../lib64/libpam.so: undefined reference to `audit_open'
> .../lib64/libpam.so: undefined reference to `audit_close'
> ......
> 
> The libaudit has been available and libpam build with it, after we run
> another build with sstate-cache and w/o libaudit, the error occurs. The
> solution in these cases is to use PACKAGECONFIG to lay out dependencies
> on optional packages and make them explicit. We need to run an audit and
> catch all of these issues.
> 
> A probable ways maybe:
> 
> 1) Run world build to generate the sysroots as much as possible;

(See Ross's reply for a pointer to the new test-dependencies script)

> 2) Run 'configure --help' on each package to spot all of the optional
> dependencies, and convert them into PACKAGECONFIG specs/or any other
> prompts.

Actually I have started along this line as well, putting the output of 
configure --help into buildhistory so you can see the differences. I'm not 
totally sure how useful it is at the moment and it will need some smooting out 
to avoid known differences (paths etc.).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

