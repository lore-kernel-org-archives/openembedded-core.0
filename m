Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD6D73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:03:41 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so7625303pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sFYX4SQCAJHRS1eKWz4efFJ3V777JtfaGe+ZUO/IsKg=;
	b=eGF2TGtQsyyeNTNvlD5q7pDcBtc6veP/abgfQMMsh4v/EGDBS4KoPoh2jQpwLNEetB
	g2TZZrobwEaMQc1l2HR8f9K2llJf9Y1gnXsOYTug2RGp706GOl2M3ch85LeHGrPWvuKw
	p7f4bz25NxsXKNaqcEi+M04pZ7n4oY3OuV6n7MbDDGJqnLClXOoZef2yWFv1XETm/CFq
	hwlv8nyyXDsCCwiSJYEdjUkPXlLrpOHVWm4TK0h5KD5bgpq3iiXtLpAguY8ab8xssCPP
	2OjOVt7HcAO2oc+AQx4FC0CW60yoU4w3FdXo8zvcUvEfmoF//GsxHzfKamQ/TOmFIpi7
	kw6g==
X-Received: by 10.70.47.40 with SMTP id a8mr860783pdn.7.1440032621645;
	Wed, 19 Aug 2015 18:03:41 -0700 (PDT)
Received: from Akusters-laptop-2.local
	([2601:202:4000:1239:30b9:3948:d6b8:54e0])
	by smtp.googlemail.com with ESMTPSA id
	tm3sm2208095pbc.27.2015.08.19.18.03.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 18:03:40 -0700 (PDT)
Message-ID: <55D5276B.7000402@gmail.com>
Date: Wed, 19 Aug 2015 18:03:39 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Sona Sarmadi <sona.sarmadi@enea.com>, 
	openembedded-core@lists.openembedded.org
References: <1439986469-23056-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1439986469-23056-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] qemu-vnc: CVE-2014-7815
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
X-List-Received-Date: Thu, 20 Aug 2015 01:03:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 8/19/15 5:14 AM, Sona Sarmadi wrote:
> Fixes an uninitialized data structure use flaw in qemu-vnc
> which allows remote attackers to cause a denial of service
> (crash).
>
> Upstream patch:
> http://git.qemu.org/?p=qemu.git;a=commit;
> h=b2f1d90530301d7915dddc8a750063757675b21a
>
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-7815
> http://www.securityfocus.com/bid/70998
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
merged to staging,
Armin
> ---
>  .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch b/meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
> new file mode 100644
> index 0000000..10a6dac
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
> @@ -0,0 +1,53 @@
> +From b2f1d90530301d7915dddc8a750063757675b21a Mon Sep 17 00:00:00 2001
> +From: Petr Matousek <pmatouse@redhat.com>
> +Date: Mon, 27 Oct 2014 12:41:44 +0100
> +Subject: [PATCH] vnc: sanitize bits_per_pixel from the client
> +
> +bits_per_pixel that are less than 8 could result in accessing
> +non-initialized buffers later in the code due to the expectation
> +that bytes_per_pixel value that is used to initialize these buffers is
> +never zero.
> +
> +To fix this check that bits_per_pixel from the client is one of the
> +values that the rfb protocol specification allows.
> +
> +This is CVE-2014-7815.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Petr Matousek <pmatouse@redhat.com>
> +
> +[ kraxel: apply codestyle fix ]
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +(cherry picked from commit e6908bfe8e07f2b452e78e677da1b45b1c0f6829)
> +Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + ui/vnc.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/ui/vnc.c b/ui/vnc.c
> +index f8d9b7d..87e34ae 100644
> +--- a/ui/vnc.c
> ++++ b/ui/vnc.c
> +@@ -2026,6 +2026,16 @@ static void set_pixel_format(VncState *vs,
> +         return;
> +     }
> + 
> ++    switch (bits_per_pixel) {
> ++    case 8:
> ++    case 16:
> ++    case 32:
> ++        break;
> ++    default:
> ++        vnc_client_error(vs);
> ++        return;
> ++    }
> ++
> +     vs->client_pf.rmax = red_max;
> +     vs->client_pf.rbits = hweight_long(red_max);
> +     vs->client_pf.rshift = red_shift;
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> index 5e5ecf0..444a422 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
> @@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
>              file://qemu-CVE-2015-3456.patch \
>              file://CVE-2014-7840.patch \
> +            file://vnc-CVE-2014-7815.patch \
>              "
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"


