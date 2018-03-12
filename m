Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9B678429
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 19:02:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 12:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,462,1515484800"; d="scan'208";a="182037547"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 12 Mar 2018 12:02:30 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Zhang Xiao <xiao.zhang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
Date: Mon, 12 Mar 2018 20:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 19:02:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/12/2018 08:38 PM, Mark Hatle wrote:
> In this case, because the user specifically asked for BOTH 32-bit and 64-bit
> development components to be installed onto the target for their application
> development.  (This isn't a theoretical problem, but a specific problem from one
> of our customers.)

Fair enough, but you should explain to the customer that Unix-type 
systems are not designed for this. There are hardcoded assumptions 
everywhere, that for each component there's only one set of header 
files, one .pc file, and one -config-style helper binary. Desktop 
distributions mutually exclude multilib -dev packages for this reason.

> The under the hood it can rename the 'python3.5m-config' to a nonconflicting
> name (based on the base_libdir, since we know that will be unique)... and then
> invoke a post-install script that will define an appropriate priority to ensure
> that python3.5m-config will match the final 'python3.5m' version.  (Possibly
> using update-alternatives to manage this.)

Here's something I don't get. When the user starts actual development, 
and calls python3.5-config to fetch configuration values, how do we 
ensure that the 'right' python3.5m-config is called, from the two that 
are installed? Same question for pkgconfig - how do we make sure it 
would look in the 'right' library directory of the two that are available?

Alex


