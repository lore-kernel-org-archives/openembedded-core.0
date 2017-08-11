Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF579779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 13:23:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 06:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="888999715"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2017 06:23:38 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1502447434.git.markus.lehtonen@linux.intel.com>
	<4eb7062b1b49a2e67dd84a274e371234021b3ce5.1502447434.git.markus.lehtonen@linux.intel.com>
	<d453fbc1-1ba3-1bca-71a7-74abb7f0a63c@linux.intel.com>
	<CF633D0C-02ED-4F5C-8679-853DC36C489B@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <77d4f42e-2f5c-f4ee-cc52-61f19a34c4eb@linux.intel.com>
Date: Fri, 11 Aug 2017 16:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CF633D0C-02ED-4F5C-8679-853DC36C489B@linux.intel.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 13:23:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/11/2017 03:54 PM, Markus Lehtonen wrote:

>      Wait a moment. If feed signing is enabled, then dnf's "repo_gpgcheck",
>      and "gpgkey" settings should be configured and working by default. You
>      shouldn't fix them after the fact in the test. Please add the necessary
>      code to insert_feeds_uris() in package_manager.py.
>      
> Do you think it's a safe assumption that all repos configured via PACKAGE_FEED_URIS are signed and with the same key?

We had a discussion on IRC; the problem here is that some of those repos 
may be from a 3rd party, or created earlier with different signing 
settings. We don't provide configuration support for such a mix of 
repositories; if PACKAGE_FEED_SIGN is enabled, then it is assumed that 
all of the configured repositories are signed with the provided key. If 
someone needs a more intricate configuration, they can have it via a 
custom repository indexer recipe, and image creation hooks that 
configure dnf to match that.

The alternative (not configuring dnf to check the signatures) is worse: 
the repos are signed, but then dnf does not actually verify anything. So 
the signing is quietly subverted. This default case should simply work, 
and not fail quietly.

Alex

