Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3E7877BF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 15:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3BFGbQO006484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:16:37 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 08:16:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
Date: Tue, 11 Apr 2017 10:16:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 15:16:39 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/11/17 9:56 AM, Patrick Ohly wrote:
> gdb-cross used to be specific to the tune flags, but isn't
> anymore. Therefore it is enough to use TARGET_SYS instead of
> TUNE_PKGARCH to create a unique path.

Are you sure about this.  On non-intel architectures, it used to be VERY common
that the specific instruction set for a process was programmed into gdb.

Sometimes the user could (after loading gdb) change the instructions, but this
was an aweful user experience.

Good example of this would be Power, e500, etc.  The instruction sets are not
actually compatible with each other, so GDB needs to know the specific
instruction in order to work.

--Mark

> Fixes a sstate signature difference that was found via
> yocto-compat-layer.py's test_machine_signatures check. In practice it
> probably showed up as unnecessarily rebuilding gdb-cross when
> switching between machines like intel-corei7-64 and qemux86-64.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
> index a34223e..d92f31f 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -24,4 +24,4 @@ BPN = "gdb"
>  inherit cross
>  inherit gettext
>  
> -datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
> +datadir .= "/gdb-${TARGET_SYS}${TARGET_VENDOR}-${TARGET_OS}"
> 


