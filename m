Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Uaox4-0005Zs-Oa
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:09:43 +0200
Received: by mail-pb0-f48.google.com with SMTP id ma3so2828637pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=AorFa/FeZ3GkKWVa5wnHJvK+2L2224XEsG5V7IrR2LE=;
	b=S8cf1iXLPtn68KN/TzGuK3tsKuy+kjOgoPboZEz5jk0gSYxF/SRQ9XmKsgvoSdovjC
	2GmnQSfcNdmMzMrOGSBg+ujCoHOsezudRlWlOAZiNK3xqZUip57+DxgTSsdsowRq3Owj
	ZjDOWfRIBl15Xmz7E/93rJj5aTatX5SoLW0PhALRBe6rF6PbSCAwGXJosVR3JYOKtcwC
	uD3NhPx8drOuoSeuJIa60g+OVWetlfZyahF9A1xFtFx3WmMQKeOeHoiJ9tlayvuuNdDw
	LsCGyT2QdvMM9/9jG7ZBfA1ZNX22ByJixtwkKKYBlKXd1JZcjcB8BoxyB6/Ej4sHhtfZ
	MYCA==
X-Received: by 10.66.51.102 with SMTP id j6mr17736929pao.210.1368197496731;
	Fri, 10 May 2013 07:51:36 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id uv1sm2995152pbc.16.2013.05.10.07.51.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 07:51:35 -0700 (PDT)
Message-ID: <518D085C.2090407@gmail.com>
Date: Sat, 11 May 2013 00:46:52 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<38c4fbc026089ad28ec7c1719e720bbc49112f41.1367919920.git.liezhi.yang@windriver.com>
In-Reply-To: <38c4fbc026089ad28ec7c1719e720bbc49112f41.1367919920.git.liezhi.yang@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] image_types.bbclass: replace genext2fs with populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 15:09:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/05/2013 7:48 PM, Robert Yang wrote:
> -oe_mkext4fs () {
> -	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} $1
> -	tune2fs -O extents,uninit_bg,dir_index,has_journal $1
> -	e2fsck -yfDC0 $1 || chk=$?
> -	case $chk in
> -	0|1|2)
> -	    ;;
> -	*)
> -	    return $chk
> -	    ;;
> -	esac
> +	# Create a sparse image block
> +	dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype seek=$ROOTFS_SIZE count=0 bs=1k
> +	yes | mkfs.$fstype $extra_imagecmd ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
yes | mkfs.$fstype can be simplified to mkfs.$fstype -F
> +	populate-extfs.sh ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.$fstype
>   }
Regards,
Jonathan


