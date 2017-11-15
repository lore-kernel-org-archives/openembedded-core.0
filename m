Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E57407852A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:16:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 04:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,399,1505804400"; 
   d="scan'208";a="5218408"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.31])
	([10.237.66.31])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2017 04:16:00 -0800
User-Agent: Microsoft-MacOutlook/f.27.0.171010
Date: Wed, 15 Nov 2017 14:15:59 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Konrad Scherer <Konrad.Scherer@windriver.com>,
	ChenQi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Message-ID: <40402C0B-F567-41EB-BE3E-F23261E7CC95@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 05/10] bitbake.conf: add ip and scp to
	HOSTTOOLS unconditionally
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
	<E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
	<ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
	<9CB13C08-90ED-4213-98B1-81DD4223E5CC@linux.intel.com>
	<ef6cb9de-02fd-06f2-3f75-57875aeac3a0@windriver.com>
In-Reply-To: <ef6cb9de-02fd-06f2-3f75-57875aeac3a0@windriver.com>
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
X-List-Received-Date: Wed, 15 Nov 2017 12:16:01 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,

Hosttools are set after the bitbake configuration is parsed so there is no way to affect the outcome from the "recipe space". HOSTTOOLS can only be set from bitbake configuration. Thus, I don't see any way to conditionally expand the value in case something specific is being built.

The only way that I can think of to make this somehow work would be to add the utilities to HOSTTOOLS_NONFATAL. Then, the utils would be linked if present and the profile task would succeed on most systems.

Thanks,
   Markus

On 01/11/2017, 17.35, "Konrad Scherer" <Konrad.Scherer@windriver.com> wrote:

    On 10/31/2017 03:15 AM, Markus Lehtonen wrote:
    > Hi,
    > 
    > Please see the 6th patch ("devtools/images: add python-pgo-image") in my patchset for python-pgo-image.
    > 
    > I'd like the profiling to work out-of-the-box, without requiring some
    > strange-ish (i.e. modification of HOSTTOOLS) changes in local.conf.
    > The required utilities, ip and scp, are rather standard tools,
    > anyway. And, they used to be in HOSTTOOLS, unconditionally, before.
    ip and scp are not needed for a normal build so it doesn't make sense to 
    make them mandatory. Including them unconditionally caused build 
    failures for us because the docker images we use for coverage builds did 
    not include those binaries. I realize that doing builds in minimal 
    containers is rare today, but I expect it to become more common.
    
    Since the recipe uses the oeqa helpers, is there a way to setup the 
    conditional inclusion to detect this and include the required binaries 
    in HOSTTOOLS? Or have the oeqa helper modify the HOSTTOOLS before they 
    are used?
    
    -- 
    Konrad Scherer, MTS, Linux Products Group, Wind River
    



