Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4086E8A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:59:19 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w7so1477890lbi.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 05:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=xnO66eFxgzRsKNQSSk9eT+7puQzV5cJznmkGzrL9QJs=;
	b=JCtUrp9K2UMoQCnpMY4I9ZqzPE0X5xHzy45T11l4qHaER8gJKU0tHkufDLP107pH/M
	t9caUVo1gopsxUWpGCZJC4dyVcPfJSWgVjYO2Hx0WV4pZTUSGlu4cLH9EBMXJOB5C6nR
	w2m4xii6A5/1gw+LauuKFMRl1r8WK8brjehGyh/KG6hE5Q1j3VtrUjq0nRBw/hBo3Bc9
	CoSakoM0N+UBa/CpVPAOABBgggf25qa1kyFVLxZLGMk7rNc0pdHnD18lcXDYYzcjg20s
	YiW+hjHa6ManOWNV7q6ZQlGW2h33wzLP1/Z7RRX1m40eeBcbkcn+3HgHmYtn/uk/PAQg
	qdhA==
X-Received: by 10.152.234.139 with SMTP id ue11mr5640781lac.26.1391003959779; 
	Wed, 29 Jan 2014 05:59:19 -0800 (PST)
Received: from [79.102.213.33] (c-4f66d521-74736162.cust.telenor.se.
	[79.102.213.33])
	by mx.google.com with ESMTPSA id sv5sm2609909lbb.9.2014.01.29.05.59.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 05:59:18 -0800 (PST)
Message-ID: <52E90934.3080900@gmail.com>
Date: Wed, 29 Jan 2014 14:59:16 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Jonas Eriksson <jonas.eriksson@enea.com>, 
	openembedded-core@lists.openembedded.org
References: <1390988324-15471-1-git-send-email-jonas.eriksson@enea.com>
In-Reply-To: <1390988324-15471-1-git-send-email-jonas.eriksson@enea.com>
Subject: Re: [PATCH] qemu: Allow building without X11 support
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
X-List-Received-Date: Wed, 29 Jan 2014 13:59:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-01-29 10:38, Jonas Eriksson wrote:
> To enable the construction of minimal hypervisors based on OE, it is
> important to be able to build qemu without it requiring X support. By
> checking that the distro is built with the x11 feature before adding
> virtual/x11 to the dependencies, this is made possible.
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 8705dc7..76119c0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,8 @@
>   SUMMARY = "Fast open source processor emulator"
>   HOMEPAGE = "http://qemu.org"
>   LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
> +DEPENDS = "glib-2.0 zlib alsa-lib pixman dtc libsdl \
> +           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
>   DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
>   DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>   RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
>

Reviewed-by: David Nyström <david.nystrom@enea.com>


