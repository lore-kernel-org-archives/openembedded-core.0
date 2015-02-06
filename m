Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6542260097
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 18:45:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 06 Feb 2015 10:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,530,1418112000"; d="scan'208";a="648507710"
Received: from localhost.jf.intel.com (HELO [10.7.201.167]) ([10.7.201.167])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2015 10:45:40 -0800
Message-ID: <54D50BD3.8020608@linux.intel.com>
Date: Fri, 06 Feb 2015 10:45:39 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>	<1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
	<1423069496-25819-3-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1423069496-25819-3-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH v2 2/2] systemd: split modules into packages
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
X-List-Received-Date: Fri, 06 Feb 2015 18:45:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2015 09:04 AM, Bruno Bottazzini wrote:
> It wil be able to choose what systemd module to be installed.
> The final result may get smaller, if the user wanted to.
> By default it will install the whole systemd which may be big.
> ---
>   meta/recipes-core/systemd/systemd_218.bb | 1059 ++++++++++++++++++++++++++----
>   1 file changed, 914 insertions(+), 145 deletions(-)

This patch will push a lot of maintenance work onto the Yocto systemd maintainer 
every time there is an upgrade. It's also easy to miss dependencies because of 
the inter-dependencies that can exist between services.

For items such as systemd-cgls and the tools, a change like this would be 
maintainable since those items are self-contained. But yanking out the services 
into separate packages means the maintainer will have to inspect them on each 
upgrade to make sure they still work.

Would it be sufficient to use PACKAGECONFIG for each of the items that can be 
disabled via configure? That way the granularity configuration is done by the 
systemd maintainers rather than the Yocto maintainer.




