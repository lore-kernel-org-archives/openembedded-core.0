Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABA2860EB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 00:13:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8R0DYOv024351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 17:13:34 -0700 (PDT)
Received: from [128.224.23.54] (128.224.23.54) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 26 Sep 2013 17:13:33 -0700
Message-ID: <5244CDA3.7080607@windriver.com>
Date: Thu, 26 Sep 2013 20:13:23 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>,
	<openembedded-core@lists.openembedded.org>, "Hatle, Mark"
	<mark.hatle@windriver.com>
References: <1380221559-25585-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1380221559-25585-1-git-send-email-jslater@windriver.com>
X-Originating-IP: [128.224.23.54]
Subject: Re: [v2][PATCH 1/1] vala.bbclass: add dependency on vala
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
X-List-Received-Date: Fri, 27 Sep 2013 00:13:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-26 02:52 PM, Joe Slater wrote:
> This class points the inheritor, if it is a target,
> to directories in the target sysroot, so we want to
> be sure the .vapi files are there.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/classes/vala.bbclass |    8 +++++---
>   1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
> index c7db08c..3b70a04 100644
> --- a/meta/classes/vala.bbclass
> +++ b/meta/classes/vala.bbclass
> @@ -1,9 +1,11 @@
>   # Vala has problems with multiple concurrent invocations
>   PARALLEL_MAKE = ""
>
> -# Vala needs vala-native
> -DEPENDS += "vala-native"
> -DEPENDS_virtclass-native += "vala-native"
> +# Everyone needs vala-native and targets need vala, too,
> +# because that is where target builds look for .vapi files.
> +#
> +VALADEPENDS_class-target = "vala"
> +DEPENDS_append = " vala-native ${VALADEPENDS}"
>
>   # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
>   export STAGING_DATADIR
>


In response to your previous patch, Richard P said:
> In class code this is a really bad idea. Why? Imagine a recipe which
> does:
>
> DEPENDS =+ "x"
> DEPENDS_class-native = "y"
>
> The += on the class-native above will not do what you think.
>
> I'd recommend something like:
>
> VALADEPENDS = "vala vala-native"
> VALADEPENDS_class-native = "vala-native"
> DEPENDS += "${VALADEPENDS}"
>
> Most other classes actually use _append on DEPENDS to ensure consistent
> behaviour.

so send it to oe-core and see what they say.
Mark H any comments?

// Randy

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

