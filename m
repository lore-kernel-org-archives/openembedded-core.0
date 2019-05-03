Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9297D543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 09:58:33 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id s3so8201525itk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=flAR2zh3JD9fGvScadAa+wSlW8xS8Fyv+AdTp6feYjc=;
	b=Dk+Gdj0L5FtJUy16NzA/5+nE3xlgHhEN1VeJzSlMDb51mQ9skuqeECKFRWUM7k/KDz
	6itam91P492mzOfQrT/DagtOZmIdl1xmn14sPqMCZzK1/WKdvHQHPciTSyhRK561q61J
	sstKu+CdpW2WLOkIgdyVWvaZSl+TcNjb0v1eIsJ2OENTf/SwsRKYQ6SHPXjf01RGiSBc
	5IefcTMwT8fmmcNEeoIOSgqlOMGymAl5B5MrOca7niQ3ityrB11oamrP/aWMMU8snHd3
	TAtpMMPGOTu7w6GG24wjG6pTdVgAEyGhvjeDdHf0B79cgK0WmONJEdgUNPVROcHlDK1U
	t0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=flAR2zh3JD9fGvScadAa+wSlW8xS8Fyv+AdTp6feYjc=;
	b=ULBlj75p+p1MyhLjm5wtzh/Lo8ssVoO0v9ahhodvs4blHQpn8DDcQJJp6qXVFUpDD9
	tz0GFBndNpNn8xsvPKEtceilC1pTulrBMdwZ91vcZA8sdCW8OAY96qoRAf9R4HJAnMte
	iXL250ov6KExSH0mMkZO+T85PVKLz0WKKdc5c+GNzvuO4t391i0SiWzqJ3XY6AINHXYy
	7xijQXGWcRGdx1eZLxlRT7YTXOsCUfjhG4F4cl6N0Kg6w1U09fktr1+b6F8Jswa6pnJ+
	WeT1mHD771dUMgcgb4CMxvYXI6raSTI1sKpGahTUiTlmxww4/FqnzQJi2rosndImi23h
	1b3g==
X-Gm-Message-State: APjAAAWJqZYnyFKWgPC+8acpw2kHU+c5CP6+2rqIpaPeLUvaOU1+oxpT
	wcUSKZ5Kn1caNsT8Aq75zpE+PHuDtzoGgu0jcjNnXg==
X-Google-Smtp-Source: APXvYqzYGPs23OnaQdVIj4NA19jP8MOyJbv02l5wSzIfYl0GDdgITV6xP5oEMxVBySBoFSRFbCnCvX1XeWSc2kCeC1M=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr5757242itw.26.1556877514403;
	Fri, 03 May 2019 02:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 May 2019 10:58:23 +0100
Message-ID: <CAJTo0LYPgt+hnVkvnMmt85eCW4bjq1rhugRNoXi5CQY+fQKz4g@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, Stefan Agner <stefan.agner@toradex.com>,
	luka.pivk@toradex.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix a libxkbcommon runtime error
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
X-List-Received-Date: Fri, 03 May 2019 09:58:33 -0000
Content-Type: text/plain; charset="UTF-8"

I'd much prefer a dependency that is conditional on the
DISTRO_FEATURES and have an alternative recipe that just ships the
locale data.

Ross

On Thu, 2 May 2019 at 20:41, <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> We had observed a runtime error when we run a QT application on weston
> compositor, as follows:
> | xkbcommon: ERROR: couldn't find a Compose file for locale "C"
>
> after some investigation, we found the libx11-locale is being required
> by libxkbcommon at runtime, or else we get the above error and the QT
> widgets could not get the keyboard events.
>
> To fix the issue, I think there might be two ways:
>
> 1 Allow the libx11 to be built without the requirement for x11 being in
>   DISTRO_FEATURES, as this patch series are trying to do.
> 2 Create another libx11-data recipe to provide the locales of libx11.
>
> I would like to get your input about this fix, please kindly help me
> review it.
>
> Ming Liu (2):
>   meta: unset REQUIRED_DISTRO_FEATURES for libx11 and its dependents
>   libxkbcommon: RDEPENDS on libx11-locale
>
>  meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb       | 2 ++
>  meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb       | 2 ++
>  meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb      | 4 ----
>  meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb     | 2 ++
>  meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
>  meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb       | 2 ++
>  6 files changed, 12 insertions(+), 4 deletions(-)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

