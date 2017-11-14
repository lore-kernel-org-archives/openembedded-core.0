Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EBCB0784FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:47:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 04:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,393,1505804400"; 
   d="scan'208";a="7468255"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2017 04:47:32 -0800
To: Martyn Welch <martyn.welch@collabora.co.uk>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ac750826-9931-85d1-35b4-106d774ee829@linux.intel.com>
Date: Tue, 14 Nov 2017 14:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v2 1/2] package.bbclass: add prohibited-path qa test
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
X-List-Received-Date: Tue, 14 Nov 2017 12:47:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/13/2017 09:19 PM, Martyn Welch wrote:
> Sometimes we wish to ensure that packages don't install files or
> directories somewhere that may prove detrimental to the operation of the
> system. For example, this may be the case if files are placed in a
> directory that is utilised as a mount point at run time, thus making them
> inaccessible once when the mount point is being utilised.
> 
> Implement the prohibited-path QA test, which enables such locations to be
> specified in a "PROHIBITED_PATH" variable. This implementation allows for
> exact matches and simple wildcards (paths ending with an asterisk. An
> error will be raised should a match be found, or in the case of a
> wildcard, for any files added below the specificed location(s).

I think this situation is an image configuration problem, not a package 
qa problem. If a package wants to install something in a location that 
is deemed inappropriate by the local config, there's a reason behind it, 
the fix may not be easy to develop, and will likely be useless or even 
unacceptable to other users of the recipe. It's better to reconfigure 
the mount points.

Can you perform this check using IMAGE_QA_COMMANDS please?

On a broader note, we've had an open issue to improve image qa testing 
for a long time, so maybe this could be a first step :)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10636

Alex

