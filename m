Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.11397.1598353930016097791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 04:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=PJSc3W8l;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=axlr=cd=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BbRCT6PbBz3R;
	Tue, 25 Aug 2020 13:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1598353926;
	bh=HaOklsopCzOi7n8mr/Ej1s1M7ejnIFYDgwhSMSnhThw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJSc3W8lFw6PNqWx78DVJOxj5fu4VSaiRBk5uWg4gkKhNgCq2OyBoyP8BLPtaQ0eI
	 u/HuOQ0VXmGBJ41XnFK96sp9qhjE/vwuoc3Haua4MRqXqXzk+sfksKSOF7ED93TYea
	 phzUq4rN/kKSnAFPdmaXEWUlcKX1BPF5PAYaumPFvK0uRTzutxxb1SNsszv0TIymSG
	 7peWfM8SJJpMxqtqOaJJ6cTI3oTTzqchGC9L2pEIC6Xqbfo6t+XL7oU0eyxcSxgyuY
	 ZuC4XoB3vYbGqo67DTnDIKdAKiamFjq94/TwhTsdjdfh4BcAiRO/CVqhwws1fC2m9G
	 7NclcwT9DruZOg7Aym/tQ81iig7Q/pyWjR9xkUxRzukWtVcRn3pt0F0CEpS4JbfJYS
	 g8AlP0QVubuCsn/7RNqv+6nrMYGoVSVcqkTmi1o5iePciqs4QlTzmUIIdXJfO9uzlI
	 BWgRvpswZcZ9XcnMHTeLZwmkXP4kUsdEo1CIta0oXBwVqRawiTvJ4H9N30X8q951ZZ
	 V7Aq8ZWRGDQRn3YTi75gHG5hAjN5S8XrVUhza+FJ6VFV/s8WtZTkoODBH8/ilfPEDo
	 oqW/jdfQTX61r4V5Xq0S5H84u6UWqv27QCXwhYQUKLQhsSmiuQMartRIXdnA6jEtyr
	 OpzVaDW2egNmoR4PFn6HOqjs=
Date: Tue, 25 Aug 2020 14:12:04 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bluez5: fix builds that require ell support
Message-ID: <20200825111204.GA19790@localhost>
References: <20200824194451.279731-1-pab@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <20200824194451.279731-1-pab@pabigot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 24, 2020 at 02:44:51PM -0500, Peter A. Bigot wrote:
> Shortly after the recipe was updated to add ell as a mesh dependency
> the way ell was integrated into bluez5 was changed.  Add the new
> configuration options required for an external ell.
>...
> -PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
> -PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
> +PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh --disable-external-ell, json-c ell"
> +PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient --disable-external-ell, ell"
>...

This won't work if exactly one these two options is enabled.

What about unconditional --enable-external-ell and ell DEPENDS instead?
It seems to link with the external ell only when necessary.

cu
Adrian
