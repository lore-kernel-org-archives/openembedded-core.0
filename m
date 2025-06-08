Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368D8C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:09:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.45157.1749416982311599373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aNIYUwrn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so599225966b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749416981; x=1750021781; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdTt6ePpoS4EJKZsXMQGaOc7q02LA38NHyPN7AE8BX8=;
        b=aNIYUwrnvPHs+A3uUm1zq8mghE9Mm4QqIJJrsXByp1+Sbo1IV3knTrALmhmhc29UbV
         0FJyUxb22MTckO+6e93TI+Y42ThmqBdOXvTIu0xyvMurIcdDdKYxqeieNNokxvH42XQX
         cMAy2HH3EukPfWP1j81341OMzpfbq8cfK3UZcpSfNRde1TCsBJsoH2QdaNl0tCCwDoyS
         B1qV4xczs3y+aViX5+OQHwK82XoS4NaG2I6M94bmnsqfYRhD2b6ykKNNIRnNIolpDuJF
         VFjDdvgxba4O4jG1HCIoTKALmQPp/5HaW2cE7SuDD86rXFZD9qk9dhIxYP69JLpeLfJo
         ffaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749416981; x=1750021781;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdTt6ePpoS4EJKZsXMQGaOc7q02LA38NHyPN7AE8BX8=;
        b=cT4kQAg4i42frlkrDoTH47zBMtwjy5JZk6ibBAn87zuNrUZWVn88eva/hbqT49M9uD
         ROlv6G+kawG0izNPwQyK8hNE+BBzAVHn4cA+aHLCC6BUlB3N3GAP4vmgQb4q0/sQ7PUX
         Fw62CtnLu419yFtALoaVyjjOOj17O4xO/eQZliQAOb8z9FSik7S9x6TRbtA899QHl5ep
         tD8g8rj9AE3E4/kRtKekZnL0McFoXK+A6HIXtDmfVkPL8AdL4iOuqBLpTey+QvDiOvoO
         uC3PSVtTvX4Za3ro88b9joRQ24FvRmbQxx03a8Pw+4LzcKwSW7uTSxcPzWbV1vuo31eI
         y0cg==
X-Gm-Message-State: AOJu0YxaXatyhMfgYRec2ghxSOHOv7yEUETZ8rEYkExfn+taTTCLSCwD
	kGMLqBZedYdN6H2xRem/UA2LAJVBSgdqYHKuEbgm9ikQzeICd1S3pMTs7cyfXg==
X-Gm-Gg: ASbGncs5iWgSlXN6HXDthszg0CRC+iMuYl3iHO1CHO3tEIFd207XwntUtYZwrjxC8Un
	0cJpugyrJ1kX4CZuDcXX27SHy4Y6cnigWVVjNbl7RBh8r3LPJkwRCgo1ghX51hVjobaAoJN57pN
	kidoPliCB2th6UJlVyRX3oT0ykSs8wy1rU6lV2d1BLWCuttaKR4lbsECLpERd9YJiWypdMBYbq/
	IKrT8DbgGgIAGKlfDsKDgUR6PKJai09MLbX+35prsdbWhPLNNmjARaYdpPV3iTEl1kAbLA/kHUD
	/Vi6820tP74Ts8I7mOY0EdgjbRe8KqJJHOzfN/TElJFDl3i0He+yYD6eby4Gtl4lVgg=
X-Google-Smtp-Source: AGHT+IHwRkm0gZNFixnXT9M76Fqs+5s94zSx+lGL74qkRLYrR4jt/OLq2FlZkux/Q2cDKMt57FRLlQ==
X-Received: by 2002:a17:907:3f22:b0:ad5:365a:1352 with SMTP id a640c23a62f3a-ade1a9c9fa0mr1007236866b.1.1749416980383;
        Sun, 08 Jun 2025 14:09:40 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc39c3fsm458893566b.140.2025.06.08.14.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 14:09:39 -0700 (PDT)
Date: Sun, 8 Jun 2025 23:09:35 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@eng.windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/1] iputils: upgrade 20240905 -> 20250605
Message-ID: <20250608210935.GA1385708@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20250608210152.1384768-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608210152.1384768-1-petr.vorel@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218224

Hi Richard,

I also noted DEPENDS = "gnutls".

This dependency has been removed long time ago (md5 implementation was vendored
in s20200821), it should be safe to remove it.

Kind regards,
Petr

