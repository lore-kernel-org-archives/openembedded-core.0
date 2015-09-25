Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4234A7391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 04:48:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P4mtBb018161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Sep 2015 21:48:55 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 21:48:55 -0700
Message-ID: <5604D235.8070306@windriver.com>
Date: Fri, 25 Sep 2015 12:48:53 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
	<CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
In-Reply-To: <CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Fri, 25 Sep 2015 04:48:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2015 07:49 PM, Jussi Kukkonen wrote:
> On 24 September 2015 at 14:04, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     From: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>
>     * gnutls.pc:
>        -L/path/to/tmp/sysroots/qemux86-64/lib64 -> -L/lib64
>
>
> I'm not seeing this problem and gnutls.pc.in <http://gnutls.pc.in> file
> looks ok to me. Any idea how I could reproduce this?

Sorry for the confusion, I'll update the commit logs.

To reproduce the issue with qemux86-64:

1. update local.conf:

MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "x86"
DEFAULTTUNE_virtclass-multilib-lib64 ?= "x86-64"

2. run bitbake gnutls

3. check gnutls.pc:

Libs.private: 
-L/buildarea/raid5/wfan/yocto/builds/poky-build/tmp/sysroots/qemux86-64/usr/lib64 
-lz        -lgmp

Thanks
Wenzong

>
> Jussi
>
>     Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
>     <mailto:wenzong.fan@windriver.com>>
>     ---
>       meta/recipes-support/gnutls/gnutls.inc | 5 +++++
>       1 file changed, 5 insertions(+)
>
>     diff --git a/meta/recipes-support/gnutls/gnutls.inc
>     b/meta/recipes-support/gnutls/gnutls.inc
>     index e9b138a..0a5e663 100644
>     --- a/meta/recipes-support/gnutls/gnutls.inc
>     +++ b/meta/recipes-support/gnutls/gnutls.inc
>     @@ -38,6 +38,11 @@ PACKAGECONFIG ??= "zlib"
>       PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
>       PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
>
>     +do_install_append() {
>     +       # cleanup buildpaths from gnutls.pc
>     +       sed -i -e 's#${STAGING_DIR_HOST}##g'
>     ${D}${libdir}/pkgconfig/gnutls.pc
>     +}
>     +
>       PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>       FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

