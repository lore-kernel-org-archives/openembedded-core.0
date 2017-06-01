Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A347077DB1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 17:46:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 01 Jun 2017 10:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="1137013088"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2017 10:46:31 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
	<af1710db-aa6a-1934-e2e8-d59f94c52402@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bcc3605e-962f-1239-dad9-1ea7e6a97f83@linux.intel.com>
Date: Thu, 1 Jun 2017 20:44:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <af1710db-aa6a-1934-e2e8-d59f94c52402@windriver.com>
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
X-List-Received-Date: Thu, 01 Jun 2017 17:46:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 08:11 PM, Mark Hatle wrote:
> On 6/1/17 10:15 AM, Alexander Kanavin wrote:
>> RPM's default is single-threaded gz; the change greatly helps with
>> both buildtimes (when there is a small number of large-sized packages)
>> and disk space taken by resulting rpms.
>
> If you wnable XZ here, you need to make sure XZ compression is enabled within
> rpm itself.  (I know how that worked in rpm5, not sure how rpm4 does it -- it
> may be enable that the binary be present to call out to.)

rpm4 does not call out to any binary, it is linking against liblzma from 
xz package, if it can find it during configure. Xz was already in list 
of dependencies, so nothing needed to be done. Same for other 
compression schemes.

> Finally I have not investigated parallel XZ, but in some cases the resulting
> compressed file is different depending on compression artifacts due to
> parallelization.  (The compressed file is different, not the uncompressed content.)
>
> This can be a concern to some who want fully reproducible builds (from source).
> So we need to make sure we have a way to disable this type of parallelization
> --if-- it causes a problem with different contents.

Let's first see if it is an actual concern for anyone. If the 
uncompressed contents is exactly same, I have difficulty seeing what is 
the problem specifically.

Alex

