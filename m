Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1A45F70101
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:52:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 04 May 2016 02:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="798516944"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.24.244])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2016 02:52:35 -0700
Message-ID: <1462355553.6485.5.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 May 2016 10:52:33 +0100
In-Reply-To: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Wed, 04 May 2016 09:52:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Armin,

On Thu, 2016-04-28 at 11:23 -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 

I've been seeing:

"qemu: uncaught target signal 11 (Segmentation fault) - core dumped"

when trying to build gobject-introspection for qemux86 recently and
narrowed it down to this change, if I revert this patch the use of
qemu-native by gobject-introspection no longer causes a segmentation
fault.

Are we missing some related patches for this CVE fix? I haven't dug
into the details, but noticed that Fedora's CVE-2016-2857 diffstat[1]
is much larger than ours[2].

Regards,

Joshua

1. http://pkgs.fedoraproject.org/cgit/rpms/qemu.git/commit/?id=54cb1301
c61f0be7b96e343902bb09be081b34fe
2. http://git.openembedded.org/openembedded-core/commit/?id=d1b972a55c5
9a3f3336b3ebd309532dc204ea97b

> ---
>  .../recipes-devtools/qemu/qemu/CVE-2016-2857.patch | 51
> ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-
> 2857.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
> new file mode 100644
> index 0000000..73cfa2a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-2857.patch
> @@ -0,0 +1,51 @@
> +From 362786f14a753d8a5256ef97d7c10ed576d6572b Mon Sep 17 00:00:00
> 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Wed, 2 Mar 2016 17:29:58 +0530
> +Subject: [PATCH] net: check packet payload length
> +
> +While computing IP checksum, 'net_checksum_calculate' reads
> +payload length from the packet. It could exceed the given 'data'
> +buffer size. Add a check to avoid it.
> +
> +Reported-by: Liu Ling <liuling-it@360.cn>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Signed-off-by: Jason Wang <jasowang@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-2857
> +
> +http://git.qemu.org/?p=qemu.git;a=commit;h=362786f14a753d8a5256ef97d
> 7c10ed576d6572b
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + net/checksum.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +Index: qemu-2.5.0/net/checksum.c
> +===================================================================
> +--- qemu-2.5.0.orig/net/checksum.c
> ++++ qemu-2.5.0/net/checksum.c
> +@@ -59,6 +59,11 @@ void net_checksum_calculate(uint8_t *dat
> +     int hlen, plen, proto, csum_offset;
> +     uint16_t csum;
> + 
> ++    /* Ensure data has complete L2 & L3 headers. */
> ++    if (length < 14 + 20) {
> ++        return;
> ++    }
> ++
> +     if ((data[14] & 0xf0) != 0x40)
> + 	return; /* not IPv4 */
> +     hlen  = (data[14] & 0x0f) * 4;
> +@@ -76,8 +81,9 @@ void net_checksum_calculate(uint8_t *dat
> + 	return;
> +     }
> + 
> +-    if (plen < csum_offset+2)
> +-	return;
> ++    if (plen < csum_offset + 2 || 14 + hlen + plen > length) {
> ++        return;
> ++    }
> + 
> +     data[14+hlen+csum_offset]   = 0;
> +     data[14+hlen+csum_offset+1] = 0;
> diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-
> devtools/qemu/qemu_2.5.0.bb
> index e9d9a8d..7622386 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
> @@ -11,6 +11,7 @@ SRC_URI += "file://configure-fix-Darwin-target-dete
> ction.patch \
>              file://CVE-2016-2197.patch \
>              file://CVE-2016-2198.patch \
>              file://pathlimit.patch \
> +            file://CVE-2016-2857.patch \
>             "
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.b
> z2"
>  SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
> -- 
> 2.3.5
> 

