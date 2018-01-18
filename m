Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6388571BF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 19:23:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 11:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,378,1511856000"; d="scan'208";a="194461172"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.10.225])
	by orsmga005.jf.intel.com with ESMTP; 18 Jan 2018 11:23:02 -0800
To: openembedded-core@lists.openembedded.org
References: <20180118191245.9490-1-alistair.francis@xilinx.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <cb001244-b8fa-1425-54fa-98d65d4d43fb@linux.intel.com>
Date: Thu, 18 Jan 2018 19:23:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180118191245.9490-1-alistair.francis@xilinx.com>
Subject: Re: [PATCH] glib-2.0: Re-add the gettext depend
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
X-List-Received-Date: Thu, 18 Jan 2018 19:23:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/01/18 19:12, Alistair Francis wrote:
> Commit "glib-2.0: rationalise build dependencies"
> (8b0ca0cb54c91611213556bdb99316d5e7ac5b3b) broke mingw glib builds with
> the following error:
> 
> This patch fixes the issue by re-adding the gettext dependency.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>   meta/recipes-core/glib-2.0/glib.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 354d95cfe3..e6997ae88f 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -24,6 +24,7 @@ DEPENDS = "glib-2.0-native \
>              virtual/libiconv \
>              libffi \
>              zlib \
> +           gettext \

If this is only required for mingw we should add it in a mingw override, 
something like (untested):

DEPENDS_mingw32 += "gettext"

That way we:
a) know that it's a mingw dependency (and to test that toolchain before 
removing)
b) don't bloat the DEPENDS where gettext isn't a strict requirement.

>              ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
>   
>   PACKAGES += "${PN}-codegen ${PN}-utils"
> 

