Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0BA660291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:00:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s12so4752545wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rfEZfvFFd2z+iIqsaF/6niB0LI3CdLY9zfbZ8uBD5mg=;
	b=gR9bHYk1NQz78ywuU5oZkQr8gPal2R/JPUB0SMG0Zb4AGuFaIWoE6NrtEOhuO9XjJ1
	y8AseWGJIqYmG84Gf0fANktVZ1dZtalJD4ao5O3mh0dGY4d9wjmLl1Pmdy8FP2gbKZsy
	jHb0qtvUdlpugVsVfrAtnYFaTcaVW0IobwCzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rfEZfvFFd2z+iIqsaF/6niB0LI3CdLY9zfbZ8uBD5mg=;
	b=fEUzPcadNMKDjVLZEaLaOogC9BIQrowSc5cL/A2gyHNBVEBqNOgmJz0+ET4vrbGvKP
	uDzr5W6bQnw4xovrf9E6K+I2I63dUdIe4wI1i/TO+XTi66RRswi3CJ8Hfaewm/fkkx2I
	n4W5r33FXnAcySz/6scAUV1vNwXtnOM51uXl0OfcC4YCqaMi4J62w4sHbB/1ew8N0MUU
	WpE9qxUma0ttevsEEqH6ULvHD2aP3VaaeDc4QGSoC++8lgSH+wkMU3mYVxrFvP58DdL/
	09jheiLnyZceZ8Z7YYNuDrw0QpCyBx3XJeKeMwc41YiGlzbuz5hHGF2TV/i5iZMLR+pp
	WG5w==
X-Gm-Message-State: AJcUukf/1WND3aD2dtwK8s+9sttl2fglYRxybdT3XHSO9k0Dtg64LxDU
	j/GTy9idr2h3GAGyhKXpMFSjeA==
X-Google-Smtp-Source: ALg8bN6yFcqGmNLa0V9lx0rlwBbe52yj9J8JsddbmDX80p6KfjvrxZefrLq0DmnvEmXa3BExcijESg==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr4528593wrv.101.1547589638471; 
	Tue, 15 Jan 2019 14:00:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j24sm89607615wrd.86.2019.01.15.14.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Jan 2019 14:00:37 -0800 (PST)
Message-ID: <66c714be22a43ac8bb38ae7bf735f412efe729d7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 22:00:36 +0000
In-Reply-To: <20190115193950.25538-1-JPEWhacker@gmail.com>
References: <20190115193950.25538-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH] classes/sstate: Update output hash
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
X-List-Received-Date: Tue, 15 Jan 2019 22:00:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-15 at 13:39 -0600, Joshua Watt wrote:
> Updates the output hash calculation for determining if tasks are
> equivalent. The new algorithm does the following based on feedback:
>  1) All files are printed in a single line tabular format
>  2) Prints the file type and mode in a user-friendly ls-like format
>  3) Includes the file owner and group (by name, not ID). These are
> only
>     included if the task is run under pseudo, since that is the only
>     time they can be consistently determined.
>  4) File size is included for regular files
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 91 +++++++++++++++++++++++++++++++--
> ----
>  1 file changed, 76 insertions(+), 15 deletions(-)

I've not really looked at the code itself yet but could we turn this
into a function in lib/oe/sstate*.py somewhere please?

I'd really like to start getting some of the python code into strong
function libraries where it makes sense and this lends itself toa 
library function.

Cheers,

Richard


