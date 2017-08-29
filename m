Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEE478325
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:03:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l19so5074992wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IAEuG+8KFHm7oT5Bf7Ku7R5DQpKtlS4Gblz6Ih6EeGw=;
	b=TUn6087R/XMuGOAruI3Sd3ukYO+0tk9ojmo5CGYcLOu8KSexeyr6chEgC0QSzP2NrH
	ZoaMS5LM0Acii1tXOOYQjv57DntaFZnsMzqejahRT/I26XCho+0volVwtuArf0tkviUm
	REF11LteAQTieL3l2V10JrHOTFzDaqfVudZ9wpFhzcWAXIkVN7licdHqbmIbyoMT4Mhf
	91rxrRvnl41rDIkLQDZNy0bXktaUhuJG5VG71oY6qKkkqgVZ65GBfwPvD/94f00VCTY+
	NVQNWvVul4s9pKRV9p66Ni7ZQoPGISlwiZVKA+78tLlChH05BBiDrATbqQ1ZBF7Zz0Hz
	NqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IAEuG+8KFHm7oT5Bf7Ku7R5DQpKtlS4Gblz6Ih6EeGw=;
	b=mySrQ70y9Fn9Ji1v/Dh/GmBKRsX0Ky8yEwwk0bsGS/TkwbAU358BFIZ8J7/vQte6ee
	SZvp3RWlvj57ev3S6RbnMKVCkFQ+8a5bzRkc7M+QcLX75y358eKVGU6BCrPtVX8enqgR
	Ik0PA/NBmgM5X+gQfBLiiFVz/o/A2ZDcDEETKVnM1YpOUD8K1yWN0/KOzRUSi0qEALog
	f5neImpK+wNTN9iRw9UJ/ZKsUwxBqbUpGOyCAZBXQuXCi42JkFlRZeCXV6g5ii94jDtB
	npps8FSSTLyVgkC4ajI+Xd4YOXjZSqPaWmesMTNufYsz6LbC294UEJ/TfoOOck5dvkox
	P9ow==
X-Gm-Message-State: AHYfb5hngvcM9kvKLzgV03l2Kv+h4cHb/KIukoePAg+T7QQ/8SgLp0ec
	eqWUL+NW+nt67wXtdz8c7lLF/pBx8w==
X-Received: by 10.28.185.12 with SMTP id j12mr12209wmf.100.1504044211934; Tue,
	29 Aug 2017 15:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Tue, 29 Aug 2017 15:03:31 -0700 (PDT)
In-Reply-To: <70b15633357a418095d460b943d3e994@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 Aug 2017 15:03:31 -0700
Message-ID: <CAJ86T=UBJz2HVnevLKc7CBiG1x6JAdezdq3jC19+5aWno5Lj2g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Tue, 29 Aug 2017 22:03:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 29, 2017 at 1:59 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> We do have a daily job that cleans up the global sstate cache and
> removes files that have not been accessed in the last ten days, but
> it seems unlikely that it should remove a file that just happens to
> be required again, and do it at exactly the time when that task is
> building.

I guess you've already confirmed that accessing the sstate files over
NFS does actually modify atime on the server (and that the filesystem
on the server really does have atime support enabled, e.g. mounted
with strictatime rather than relatime etc)?

If access time isn't being determined reliably and sstate files are
being removed 10 days after being created then that might make the
race a little more likely to trigger.

