Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 00D2B76DFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 16:40:03 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so29394663pad.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=fGEHvzgpJU1tjcGBN4MotSQKQo5/jy4iw2IYqT0nBMA=;
	b=mbY4DTx8ppSKQniajq0+PUOmZF8GiTBRWjAIi0mdL1bXqoBKcPs/1rdTcakjJSglzw
	ucsRK9QS6RpSKhSLCOKZASenMBn7hfxU1FM/ywkU++xF7ku/NlY02Ps7+77VexQXVXwq
	+hQirJINbza4XDRLsMWew9RutkIRuvVjJG/5s4/iXwKR1NUlGv/m9GGQb74ETCL12cIu
	/GFNSzlvd24apUKs6QN9kXLFNY6nbGNoK8EDamymzKldMg/wCRroKh/pMPSlgKVW6+E8
	Ff1uyouiMbByRPgqw0WETbNFH3ZNON12Cup1GGdVeGVcYBruAG+pC1zjSK5eGDJ8UH1Q
	6LaQ==
X-Received: by 10.66.251.197 with SMTP id zm5mr15949512pac.157.1440780004232; 
	Fri, 28 Aug 2015 09:40:04 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d511:789c:724b:54b9?
	([2601:202:4000:1239:d511:789c:724b:54b9])
	by smtp.googlemail.com with ESMTPSA id
	bz1sm6234681pbb.85.2015.08.28.09.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 09:40:03 -0700 (PDT)
Message-ID: <55E08EE1.50403@gmail.com>
Date: Fri, 28 Aug 2015 09:40:01 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1440496207-22738-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1440496207-22738-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] qemu-slirp: CVE-2014-3640
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
X-List-Received-Date: Fri, 28 Aug 2015 16:40:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

merged to staging

thanks
- armin

On 08/25/2015 02:50 AM, Sona Sarmadi wrote:
> Fixes NULL pointer deref in sosendto().
> 
> Reference:
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3640
> 
> Upstream patch:
> http://git.qemu.org/?p=qemu.git;a=commit;
> h=9a72433843d912a45046959b1953861211d1838d
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch b/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
> new file mode 100644
> index 0000000..a7ecf31
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
> @@ -0,0 +1,48 @@
> +From 9a72433843d912a45046959b1953861211d1838d Mon Sep 17 00:00:00 2001
> +From: Petr Matousek <pmatouse@redhat.com>
> +Date: Thu, 18 Sep 2014 08:35:37 +0200
> +Subject: [PATCH] slirp: udp: fix NULL pointer dereference because of
> + uninitialized socket
> +
> +When guest sends udp packet with source port and source addr 0,
> +uninitialized socket is picked up when looking for matching and already
> +created udp sockets, and later passed to sosendto() where NULL pointer
> +dereference is hit during so->slirp->vnetwork_mask.s_addr access.
> +
> +Fix this by checking that the socket is not just a socket stub.
> +
> +This is CVE-2014-3640.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Petr Matousek <pmatouse@redhat.com>
> +Reported-by: Xavier Mehrenberger <xavier.mehrenberger@airbus.com>
> +Reported-by: Stephane Duverger <stephane.duverger@eads.net>
> +Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> +Message-id: 20140918063537.GX9321@dhcp-25-225.brq.redhat.com
> +Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> +(cherry picked from commit 01f7cecf0037997cb0e58ec0d56bf9b5a6f7cb2a)
> +Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + slirp/udp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/slirp/udp.c b/slirp/udp.c
> +index 8cc6cb6..f77e00f 100644
> +--- a/slirp/udp.c
> ++++ b/slirp/udp.c
> +@@ -152,7 +152,7 @@ udp_input(register struct mbuf *m, int iphlen)
> + 	 * Locate pcb for datagram.
> + 	 */
> + 	so = slirp->udp_last_so;
> +-	if (so->so_lport != uh->uh_sport ||
> ++	if (so == &slirp->udb || so->so_lport != uh->uh_sport ||
> + 	    so->so_laddr.s_addr != ip->ip_src.s_addr) {
> + 		struct socket *tmp;
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> index 444a422..92a89d6 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> @@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://qemu-CVE-2015-3456.patch \
>              file://CVE-2014-7840.patch \
>              file://vnc-CVE-2014-7815.patch \
> +            file://slirp-CVE-2014-3640.patch \
>              "
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
> 

