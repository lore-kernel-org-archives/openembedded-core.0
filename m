Return-Path: <christian.ziethen@linaro.org>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id B740E606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 10:55:05 +0000 (UTC)
Received: by lbbpu9 with SMTP id pu9so79535477lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 03:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=mbEe7BtrqNtBPF/n57RYWDCrKWe+QLL+3pgHm9JjawU=;
	b=R5GE1S86G9H2mUZf0MoKNcJho3dpxq3geUM4SG0ALz/6eQDxQlgfhclksc+6T8M8fO
	duIdmN8Gmer6yANsBjO6e/haqmOoOKwAgVmJUZPvEWZGFBcz7ef51OMZe2dgjgD7AGEx
	3Xja/EcYj3kH9OryppdClDAMmvYEXZX4kSWw7sJMzmiOdIC/Y7ZGVmNAdAvUTf8tg7yh
	sqibRsHMXUqrZQIlVCgcU3YhQ7zn+esq2H34VXzJ6Synv5MTEKqNki/00VTP1LNjk+VO
	JsabLtABhVk19bDLv0GuA6PE47J/I6kIxUkv3dkVEIcdhpBrjqB1RF0qh1ohdmL961cS
	xLmg==
X-Gm-Message-State: ALoCoQneGPra3AjoSoVZx1P1mhtaUaSZ1A+E8gwvb7bE9ADxOxYaMv6v/dRc6phCnFOT/TK/yxFA
X-Received: by 10.152.44.130 with SMTP id e2mr669676lam.14.1439808905416;
	Mon, 17 Aug 2015 03:55:05 -0700 (PDT)
Received: from gmail.com (sestofw01.enea.se. [192.36.1.252])
	by smtp.gmail.com with ESMTPSA id n6sm1633577laf.18.2015.08.17.03.55.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 03:55:04 -0700 (PDT)
Date: Mon, 17 Aug 2015 12:55:03 +0200
From: Christian =?iso-8859-1?Q?Zieth=E9n?= <christian.ziethen@linaro.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150817105502.GB28145@gmail.com>
References: <1437661949-9295-1-git-send-email-christian.ziethen@linaro.org>
	<1437661949-9295-2-git-send-email-christian.ziethen@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1437661949-9295-2-git-send-email-christian.ziethen@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 2/2] boot-directdisk: Make kernel image inclusion conditional.
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
X-List-Received-Date: Mon, 17 Aug 2015 10:55:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

ping

On 2015-07-23 16:32, Christian Ziethén wrote:
> When building for qcow2 and a dummy kernel, avoid installing
> a non existing bzImage.
> 
> Signed-off-by: Christian Ziethén <christian.ziethen@linaro.org>
> ---
>  meta/classes/boot-directdisk.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index d256fff..600e21a 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -70,7 +70,9 @@ boot_direct_populate() {
>  	install -d $dest
>  
>  	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
> -	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
> +	if [ -e ${DEPLOY_DIR_IMAGE}/bzImage ]; then
> +		install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
> +	fi
>  
>  	# initrd is made of concatenation of multiple filesystem images
>  	if [ -n "${INITRD}" ]; then
> -- 
> 2.1.4
> 

