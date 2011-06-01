Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QRpVP-0004Xz-CV
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:46:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jun 2011 10:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,304,1304319600"; d="scan'208";a="10455654"
Received: from unknown (HELO [10.255.13.48]) ([10.255.13.48])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2011 10:43:43 -0700
Message-ID: <4DE67A4F.5010703@intel.com>
Date: Wed, 01 Jun 2011 10:43:43 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306865217.git.scott.a.garman@intel.com>	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1306921632.2529.18.camel@phil-desktop>
In-Reply-To: <1306921632.2529.18.camel@phil-desktop>
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 17:46:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 02:47 AM, Phil Blundell wrote:
> On Tue, 2011-05-31 at 12:53 -0700, Scott Garman wrote:
>> This adds a -native recipe for the shadow utilities.
>>
>> The custom --root option allows the the following utilities to be
>> run within a chroot when invoked under pseudo:
>
> Rather than patching the code for all these utilities, can't you just
> wrap them in a call to chroot(8)?  That is, make useradd.bbclass do:
>
> eval $PSEUDO chroot ${STAGING_DIR_TARGET} useradd ...
>
> rather than the existing
>
> eval $PSEUDO useradd --root ${STAGING_DIR_TARGET} ...

That's a reasonable suggestion. I haven't tried it yet, but I have found 
that pseudo's chroot(2) implementation is not complete. One of the cases 
where it does not work is when forking child processes, which breaks the 
jail and the child processes are no longer chroot'ed.

My guess is that chroot(8) is going to call chroot(2) and then fork a 
child process to run its additional arguments.

cc'ing Mark directly in case he has additional comments or needs to 
correct me.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


