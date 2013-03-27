Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKnmz-00059R-At
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 11:41:24 +0100
Received: by mail-ve0-f174.google.com with SMTP id jz10so3894333veb.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 03:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=MkFCBnxXDbNqvRl7//MGX5gNcs9RF/F7VRnY7zFTLtc=;
	b=iuuJw6/3kccDBUDjmhHhLlyzqd+uLk2PSTjnjglgtfajLR3T/BG153cQlg7V4gtJAW
	VFQUIoz6ig7F/45aYGbOX39nnRYoLHUxNhNpgQXszIBXBcZnh08AUNY741GF873JXgRm
	Kk7PnLIOVvzmruDns8Z8iz28Sz14xAzwDtd6JeVFV52Im908nNggPiTYPY/DHPo7mEBL
	OtmmT7m3OK2XNrYeiBbZ8mXc+aV/pxEFHVRlVdaQKKDsrzkRzNSmXiiAiM9/nGWFCgpm
	p2b149rFk5d5hMMbYQ0Gg6HExkVOM/qlfnECjfX5R57PFO38/fs7QKfaHL2aM74r6tN3
	7WnA==
X-Received: by 10.220.177.138 with SMTP id bi10mr18236295vcb.31.1364379844156; 
	Wed, 27 Mar 2013 03:24:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 27 Mar 2013 03:23:44 -0700 (PDT)
In-Reply-To: <CALbNGRTq6A9RoAdyHXeun_vhmsgEyRgV8wSY+xCdRsS7-BdPJA@mail.gmail.com>
References: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb8-CbnMtcxgximM7W_2YxbexGB49VLM+HbEqQrWHGpYg@mail.gmail.com>
	<CALbNGRQVd3yi7bEuCO_Yyh_RVnnfcB0k9yMG3jHg_BCF9=2Reg@mail.gmail.com>
	<1364298513.3097.75.camel@ted>
	<CALbNGRSvGR75F4-bg123eQhTFaM_ex9Rs=Hyo2-Y6o8m2v9w0Q@mail.gmail.com>
	<1364340556.28471.2.camel@ted>
	<CALbNGRQE4kGAmeXQ2TqfVqb4rFkQeQJua6COxBEvQNh-FbAKSg@mail.gmail.com>
	<CALbNGRTq6A9RoAdyHXeun_vhmsgEyRgV8wSY+xCdRsS7-BdPJA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Mar 2013 10:23:44 +0000
Message-ID: <CAJTo0LbxZfG5M4koRxRFCLDmfjxn2afT2Sd=cfFvr04BoU=i7g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQkmOI1i+7aGvRNE22I24gn3rh3pCygG85MdmEY99JeWlwtZJ5LNXu08mgE/I8e8jUwqVXaS
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
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
X-List-Received-Date: Wed, 27 Mar 2013 10:41:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 27 March 2013 08:27, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> meta-browser: chromium

The latest commit to the Chromium 24 recipe changes gtk+-native to
gtk+, so it appears that any gtk+-native references you're seeing are
bad and the same fix should be applied to the other versions.

> openembedded-core: packagegroup-toolset-native

This is a packagegroup that builds ~all of the native packages.

> openembedded-core: sstate.bbclass

    def isPostInstDep(x):
        if x in ["qemu-native", "gdk-pixbuf-native", "gtk+-native",
"qemuwrapper-cross", "depmodwrapper-cross",
"systemd-systemctl-native", "gtk-update-icon-cache-native"]:
            return True
        return False

Some sstate black magic.

> openembedded-core: seperatebuilddir.inc

Just a variable saying it can be built out of tree.

packagegroup-toolset-native is the only place that actually uses
gtk+-native, so anyone actually using that for whatever purpose will
need to set the preferred provider.

Ross


