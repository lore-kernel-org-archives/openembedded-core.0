Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E55C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 11:12:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11884.1675941149011155452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 03:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DFd82uJW;
 spf=pass (domain: linaro.org, ip: 209.85.218.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f54.google.com with SMTP id p26so5177486ejx.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2QBv/5zoex9E7sVHDTcmtQnM23pQ2Pa0yEsnMdykyl0=;
        b=DFd82uJWk5igDj7XiCy5H8mxWyhSw/vFGLYZWiOIBmEKEKu59ZMG68+2C4f/+kBVM9
         yMu1CKT1z7k6oGNAzPPVyVJ7yvbe1L62XhJHXeOcqUO/TEoEZz61gh/3xhdAob60cbIC
         wlS1Uvn2TTqp/IrFHGrgtVpGiPLcKm3DSvQgWahom26irWKhRk7c3sh2RusN9JXDqxFk
         lDiTzBylCYxhUR2C9yaM0qY5QCN66MuFkGxuMkcCqs4OLHFZvHkPXGCfB+K+5+GZIS4Z
         IBzEuX4bMDB9bSbeXAwAyE6vW85NHNgkpoAlmP8fdIdx6pRouLwP/uy65sKn6LUuMIXE
         vjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QBv/5zoex9E7sVHDTcmtQnM23pQ2Pa0yEsnMdykyl0=;
        b=s65ldKyNVn5g4lEzXj/a5EmdzrqQjQ96hxfHYXGAgdL9l0gIh039LvmskZva8krMJT
         J3twGXkTPAUlKi1lDExnlmaqn2AvJ9qit9hUNGgafQowcsPNP1Dga/kljglUYbWHIwyC
         Fattbw5cFj1zgRmd2c53bvT5UNKgonv9JC+b/Gb/NXIdk+bc8s1r1z3z2PNZDx6BRqaT
         5wnz4TTE5uNpVfKKt6kYpz7+JeBW2De8xgdO3n5nA+SmEL9OKrcWXLJu/Ovj86q2etLE
         YLOa0aisFqxKprkuSfAscl8kBZaDxo19WgzL2ofN7ArCM+OlkIUxktBTPrm2tuAaiLBd
         zj4w==
X-Gm-Message-State: AO0yUKXFpCxLrJL4WfIkYSdXE5ulUrjNfbcNlFcyjyP9yt0ZRRK8aKic
	sxLcE7ubKhE29+JTYrLFt/MQaw==
X-Google-Smtp-Source: AK7set8uo6ENJUHxhZQFDiT1MQ7rJZfMmquKVXjpS+HFmSGqp7TgvH427+fHET4wxtUzquPFoJs8xg==
X-Received: by 2002:a17:906:7c07:b0:880:2870:7849 with SMTP id t7-20020a1709067c0700b0088028707849mr12300406ejo.74.1675941147247;
        Thu, 09 Feb 2023 03:12:27 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id uj28-20020a170907c99c00b00878a8937009sm721947ejc.199.2023.02.09.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:12:26 -0800 (PST)
Date: Thu, 9 Feb 2023 13:12:24 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
Message-ID: <Y+TVGJ+OOfSL+pBX@nuoska>
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org>
 <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
 <Y+S+g0W4NZ+0zd5g@nuoska>
 <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 11:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176944

Hi,

On Thu, Feb 09, 2023 at 11:53:00AM +0100, Alexander Kanavin wrote:
> On Thu, 9 Feb 2023 at 10:36, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > I think sleep() is ok in this case to reduce busy looping over serial
> > console and read() more data than what select() initially saw. Reading
> > single character at a time is a bit silly and just wastes CPU time when
> > we don't need ms level accuracy.
> 
> Something doesn't compute here. The writer should be sending data in
> chunks, and there are buffers all the way to the reader, so where does
> the splitting into single characters happen?

Sorry I mixed with the serial console patch, but the output was similar
over ssh.

select() returns with any data, even single character. Fancy readers
will read larger chunks but will read more data than is available and thus
block for ever. Plain read() will read the data which is available from
select() and thus really small amounts like single characters if that's
available over the socket. This is visible in the partial read output of
do_testimage() task output log which becomes quite unreadable without change.

Cheers,

-Mikko

