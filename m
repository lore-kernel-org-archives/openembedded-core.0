Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 33D1360079
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 15:43:14 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id o19-v6so14928469iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 07:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pdngBjfJMAVeydLV2mMVxhs4uoUQqSa6M0iFtH0MV/4=;
	b=FVoST1ZQZMW57V37EsAlEAiaxjDlnPHhA3EokTJdKid2iAhmGwaKYzIZnOZaEZSy1z
	fOsEVJddSb7LHvhCwCKqY8jLZaHhwbPF8KPyX3dFryZixCS8K9IlEKmNVcresOGa55ph
	7ryTbQwbq2PTDiSshQ0tEoohmiHlSy0wn6VfpqCkY1KQOpMkhT5/nuuYgm+Tw9ScSsWS
	nHYDVIhFnO6jyzgy8MZUHRAzTbWaAuJJ9A6bMwiXaO8wwAVQMBQPakU5RcLyV9RIYYKy
	GeIu9d3UWLxOfCs0yHijdHfU9LmAvAX8eRj+MgoLmobyV+AQ5Oh63GhTLuqwAL2XdJh8
	YyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pdngBjfJMAVeydLV2mMVxhs4uoUQqSa6M0iFtH0MV/4=;
	b=M8CbHJFRYyYooBpNOEFGV5LfdohCnb2b7gdcfKjPBxRTNib9rQEpdxeiubyNSwKRxr
	jSFCqC1o3VYRZ00L7928s65lqGcr0C+3DrEjuBJlK9M6K/5avsxhsxgJ1dFL2lCJxMv2
	JLj3JWTcSl49R2R9wcSTTS/5MiqAyTRVUmHgAEMwp+3tsfI6iw6f6ASShtmMXv0NUspX
	9vevfuKlIWnhR7PSzZCdQ4K07LVP9EjxOrXpWNH79lGtRA2OUJ0icaiH33TY5o3qHHHA
	zlvUgyKRfbTRfQ0noR+mRHgF1BtXIbUFG3P7kag3rTCUL/kBkppfM5/F3WzqzqvkrdaG
	DJow==
X-Gm-Message-State: AGRZ1gJr5czk5cqSSExcht6BTpUVaTDgPPHk97fFYkAV6UZeZsOXQq4/
	xHqen6D/VEkWcmvjw/FbIYn6jl6K5BFrma5GKpQq8w==
X-Google-Smtp-Source: AJdET5cg7kAAMuKAzoaXONwuv/BjBJ/fC+QL2sp9f+GcLUN1RvT+jjmfUnXFZ/tzm4Eae8MLEqAiW7DscLN9X/2gV8w=
X-Received: by 2002:a6b:fb0a:: with SMTP id
	h10-v6mr3678311iog.270.1541691795134; 
	Thu, 08 Nov 2018 07:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20181106122429.24563-1-ross.burton@intel.com>
	<FB4F7315-9363-4F94-B5B0-3C736A1AE7FA@gmail.com>
In-Reply-To: <FB4F7315-9363-4F94-B5B0-3C736A1AE7FA@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 15:43:02 +0000
Message-ID: <CAJTo0LY1=XkrjSPBJKeDu_y8bo5fZYsfZChHpSsHwyHnV5mCvw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: fix link with new sqlite3
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
X-List-Received-Date: Thu, 08 Nov 2018 15:43:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 14:53, Jens Rehsack <rehsack@gmail.com> wrote:

> I digged a bit deeper (since I'd like to get a reasonable solution even for other dependent components) and would say, pseudo will also fail, when sqlite3 is build using readline or libz.
> The better option will be to let pseudo use the libs and link-flags from sqlite.pc

Yes for libz, but I'd assumed the readline dependency was solely in
the binary not the library.

Annoyingly the fairly simple change to pseudo to make it use
pkg-config for flags then failed to link statically.  If you want to
see what I did and fancy fixing it, then my WIP is in the pkgconfig
branch at https://gitlab.com/rossburton/pseudo.

Ross

