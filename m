Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD73B6022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:59:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 27 Sep 2016 11:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,406,1470726000"; d="scan'208";a="884403431"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.5])
	by orsmga003.jf.intel.com with ESMTP; 27 Sep 2016 11:59:44 -0700
Message-ID: <1475002783.3072.13.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: California Sullivan <california.l.sullivan@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 19:59:43 +0100
In-Reply-To: <1475000836-12716-1-git-send-email-california.l.sullivan@intel.com>
References: <1475000836-12716-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH RFC] scripts/runqemu: Be more loose when guessing QB_SYSTEM_NAME variable
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
X-List-Received-Date: Tue, 27 Sep 2016 18:59:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-27 at 11:27 -0700, California Sullivan wrote:
> Following the instructions to reproduce YOCTO #10026 I found that
> runqemu would fail to start because QB_SYSTEM_NAME is null. This
> patch
> makes the guessing algorithm more loose allowing it to correctly
> guess
> the variable from the MACHINE name.

Out of interest can you help me understand how/when the current code
fails?

> 
> It is still a good assumption that if it contains "qemux86-64" for
> example, that the system is x86-64, so this is unlikely to cause any
> new issues while preserving some peoples' old workflows.
> 
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  scripts/runqemu | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 45bcad7..b06d09e 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -870,20 +870,20 @@ class BaseConfig(object):
>          if not mach:
>              return None
>  
> -        if mach == 'qemuarm':
> -            qbsys = 'arm'
> -        elif mach == 'qemuarm64':
> +        elif 'qemuarm64' in mach:

This elif should be below the "if 'qemuarm' in mach" below which begins
the control flow statements for determining the value to assign to the
qbsys variable.

>              qbsys = 'aarch64'
> -        elif mach == 'qemux86':
> -            qbsys = 'i386'
> -        elif mach == 'qemux86-64':
> +        if 'qemuarm' in mach:
> +            qbsys = 'arm'
> +        elif 'qemux86-64' in mach:
>              qbsys = 'x86_64'
> -        elif mach == 'qemuppc':
> +        elif 'qemux86' in mach:
> +            qbsys = 'i386'
> +        elif 'qemuppc' in mach:
>              qbsys = 'ppc'
> -        elif mach == 'qemumips':
> -            qbsys = 'mips'
> -        elif mach == 'qemumips64':
> +        elif 'qemumips64' in mach:
>              qbsys = 'mips64'
> +        elif 'qemumips' in mach:
> +            qbsys = 'mips'
>  
>          return 'qemu-system-%s' % qbsys
>  
> -- 
> 2.5.5
> 

