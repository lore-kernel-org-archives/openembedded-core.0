Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id A1EA67BEF2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 20:02:44 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id l14so1333783ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 12:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LPxMprxT8cHEtSDHVrQwvzmzO6sCVga95UWDQ9yjOps=;
	b=Yd+//vQXQW3spdnAdh3HroYFaVxIYXg+aCmMvhekTgWZP5oxFruB+SmHfXoQ5q16SO
	qMU/f/Z1gUjv61Z5RZ3B7RhR+IxjRpFVIFK17aGrrOwqEtAYytFD4yjjZiX3PD7KyRww
	1X1HHZW68b1WrlcWq4vlsBSlP32EKTOmf/DY8Cqawd2K48odbsqLtlHopRVm0rfsYY+m
	dvDLlVlZCXNxK+Lbkq0q4YTh5k5zsRn9C0YFeY5LHef4d1upU6K1Bg0CR1FJ28JIhrsT
	u4o/jrpsZpT/WW53u3RYUYh+lI4/fSCWCpSf1pBJ99GAz2Ny+ArWoi9nwtRwdfxS+xpT
	Cf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LPxMprxT8cHEtSDHVrQwvzmzO6sCVga95UWDQ9yjOps=;
	b=VdgF3lomsKuVfP65bRwjVYH3q+WGktA5N8BSpcQb4Nv5SFZE3BK7ROHO3Lbw/5fyeM
	S1ASOYs4qUMQqeEnZV/G0KvjTREYrv/Z76oE0zaVKTfqURj/ehyhtqTWg8s2vIUsuF89
	DhrWyUIRtBKMow/jnIBku9IUxCen16ftHXJacnkSA6NY/njwrGZ5FkxXCulttbN6ETtq
	Dh7WfpqHU3/FfM8XQs/AU562YdqpmTTEd5Opr922CvutbrzTJ7aj1gqIuOX8oprsYQWg
	YRw8UMmjcy8pPDuzrvccGUKswMIhvw88tFcJnMGh2Pu7owRVcnTZVmIaYhV8AslVOqJy
	xU+Q==
X-Gm-Message-State: AJcUukdRLouGo1M/xRiAX5/8GJ4xLrtLQeETEb/dCmbnPEOCAo5Ycy3N
	TktOtaVp5hVd3dd7p7CWgumkP6QjumWmeBqbLgtOVGTr
X-Google-Smtp-Source: ALg8bN4eKAibawuKy0hfAjVKLQusMMgyBcLUAkFaBB0pB5PNyMAy0T3wQFgxFxp0umTpz0ZFoSQFprh3cZfaSWonR+A=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr41637301ioe.20.1546891365590;
	Mon, 07 Jan 2019 12:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20190107163823.31816-1-ross.burton@intel.com>
	<20190107163823.31816-3-ross.burton@intel.com>
	<b22346fb-8cd8-a747-de26-cbcd5a39deea@xevo.com>
In-Reply-To: <b22346fb-8cd8-a747-de26-cbcd5a39deea@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2019 20:02:34 +0000
Message-ID: <CAJTo0LYHrwfyL98stDqaxRug65ioeRgKjc-Q9CTyyqr-behAKw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] meson: fix nativesdk-meson for multilib SDKs
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
X-List-Received-Date: Mon, 07 Jan 2019 20:02:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jan 2019 at 19:03, Martin Kelly <mkelly@xevo.com> wrote:
> > +with open(template_file) as in_file:
> > +    template = in_file.read()
> > +    output = Template(template).substitute(Environ())
> > +    with open(cross_file, "w") as out_file:
> > +        out_file.write(output)
>
> I like using string.Template instead of custom logic, but shouldn't we
> keep the atomic rename logic? If someone hits control-C or the
> extraction process crashes during the write, we don't want a corrupt
> file due to a partial write.

If someone control-c's during SDK unpack, the SDK isn't usable.

> I have no problem with it, but I'm curious why we use @CC instead of
> @@CC@@ style here. Is there an issue with @@CC@@ style?

Because that's how string.Template works.

Ross

