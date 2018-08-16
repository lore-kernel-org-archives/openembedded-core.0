Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF07E79092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 04:05:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7G454Hp020417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Aug 2018 21:05:05 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 21:05:03 -0700
To: Alistair Francis <alistair.francis@wdc.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180815222519.25303-1-alistair.francis@wdc.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a02d6015-c5c7-9987-1f44-4744c6a75887@windriver.com>
Date: Thu, 16 Aug 2018 00:05:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180815222519.25303-1-alistair.francis@wdc.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] recipes-devtools: Upgrade QEMU to 3.0
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
X-List-Received-Date: Thu, 16 Aug 2018 04:05:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

LGTM.

Patched and built on an ubu-16.04 box.
I was able to log into both qemux86-64 and qemuppc
using core-image-minimal.

As people might expect, loads has changed:
qemu.git $ git diff v2.12.0..v3.0.0| diffstat| tail -1
  1825 files changed, 101360 insertions(+), 46333 deletions(-)

Have you tested all of the oe-core qemu archs with the upgrade?

Any concerns other than what is listed here:
    https://wiki.qemu.org/ChangeLog/3.0

../Randy


On 08/15/2018 06:25 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc   |  2 +-
>   ...1806-QEMU-slirp-heap-buffer-overflow.patch | 70 -------------------
>   .../qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb}    |  7 +-
>   3 files changed, 4 insertions(+), 75 deletions(-)
>   delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
>   rename meta/recipes-devtools/qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb} (88%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index bed1594b7a..1c9226cb06 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -28,7 +28,7 @@ BINUVERSION ?= "2.31%"
>   GDBVERSION ?= "8.1%"
>   GLIBCVERSION ?= "2.28%"
>   LINUXLIBCVERSION ?= "4.15%"
> -QEMUVERSION ?= "2.12%"
> +QEMUVERSION ?= "3.0%"
>   
>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
> deleted file mode 100644
> index 837b65a79a..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -CVE: CVE-2018-11806
> -Upstream-Status: Backport
> -
> -https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
> -
> -From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
> -From: Jeremy Puhlman <jpuhlman@mvista.com>
> -Date: Thu, 14 Jun 2018 01:28:49 +0000
> -Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
> -
> -Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
> -Date:	Tue, 5 Jun 2018 23:38:35 +0530
> -From: Prasad J Pandit <address@hidden>
> -
> -While reassembling incoming fragmented datagrams, 'm_cat' routine
> -extends the 'mbuf' buffer, if it has insufficient room. It computes
> -a wrong buffer size, which leads to overwriting adjacent heap buffer
> -area. Correct this size computation in m_cat.
> -
> -Reported-by: ZDI Disclosures <address@hidden>
> -Signed-off-by: Prasad J Pandit <address@hidden>
> ----
> - slirp/mbuf.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ----
> - slirp/mbuf.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/slirp/mbuf.c b/slirp/mbuf.c
> -index 5ff2455..7fb4501 100644
> ---- a/slirp/mbuf.c
> -+++ b/slirp/mbuf.c
> -@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
> - 	 * If there's no room, realloc
> - 	 */
> - 	if (M_FREEROOM(m) < n->m_len)
> --		m_inc(m,m->m_size+MINCSIZE);
> -+               m_inc(m, m->m_len + n->m_len);
> -
> - 	memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
> - 	m->m_len += n->m_len;
> -@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
> -
> -         if (m->m_flags & M_EXT) {
> - 	  datasize = m->m_data - m->m_ext;
> --          m->m_ext = g_realloc(m->m_ext, size);
> -+          m->m_ext = g_realloc(m->m_ext, size + datasize);
> - 	  m->m_data = m->m_ext + datasize;
> -         } else {
> - 	  char *dat;
> - 	  datasize = m->m_data - m->m_dat;
> --          dat = g_malloc(size);
> -+          dat = g_malloc(size + datasize);
> - 	  memcpy(dat, m->m_dat, m->m_size);
> -
> - 	  m->m_ext = dat;
> -@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
> - 	  m->m_flags |= M_EXT;
> -         }
> -
> --        m->m_size = size;
> -+        m->m_size = size + datasize;
> -
> - }
> -
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> similarity index 88%
> rename from meta/recipes-devtools/qemu/qemu_2.12.0.bb
> rename to meta/recipes-devtools/qemu/qemu_3.0.0.bb
> index 98db44a8ef..80da0810f1 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN}-ptest = "bash make"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>   
> -SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> +SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>              file://powerpc_rom.bin \
>              file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
>              file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
> @@ -21,7 +21,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>              file://0009-apic-fixup-fallthrough-to-PIC.patch \
>              file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>              file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
> -           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
>              "
>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
>   
> @@ -30,8 +29,8 @@ SRC_URI_append_class-native = " \
>               file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
>               "
>   
> -SRC_URI[md5sum] = "122fd7cdf241ff7eb1e42c0b503b5d1b"
> -SRC_URI[sha256sum] = "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c"
> +SRC_URI[md5sum] = "6a5c8df583406ea24ef25b239c3243e0"
> +SRC_URI[sha256sum] = "8d7af64fe8bd5ea5c3bdf17131a8b858491bcce1ee3839425a6d91fb821b5713"
>   
>   COMPATIBLE_HOST_mipsarchn32 = "null"
>   COMPATIBLE_HOST_mipsarchn64 = "null"
> 


-- 
# Randy MacLeod
# Wind River Linux

