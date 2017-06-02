Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4A57860043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 11:42:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 04:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,284,1493708400"; d="scan'208";a="269399391"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2017 04:42:41 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Vgkosu=ubwF62dp8mHhaL7n1nKfSQXi4G1Si5F3J6TfA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <299ab56a-9990-70da-3a50-730f1646b232@linux.intel.com>
Date: Fri, 2 Jun 2017 14:40:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vgkosu=ubwF62dp8mHhaL7n1nKfSQXi4G1Si5F3J6TfA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_rpm.bbclass: use multithreaded xz compression
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
X-List-Received-Date: Fri, 02 Jun 2017 11:42:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 10:02 PM, Andre McCurdy wrote:
>> RPM's default is single-threaded gz; the change greatly helps with
>> both buildtimes (when there is a small number of large-sized packages)
>> and disk space taken by resulting rpms.
>
> Do you have any test results for that? Obviously build times will be
> longer when building with a single CPU since xz compression needs more
> CPU than gzip, but I'm curious how many CPUs are required before the
> multiple threads win over and build times actually get shorter. 4? 8?

Yes; it's in the cover letter.

> One other concern with parallel xz compression is memory usage. Single
> threaded xz needs more memory than gzip and running multiple xz
> compression threads together will push the memory usage up again.
> Maybe not an issue if the peak is still acceptable, but something to
> be aware of (I've given up trying to build in 4GB, but hopefully 8GB
> build machines still have some life left in them...).

I haven't seen anything resembling low-memory or OOM in my testing, even 
when running 44 rpm instances at the same time, each with their own 
several threads, each thread handling a package, and compression for the 
package again being done in a multi-threaded way. But then I have 22 
cores and 32G RAM here.

So do try the patches please, and report the findings, YMMV.

Alex


