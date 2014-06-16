Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id D57636B3A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:12:57 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id v10so7584743qac.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KdQ8wzK9EvP8ykN/DbFImFJ5F4gkLobhi3hraVga2oU=;
	b=IMxuGpeDbOGdbeNwEe6jBdtxzLVtKMKWTDSrPkUIXUVXf5Og5OPJmfZuhJ9ACeGCfr
	MFo42dQSScurUZQRRAT5YzO2EXx+K84Q9F5wy0VYYcAVtzSKNzZCNU79uTrfMMwBT8Pi
	jHizSw9tswZvJFmw+nNyD+HofV5fnHhi9ny1CkPmySrEiXKoam7SI6374AlhgkAhdrc0
	LROmZ8fUWEfF9CsywfzxCr2/WRmvA2bZwbmecsQqHRMpFx3mTMxVt8Ot4nCiKMkFjp47
	HfWTFQqKSLGnFEz+g+0SYvgwphNHv2XHSeNe7WUquAnPiEy9iYX/TxSQQ0yuZCMm4h+K
	nRwA==
X-Gm-Message-State: ALoCoQnY6ZnPBIakvZlLy+k1MmPVhQqTI7+afSd5k8JDLJe1pAOtJ2QVwEeCpJgv01U0MffGFyr1
X-Received: by 10.224.165.70 with SMTP id h6mr27384050qay.78.1402931578055;
	Mon, 16 Jun 2014 08:12:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 16 Jun 2014 08:12:37 -0700 (PDT)
In-Reply-To: <539F08D0.7060602@digi.com>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<539EDD51.9060508@digi.com>
	<CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
	<539F08D0.7060602@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jun 2014 16:12:37 +0100
Message-ID: <CAJTo0Lby+ctMeFe8_NhgpCAuazw4OHkNvPEo=53h5hhJfMuKRg@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 16 Jun 2014 15:13:04 -0000
Content-Type: text/plain; charset=UTF-8

On 16 June 2014 16:10, Javier Viguera <javier.viguera@digi.com> wrote:
> Attached the obvious cherry-pick of the commit from *master* with a basic
> conflict solved. But I don't think this is acceptable in an already-released
> stable branch "Daisy" as it involves a recipe rename (dbus-ptest_1.6.18.bb
> => dbus-test_1.6.18.bb) that probably will break the projects of current
> users of yocto Daisy.
>
> Instead, would a basic change like the following be enough?:
>
>
> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest',
> 'dbus-ptest-ptest', '', d)}"
> +RDEPENDS_dbus = "${@base_contains('PTEST_ENABLED', '1', 'dbus-ptest-ptest',
> '', d)}"
>
> This does not change any recipe name so it seems suitable for a bug-fix only
> branch but unfortunately this goes beyond my skills in Yocto and ptest
> framework so any advise would be appreciated.

That change doesn't solve your problem, so no.  I'm not the daisy
maintainer but I can see a good argument for merging the change even
with the rename.

Ross

