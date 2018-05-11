Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4B876004
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:35:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 May 2018 08:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,389,1520924400"; d="scan'208";a="54374222"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2018 08:35:15 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1525990692.git.pkj@axis.com>
	<fc21a364b6714e86743cc14e43e278328f9b39ea.1525990692.git.pkj@axis.com>
	<e41c1a9f-60e1-a8b7-76d9-9af324866a33@linux.intel.com>
	<ad98467799e844e8a8055ab4d2808ba4@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e87faf98-0173-b2f6-cb5c-8352fb435026@linux.intel.com>
Date: Fri, 11 May 2018 18:27:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ad98467799e844e8a8055ab4d2808ba4@XBOX02.axis.com>
Subject: Re: [PATCH 2/2] rpm: Assume a max limit of 1024 open files
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
X-List-Received-Date: Fri, 11 May 2018 15:35:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/11/2018 01:39 PM, Peter Kjellerstedt wrote:
> However, I gave this some more thought, and maybe it would be better to
> let bitbake set the soft limit for max open files to, e.g., 1024. That
> way we would not need to modify the code in rpm as it would adapt itself
> automatically. I tried adding the following to bitbake_main and it worked:
> 
>      import resource
> 
>      # Set the maximum number of open files as there are performance problems
>      # with, e.g., rpm if this is unlimited (which it may be if running inside
>      # a Docker container).
>      (soft, hard) = resource.getrlimit(resource.RLIMIT_NOFILE)
>      soft = int(os.environ.get("BB_LIMIT_NOFILE", "1024"))
>      resource.setrlimit(resource.RLIMIT_NOFILE, (min(soft, hard), hard))

That's right, this is the best solution.

Alex

