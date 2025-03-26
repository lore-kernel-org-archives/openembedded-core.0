Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98CFC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 16:46:20 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.27554.1743007572560029040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 09:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvJHvIgx;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso9778793a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743007572; x=1743612372; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WknRXDKIXLvJzgMlkuGCCBvfLnYi6Zo8ZFWhC3JrMbc=;
        b=TvJHvIgxKBHugmF8xGNiUPNf71mY+5QA3ROoiHM9osthr8HmVxbA9rElrI5qNGcxPS
         onv5If1ELcICeVzudQF7FadLf9A7W7KgzTg/gbVhLjCZ/YVz62mHn8ETi0vlElcOCsyA
         UpoU96HJZLIovx355BaLXoKGcJ/B5LfqywaDmYjkBlSVhnLQyNTysG72PPDNKCXTmA0R
         +RCy1euqzOc/7adhkS/uzZZ5YAEHG+5/U5oSo1W7ccip9u+uu8EMBn4hq0Rt2jJ6a93D
         Jg/xE5YKu8rvZVo5bkDa1t68i/o+2A8TJ/PPOOJk7JeCxL8jLEbz+2xu3S7Omk7UQ35u
         NKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007572; x=1743612372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WknRXDKIXLvJzgMlkuGCCBvfLnYi6Zo8ZFWhC3JrMbc=;
        b=OY+XVVXk/4k4M8iX4E6KhGafU6OjYggWLopaYFIYfgGxkjg7Q4vfV3IvXgD146/qSF
         kk36Sb7Gb2tnHnaKYj0Tl2vGvLOnn8Ft11H/E8oZRW8NZENV9b9hFEuPE9tgPHUdcCz3
         kTb1NJ7gaEDrEm6ZDNfX9UrkYoacrZVBnzsNDFmWAQMp8erS7trVa14yOUfERG69lNA5
         W5C05kJU5b5p2cIDsmMojjDuFS/Y5AuFy02dK3aKE1XGXy2NSKj3bnFAULpSONN5Dbvb
         Ry43t2sZHdL/dfv7POlOH8SOC0148JWlo25VuE4aDAKo6830/0H8J7pynba01jKb1rVk
         EvyA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpbf29nUhjsy6zl7XDUgxLJi+mgfiK9WgMpM5yH8T5CYR6NRzoi+d3K2yTVHN57XSpwBfYyj33YnKEfQD/t+p7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2lZQQjcEoJSHxOO6woFMeyeW1m9x8u0cMWcH96eXG+mDkEedX
	tDWLQHFSB8yskMicF1GAjhXHR018OEscpgX0I0+dBpGfnZ0xl4AP
X-Gm-Gg: ASbGncvasny/x8qw8IDMZKU7xNmJZwb9GOUbPeOtNP1FqFB7W7b/PjNEvfxYcQxUaNM
	9NN0I3ULol82MPQh8iUywZESAFfH5qcYykpctSWeruCMzPZ7XQSvNAzjYz+fk9PB71clEMShoiP
	mRYU8op+56vWlfmM4qUXvaOKnl6sHo7Y/UjN0QgvMaPJno6YuWFoijRgsMs1H10d7YBNZ5965Ds
	BS6C6QjgqkK3AfahzZtGvOCDSp2tY7hA2PqLwkFy/LzqxagJIAMt7Imgn55gC0WqByJUWySSWNx
	na3vBxr78S8YG+yseRfY6W8ypqB7hGlZB3JFyEtqgTg=
X-Google-Smtp-Source: AGHT+IEfOLbYj/UhKwiZDj54nYWMQs7cWIi/D6zcRAEN52JVZ5OIUP8lNeO9CQIyKKCKsNcWbWLsbg==
X-Received: by 2002:a17:90b:48d2:b0:2ff:7031:e380 with SMTP id 98e67ed59e1d1-303a7d6fa99mr606073a91.10.1743007571827;
        Wed, 26 Mar 2025 09:46:11 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b2ebbsm421370a91.41.2025.03.26.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:46:11 -0700 (PDT)
Date: Wed, 26 Mar 2025 13:46:07 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: quentin.schulz@cherry.de, steve@sakoman.com,
	openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [scarthgap][PATCH] linux-firmware: upgrade 20240909 ->
 20250311
Message-ID: <20250326164607.v3q7jla5htxedolk@hiago-nb>
References: <20250325215444.11125-1-hiagofranco@gmail.com>
 <CAOSpxda1s_VUBMTQBRzfdXGy0B=9sgNr=eq+LdDDKFc+koG4dQ@mail.gmail.com>
 <b3f0e7d4-83c6-4632-98c7-e25327b872ad@cherry.de>
 <524ac8df44c628ab5dc61f464d525f5bd9b234ad.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <524ac8df44c628ab5dc61f464d525f5bd9b234ad.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 16:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213654

Hi Richard, Quentin and Steve,

Thanks for the reviews.

I got the idea now, I will then backport the patches from master into
styhead and scarthgap and send a v2. I also plan to do the same with
kirkstone.

Cheers,

Hiago.

