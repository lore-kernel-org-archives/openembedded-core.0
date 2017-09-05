Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBD177E79
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 07:40:41 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 137so20441842wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 00:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eAll8/Ve2pc0TM8O2o5AnruxeakWc9e7RD3NZLsc8wo=;
	b=RghznibqUYGFDV2LbFnmbzXH6pRjxdjq1FF1ozcRYihO8YvpzeVDe3DU6tPQIBKd+m
	CLGz0rzGbYzrsAyR2C8GNPpt4ZjhwCE90/HPfFpplXzgBKdsw8WSqRL72L120vIIBeiI
	I3OzOjJAVKZwXXOeNJ4vGoKrFn3RDAD0N+RGd/z12aSRjTEfBWsiDK8Xk4o8npkIVvvN
	uFmlRSBA/HPsrl3qwGb4s9hT9UIdOc19qcUtN0o7JOrfjpe+281YMxjUH0HmALadIJpA
	SICVI6k7R0ul3qksw7EXJ8S9XBVo+8bIMMCUjjrzkxvxYJEZyPBO9CEF6M2E3S+0Z1qb
	zWWw==
X-Gm-Message-State: AHPjjUjlUpsa4/aPHw41nJqjrvTfotRnuzfzzTtyNSzHmQF0CXCgyeLU
	EY/Vm6dzhKyD/w==
X-Google-Smtp-Source: ADKCNb79zjqLTkHWlZFiQGGoGNe83LmFIzWBK8UoWO12jsRloVaLNFTV4k/6kfYFsPYFzt/TVujGIA==
X-Received: by 10.28.66.65 with SMTP id p62mr1978320wma.159.1504597242560;
	Tue, 05 Sep 2017 00:40:42 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u30sm85561wru.88.2017.09.05.00.40.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 00:40:41 -0700 (PDT)
Message-ID: <1504597240.29140.10.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Sep 2017 08:40:40 +0100
In-Reply-To: <101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
References: <20170904093726.11472-1-git@andred.net>
	<101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] useradd-staticids: don't create username-group if	gid is specified
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
X-List-Received-Date: Tue, 05 Sep 2017 07:40:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-04 at 10:22 +0000, Peter Kjellerstedt wrote:
> > 
[...]
> > diff --git a/meta/classes/useradd-staticids.bbclass
> > b/meta/classes/useradd-staticids.bbclass
> > index ce4ac62ab5..1b61a8bf9b 100644
> > --- a/meta/classes/useradd-staticids.bbclass
> > +++ b/meta/classes/useradd-staticids.bbclass
> > @@ -102,7 +102,7 @@ def update_useradd_static_config(d):
> >              # So if the implicit username-group creation is on, then
> > the implicit groupname (LOGIN)
> >              # is used, and we disable the user_group option.
> >              #
> > -            user_group = uaargs.user_group is None or uaargs.user_group
> > is True
> > +            user_group = uaargs.gid is None or uaargs.user_group is
> > True
> 
> Hmm, I believe that should be:
> 
>             user_group = uaargs.gid is None and uaargs.user_group is None
> or uaargs.user_group is True
> 
> I.e., if neither --gid nor --user-group is specified, then it should 
> treat it as if --user-group was specified.

Hm, isn't this still the same as 

user_group = uaargs.gid is None or uaargs.user_group is True

? If neither --gid nor --user-group is specified, then gid is None, so it
will do what you want already. IOW, unless the group name (gid) is
specified, a username-group is being created.


Cheers,
Andre'


