Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id E1E3D73943
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:29:29 +0000 (UTC)
Received: by yhzz6 with SMTP id z6so15975921yhz.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zuRfQ7yA1j3FLvEvD26q6EsZRCUA4hJtJFteN5cnvZA=;
	b=wUcwWwkDYEF4k3wQ1flh+BIemk+zoA/yMtZGFKrg+zHigdOm/f6XIoz2Lhj2yiE1Dk
	rBuCYfxaCf3CrzKYI+xmzu9A5ZTEqQOr/Q6iCKzzXnprT2geboiNkxhjk8ucn0/e3asW
	uBkSizCid8b+OzuYBt9xIV4LuE8SqCGjKRR9zK4opleSPeIEHDuV6mU6maBQjx7pphJl
	7p/ZPbK9mfpGHhgPMolBoRLPhg0lwIlTq/tmkH5tM8qLm7G2trE71rV35mHg2fUxO6vt
	p0Fd8XShqH2Un1e5ldEDtPmHXJBFhFUdkQB3S3h9QW9HXkKSGhr/em8rfW/qTJ9BrBfZ
	fQVA==
MIME-Version: 1.0
X-Received: by 10.170.162.135 with SMTP id e129mr31298052ykd.110.1425918570758;
	Mon, 09 Mar 2015 09:29:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Mon, 9 Mar 2015 09:29:30 -0700 (PDT)
In-Reply-To: <1425885894-9030-1-git-send-email-B40290@freescale.com>
References: <1425885894-9030-1-git-send-email-B40290@freescale.com>
Date: Mon, 9 Mar 2015 13:29:30 -0300
X-Google-Sender-Auth: ABCtidcGKV3Rm3xWOUnZ3p00j5E
Message-ID: <CAP9ODKqS5rABZZsAue19k3pO-SfHXWRSEwcPt6s+zWDMWF_v6w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot.inc: fix rename image error
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
X-List-Received-Date: Mon, 09 Mar 2015 16:29:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 9, 2015 at 4:24 AM, Chunrong Guo <B40290@freescale.com> wrote:
>   Resolve mismatch between U-Boot configs and uboot image name.
>   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>   and repeat compile or install so we need to check if ${type} match ${config} .
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

I think we have a serious issue here:

+ echo mx6qsabresd_config
+ cut -d_ -f2
+ [ config = sd ]
+ echo mx6qsabresd_sata_config
+ cut -d_ -f2
+ [ sata = sd ]
+ echo mx6qsabresd_config
+ cut -d_ -f2
+ [ config = sata ]
+ echo mx6qsabresd_sata_config
+ cut -d_ -f2
+ [ sata = sata ]
+ oe_runmake O=mx6qsabresd_sata_config mx6qsabresd_sata_config
+ oe_runmake_call O=mx6qsabresd_sata_config mx6qsabresd_sata_config

This is wrong. It shouldn't expect a pattern in the UBOOT_MACHINE
value. Instead it should match the UBOOT_CONFIG for it and done.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

