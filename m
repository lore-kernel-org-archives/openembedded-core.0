Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 97C9E60746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 03:15:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jul 2016 20:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,432,1464678000"; d="scan'208";a="1030524582"
Received: from hgoginen-mobl3.amr.corp.intel.com (HELO [10.254.61.239])
	([10.254.61.239])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2016 20:15:20 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
	<1469659242-12350-6-git-send-email-anibal.limon@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <f10cdb53-0628-e44a-2c42-c0b488171a3a@linux.intel.com>
Date: Wed, 27 Jul 2016 22:18:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469659242-12350-6-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH 5/5] oeqa/utils/commands.py: Command class improve validations/decoding in output
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
X-List-Received-Date: Thu, 28 Jul 2016 03:15:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anibal,


El 07/27/2016 a las 05:40 PM, Aníbal Limón escribió:
> When run a command sometimes the output isn't provided so validate
I wonder if this problem is related to a timeout, so at some point this 
is reached and no output is shown.
> before trying to encode to utf-8, also some output like BIOS/EFI
> contains characters that can't be codified into utf-8 for this reason
> set errors='replace'.
>
> [YOCTO #10019]
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   meta/lib/oeqa/utils/commands.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
> index 4f79d15..a8e184d 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -78,7 +78,10 @@ class Command(object):
>                   self.process.kill()
>                   self.thread.join()
>   
> -        self.output = self.output.decode("utf-8").rstrip()
> +        if not self.output:
> +            self.output = ""
> +        else:
> +            self.output = self.output.decode("utf-8", errors='replace').rstrip()
>           self.status = self.process.poll()
>   
>           self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))


