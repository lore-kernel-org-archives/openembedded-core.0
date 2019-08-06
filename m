Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 74FD56C3AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:20:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 31so88133946wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jEpc5D7f6j5Wu5UB+j3YMF6dPouPnhqThk+2Hd7UQD8=;
	b=KSqgaa+2tOpbREBneYuFZTkRTQU82BwAWG6DgQQi36L0wgnX62SLUFTY9dKaaiOm1T
	A0kna8htxbQBVU339CsJuTSQF6biEMufNUckCe6p4r0nY9svU3BN6AkK2EjVoflkhPPl
	rcYjZ+H6W1sfYvIPelkUVjJqvS+hgaSER8Kd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jEpc5D7f6j5Wu5UB+j3YMF6dPouPnhqThk+2Hd7UQD8=;
	b=L3OIYa+YGouSGYXSbcNsCXIubMG4yTXWtsdaUuSHmiF3OlFqunYvOd3t7eLiHYyMA0
	l4xKdD0qLeIcNZpgctUD4dsGMad6QmxESnas1Pyepo9tT4GxO3J3B6Fqu+mGzm+41Jmn
	v8GK4md65o4/lV5kf9bUnc3A+3ToqCWbtiXdZMMFyw4qVIpoyElPgcsjpbv5/W1TIK6Y
	8IrRJYxOcgNaB7ugQcs9MmJuF1l1lWUj86xTE1DkgCRG04RRUTS5US0WU+F90/qBn0Zb
	ge088gzi5nAfSSfQhi01OpHaMzlhSMZXUvDhdcD2NZjbgJikUgSbnPeYm5EF5eRhO8SK
	G2OA==
X-Gm-Message-State: APjAAAUjkHIJKSsN4mlmvERg2ssxfsIDDoZUGdO4dp+skHKBjev1zhfM
	iRhna+cD2ToElQZM6PvnowhIcQ==
X-Google-Smtp-Source: APXvYqwROFqq7Ap6iyjS8Dcsd7KR0v8qdp0lnYugchlqtM+WiJyFutcWRdXVapXVy5C5rTaA8hhXYw==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr5159554wrs.136.1565101226204; 
	Tue, 06 Aug 2019 07:20:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e4sm2574170wrh.39.2019.08.06.07.20.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 07:20:25 -0700 (PDT)
Message-ID: <aeeadff58eb8c60f7cf433f22e67b309a9a0d4ca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2019 15:20:16 +0100
In-Reply-To: <20190805163237.106405-1-jason.wessel@windriver.com>
References: <20190805163237.106405-1-jason.wessel@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] pseudo: Fix openat() with a symlink pointing to a directory
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
X-List-Received-Date: Tue, 06 Aug 2019 14:20:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-05 at 09:32 -0700, Jason Wessel wrote:
> While working with ostree disk generation in conjunction with wic, I
> found a problem with pseudo where it tried to resolve a symlink when
> it shouldn't, based on openat() flags. A C program has been
> constructed to test pseudo to show that it is working properly with
> the correct behavior around openat().
> 
[...]
> 
> Many thanks to Peter Seebach for fixing the problem in the pseudo
> code
> to use the same logic which was already there for the
> AT_SYMLINK_NOFOLLOW.
> 
> Also updated is the license MD5 checksum since the master branch of
> pseudo has had the SPDX data updated.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc    | 2 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

pseudo-native didn't build on fedora28 or centos7:

http://errors.yoctoproject.org/Errors/Latest/?filter=9382629d4bbcd26196c36d31ffdf097b30023150&type=commit&limit=150

(see the pseudo-native failures).

It looks like an issue on hosts which don't have zlib-devel installed,
at a very approximate guess -  I've not been able to look in detail.

Cheers,

Richard


