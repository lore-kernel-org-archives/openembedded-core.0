Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6F43607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:44:44 +0000 (UTC)
Received: by iggf3 with SMTP id f3so23027146igg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=VhlbBiPuCPFhAHdTbEKRFk1FrXvmoHPIdjcKkXzem1o=;
	b=hICyI2hVr6b/sB1jr4alPPRcPqHcARgdp3orc8A98cmhadu7AJ2EXRQGnQo7eNBz/d
	G+LzGqID4LLJwsYrWlKRPWv8eAYSoYrzh6CEQsSlEffpMyZJSU2/R1fB5GGpBfW8fkC2
	ObxsezdnkXwq9E57XWinc3wYJKAVq/ZIcXLmRgdyrlc6jTWgehzkeRDW7vjomMDbFtWL
	lKmTC+TzRWqkz6wDBY82q8EGWi9WvQQuCFcNVcqL3wYCHHarcY0fTrmL/Vz5cbqtmYEv
	Aqg+EtHxum4AE2xBoA2ygGjzz8e1i7JwQVOfAUZY1cDTUciEpIZh69S+n4CwYG9oNyFa
	ZhQQ==
X-Gm-Message-State: ALoCoQmqK2EGW5bj0aGdHrEF9+dvueHLM5driOk6X1w3agEe2rqYAcURlb3JZSzpHXsLscXlGcSG
X-Received: by 10.50.39.17 with SMTP id l17mr5607432igk.75.1437079484713;
	Thu, 16 Jul 2015 13:44:44 -0700 (PDT)
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com.
	[209.85.223.173]) by smtp.gmail.com with ESMTPSA id
	ig10sm2066699igb.21.2015.07.16.13.44.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 13:44:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ietj16 with SMTP id j16so64393246iet.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:44:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.57.102 with SMTP id h6mr6082773igq.72.1437079482680; Thu,
	16 Jul 2015 13:44:42 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 16 Jul 2015 13:44:42 -0700 (PDT)
In-Reply-To: <1437074585-8963-31-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1437074585-8963-1-git-send-email-lauren.post@freescale.com>
	<1437074585-8963-31-git-send-email-lauren.post@freescale.com>
Date: Thu, 16 Jul 2015 17:44:42 -0300
Message-ID: <CAP9ODKpQcX6yCHDQkF0eDkhkH-Ft_A6NgQB1VGRxRDGv3r9HTg@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-freescale] [meta-fsl-arm][PATCH v2 30/32] conman: Add configuration to fix ethernet port with NFS
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
X-List-Received-Date: Thu, 16 Jul 2015 20:44:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello Lauren,

On Thu, Jul 16, 2015 at 4:23 PM, Lauren Post <lauren.post@freescale.com> wrote:
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
...
> diff --git a/recipes-connectivity/connman/connman_%.bbappend b/recipes-connectivity/connman/connman_%.bbappend
> new file mode 100644
> index 0000000..1090214
> --- /dev/null
> +++ b/recipes-connectivity/connman/connman_%.bbappend
> @@ -0,0 +1,7 @@
> +
> +do_install_append() {
> +     # This patch will fix to the issue that 2 Ethernet port board failed to mount nfs rootfs
> +    if [ -e ${D}${sysconfdir}/init.d/connman ]; then
> +        sed -e 's/ifconfig | grep \"^eth\" | sed -e \"s\//dmesg | grep \"device=eth\" | sed -e \"s\/^.*/' -i ${D}${sysconfdir}/init.d/connman
> +    fi
> +}

This is a very ugly hack and I think we need to address this in a generic way.

I am adding OE-Core in copy so we can try to come up with a generic
solution for this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

