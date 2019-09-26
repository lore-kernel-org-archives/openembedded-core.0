Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 058336BF37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 20:31:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n14so235843wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pUjjy04AXXGHHR5rukkJZEpAGlUvixP8jx1E0LywsJY=;
	b=dyvpRDoD/JquJoFgadqXHfBnW4NTV7qoSn78/4OVDXCvPya8ar6jHFM0Yp0DjHdyEV
	MdMmpJ+9Hr8D7y8vF/dBppl0P9+IuSZSjKLrPlytLx2oFzxybJxwL9CLlE37/dI/gxxH
	OMpm+N4Sj6ydefpS2mnYtnPM3k77bevqbO3hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pUjjy04AXXGHHR5rukkJZEpAGlUvixP8jx1E0LywsJY=;
	b=fDVtzOYIb0X2cCeHbKbAkRee4NdorotW6mXXTnNd3KOvRNhRO/LRMXT1rtH53G+g5J
	xeYqxhnxK7WDeaISF+myNyeyngcR7HPlNbFx/ABniBPgA/ZPj7LURdxJA4XbwGj79FSE
	QdYfQxXp1lDVL+B5cA3na8GRb2TOeQOKIpzTrTt9tA8vREAW8p+yxgShjhrExswWOkL5
	qztv4z7pizLmwnelCzpGFoKyq+8y+G3PTEbBUs43K+inKCEG1Y51nYWTetG3hvM97e78
	+s6ap7Aa7bqyrWRw6vyHT19GMs9bOtDnmm2vK3cCsYd/viFCsdFo1jnQu7u3kSNTdNDU
	sDkg==
X-Gm-Message-State: APjAAAWaKXKp4D+i4AjXJ/f0yCxDa6Bm17d3MmdZrhpGlbyjZwalDxEO
	MeXfBlH3Hd6BxWe1z+sPUBz0Rfapkds=
X-Google-Smtp-Source: APXvYqwzaF+oPZI9UPiytcaboSYP9piy/QDCuky1UY4d0eIdGd9TSvRnXO/G092L5T+8JNG2GTHZNg==
X-Received: by 2002:adf:a415:: with SMTP id d21mr230798wra.94.1569529908485;
	Thu, 26 Sep 2019 13:31:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b194sm7734573wmg.46.2019.09.26.13.31.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 13:31:47 -0700 (PDT)
Message-ID: <005f542adcf8904ec7fc2cd45e1c2cc8aa532cba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@betafive.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 21:31:46 +0100
In-Reply-To: <20190924090609.264248-1-paul@betafive.co.uk>
References: <20190924090609.264248-1-paul@betafive.co.uk>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] Add new mirror archiver mode
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
X-List-Received-Date: Thu, 26 Sep 2019 20:31:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-09-24 at 10:06 +0100, Paul Barker wrote:
> This patch allows the creation of a full source mirror using the
> archiver
> bbclass. Using the archiver allows us to make use of copyleft license
> filtering, recipe type filtering and other features that are not
> available if
> we just copy the contents of the downloads directory itself to create
> a
> mirror. We also get the advantage of sstate caching and we don't have
> to
> throw away the entire downloads directory before building to keep
> sources for
> other builds out of our mirror.
> 
> The resulting mirror may be published and used as an entry in
> PREMIRRORS or
> MIRRORS for a subsequent build. The functionality is explained in
> more detail
> in the patch commit message and the additions to the documentation
> comments.
> 
> We've been using this patch in our Oryx Linux distro for a few months
> now to
> confirm that it works as expected. All feedback is welcome,
> especially from
> people who have worked on the archiver bbclass before.
> 
> Mirror creation was tested with the following additions to
> local.conf:
> 
>     INHERIT += "archiver"
>     BB_GENERATE_MIRROR_TARBALLS = "1"
>     ARCHIVER_MODE[src] = "mirror"
>     ARCHIVER_MODE[mirror] = "combined"
>     ARCHIVER_MIRROR_EXCLUDE = "file://"
>     COPYLEFT_LICENSE_INCLUDE = "*"
> 
> The resulting mirror directory was moved out of the tmpdir and a
> rebuild was
> tested with the following additions to local.conf:
> 
>     BB_NO_NETWORK = "1"
>     INHERIT += "own-mirrors"
>     SOURCE_MIRROR_URL = "file://${TOPDIR}/mirror"
> 
> Paul Barker (1):
>   archiver.bbclass: Add new mirror archiver mode
> 
>  meta/classes/archiver.bbclass | 136 +++++++++++++++++++++++++++++---
> --
>  1 file changed, 117 insertions(+), 19 deletions(-)

This is coming in a bit late to be in 3.0 as we're way past feature
freeze. Have you given thought to regression testing? I'd also really
like to see some tests. There are some already:

meta/lib/oeqa/selftest/cases/archiver.py 

and whilst I'd not going to claim they're wonderful, it would be good
to extend as we add new functionality.

Cheers,

Richard


