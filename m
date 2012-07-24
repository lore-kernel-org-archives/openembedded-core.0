Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1StZlH-0002zh-E3
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 09:42:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jul 2012 00:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="197224979"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2012 00:29:57 -0700
Message-ID: <500E50C5.8000403@intel.com>
Date: Tue, 24 Jul 2012 10:37:41 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Tue, 24 Jul 2012 07:42:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

As far as kmod package is concerned O_CLOEXEC is used in constructs like 
"O_RDONLY|O_CLOEXEC". O_CLOEXEC can be used (is defined) starting with 
Linux kernel ≥2.6.23 and glibc ≥2.7 case in which the patch does not 
logically changing anything. However, prior Linux kernel ≥2.6.23 
O_CLOEXEC is not defined (the case for CentOS 5.8 - kernel 2.6.18) and 
using it in code will cause build errors. My patch provides a workaround 
for those distributions that do not have O_CLOEXEC define, just to be 
able to build stuff. I have not tested on CentOS 5.8 if the applications 
are not broken in some way, but that's not in the scope of this patch. 
If something does indeed break, then a totally different patch is 
required, targeting a backport of kmod for kernel older than 2.6.23.

Radu

On 07/23/2012 05:34 PM, Enrico Scholz wrote:
> Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>> Close-on-exec seems to be unsuported on some architectures like CentOS 5.8
>> and thus causing some packages to fail to build successfully.
> Have you verified that making O_CLOEXEC a noop does not break the
> applications?
>
>
> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




