Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D945B7669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 14:10:35 +0000 (UTC)
Received: by ioii196 with SMTP id i196so23224944ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=IVvXvvUR+pb8Mv78niSO3a5v1zLJ9CkW+IoXPKOOgzs=;
	b=OjJKVzHtK/FWQO8Fc0+xocYhrFLmKPRGOiqcSCIUnVQhasOzpWsEThtJdDGBP/Ff7u
	UVu194Bg1KoxHffFkn56VW8WUSlAT/YxvVCJYn2+LIXyr0LCqXbSyZ76ZYemM1j+vf8s
	NwSR4BhLs+tm37vQtfX7EB4jbryLSMuV9QY2ytBSPXgq9cosUASs1dismYMDKqCC6Dyr
	QqSg9RDKohV90Swkq3lu5mtu/rV0XUqnSRtJVMOBmrZ3JwhjD0CKHUkiDfQyEd84Evu1
	NnJZGGA2yJ+8IpxSJ70x8B/DaiiFxWsQroCZz7d9nD6sAMhkbwlRqY4kOPtdxN4JBVfB
	clBw==
X-Gm-Message-State: ALoCoQnn0WCr11LQDylvML8dPu0MmG4iZ2oqpZamklsKsO7VScB1HZ3fQDbZKG/oWb5nQsI9p1HA
X-Received: by 10.107.17.206 with SMTP id 75mr31240074ior.140.1441807834986;
	Wed, 09 Sep 2015 07:10:34 -0700 (PDT)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com.
	[209.85.223.179])
	by smtp.gmail.com with ESMTPSA id 3sm1709522igy.10.2015.09.09.07.10.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:10:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so23387332iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:10:33 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr42428354ioi.192.1441807833368; 
	Wed, 09 Sep 2015 07:10:33 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 9 Sep 2015 07:10:33 -0700 (PDT)
In-Reply-To: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
	<e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
Date: Wed, 9 Sep 2015 11:10:33 -0300
Message-ID: <CAP9ODKqwU-SBDQj5kaCDLFz58LX6GhYnzAAjx2aeWbO8jNPfnA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] initramfs-framework: support rootflags and rootfstype boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 14:10:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 10:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> These two parameters are supported by the kernel
> (https://www.kernel.org/doc/Documentation/kernel-parameters.txt). When
> an initramfs is used, the kernel does not mount the rootfs and the
> initramfs needs to react to them.
>
> The boot parameters can be set both by the image creator and
> by users.
>
> Supporting these two parameters is useful:
> - rootflags is needed to ensure that the rootfs is already mounted as
>   intended in the time between starting init and init remounting
>   it (as systemd does); this is critical for IMA where iversion must be
>   active already when system starts writing files.
> - setting it correctly up-front avoids messages from the kernel ("cannot
>   mount ... as ext2 because ...") when trying to guess the desired type.
>
> For example, assuming that only one of ext4/ext3/ext2 is set,
> rootfstype could be set in an image recipe with:
> APPEND_append = "${@''.join([' rootfstype=' + i for i in ['ext4', 'ext3', 'ext2'] if i in d.getVar('IMAGE_FSTYPES', True).split()])}"
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

