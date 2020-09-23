Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.1168.1600881779062500680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 10:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.24, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: gWyUpHMz8genVzkIUBNTMi2uQukWcu+pGEcWAeTJCwCsIqf7tRu0EHwXnr3uAeBHsbiE4Xw0G1
 7oAAmanucing==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="161895631"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="161895631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 10:22:56 -0700
IronPort-SDR: Rw08aVMJGn1Qs4Wz+I3rY5+ufnfzEHVseQVKTz+nRBuTHOIgvJpxWnIL/+4r9n/2jfBpnUk6q7
 flTA1LR3YuwA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="454995914"
Received: from chihshen-mobl.amr.corp.intel.com ([10.213.164.146])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 10:22:55 -0700
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Randy Witt" <randy.e.witt@linux.intel.com>
Subject: RFC: Upgrading rt-tests requires numactl
Cc: alex.kanavin@gmail.com
Message-ID: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
Date: Wed, 23 Sep 2020 10:22:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While looking into upgrading rt-tests to the latest version, on IRC, John 
Kacur(the maintainer of rt-tests), recommended "that they use 
unstable/devel/latest as the maintained stable branch".

I updated the recipes in 
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rewitt/rt-tests-upgrade&id=551b25918d06c903fff22d76d5683b548c4f2e6f. 
However, I know this won't work as is, due to the issues below.

The latest version of rt-tests requires the numa libraries for compilation via 
this patch https://marc.info/?l=linux-rt-users&m=158335896221530&w=2. rt-tests 
exists in oe-core, but numactl which provides libnuma/numa.h exists in 
meta-openembedded.

Another issue is that ARM is removed from COMPATIBLE_HOST in 
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/numactl/numactl_git.bb?h=master#n27. 
This may be for legacy reasons, but libnuma can be installed on most 
distributions running on an ARM host. Regardless, it would need to be changed to 
allow for rt-tests on ARM.

I'm therefore trying to determine how to proceed to upgrade rt-tests. These are 
the options I thought of, which are most likely not exhaustive.

1. Bring numactl into oe-core
2. move rt-tests out of oe-core
3. TMy to patch out the numa requirement and carry it forever(doesn't appear to 
be a small task)
